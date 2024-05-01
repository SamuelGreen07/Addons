# <DBM Mod> Raids (DF)

## [10.2.37-13-g01da160](https://github.com/DeadlyBossMods/DeadlyBossMods/tree/01da1603e68ec2ed326229cb81b36c402e316468) (2024-05-01)
[Full Changelog](https://github.com/DeadlyBossMods/DeadlyBossMods/compare/10.2.37...01da1603e68ec2ed326229cb81b36c402e316468) [Previous Releases](https://github.com/DeadlyBossMods/DeadlyBossMods/releases)

- Fix trivial filter description  
- throw in a couple more  
- Thought I annotated these  
- several more defined functions for LuaLS (i'm aware how ugly UnitAura stuff looks, but LuaLS is too picky about nil/unknown checks and required 279 mods to add redundant nil checks if I just used string|number, and "any" isn't scoped enough)  
    None the less, the new diagnostics helped find several more errors (and will prevent future ones).  
    I also am annotating lots of functions too to make DBM mod development more inviting to people who don't know what all these functions do.  
- update note for own sanity  
- Oops, it actually changed timer of all 4 abilities, not just 3 of them. darkness also increased due to the change  
- Updated 3 timers on Echo of Nelth to account for Increased cast time of sunder reality increasing time between sunder reality, ebon destruction, and Calamitous Strike by 6 seconds.  
    While at it, also add cast timer too.  
- backwards compat api cleanup.  
- I hate when i forget to hit save  
- Define a few more objects, fixed some new bugs found by new definitions  
- Improvements to sync throttling for 10.2.7  
- don't register boss unitIds in classic era (not that any mod is using blank args, but still good practice)  
- apparently no one is actually ready for the cataclysm pre patch yet (ie multi interface versions separated by ,). So revert that for now  
