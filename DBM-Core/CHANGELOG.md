# Deadly Boss Mods Core

## [8.3.15](https://github.com/DeadlyBossMods/DeadlyBossMods/tree/8.3.15) (2020-02-25)
[Full Changelog](https://github.com/DeadlyBossMods/DeadlyBossMods/compare/8.3.14...8.3.15)

- Copy those harvester timers to LFR too (for now)  
- Disabled berserk timer on normal nzoth, at least til the berserk for normal is known (it doesn't match heroic)  
    Added more timer data to Thought Harvesters to normal Nzoth  
    Added a special warning to move when boss is casting creeping anquish is cast that's on by default for tanks.  
- Fix error  
- Fixed a couple missing timers on Council of Tribes in kings rest from some public high key logs. The inactive boss ability timers are still disabled because I'm still not confident they are actually timed and not triggered on thresholds for the active boss.  
    Added target scanning to Poropellant Blast on Rixxa in motherload so it can give a more precise target and target yell warning instead of generic dodge warning.  
- Added RP timer for Tonks fight in Mechagon  
- Removed the infoframe from KUJ0 encounter. It clearly doesn't work.  
- Fixed a bug that caused chemical burn timer not to show up if you weren't a healer with a dispel not on cooldown (ie it was locked behind the dispel cooldown check, sorry about that).  
    While at it, made chemical burn timer on by default for everyone instead of just healers  
- Don't call DBM:GetModLocalization() if nothing is set. This is just inefficient and bad practice. From now on, these will be templated as commented, in case they are needed, when content is current.  When content is not current, they'll be removed and cleaned up  
- Changed nettles warning to on by default for all instead of just healer and added an attempt at using target scanning, despite previous information leading me to believe that wouldn't be accurate. if it's inaccurate I'll find out fast enough.  
- Fixed a bug with jagged Nettles warning that caused it to always say the wrong spell name and also caused option to not appear correctly in GUI  
- Fix oopsy that'd break a whole lot of things  
- Should be last round of fixes  
- Dial back the luacheck for now, the rest of shadowing is fine  
- Updated luacheckrc with a few more functions and globals  
    - With FAR stricter error checking now functioning. A few bugs have been found and are now fixed  
     - Fixed a bug that caused Cleansing Protocol timers to stop working in heart chamber on mythic N'zoth  
     - Fixed SPELL\_PERIODIC\_ENERGIZE being defined twice in Combat log handler  
     - Fixed a ton of unnessesary shadowed definitions and tweaked a improved a few variable names that weren't shadowed but get tagged that way by luacheck.  
- Actually run luacheck file instead of generic SUPER basic checking. Let the real errors come in  
- - Maut adds will now say addcount and offering count in the offering warnings so it's clearer when multiple adds are up, what's what.  
    - Added count to Soul Flay timer at user request.  
