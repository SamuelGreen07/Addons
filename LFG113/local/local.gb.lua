local _, L = ...

L.Locals ["enGB"] = {
	["LanguageUsed"]			= "English (Great Britain)",
	["TranslatedBy"]			= " by Kauf (Horde) on Server Pagle",

-- clients
	["Clients"]					= { ["1"] = "Vanilla", ["2"] = "TBC", ["3"] = "WOTLK", ["4"] = "Cata", },

-- StandingIDs
	["StandingID"]				= { "Hated", "Hostile", "Unfriendly", "Neutral", "Friendly", "Honored", "Revered", "Exalted" },

-- Text
	["txtLoaded"] 				= "LFG113 Loaded, use /lfg to display. ",
	["txtUpdate"]				= "New Update Available",
	["txtUpdateMessage"]		= "The version of LFG113 is out of date. Please update",
	["txtInvalidAny"]			= "Invalid instance selected. You can not use 'Select Any'",
	["txtInvalidInst"]			= "Invalid instance selected.",
	["txtMissingRole"]			= "Missing role.",
	["DPS"]						= "DPS",
	["Tank"]					= "Tank",
	["Heal"]					= "Heal",
	["NeedAll"]					= "need all",
	["txtRoleType"]				= { "for the dungeon", "for the raid", "to do some questing in", "to PVP in", "" },
	["txtNotes"]				= "Update Notes:",
	["txtRoles"]				= "Roles",
	["txtInstances"]			= "Instances",
	["txtCustomText"]			= "Custom Text",
	["txtLevel"]				= "Level",
	["txtReport"]				= "Report",
	["txtReportedBy"]			= "Issue reported by",
	["txtOn"]					= "on",
	["txtBy"]					= "by",
	["txtCounts"]				= "Report(s)",
	["txtSaveQuestion"]			= "What would you like to save this as?",
	["txtReportQuestion"]		= "Who do you want to report?",
	["txtAnd"]					= "and",
	["txtOr"]					= "or",
	["txtFor"]					= "for",
	["txtGuildRun"]				= "Guild Run",
	["txtAddToBlackList"]		= "Add to Black List",
	["txtNeed"]					= "Need",
	["txtGTG"]					= "then GTG",
	["txtAddToPremade"]			= "Add to Premade",
	["txtShareBlackList"]		= "Sync Blacklist",
	["txtAddQuestion"]			= "New keyword to add",
	["txtShareRating"]			= "Sync Ratings",
	["txtDefaultWhispers"]		= {
		["Accept"]				= "You can come along with us if you want to.",
		["Decline"]				= "I'm sorry but Im not taking you on this adventure to {i}.",
		["Join"]				= "Level {l} {c} {r}",
		["Invite"]				= "I sent an invite to you so you can join us to {t} {i}",
		["Missing"]				= "Please whisper me your level AND role eg. '60 tank/dps' or more specific 'level 60 warrior dps/tank'",
		["Guild"]				= "I sent a Guild invite to you to so you can join us {t} {i}",
		["whisperPartyLeader"]	= "{p} is looking for the same instance we are."
	},
	["txtDefaultSearch"]		= {
		["LFG"]					= "{l} {c} {r} LFG {i} {s}",
		["LFM"]					= "LF{n}M {r} for {i} {s} {g}",
	},
	["txtClasses"]				= {
		[1]						= "Warrior",
		[2]						= "Paladin",
		[3]						= "Hunter",
		[4]						= "Rogue",
		[5]						= "Priest",
		[7]						= "Shaman",
		[8]						= "Mage",
		[9]						= "Warlock",
		[11]					= "Druid",
	},

	-- Labels
	["lblChannelLoading"]		= "Enable Channel Loading/Unloading",
	["lblWhatYouNeed"]			= "What do you need in your group:",
	["lblWhatToJoinAs"]			= "What do you want to join a group as:",
	["lblWhatYouView"]			= "Viewing both LFG/LFM:",
	["lblActivity"]				= "Activity",
	["lblKeybind"]				= "Keybind",
	["lblAccurate"]				= "Accurate scan (may slow down system)",
	["lblNotifications"]		= "Notifications/Alerts",
	["lblBroadcast"]			= "Broadcast",
	["lblTTB"]					= "Time To Broadcast",
	["lblTimeToLive"]			= "Message Life",
	["lblAutoWhisper"]			= "Auto Whisper",
	["lblMessDecline"]			= "Message when you DECLINE someone",
	["lblMessAccept"]			= "Message when you ACCEPT someone",
	["lblMessJoin"]				= "Message when you want to JOIN a group",
	["lblMessInvite"]			= "Message when you INVITE to your group",
	["lblMessGuildInvite"]		= "Message when you INVITE Guild to your group",
	["lblMessMissing"]			= "Message when whispered with missing info",
	["lblDesignType"]			= "Design Type (Requires reload)",
	["lblSettings"]				= "Settings",
	["lblFreeMovingEye"]		= "Search Eye on Minimap",
	["lblUseDMnotVC"]			= "Deadmines Search Initials",
	["lblAdditionalChannel"]	= "Additional channel to monitor",
	["lblSavedSearches"]		= "Saved Searches",
	["lblPlayer"]				= "Player",
	["lblIssue"]				= "Issue",
	["lblLanguage"]				= "Language",
	["lblSyncBlackList"]		= "Black list syncronization",
	["lblGroup"]				= "Group",
	["lblPremades"]				= "Premades",
	["lblChangeLanguage"]		= "Interface Language (Requires /reload)",
	["lblCommLanguage"]			= "Communication Language",
	["lblOutput"]				= "Output",
	["lblLFG"]					= "Join Group Broadcast string format",
	["lblLFM"]					= "Create Group Broadcast string format",
	["lblShowNewMessage"]		= "Auto Alert",
	["lblKeywords"]				= "Keywords",
	["lblInstanceKey"]			= "Instance Key",
	["lblPulldown"]				= "Pulldown",
	["lblNewKey"]				= "New Key",

	-- Pull Downs
	["lblSelectAny"]			= "Select Any",
	["lblSelectNone"]			= "Select None",
	["cmbActivityPull"]			= { "Dungeons", "Raids", "Quests", "PVP", "Custom" },
	["cmbLanguage"]				= {
		["frFR"]				= { 1,  false, "Français (France)" },
		["deDE"]				= { 2,  true,  "Deutsche (Deutschland)" },
		["enGB"]				= { 3,  true,  "English (Great Britain)" },
		["enUS"]				= { 4,  true,  "English (America)" },
		["itIT"]				= { 5,  false, "Italiano (Italia)" },
		["koKR"]				= { 6,  false, "한국어 (대한민국)" },
		["zhCN"]				= { 7,  false, "中文 (中国) (简化的)" },
		["zhTW"]				= { 8,  false, "中文 (台灣)" },
		["ruRU"]				= { 9,  true, "русский (Россия)" },
		["esES"]				= { 10, true,  "Español (España)" },
		["esMX"]				= { 11, true,  "Español (Mexico)" },
		["ptBR"]				= { 12, false, "Português (Brasil)" },
	},

	-- Settings TABS
	["tabGeneral"]				= { "General", 57 },
	["tabCommunication"]		= { "Communication", 96 },
	["tabWhisper"]				= { "Whispers", 64 },
	["tabDisplay"]				= { "Display", 70 },
	["tabPremade"]				= { "Premades", 35 },
	["tabKeywords"]				= { "Keys", 64 },
	["tabBlackList"]			= { "Black list", 65 },
	["tabRatings"]				= { "Rating", 60 },

	-- Popup notification
	["lblLFGNitofication"]		= "LFG113 Popup Notification",
	["lblRequestJoin"]			= "Person requesting to join",

	-- Checkbox
	["chkChannelLoading"]		= "Enable modifications of channels",
	["chkGuildOnly"]			= "Guild only",
	["chkShowAll"]				= "Show all",
	["chkForce"]				= "Force bind to key I",
	["chkEnableScan"]			= "Enabled (Requires reload)",
	["chkEnableSound"]			= "Enable sound",
	["chkPopUpAlert"]			= "Popup alert",
	["chkFullAudio"]			= "Full group audio",
	["chkPingAlert"]			= "Ping alert",
	["chkTrade"]				= "Trade",
	["chkGeneral"]				= "General",
	["chkWorld"]				= "World",
	["chkLFG"]					= "LookingForGroup",
	["chkWhispers"]				= "Accept whispers",
	["chkOriginalDisplay"]		= "Original display",
	["chkFreeMovingEye"]		= "Lock the search eye on the Minimap",
	["chkAlwaysShowEye"]		= "Always show the eye on the Minimap",
	["chkUseDMnotVC"]			= "Use DM for Deadmines, not VC",
	["chkSyncBlackList"]		= "Syncronize List",
	["chkPersonalBL"]			= "Personal Entry",
	["chkCompact"]				= "Compact LFM/LFG",
	["chkDisableAutoNotification"] = "Disable auto broadcast (use Minimap)",
	["chkShowNewMessage"]		= "Visual alert when a new match shows",
	["chkSoundNewMessage"]		= "Audio Alert when a new match shows",
	["chkSoloNewMessage"]		= "Solo: Alert only when active search",

	-- Buttons
	["btnCreateGroup"]			= "Create Group",
	["btnNEWCG"]				= "           Create\n           Group",
	["btnJoinGroup"]			= "Join Group",
	["btnNEWJG"]				= "        Join\n           Group",
	["btnPremades"]				= "Premades",
	["btnNewPremades"]			= "                  Premades",
	["btnActiveSearchs"]		= "Saved Searches",
	["btnNEWAS"]				= "           Saved\n                Searches",
	["btnBlackList"]			= "Players",
	["btnNEWBL"]				= "             Players",
	["btnSettings"]				= "Settings",
	["btnNEWSettings"]			= "              Settings",
	["btnSearch"]				= "Search",
	["btnCancelSearch"]			= "Stop",
	["btnDefault"]				= "Default",
	["btnAdd"]					= "Add",
	["btnRemove"]				= "Remove",
	["btnAccept"]				= "Accept",
	["btnDecline"]				= "Decline",
	["btnInvite"]				= "Invite",
	["btnJoin"]					= "Join",
	["btnNotify"]				= "Notify",
	["btnAddSearch"]			= "Save",
	["btnCancel"]				= "Cancel",
	["btnReport"]				= "Report",
	["btnViewNotes"]			= "Update notes",
	["btnLoad"]					= "Load",
	["btnUnload"]				= "Unload",
	["btnClear"]				= "Reset",
	["btnAcknowledge"]			= "Acknowledge",
	["btnBoth"]					= "Both",
	["btnReload"]				= "Reload",

	-- Popups
	["pupChannelLoading"]		= "Enable the ability to load and unload channels",
	["pupGuildOnly"]			= "Show only Guild activities",
	["pupShowall"]				= "Show all dungeons",
	["pupForce"]				= "Force the system to use the I keybind to open and close the LFG113",
	["pupAccurate"]				= "Enable accurate scanning, may slow down game on slow machines",
	["pupBroadcast"]			= "Sets the re-broadcast time in seconds (Requires reload)",
	["pupTimeToLive"]			= "The number of seconds we wait for a person in chat to repeat a message before we consider their last one dead and remove it from the display.",
	["pupEnableSound"]			= "Sound is enabled for the addon",
	["pupPopuAlert"]			= "Allow a popup when someone requests invite",
	["pupFullGroup"]			= "Notification via sound when your group is full.",
	["pupPingAlert"]			= "Allow audio ping when someone requests invite",
	["pupTrade"]				= "Enable broadcasting to Trade Channel",
	["pupWorld"]				= "Enable broadcasting to World Channel",
	["pupGeneral"]				= "Enable broadcasting to General Channel",
	["pupLFG"]					= "Enable broadcasting to LookingForGroup Channel",
	["pupDisplayType"]			= "Display buttons and future display updates for addon in classic display. Requires reload",
	["pupAcceptWhispers"]		= "Auto invite whispers that say their roll/level and if you need that class.",
	["pupFreeMovingEye"]		= "Lock/Unlock the search eye from the minimap",
	["pupResetEye"]				= "Reset the position of the EYE to the Minimap if you cant find it",
	["pupAlwaysShowEye"]		= "Always show the Eye on the minimap or only when you are actively searching",
	["pupUseDMnotVC"]			= "When enabled use DM for Deadmines, not VC",
	["pupSyncBlackList"]		= "Enable syncronization of the Black List with others on the network",
	["pupPersonalBL"]			= "Do not sync this entry, its personal",
	["pupCompact"]				= "Use this to compact the LFG/LFM display to smaller lines compromising information",
	["pupDisableAutoNotification"] = "Disables automatic notification to broadcast while searching, instead you have to SHIFT-LEFT CLICK the minimap icon to broadcast when you are ready",
	["pupShowNewMessage"]		= "This will alert you through RAID WARNING when a new matching group shows in chat",
	["pupSoundNewMessage"]		= "This will alert you via audio when a new matching group shows in chat",
	["pupSoloNewMessage"]		= "This will choose between allowing alerts when soloing and NOT searching, or only when you are searching",
	["pupActiveSearch"]			= {
		{ "Classic Looking For Group", 1, 1, 1 },
		{ "You have an active search going!", 1, 1, 0 }, { "\n" },
		{ "Left click          - Open/close", 0, 1, 1},
		{ "Right click        - Move icon", 0, 1, 1 },
		{ "Shift-Left click - Broadcast Search", 0, 1, 1},
	},

	["pupHowtoUse"]				= {
		{ "HOW TO USE:", 1, 1, 1 }, { "\n" },
		{ "Type in any text. You can use special format strings listed below:", 0, 1, 1},
		{ "   - {p} The player whom you are responding to", 1, 1, 0 },
		{ "   - {i} Instance", 1, 1, 0 },
		{ "   - {s} Custom string", 1, 1, 0 },
		{ "   - {t} Special string containing 'Type' of instance.", 1, 1, 0 },
		{ "   - {l} Your level", 1, 1, 0 },
		{ "   - {c} Your class", 1, 1, 0 },
		{ "   - {cs} Your current talent spec", 1, 1, 0 },
		{ "   - {r} Your role", 1, 1, 0 },
		{ "   - {n} Number of available spaces left", 1, 1, 0 },
		{"    - {g} Appends then GTG at end when one available space is left", 1, 1, 0},
		{ "\n" },
		{ "{t} will return ONE of the strings depending on the instance type selected via the pulldown:", 0, 1, 1 },
		{ "   - Dungeons selected: 'for the dungeon'", 1, 1, 0 },
		{ "   - Raids Selected: 'for the raid'", 1, 1, 0 },
		{ "   - Questing Selected: 'to do some questing in'", 1, 1, 0 },
		{ "   - PVP Selected: 'to PVP in'", 1, 1, 0 }, { "\n" },
		{ " Example: if you are a Warrior level 19 who has both DPS and TANK selected -", 0, 1, 1 },
		{ "   Level {l} {c} {r}", 1, 1, 0},
		{ "     will output 'Level 19 Warrior Tank/DPS'", 1, 1, 0}
	},

	-- Dungeons
	-- 	= {#people, Name On Pulldown, lowest entry level, highest entry level, text to display in chat,  {#tank,#heals,#dps}, { ["keyword"]=1, ... }, "use PulldownSecondChance #8", if used-submenu name, { Quest chains required for attunement }, { faction, ... }, faction level required }
	["PulldownInstance"]		= {
		["any"]					= {1, "Select One", 1, 60, "Any", {1,1,3}, { }, nil},
		-- Vanilla
		["rfc"]					= {5, "Ragefire Chasm", 13, 18, "RFC", {1,1,3}, { [" rfc "]=1, [" ragefire "]=1, [" ragefire chasm "]=1 }, nil, "Vanilla"},
		["wc"]					= {5, "Wailing Caverns", 17, 24, "WC", {1,1,3}, { [" wc "]=1, [" wailing caverns "]=1 }, nil, "Vanilla"},
		["vc"]					= {5, "The Deadmines", 17, 26, "VC", {1,1,3}, { [" vc "]=1, [" deadmines "]=1, [" van cleef "]=1 }, nil, "Vanilla"},
		["sfk"]					= {5, "Shadowfang Keep", 22, 30, "SFK", {1,1,3}, { [" sfk "]=1, [" shadowfang keep "]=1 }, nil, "Vanilla"},
		["bfd"]					= {5, "Blackfathom Deeps", 24, 32, "BFD", {1,1,3}, { [" bfd "]=1, [" blackfathom deeps "]=1 }, nil, "Vanilla"},
		["stocks"]				= {5, "The Stockade", 24, 32, "Stocks", {1,1,3}, { [" stocks "]=1, [" stockade "]=1 }, nil, "Vanilla"},
		["gnomer"]				= {5, "Gnomeregan", 29, 38, "Gnomer", {1,1,3}, { [" gnomer "]=1, [" gnomeregan "]=1 }, nil, "Vanilla"},
		["rfk"]					= {5, "Razorfen Kraul", 29, 38, "RFK", {1,1,3}, { [" rfk "]=1, [" razorfen kraul "]=1 }, nil, "Vanilla"},
		["internalsm"]			= {5, "The Scarlet Monastery", 26, 45, "SM", {1,1,3}, {}, "1:sm gy!1:sm lib!1:sm arm!1:sm cath!1:internalsm", "Vanilla"},
		["sm gy"]				= {5, "The Scarlet Monastery Graveyard", 26, 36, "SM GY", {1,1,3}, { [" sm g"]=1, [" graveyard "]=1, [" gy "]=1 }, "1:sm gy!1:internalsm", "Vanilla"},
		["sm lib"]				= {5, "The Scarlet Monastery Library", 29, 39, "SM Lib", {1,1,3}, { [" sm l"]=1, [" library "]=1, [" lib "]=1 }, "1:sm lib!1:internalsm", "Vanilla"},
		["sm arm"]				= {5, "The Scarlet Monastery Armory", 32, 42, "SM Arm", {1,1,3}, { [" sm a"]=1, [" armory "]=1, [" arm "]=1 }, "1:sm arm!1:internalsm", "Vanilla"},
		["sm cath"]				= {5, "The Scarlet Monastery Cathedral", 34, 45, "SM Cath", {1,1,3}, { [" sm c"]=1, [" cathedral "]=1, [" cath "]=1 }, "1:sm cath!1:internalsm", "Vanilla"},
		["rfd"]					= {5, "Razorfen Downs", 37, 46, "RFD", {1,1,3}, { [" rfd "]=1, [" razorfen downs "]=1 }, nil, "Vanilla"},
		["internalulda"]		= {5, "Uldaman", 41, 51, "Ulda", {1,1,3}, {}, "1:ulda front!1:ulda back!1:internalulda", "Vanilla"},
		["ulda front"]			= {5, "Uldaman Front", 41, 51, "Ulda Front", {1,1,3}, { [" ulda front "]=1, [" front ulda "]=1, [" uldaman front "]=1, [" front uldaman "]=1 }, "1:ulda front!1:internalulda", "Vanilla"},
		["ulda back"]			= {5, "Uldaman Back", 41, 51, "Ulda Back", {1,1,3}, { [" ulda back "]=1, [" back ulda "]=1, [" uldaman back "]=1, [" back uldaman "]=1 }, "1:ulda back!1:internalulda", "Vanilla"},
		["zf"]					= {5, "Zul'Farrak", 42, 46, "ZF", {1,1,3}, { [" zf "]=1, [" zulfarrak "]=1, [" zul'farrak "]=1 }, nil, "Vanilla"},
		["internalmara"]		= {5, "Maraudon", 46, 55, "Mara", {1,1,3}, {}, "1:mara purple!1:mara orange!1:mara princess!1:internalmara", "Vanilla"},
		["mara purple"]			= {5, "Maraudon Purple", 46, 55, "Mara Purple", {1,1,3}, { [" mara purple "]=1, [" purple mara "]=1, [" maraudon purple "]=1, [" purple maraudon "]=1 }, "1:mara purple!1:internalmara", "Vanilla"},
		["mara orange"]			= {5, "Maraudon Orange", 46, 55, "Mara Orange", {1,1,3}, { [" mara orange "]=1, [" orange mara "]=1, [" maraudon orange "]=1, [" orange maraudon "]=1 }, "1:mara orange!1:internalmara", "Vanilla"},
		["mara princess"]		= {5, "Maraudon Princess", 46, 55, "Mara Princess", {1,1,3}, { [" mara princess "]=1, [" princess mara "]=1, [" maraudon princess "]=1, [" princess maraudon "]=1 }, "1:mara princess!1:internalmara", "Vanilla"},
		["st"]					= {5, "Temple of Atal'Hakkar", 50, 56, "ST", {1,1,3}, { [" st "]=1, [" atal'hakkar "]=1, [" atalhakkar "]=1 }, nil, "Vanilla"},
		["internalbrd"]			= {5, "Blackrock Depths", 52, 60, "BRD", {1,1,3}, {}, "1:brd arena!1:brd anger!1:brd golem!1:internalbrd", "Vanilla"},
		["brd arena"]			= {5, "Blackrock Depths Arena", 52, 60, "BRD Arena", {1,1,3}, { [" arena "]=1, [" brd arena "]=1, [" blackrock depths arena "]=1 }, "1:brd arena!1:internalbrd", "Vanilla"},
		["brd anger"]			= {5, "Blackrock Depths Anger", 52, 60, "BRD Anger", {1,1,3}, { [" anger "]=1, [" brd anger "]=1, [" brd angerforge "]=1, [" blackrock depths anger "]=1 }, "1:brd anger!1:internalbrd", "Vanilla"},
		["brd golem"]			= {5, "Blackrock Depths Golem", 52, 60, "BRD Golem", {1,1,3}, { [" golem "]=1, [" brd golem "]=1, [" blackrock depths golem "]=1 }, "1:brd golem!1:internalbrd", "Vanilla"},
		["lbrs"]				= {5, "Lower Blackrock Spire", 55, 60, "LBRS", {1,1,3}, { [" lbrs "]=1, [" lower blackrock "]=1 }, nil, "Vanilla"},
		["ubrs"]				= {10, "Upper Blackrock Spire", 55, 60, "UBRS", {1,1,3}, { [" ubrs "]=1, [" upper blackrock "]=1 }, nil, "Vanilla"},
		["internaldm"]			= {5, "Dire Maul", 55, 60, "DM", {1,1,3}, {}, "1:dm west!1:dm north!1:dm east!1:dm tribute!1:internaldm", "Vanilla"},
		["dm west"]				= {5, "Dire Maul West", 55, 60, "DM West", {1,1,3}, { [" dm w "]=1, [" dm west "]=1, [" west dm "]=1, [" dire maul west "]=1, [" west dire maul "]=1 }, "1:dm west!1:internaldm", "Vanilla"},
		["dm north"]			= {5, "Dire Maul North", 55, 60, "DM North", {1,1,3}, { [" dm n "]=1, [" dm north "]=1, [" north dm "]=1, [" dire maul north "]=1, [" north dire maul "]=1 }, "1:dm north!1:internaldm", "Vanilla"},
		["dm east"]				= {5, "Dire Maul East", 55, 60, "DM East", {1,1,3}, { [" dm e "]=1, [" dm east "]=1, [" east dm "]=1, [" dire maul east "]=1, [" east dire maul "]=1 }, "1:dm east!1:internaldm", "Vanilla"},
		["dm tribute"]			= {5, "Dire Maul Tribute", 55, 60, "DM Tribute", {1,1,3}, { [" tribute "]=1, [" dm tribute "]=1, [" tribute dm "]=1, [" dire maul tribute "]=1, [" tribute dire maul "]=1, [" tribute run "]=1 }, "1:dm tribute!1:internaldm", "Vanilla"},
		["internalstrat"]		= {5, "Stratholme", 58, 60, "Strat", {1,1,3}, {}, "1:strat live!1:strat dead!1:internalstrat", "Vanilla"},
		["strat live"]			= {5, "Stratholme Live", 58, 60, "Strat Live", {1,1,3}, { [" strat live "]=1, [" strat scarlet "]=1, [" live strat "]=1, [" scarlet strat "]=1, [" stratholme live "]=1, [" live stratholme "]=1 }, "1:strat live!1:internalstrat", "Vanilla"},
		["strat dead"]			= {5, "Stratholme Dead", 58, 60, "Strat Dead", {1,1,3}, { [" strat dead "]=1, [" strat undead "]=1, [" strat scourge "]=1, [" dead strat "]=1, [" undead strat "]=1, [" scourge strat "]=1, [" ud strat "]=1, [" ud strath "]=1, [" strat ud "]=1, [" stratholme dead "]=1, [" stratholme undead "]=1, [" dead stratholme "]=1, [" undead stratholme "]=1 }, "1:strat dead!1:internalstrat", "Vanilla"},
		["scholo"]				= {5, "Scholomance", 58, 60, "Scholo", {1,1,3}, { [" scholo "]=1, [" scholomance "]=1 }, nil, "Vanilla"},
		-- TBC Heroic
		["hramparts"]			= {5, "Heroic Hellfilre Ramparts", 70, 75, "Heroic Ramps", {1,1,3}, { }, nil, "TBC Heroic", nil, { 946, 947 }, 7 },
		["hfurnace"]			= {5, "Heroic Blood Furnace", 70, 75, "Heroic BF", {1,1,3}, { }, nil, "TBC Heroic", nil, { 946, 947 }, 7 },
		["hshattered"]			= {5, "Heroic Shattered Halls", 70, 75, "Heroic SH", {1,1,3}, { }, nil, "TBC Heroic", nil, { 946, 947 }, 7 },
		["hslavepens"]			= {5, "Heroic The Slave Pens", 70, 75, "Heroic SP", {1,1,3}, { }, nil, "TBC Heroic", nil, { 942}, 7 },
		["htheunderbog"]		= {5, "Heroic Underbog", 70, 75, "Heroic UB", {1,1,3}, { }, nil, "TBC Heroic", nil, { 942 }, 7 },
		["hthesteamvaults"]		= {5, "Heroic Steam Vaults", 70, 75, "Heroic SV", {1,1,3}, { }, nil, "TBC Heroic", nil, { 942 }, 7 },
		["hmanatombs"]			= {5, "Heroic Mana-Tombs", 70, 75, "Heroic MT", {1,1,3}, { }, nil, "TBC Heroic", nil, { 1011 }, 7 },
		["hauchenaicrypts"]		= {5, "Heroic Auchenai Crypts", 70, 75, "Heroic AC", {1,1,3}, { }, nil, "TBC Heroic", nil, { 1011 }, 7 },
		["hsethekkhalls"]		= {5, "Heroic Sethekk Halls", 70, 75, "Heroic Seth", {1,1,3}, { }, nil, "TBC Heroic", nil, { 1011 }, 7 },
		["hshadowlabyrinth"]	= {5, "Heroic Shadow Labyrinth", 70, 75, "Heroic Slabs", {1,1,3}, { }, nil, "TBC Heroic", nil, { 1011 }, 7 },
		["hescapefromdurnholde"]= {5, "Heroic Old Hillsbrad", 70, 75, "Heroic Old Hillsbrad", {1,1,3}, {  }, nil, "TBC Heroic", nil, { 989 }, 7 },
		["hblackmorass"]		= {5, "Heroic Black Morass", 70, 75, "Heroic BM", {1,1,3}, { }, nil, "TBC Heroic", nil, { 989 }, 7 },
		["hopeningofthedarkportal"]	= {5, "Heroic Opening of the Dark Portal", 70, 75, "Heroic Opening of the Dark Portal ", {1,1,3}, { }, nil, "TBC Heroic", nil, { 989 }, 7 },
		["hthemechanar"]		= {5, "Heroic Mechanar", 70, 75, "Heroic Mech", {1,1,3}, { }, nil, "TBC Heroic", nil, { 935 }, 7 },
		["hthebotanica"]		= {5, "Heroic Botanica", 70, 75, "Heroic BOT", {1,1,3}, { }, nil, "TBC Heroic", nil, { 935 }, 7 },
		["hthearcatraz"]		= {5, "Heroic Arcatraz", 70, 75, "Heroic ARC", {1,1,3}, { }, nil, "TBC Heroic", nil, { 935 }, 7 },
		["hmagistersterrace"]	= {5, "Heroic Magister’s Terrace", 70, 75, "Heroic Magister’s Terrace", {1,1,3}, { }, nil, "TBC Heroic", { 11492 } },
		-- TBC
		["ramparts"]			= {5, "Hellfilre Ramparts", 58, 62, "Ramps", {1,1,3}, { [" ramparts "]=1, [" hellfire ramparts "]=1, [" hellfire "]=1, [" hfr "]=1, [" ramps "]=1, [" ramp "]=1 }, nil, "TBC Normal"},
		["furnace"]				= {5, "Blood Furnace", 58, 63, "BF", {1,1,3}, { [" furnace "]=1, [" blood furnace "]=1, [" blood furn "]=1, [" bf "]=1 }, nil, "TBC Normal"},
		["shattered"]			= {5, "Shattered Halls", 67, 70, "SH", {1,1,3}, { [" shattered halls "]=1, [" shatt halls "]=1, [" shattered "]=1, [" sh "]=1 }, nil, "TBC Normal"},
		["slavepens"]			= {5, "The Slave Pens", 59, 64, "SP", {1,1,3}, { [" the slave pens "]=1, [" slave pens "]=1, ["slavepens"]=1, [" sp "]=1 }, nil, "TBC Normal"},
		["theunderbog"]			= {5, "The Underbog", 60, 65, "UB", {1,1,3}, { [" the underbog "]=1, [" underbog "]=1, [" ub "]=1 }, nil, "TBC Normal"},
		["thesteamvaults"]		= {5, "The Steam Vaults", 67, 70, "SV", {1,1,3}, { [" the steam vaults "]=1, [" steam vaults "]=1, [" steam vault "]=1, [" steamvaults "]=1, [" steamvault "]=1, [" sv "]=1 }, nil, "TBC Normal"},
		["manatombs"]			= {5, "Mana-Tombs", 62, 66, "MT", {1,1,3}, { [" mana-tombs "]=1, [" mana tombs "]=1, [" mana tomb "]=1, [" manatombs "]=1, [" manat "]=1, [" mt "]=1 }, nil, "TBC Normal"},
		["auchenaicrypts"]		= {5, "Auchenai Crypts", 63, 67, "AC", {1,1,3}, { [" auchenai crypts "]=1, [" auchenaicrypts "]=1, [" crypts "]=1, [" ac "]=1 }, nil, "TBC Normal"},
		["sethekkhalls"]		= {5, "Sethekk Halls", 65, 69, "Seth", {1,1,3}, { [" sethekk halls "]=1, [" sethekkhalls "]=1, [" sethekk "]=1, [" seth halls "]=1, [" seth "]=1, [" auch-sh "]=1 }, nil, "TBC Normal"},
		["shadowlabyrinth"]		= {5, "Shadow Labyrinth", 67, 70, "Slabs", {1,1,3}, { [" shadow labyrinth "]=1, [" shadowlabyrinth "]=1, [" shadow lab "]=1, [" shadow labs "]=1, [" shadowlab "]=1, [" shadowlabs "]=1, [" sl "]=1, [" slabs "]=1, [" slab "]=1 }, nil, "TBC Normal"},
		["escapefromdurnholde"]	= {5, "Old Hillsbrad", 64, 68, "Old Hillsbrad", {1,1,3}, { [" escape from durnholde "]=1, [" efd "]=1, [" old hillsbrad "]=1, [" old hill "]=1, [" oldhillsbrad "]=1, [" ohb "]=1, [" ohf "]=1 }, nil, "TBC Normal"},
		["blackmorass"]			= {5, "Black Morass", 68, 80, "BM", {1,1,3}, { [" black morass "]=1, [" bm "]=1 }, nil, "TBC Normal"},
		["openingofthedarkportal"] = {5, "Opening of the Dark Portal", 69, 70, "Opening of the Dark Portal ", {1,1,3}, { [" opening of the dark portal  "]=1 }, nil, "TBC Normal"},
		["themechanar"]			= {5, "The Mechanar", 67, 70, "Mech", {1,1,3}, { [" the mechanar "]=1, [" mechanar "]=1, [" mech "]=1 }, nil, "TBC Normal"},
		["thebotanica"]			= {5, "The Botanica", 67, 70, "BOT", {1,1,3}, { [" the botanica "]=1, [" botanica "]=1, [" bot "]=1 }, nil, "TBC Normal"},
		["thearcatraz"]			= {5, "The Arcatraz", 68, 80, "ARC", {1,1,3}, { [" the arcatraz "]=1, [" arcatraz "]=1, [" arc "]=1 }, nil, "TBC Normal"},
		["magistersterrace"]	= {5, "Magister’s Terrace", 70, 70, "Magister’s Terrace", {1,1,3}, { [" magister’s terrace "]=1, [" magistersterrace "]=1, ["mgt "]=1 }, nil, "TBC Normal"},
	},

	["PulldownSecondChance"]	= {
		["sm"]					= {5, "The Scarlet Monastery", 26, 45, "", {1,1,3}, { [" sm "]=1, [" scarlet monastery "]=1, [" sm full "]=1, [" scarlet monastery full "]=1 }, "1:internalsm!1:sm gy!1:sm lib!1:sm arm!1:sm cath", "Vanilla"},
		["ulda"]				= {5, "Uldaman", 41, 51, "", {1,1,3}, { [" uld "]=1, [" ulda "]=1, [" uldaman "]=1, [" ulda full "]=1, [" uld full "]=1, [" uldaman full "]=1 }, "1:internalulda!1:ulda front!1:ulda back", "Vanilla"},
		["mara"]				= {5, "Maraudon", 46, 55, "", {1,1,3}, { [" mara "]=1, [" maraudon "]=1, [" mara full "]=1, [" maraudon full "]=1 }, "1:internalmara!1:mara purple!1:mara orange!1:mara princess", "Vanilla"},
		["brd"]					= {5, "Blackrock Depths", 52, 60, "", {1,1,3}, { [" brd "]=1, [" blackrock depths "]=1, [" brd full "]=1, ["blackrock depths full "]=1 }, "1:internalbrd!1:brd arena!1:brd anger!1:brd golem", "Vanilla"},
		["dm"]					= {5, "Dire Maul", 55, 60, "", {1,1,3}, { [" dm "]=1, [" dire maul "]=1, [" dm full "]=1, [" dire maul full "]=1 }, "1:internaldm!1:dm west!1:dm north!1:dm east!1:dm tribute", "Vanilla"},
		["strat"]				= {5, "Stratholme", 58, 60, "", {1,1,3}, { [" strat "]=1, [" strath "]=1, [" stratholme "]=1, [" strat full "]=1, [" stratholme full "]=1 }, "1:internalstrat!1:strat live!1:strat dead", "Vanilla"}
	},

	-- Raids
	["PulldownRaids"]			= {
		-- Vanilla
		["any"]					= {1, "Select One", 1, 60, "Any", {1,1,3}, { } },
		["ony"]					= {40, "Onyxia's Lair", 60, 61, "Ony", {2,8,30}, { [" ony "]=1, [" onyxia "]=1, ["onyxia lair "]=1 }, nil, "Vanilla"},
		["zg"]					= {20, "Zul'Gurub", 60, 61, "ZG", {2,4,14}, { [" zg "]=1, [" zul'gurub "]=1, [" zulgurub "]=1, [" zul gurub "]=1 }, nil, "Vanilla"},
		["mc"]					= {40, "Molten Core", 60, 61, "MC", {2,8,30}, { [" mc "]=1, [" molten core "]=1 }, nil, "Vanilla"},
		["bwl"]					= {40, "Blackwing Lair", 60, 62, "BWL", {2,8,30}, { [" bwl "]=1, [" blackwing lair "]=1 }, nil, "Vanilla"},
		["aq20"]				= {20, "Ruins of Ahn'Qiraj", 60, 62, "AQ20", {2,4,14}, { [" aq20 "]=1, [" ruins of ahn"]=1 }, nil, "Vanilla"},
		["aq40"]				= {40, "Temple of Ahn'Qiraj", 60, 63, "AQ40", {2,8,30}, { [" aq40 "]=1, [" temple of ahn"]=1 }, nil, "Vanilla"},
		["naxx"]				= {40, "Naxxramas", 60, 64, "Naxx", {2,8,30}, { [" naxx "]=1, [" naxxramas "]=1 }, nil, "Vanilla"},
		-- TBC
		["karazhan"]			= {10, "Karazhan", 70, 70, "Karazhan", {2, 3, 5}, { [" karazhan "]=1, [" kara "]=1, [" kz "]=1 }, nil, "TBC", { 9838, 9837, 9836, 9832, 9831, 9829, 9826, 9825, 9824 } },
		["gruulslair"]			= {25, "Gruul’s Lair", 70, 70, "Gruul’s Lair", {3,8,29}, { [" gruul’s "]=1, [" gruuls "]=1, [" gruul "]=1, [" grul "]=1, [" gruulslair "]=1, [" gl "]=1 }, nil, "TBC"},
		["magtheridonslair"]	= {25, "Magtheridon’s Lair", 70, 70, "Magtheridon’s Lair", {4,8,28}, { [" magtheridon’s lair "]=1, [" magtheridons lair "]=1, [" magtheridons "]=1, [" magtheridon "]=1, [" mag hellfire "]=1 }, nil, "TBC"},
		["serpentshrinecavern"] = {25, "Serpentshrine Cavern", 70, 70, "Serpentshrine Cavern", {4,8,28}, { [" serpentshrine cavern "]=1, [" serpentshrine "]=1, [" ssc "]=1 }, nil, "TBC", { 10901 } },
		["theeye"]				= {25, "The Eye", 70, 70, "The Eye", {4,8,28}, { [" the eye "]=1, [" eye "]=1, [" tempest keep "]=1, [" tk "]=1 }, nil, "TBC", { 10888, 10886, 10885, 10884, 10588, 10523, 10579, 10541, 10519, 10515, 10514, 10431, 10481, 10480, 10458, 10680 } },
		["thebattleformounthyjal"] = {25, "The Battle for Mount Hyjal", 70, 70, "The Battle for Mount Hyjal", {4,8,28}, { [" the battle for mount hyjal  "]=1, [" battle for mount hyjal "]=1, [" mount hyjal "]=1, [" hyjal "]=1, [" hyjal summit "]=1 }, nil, "TBC", { 10445 } },
		["blacktemple"]			= {25, "Black Temple", 70, 70, "Black Temple", {4,8,28}, { [" black temple "]=1, [" bt "]=1 }, nil, "TBC", { 10959, 10957, 10958, 10985, 10949, 10948, 10947, 10946, 10944, 10708 } },
		["zulaman"]				= {10, "Zul'Aman", 70, 70, "Zul'Aman", {2, 3, 5}, { [" zul'aman "]=1, [" za "]=1 }, nil, "TBC"},
		["sunwellplateau"]		= {25, "Sunwell Plateau", 70, 70, "Sunwell Plateau ", {4,8,28}, { [" sunwell plateau  "]=1, [" sunwell "]=1, [" swp "]=1 }, nil, "TBC"},
		["doomwalker"]			= {40, "Doomwalker", 70, 70, "Doomwalker", {5, 15, 20}, { [" doomwalker "]=1 }, nil, "TBC"},
		["doomlordkazzak"]		= {40, "Doom Lord Kazzak", 70, 70, "Doom Lord Kazzak", {5, 15, 20}, { [" doom lord kazzak "]=1, [" lord kazzak "]=1, [" kazzak "]=1 }, nil, "TBC"},
	},

	-- PVP
	["PulldownPVP"]				= {
		-- Vanilla
		["any"]					= {1, "Select One", 1, 70, "Any", {1,1,3}, { } },
		["av"]					= {5, "Alterac Valley", 51, 70, "AV", {}, { [" av "]=1, [" alterac "]=1 }, nil, "Vanilla"},
		["wg"]					= {5, "Warsong Gulch", 10,70, "WG", {}, { [" wg "]=1, [" warsong "]=1 }, nil, "Vanilla"},
		["ab"]					= {5, "Arathi Basin", 20, 70, "AB", {}, { [" ab "]=1, [" arathi basin "]=1 }, nil, "Vanilla"},
		["world"]				= {40, "World PVP", 1, 70, "World PVP", {}, { [" world pvp "]=1 }, nil, "Vanilla"},
		-- TBC
		["eyeofthestorm"]		= {5, "Eye of the Storm", 60, 70, "EOTS", {}, { [" eots "]=1, [" eye of the storm "]=1 }, nil, "TBC"},
	},

	["Ignore"]					= {
		["ltb"]					= 1,
		["wtb"]					= 1,
		["nights are"]			= 1,
		["recruiting"]			= 1,
		["recruitment"]			= 1,
		["exceptional players"]	= 1,
		["dedicated to"]		= 1,
		["encha"]				= 1,
		["leather"]				= 1,
		["lw"]					= 1,
		["blacksmith"]			= 1,
		["engineer"]			= 1,
		["tailor"]				= 1,
		["alchem"]				= 1
	},
}