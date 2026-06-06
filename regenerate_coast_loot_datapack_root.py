#!/usr/bin/env python3
r"""
Regenerate Armor Trim Abilities full-set Coast generated-container loot support.

What it updates in the datapack:
  - data/trim/loot_table/chests/**/*.json
  - data/trim/advancement/trim_abilities/chests/**/*.json

What it intentionally does not generate:
  - dispenser loot tables / dispenser advancements
  - jungle temple dispenser support
  - trial chamber dispenser support
  - archaeology / pots / fishing / entity / block / spawner loot tables

The source is a manually extracted Minecraft `data` folder from the jar, for example:
  C:\Users\you\Downloads\data
which should contain:
  minecraft/loot_table/chests

Put this script in the datapack root, next to:
  data/
  pack.mcmeta

The script infers the datapack root from its own location. The only required
positional argument is the manually extracted Minecraft `data` folder.

Safe default: dry-run. Add --apply to actually delete/regenerate folders.
"""

from __future__ import annotations

import argparse
import copy
import json
import shutil
import sys
from dataclasses import dataclass, field
from datetime import datetime
from pathlib import Path
from typing import Any


DEFAULT_BONUS_ROLLS = 0.1

# These are vanilla chest loot tables that are physically dispenser/trap loot, not
# Coast chest/barrel bonus containers. Do not copy them and do not generate advancements.
EXCLUDED_CHEST_LOOT_IDS = {
    "minecraft:chests/jungle_temple_dispenser",
}

# These are chest loot tables that should exist as trim loot tables, but should not
# get player_generates_container_loot advancements. Vaults use a separate advancement
# and read the vault's configured loot table.
NO_ADVANCEMENT_PREFIXES = (
    "minecraft:chests/trial_chambers/reward",
)

# Top-level folders currently expected under data/minecraft/loot_table in 1.21.x-style jars.
# Unknown new folders are reported so you can decide whether a new loot-table category needs
# a Coast system later.
KNOWN_LOOT_TABLE_CATEGORIES = {
    "archaeology",
    "blocks",
    "chests",
    "dispensers",
    "entities",
    "equipment",
    "gameplay",
    "pots",
    "shearing",
    "spawners",
}

INTENTIONALLY_IGNORED_CATEGORIES = {
    "dispensers": "ignored on purpose: dispenser loot is treated as booby-trap loot, not Coast bonus container loot",
    "pots": "handled/documented separately by the trial chamber pot override, not by this generator",
    "archaeology": "handled by the suspicious-block archaeology subsystem, not by this generator",
    "blocks": "not generated-container loot",
    "entities": "not generated-container loot",
    "equipment": "not generated-container loot",
    "gameplay": "fishing/gameplay loot is handled separately",
    "shearing": "not generated-container loot",
    "spawners": "not generated-container loot",
}


@dataclass
class Report:
    source_data: Path
    pack_data: Path
    apply: bool
    bonus_rolls: float
    copied_loot_tables: list[str] = field(default_factory=list)
    generated_advancements: list[str] = field(default_factory=list)
    no_advancement_tables: list[str] = field(default_factory=list)
    excluded_tables: list[str] = field(default_factory=list)
    intentionally_ignored_categories: dict[str, str] = field(default_factory=dict)
    unknown_categories: list[str] = field(default_factory=list)
    removed_output_dirs: list[str] = field(default_factory=list)
    vault_advancement_action: str = "not generated"
    warnings: list[str] = field(default_factory=list)

    def as_text(self) -> str:
        mode = "APPLY" if self.apply else "DRY RUN"
        lines: list[str] = []
        lines.append(f"Coast loot regeneration report ({mode})")
        lines.append(f"Generated at: {datetime.now().isoformat(timespec='seconds')}")
        lines.append(f"Source data: {self.source_data}")
        lines.append(f"Datapack data: {self.pack_data}")
        lines.append(f"Bonus rolls set on every copied pool: {self.bonus_rolls}")
        lines.append("")
        lines.append(f"Copied trim chest loot tables: {len(self.copied_loot_tables)}")
        lines.append(f"Generated container advancements: {len(self.generated_advancements)}")
        lines.append(f"Copied tables without advancements: {len(self.no_advancement_tables)}")
        lines.append(f"Excluded dispenser/trap tables: {len(self.excluded_tables)}")
        lines.append(f"Vault advancement: {self.vault_advancement_action}")
        lines.append("")

        if self.excluded_tables:
            lines.append("Excluded tables:")
            lines.extend(f"  - {x}" for x in self.excluded_tables)
            lines.append("")

        if self.no_advancement_tables:
            lines.append("Copied, but no player_generates_container_loot advancement was generated:")
            lines.extend(f"  - {x}" for x in self.no_advancement_tables)
            lines.append("")

        if self.intentionally_ignored_categories:
            lines.append("Known loot_table categories intentionally ignored by this generator:")
            for name, reason in sorted(self.intentionally_ignored_categories.items()):
                lines.append(f"  - {name}: {reason}")
            lines.append("")

        if self.unknown_categories:
            lines.append("UNKNOWN loot_table categories detected. Review these manually:")
            lines.extend(f"  - {x}" for x in self.unknown_categories)
            lines.append("")

        if self.removed_output_dirs:
            lines.append("Output folders regenerated:")
            lines.extend(f"  - {x}" for x in self.removed_output_dirs)
            lines.append("")

        if self.warnings:
            lines.append("Warnings:")
            lines.extend(f"  - {x}" for x in self.warnings)
            lines.append("")

        return "\n".join(lines)


def normalize_source_data(path: Path) -> Path:
    path = path.expanduser().resolve()
    if (path / "minecraft").is_dir():
        return path
    if path.name == "minecraft" and path.is_dir():
        return path.parent
    raise SystemExit(
        f"Could not find source data folder. Expected either a folder containing 'minecraft/' "
        f"or the 'minecraft/' folder itself: {path}"
    )


def infer_pack_data_from_script() -> Path:
    pack_root = Path(__file__).resolve().parent
    pack_data = pack_root / "data"
    pack_mcmeta = pack_root / "pack.mcmeta"

    if not pack_root.is_dir():
        raise SystemExit(f"Could not resolve datapack root from script location: {pack_root}")
    if not pack_mcmeta.is_file():
        raise SystemExit(
            f"This script expects to be placed in the datapack root, next to pack.mcmeta and data/: {pack_root}"
        )
    if not pack_data.is_dir():
        raise SystemExit(
            f"This script expects to be placed in the datapack root, next to an existing data/ folder: {pack_root}"
        )

    return pack_data


def load_json(path: Path) -> Any:
    with path.open("r", encoding="utf-8") as f:
        return json.load(f)


def write_json(path: Path, data: Any, apply: bool) -> None:
    if not apply:
        return
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", encoding="utf-8", newline="\n") as f:
        json.dump(data, f, ensure_ascii=False, indent=2)
        f.write("\n")


def clean_dir(path: Path, apply: bool, report: Report) -> None:
    report.removed_output_dirs.append(str(path))
    if not apply:
        return
    if path.exists():
        shutil.rmtree(path)
    path.mkdir(parents=True, exist_ok=True)


def loot_id_from_chest_file(chests_root: Path, file_path: Path) -> tuple[str, Path]:
    rel_json = file_path.relative_to(chests_root)
    rel_no_suffix = rel_json.with_suffix("")
    loot_id = "minecraft:chests/" + rel_no_suffix.as_posix()
    return loot_id, rel_json


def add_bonus_rolls_to_pools(loot_table: Any, bonus_rolls: float) -> Any:
    result = copy.deepcopy(loot_table)
    pools = result.get("pools") if isinstance(result, dict) else None
    if isinstance(pools, list):
        for pool in pools:
            if isinstance(pool, dict):
                pool["bonus_rolls"] = bonus_rolls
    return result


def should_exclude_chest_loot(loot_id: str) -> bool:
    return loot_id in EXCLUDED_CHEST_LOOT_IDS


def should_generate_advancement(loot_id: str) -> bool:
    if should_exclude_chest_loot(loot_id):
        return False
    return not any(loot_id.startswith(prefix) for prefix in NO_ADVANCEMENT_PREFIXES)


def make_container_advancement(loot_id: str) -> dict[str, Any]:
    return {
        "parent": "trim:trim_abilities/root",
        "criteria": {
            "requirement": {
                "trigger": "minecraft:player_generates_container_loot",
                "conditions": {
                    "loot_table": loot_id,
                },
            },
        },
        "rewards": {
            "function": "trim:full_set/coast/loot/1",
        },
    }


def make_default_vault_advancement() -> dict[str, Any]:
    return {
        "parent": "trim:trim_abilities/root",
        "criteria": {
            "requirement": {
                "trigger": "minecraft:item_used_on_block",
                "conditions": {
                    "location": [
                        {
                            "condition": "minecraft:match_tool",
                            "predicate": {
                                "items": [
                                    "minecraft:trial_key",
                                    "minecraft:ominous_trial_key",
                                ],
                            },
                        },
                        {
                            "condition": "minecraft:location_check",
                            "predicate": {
                                "block": {
                                    "blocks": "minecraft:vault",
                                },
                            },
                        },
                    ],
                },
            },
        },
        "rewards": {
            "function": "trim:full_set/coast/loot/1",
        },
    }


def scan_loot_table_categories(source_data: Path, report: Report) -> None:
    loot_root = source_data / "minecraft" / "loot_table"
    if not loot_root.is_dir():
        raise SystemExit(f"Missing vanilla loot_table folder: {loot_root}")

    observed = sorted(p.name for p in loot_root.iterdir() if p.is_dir())
    for category in observed:
        if category == "chests":
            continue
        if category in INTENTIONALLY_IGNORED_CATEGORIES:
            report.intentionally_ignored_categories[category] = INTENTIONALLY_IGNORED_CATEGORIES[category]
        if category not in KNOWN_LOOT_TABLE_CATEGORIES:
            report.unknown_categories.append(category)


def count_json_files(path: Path) -> int:
    if not path.exists():
        return 0
    return sum(1 for _ in path.rglob("*.json"))


def regenerate(args: argparse.Namespace) -> Report:
    source_data = normalize_source_data(Path(args.source_data))
    pack_data = infer_pack_data_from_script()
    apply = bool(args.apply)
    report = Report(source_data=source_data, pack_data=pack_data, apply=apply, bonus_rolls=args.bonus_rolls)

    scan_loot_table_categories(source_data, report)

    source_chests = source_data / "minecraft" / "loot_table" / "chests"
    if not source_chests.is_dir():
        raise SystemExit(f"Missing vanilla chest loot-table folder: {source_chests}")

    # Explicitly report and ignore vanilla dispenser loot tables.
    source_dispensers = source_data / "minecraft" / "loot_table" / "dispensers"
    dispenser_count = count_json_files(source_dispensers)
    if dispenser_count:
        report.warnings.append(
            f"Detected {dispenser_count} vanilla dispenser loot table(s); ignored intentionally and not copied."
        )

    out_loot_chests = pack_data / "trim" / "loot_table" / "chests"
    out_adv_chests = pack_data / "trim" / "advancement" / "trim_abilities" / "chests"

    # Preserve the current working vault advancement if the datapack already has one.
    # This is read before the advancement folder is cleaned.
    existing_vault_path = out_adv_chests / "trial_chambers" / "vault.json"
    existing_vault_advancement: Any | None = None
    if existing_vault_path.exists():
        try:
            existing_vault_advancement = load_json(existing_vault_path)
        except json.JSONDecodeError as exc:
            report.warnings.append(
                f"Could not parse existing vault advancement at {existing_vault_path}; using built-in template instead: {exc}"
            )

    # Remove old generated output. This deletes legacy jungle_temple_dispenser output too.
    clean_dir(out_loot_chests, apply, report)
    clean_dir(out_adv_chests, apply, report)

    # Optional cleanup in case older versions ever created these folders.
    for legacy in [
        pack_data / "trim" / "loot_table" / "dispensers",
        pack_data / "trim" / "advancement" / "trim_abilities" / "dispensers",
    ]:
        if legacy.exists() or not apply:
            # In dry-run, list the possible cleanup target for visibility. In apply mode, only if it exists.
            if legacy.exists():
                report.removed_output_dirs.append(str(legacy))
                if apply:
                    shutil.rmtree(legacy)

    for file_path in sorted(source_chests.rglob("*.json")):
        loot_id, rel_json = loot_id_from_chest_file(source_chests, file_path)

        if should_exclude_chest_loot(loot_id):
            report.excluded_tables.append(loot_id)
            continue

        vanilla_loot = load_json(file_path)
        trim_loot = add_bonus_rolls_to_pools(vanilla_loot, args.bonus_rolls)
        out_loot_path = out_loot_chests / rel_json
        write_json(out_loot_path, trim_loot, apply)
        report.copied_loot_tables.append("trim:chests/" + rel_json.with_suffix("").as_posix())

        if should_generate_advancement(loot_id):
            out_adv_path = out_adv_chests / rel_json
            write_json(out_adv_path, make_container_advancement(loot_id), apply)
            report.generated_advancements.append("trim:trim_abilities/chests/" + rel_json.with_suffix("").as_posix())
        else:
            report.no_advancement_tables.append(loot_id)

    if args.vault_advancement:
        has_trial_reward = any(
            x.startswith("minecraft:chests/trial_chambers/reward")
            for x in report.no_advancement_tables
        )
        if has_trial_reward:
            vault_path = out_adv_chests / "trial_chambers" / "vault.json"
            vault_data = existing_vault_advancement if existing_vault_advancement is not None else make_default_vault_advancement()
            write_json(vault_path, vault_data, apply)
            report.vault_advancement_action = (
                "preserved from existing datapack"
                if existing_vault_advancement is not None
                else "generated from built-in vault template"
            )
            report.generated_advancements.append("trim:trim_abilities/chests/trial_chambers/vault")
        else:
            report.vault_advancement_action = "skipped: no trial_chambers/reward* chest loot tables found"

    report_path = pack_data / "trim" / "coast_loot_regen_report.txt"
    if apply:
        report_path.parent.mkdir(parents=True, exist_ok=True)
        report_path.write_text(report.as_text(), encoding="utf-8", newline="\n")
    else:
        report.warnings.append("Dry run only. Add --apply to actually delete and regenerate datapack files.")

    return report


def build_arg_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Regenerate full-set Coast chest loot tables and container advancements from an extracted Minecraft data folder. Run this script from inside the datapack root, next to data/ and pack.mcmeta."
    )
    parser.add_argument(
        "source_data",
        help="Path to the extracted Minecraft data folder, or directly to its minecraft/ subfolder.",
    )
    parser.add_argument(
        "--bonus-rolls",
        type=float,
        default=DEFAULT_BONUS_ROLLS,
        help=f"bonus_rolls value to set on every copied loot-table pool. Default: {DEFAULT_BONUS_ROLLS}",
    )
    parser.add_argument(
        "--apply",
        action="store_true",
        help="Actually delete/regenerate output folders. Without this, the script only reports what it would do.",
    )
    parser.add_argument(
        "--no-vault-advancement",
        dest="vault_advancement",
        action="store_false",
        help="Do not generate trim:trim_abilities/chests/trial_chambers/vault.json.",
    )
    parser.set_defaults(vault_advancement=True)
    return parser


def main(argv: list[str] | None = None) -> int:
    parser = build_arg_parser()
    args = parser.parse_args(argv)
    report = regenerate(args)
    print(report.as_text())
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
