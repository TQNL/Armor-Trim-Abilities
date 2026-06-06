# Smithed compatibility changes

- Added top-level `id`: `armor-trim-abilities` to `pack.mcmeta`.
- Added `__smithed__` metadata to the trial chamber pot vanilla loot-table override.
- Renamed runtime entity/player tags to `trim.*` style names.
- Renamed scoreboard objectives to `trim.*` style names.
- Added `trim:migration/tags` and calls it from `trim:load` to clean old persistent runtime tags.
- Added `trim:uninstall` plus `trim:uninstall/player` for manual cleanup.
- Added `smithed.entity` / `smithed.strict` tags to pack-created technical/custom entities where appropriate.
- Excluded `smithed.entity` from pack logic that modifies vanilla piglin/villager base behavior.
- Re-formatted the Minecraft `load` and `tick` function tags to plain vanilla-compatible JSON.

Skipped by request: CMD-prefixing and data pack menu/dialog conventions.
