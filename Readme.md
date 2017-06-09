# Radar Auto Ghost

A Factorio mod to automatically place ghosts for Radars at the optimum distance for complete coverage.

## Notes
---

Each time a radar is placed check the ideal placement chunks for existing radars(or ghosts), and if not present place a ghost. Optionally clear an area around the radar (mod settings, per save?).

Probably will not be placing power pole ghosts.

### Problems:
* If you've got two grids they'll intersect blindly. Search should include all chunks within the full coverage range, and maybe check if the radar would cover an uncovered chunks.

* Performance could get wonky with range extender mods.

* Speaking of range extender mods, how to handle Satellite Radar or Big Brother?

### Likely bits of code needed:
* Relative coords handling
* Chunk granularity level coordinate treatment
* Radar coverage area encapsulation
* Optional dependency on known radar adding/modifying mods
..* RSO Radar
..* Satellite Radar
..* Big Brother
