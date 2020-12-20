# Deadly Boss Mods Core

## [9.0.11-19-ga458ce9](https://github.com/DeadlyBossMods/DeadlyBossMods/tree/a458ce97de94ca6631ba8310553d9b7662023532) (2020-12-20)
[Full Changelog](https://github.com/DeadlyBossMods/DeadlyBossMods/compare/9.0.11...a458ce97de94ca6631ba8310553d9b7662023532) [Previous Releases](https://github.com/DeadlyBossMods/DeadlyBossMods/releases)

- Make boss preview 300x300 (#443)  
    This makes mobs actually RENDER properly, without cutting their heads off.  
- Tell GUI to ignoreCustom (#442)  
    * Tell GUI to ignoreCustom  
    * And here too  
- Also changed Drain fluids to be off by default based on feedback.  
- Now that Altimor isn't broken, fix P4 sinseeker timer on mythic  
    Also removed bad taunt warning in spires of ascension.. that mechanic doesn't seem to exist anymore  
- Added two special warnings for both add switches on Council of Blood  
    Added likely respawn time to sludgefist.  
- Actually show the count in the gaze and slam warnings  
- Updated zhTW (#441)  
- Proper syntax for failures. (#431)  
- Mod profile import/export (#440)  
- Fix two stupid  
- Fixed a bug wehre chain link warning never actually gave you partner name when it was supposed to  
    Disabled sinseeker timer for phase 4 mythic since it doesn't get cast in P4?  
    Made lady inerva personal warning for shared suffering 1 second faster  
- Support for CustomSounds (the hacky way of installing sounds) (#439)  
- Fix regression issue properly (#437)  
- Tweaked altimor sinseeker timers now that some longer lasting pulls exist on WCL  
    More aggressivevly restore sounds on login if option to disable them exists. Wouldn't want blizzard to delete that setting from the game too  
- Update zhTW (#436)  
- Blizzard apparently killed off ability to hide quest tooltips in 9.0, so disabled from DBM as well.  
- Fix typo  
- Fixed a serious regression that causes core to spam lua errors when playing sounds.  
    Fixed a bug on sludgefist where the seismic timer would keep on keeping on when it ran out of sequenced timers. now it'll cleanup when it reaches end of timer table.. still need to fix actual missing timers.  
- bump alpha revision  
