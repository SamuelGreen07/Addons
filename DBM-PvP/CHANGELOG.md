# <DBM Mod> PvP

## [r166](https://github.com/DeadlyBossMods/DBM-PvP/tree/r166) (2024-02-18)
[Full Changelog](https://github.com/DeadlyBossMods/DBM-PvP/compare/r164...r166) [Previous Releases](https://github.com/DeadlyBossMods/DBM-PvP/releases)

- Fix classic fallback capping time  
    The fallback was only done in the default timer time which was never  
    used.  
    Measured actual capping times in SoD Arathi: 62.5 to 67.6 seconds  
- Blood Moon end timer is now exact if you are there during event start  
    The start timer doesn't look like it can be made exact, but it seems to  
    be off by at most a minute which is fine.  
- Blood Moon seems to end 50 seconds early nowadays  
    Feels like the exact event timing changes ever other day -.-  
- Update localization.ru.lua  
- deDE update  
- Fix start timer for Arathi Basin (#136)  
    Also fix the option to disable the timer  