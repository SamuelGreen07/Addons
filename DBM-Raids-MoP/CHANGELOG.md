# <DBM Mod> Scenario (MoP)

## [r165](https://github.com/DeadlyBossMods/DBM-MoP/tree/r165) (2024-04-20)
[Full Changelog](https://github.com/DeadlyBossMods/DBM-MoP/compare/r164...r165) [Previous Releases](https://github.com/DeadlyBossMods/DBM-MoP/releases)

- fix some mob voice pack errors  
- Fix luaLS error  
- Tsulong update  
- Fix sneaky error that got through both checkers  
- Protectors of the Endless updated with all same stuff as previous commits  
- LeiShi modernized  
- Timer tweaks and count fixes for all bosses in Mogushan Vaults  
    Will of the emporor updated with voice pack support and timer bar and inline icon improvements  
    The way combo works was also refactored to Fix a few logic errors. However there is still a bug on blizzards end preventing resetting combo count (since on 10.2.6 combos never end after they start due to boss energy bugs)  
- how this got reverted is beyond me  
- Make phase cancelation more robust on spirit kings  
    Updated stoneguard with voice pack support, cleanup, syncable varables, and cleaner options UI  
- fix option grouping  
- fix error that slipped through all checks  
- Remaster localization.cn.lua (#43)  
- Spirit kings updated  
     - Massive improvements to GUI option layout  
     - Voice pack support  
     - Culling of redundant warnings  
     - Clarification on some warnings  
     - Better option defaults  
     - Syncable Variables  
     - 1 new chat yell  
- Garajal Updated with same as previous mods  
- Remove unused global  
- Fix some erorrs  
    apparently my new tooling is still fucked up. was supposed to preventme constantly pushing broken stuff, but apparently it didn't, back to drawing board.  
- Some of these updates are very slow process, but getting used to new toolset which is making stuff that i normally do quicker take much longer. Bare with me as I work through mop mods very slowly  
    This fully updates Elegon and Feng to supporting modern timer colors and icons, voice packs, syncable variables, modern callbacks, and better option defaults  
- Update README.md  
- maybe this?  
- maybe this to ignore those last warnings?  
- Fix a couple more  
- kill off computational distance calculations on raden that auto marked the furthest player from active vita. that's obviously not gonna work anymore  
    Fix a ton of LuaLS warnings  
- Create luals.yml  
- Fix issues from https://github.com/DeadlyBossMods/DBM-MoP/issues/20  
- Fix timer issues from https://github.com/DeadlyBossMods/DBM-MoP/issues/21  
- Fix https://github.com/DeadlyBossMods/DBM-MoP/issues/22  
- Fixed a bug that caused timer to start twice every cast, creating false debug. Closes https://github.com/DeadlyBossMods/DBM-MoP/issues/23  
- Fix https://github.com/DeadlyBossMods/DBM-MoP/issues/25  
- Fix https://github.com/DeadlyBossMods/DBM-MoP/issues/24  
- Small timer revisions. Closes https://github.com/DeadlyBossMods/DBM-MoP/issues/11  
- Fix typo  
- Update all outdoor/world boss content in MoP to support modern features like voice packs, smarter/better api checks, and redundancy cleanup  
