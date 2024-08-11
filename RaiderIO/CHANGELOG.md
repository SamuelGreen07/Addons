# Raider.IO Mythic Plus, Raiding, and Recruitment

## [v202408110600](https://github.com/RaiderIO/raiderio-addon/tree/v202408110600) (2024-08-11)
[Full Changelog](https://github.com/RaiderIO/raiderio-addon/compare/v202408100600...v202408110600) [Previous Releases](https://github.com/RaiderIO/raiderio-addon/releases)

- [Raider.IO] Database Refresh  
- [Raider.IO] Classic Database Refresh  
- C\_ScenarioInfo.GetCriteriaInfo returns a table. Extracting the few fields we need from it. There is an issue with enemy forces accuracy, right now it is a whole number without decimals.  
    Also, the old quantityString is missing, but it might return if we are lucky, or the quantity will be made to be more accurate and not a whole number.  
    We must pay attention to this as season 1 approaches in TWW.  
- Updated settings.json with the latest changes to the vscode wow-api annotations. Updated the docs to reflect these changes.  
    Updated the LibDBIcon to minor 55 that fixes some issues with the addon compartment.  
    Separated the choices to show the addon compartment button (and broker support), from the minimap button. This way the user can decide if they want both, one, or neither.  
