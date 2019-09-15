# Deadly Boss Mods Core

## [1.13.8](https://github.com/DeadlyBossMods/DBM-Classic/tree/1.13.8) (2019-09-14)
[Full Changelog](https://github.com/DeadlyBossMods/DBM-Classic/compare/1.13.7...1.13.8)

- Prep new release  
- Removed the Blue shaman class color feature. Doing tons of digging, there is just no clean way to support that feature without taint. DBM already supports Phanx custom class colors, so at least mod will use custom colors if you define them, but even that has no way of changing colors used by default UI, which was kind of whole point of feature.  
- Fixed bad logic with timer auto correction so it does NOT run for debug mode and ignore users preferences. Debug mode is supposed to find timer errors, it can't do that as accurately if timer correction is forced to on when debug mode is on.  
    Added a logic check to AI timers that should wipe last cast timestamp if last cast was from an earlier pull. This should wipe out any further issues of AI timers generating ridiculously long CDs for abilities by comparing time stamps between two completely different pulls.  
- KR massive push (classic) (#10)  
    * KR massive push (classic)  
    * forgot kr localization in toc  
- Fixed invalid global write  
- Same as last, but in correct spot.  
- Fix last remaining scroll bar bug with drop down. Arrow not being clickable on a first created drop down, until mouse wheeling or grabbing knob  
- Fixed a lua error during a raid dbm version check that could occur if user has a voice pack selected, that's not currently installed.  
- Local updates  
    Set scrollbar alpha that actually matches aesthetics of DBM GUI  
    Fixed dropdown not expanding enough initially do to width calculations not accounting for 16 pixel wide scrollbar  
    Fixed dropdown expanding not accounting for 16 pixel wide scrollbar  
    Fixed dropdown aggressively expanding more than it needs to for non font entries  
- Damage Shield special warning for Majordomo now off by default. A new general warning that's on for everyone by default takes it's place. If special warning is re-enabled, general warning will auto hide. Reason being, melee generally don't stop attacking for it and 2, casters like to know that it was melee shield in a general announce and they are safe for another 30 seconds.  
- Fix regression that broke GUI frames do to bad template logic (that caused it to only ever run dropdown code on scrollbars)  
- Missed this  
- - Added the ability to display edit boxes defined by mods  
    - Added the ability to display sliders (because AddSliderOption has existed for ages, but never actually injected anything... WHY?)  
    - Little bit of cleanup, prevent duplicating work.  
    - Few more tweaks for GUI  
    - AddButton now supports width, height, and font object  
    - AddButton doesn't require a func, because it has onClick argument... which is the same?  
    - Added AddEditboxOption  
    - Added func argument for AddSliderOption  
    - Supported func argument for AddDropdownOption, which now actually fires  
    - Hopefully fix the slidebar issue also?  
    - Finally fixed all of the dropdown scrollbar issues  
- Fixed version check for classic BW  
- Add missing spells to interrupt CD filter  
- Change an icon that's not used in classic  
- then then :D  
- Prevent dbm-classic from overriding media defaults if it is accidentally run on retail, to avoid activating invalid media paths  
- Should trash/adds get pulled, filter boulder casts by them  
- Tweak option defaults and warning type for inferno. it's a melee problem, not an everyone one, if strat is sound.  
