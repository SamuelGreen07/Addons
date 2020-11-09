# Deadly Boss Mods Core

## [9.0.3-23-g46c9c17](https://github.com/DeadlyBossMods/DeadlyBossMods/tree/46c9c170ff35e7994385e2254f1aa02ee44e60a9) (2020-11-08)
[Full Changelog](https://github.com/DeadlyBossMods/DeadlyBossMods/compare/9.0.3...46c9c170ff35e7994385e2254f1aa02ee44e60a9) [Previous Releases](https://github.com/DeadlyBossMods/DeadlyBossMods/releases)

- Update zhTW (#381)  
- Small council timer fix  
- tweak Emeriss timer  
- Significant updates to council post mythic testing. if heroic and normal aren't retested than it's possible those mods will not be perfect on launch, but mythic should be in fairly good shape, at least for most common boss orders. Literally no one in testing left Freida or Nik for last, so their 3 abilities are not corrected yet.  
- Fixed trivial check to make content trivial if player is 10 levels higher than content tuning, not 10 levels under it. :D  
- Missed a table  
- Simplify chain link code on sludgefist  
    Fixed chain links pairs 9 and 10 not having valid say bubbles  
    Fixed a regression that caused options with invalid spellIds to error out and fail instead of reporting out and allowing mod to continue to load  
- Fix a few changed/invalid spellId calls  
- Fixed bug causing crystalize timer not to start  
- Bug tweak last to avoid spam. if debug mode is off, cap logging level to 1 and 2, 3 should only be logged explictely if user enables it  
- Always fire debug callback even if it's not enabled, produce better transcriptor logs without needing users to actually turn debug on.  
- Miner timer adustments  
- Ensure that the option GUI never gets trivial filtered  
- Added new feature to automatically download all special anounce sounds on global level to regular announce sounds for content that is trivial for your level (on by default). Closes #379  
- comma  
- Update how istrivial works with a table that took annoying long to make. this table will applied to more features soon™  
- Update localization.tw.lua (#378)  
- Work around a new bug in GUI that didn't used to be there, but is there now. mod names can't be same as frame names or they refuse to load.  
- Minor adjustments to Ysondre  
- KR Update (#375)  
    Co-authored-by: Adam <MysticalOS@users.noreply.github.com>  
- Update DBM-Party-Shadowlands.toc (#377)  
    Correct title errors.  
- Update DBM-Shadowlands.toc (#376)  
    Add zh-TW Title.  
- Bump alpha for new test cycle  
