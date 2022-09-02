# Auctionator

## [9.2.32](https://github.com/Auctionator/Auctionator/tree/9.2.32) (2022-09-02)
[Full Changelog](https://github.com/Auctionator/Auctionator/compare/9.2.31...9.2.32) 

- Fixes for previous commit  
- Classic: Selling: Remove loading when an item fails to be selected  
- Classic: Selling: Avoid prices remaining onscreen when swapping to a new item  
    This happened on megaservers because the throttle was so long it left  
    the old item's search results up and visible, looking like nothing was  
    happening.  
- [Fixes #1190] Classic: ReagentSearch: Use non-exact search for enchant reagents and scroll  
- Alter .pkgmeta\_wrath  
- Stop doing TBC builds  
- Classic: Remove delay when cancelling auctions  
- [Fixes #1188] Selling: Option for split panel view  
- Mainline: Include raw scan data in incremental scan complete event  
