# <DBM> Outlands

## [2.5.37-14-g2699809](https://github.com/DeadlyBossMods/DBM-BCC/tree/269980955bc30c750850f24d2c7cbb4544b5ebbc) (2022-06-14)
[Full Changelog](https://github.com/DeadlyBossMods/DBM-BCC/compare/2.5.37...269980955bc30c750850f24d2c7cbb4544b5ebbc) [Previous Releases](https://github.com/DeadlyBossMods/DBM-BCC/releases)

- Update localization.ru.lua (#132) Add a few phrases.  
- Refactor GetEnemyUnitIdByGUID to be more inclusive, then use it in IsValidWarning object. This, in turn, allows filtering for units affecting combat in trash modules to be far more effective at identifying combat affecting units. Should result in far less filtereed warnings against mobs you're actually fighting in modules that use strict filtering.  
- Code tweak to last  
- Made unit target scanner more robust by addressing two core issues. 1. When not in a group it basically didn't work, because it failed to consider that when solo there won't actually be a target swap, you'l just always be \"the tank\". Now if not in group it'll execute \"tanks allowed\" permission on scan completion and still give a target warning (you). 2. The extra validation checks when in group, were also broken in that they only considered raids, not 5 mans. This is why dungeon mods using the better UNIT\_TARGET monitoring method never actually had working target scans. Every time a 5 man dungeon got a report of target scan not working on this better method I just swapped method believing it was a methodology problem, but I know better now and this should also be fixed and allow the better target scanning method to be more widely used in 5 man dungeons.  
- Update localization.cn.lua (#131)  
- flag alpha icons with updated text  
- Update koKR (#130)  
- Update zhTW (#129)  
- Merge pull request #7 from venuatu/kj  
    swp/kj: add armageddon warnings  
- Tiny cleanup  
- swp/kj: add armageddon warnings  
- Add missing localized icon text, as well as fixed bug where another one of them wasn't actually used yet.  
- Added some missing difficulty indices  
- Bump tbc alpha  
