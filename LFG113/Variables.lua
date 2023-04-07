	local _, L = ...

	L.Functions = {}

	-- Default Values
	L.Variables = { ["version"] = "Version 3.03", ["author"] = "Joseph Forrest", ["date"] = "09/20/2019", ["update"] = "01/19/2023" }

	-- Visual Frames
	L.Frames = {}
	L.Frames.mainFrame = CreateFrame ("Frame", "LFG113_MainFrame", UIParent, "BasicFrameTemplate")
	L.Frames.popupFrame = CreateFrame ("Frame", nil, UIParent, "BasicFrameTemplate")
	L.Frames.updatedFrame = CreateFrame ("Frame", nil, UIParent, "BasicFrameTemplate")
	L.Frames.MinimapButton = CreateFrame ("Button", nil, Minimap)
	L.Frames.frmRatings = CreateFrame ("Frame", nil, UIParent, "BasicFrameTemplate")

	-- Frames for events
	L.Frames.rosterFrame = CreateFrame ("Frame")
	L.Frames.autoInviteFrame = CreateFrame ("Frame")
	L.Frames.chatFrame = CreateFrame( "Frame" )

	L.Variables.BroadCastChannel = "LFG113V04a"
	L.Variables.AddOnChatWindowMessages, L.Variables.BasicFramePool, L.Variables.FramePool, L.Variables.CurrentSearch, L.Variables.TableRowList, L.Variables.tableOpen = {}, {}, {}, {}, {}, {}
	L.Variables.TabViewing, L.Variables.ActivitySelected, L.Variables.AllDungeonsChecked = 0, 1, false
	L.Variables.CanDPS, L.Variables.CanHeal, L.Variables.CanTank = false, false, false
	L.Variables.broadcastAppString, L.Variables.broadcastOriginalString, L.Variables.CustomSearchString = "", "", ""
	L.Variables.guildName, L.Variables.guildOnly, L.Variables.guildBroadcastTime = "", false, 1
	L.Variables.NotifiedOfUpdate, L.Variables.PeopleWaiting = false, false
	L.Variables.FirstResponder = nil
	L.Variables.LoadedPremade = nil

	-- Blacklist Swapping Information
	L.Variables.BlacklistSwapping = 0
	L.Variables.BlacklistClient = ""
	L.Variables.BlacklistPlaceholder = {}

	-- Temporary Rating Information for those not rated
	L.Variables.Ratings = {} -- { ["player"]=enterediinstance, ... } When someone joins the group
	L.Variables.needsRatings = {} --  { player, ... } When someone leaves or you leave group that HAS been in an instance with you.

	L.Variables.InstancesSorted = { "any", "rfc", "wc", "vc", "sfk", "bfd", "stocks", "gnomer", "rfk", "internalsm", "sm gy", "sm lib", "sm arm", "sm cath", "rfd", "internalulda", "ulda front", "ulda back", "zf", "internalmara", "mara purple", "mara orange", "mara princess", "st", "internalbrd", "brd anger", "brd arena", "brd golem", "lbrs", "ubrs", "internaldm", "dm west", "dm north", "dm east", "dm tribute", "internalstrat", "strat live", "strat dead", "scholo",
			"ramparts", "furnace", "shattered", "slavepens", "theunderbog", "thesteamvaults", "manatombs", "auchenaicrypts", "sethekkhalls", "shadowlabyrinth", "escapefromdurnholde", "blackmorass", "openingofthedarkportal", "themechanar", "thebotanica", "thearcatraz", "magistersterrace",
			"hramparts", "hfurnace", "hshattered", "hslavepens", "htheunderbog", "hthesteamvaults", "hmanatombs", "hauchenaicrypts", "hsethekkhalls", "hshadowlabyrinth", "hescapefromdurnholde", "hblackmorass", "hopeningofthedarkportal", "hthemechanar", "hthebotanica", "hthearcatraz", "hmagistersterrace",
			"upgardekeep", "thenexus", "azjolnerub", "ahnkahet", "draktharan", "theviolethold", "gundrak", "hallsofstone", "hallsoflightning", "theoculus", "utgardepinnacle", "cullingofstratholme", "trialofthechampion", "hallsofreflection", "pitofsaron", "forgeofsouls",
			"hupgardekeep", "hthenexus", "hazjolnerub", "hahnkahet", "hdraktharan", "htheviolethold", "hgundrak", "hhallsofstone", "hhallsoflightning", "htheoculus", "hutgardepinnacle", "hcullingofstratholme", "htrialofthechampion", "hhallsofreflection", "hpitofsaron", "hforgeofsouls" }
	L.Variables.RaidsSorted = { "any", "ony", "zg", "mc", "bwl", "aq20", "aq40", "naxx", "magtheridonslair", "serpentshrinecavern", "theeye", "karazhan", "gruulslair", "thebattleformounthyjal", "blacktemple", "zulaman", "sunwellplateau", "doomwalker", "doomlordkazzak",
			"10naxxramas", "10obsidiansanctum", "10vaultofarchavon", "10eyeofeternity", "10ulduar", "10trialofthecrusader", "10onyxiaslair", "10icecrowncitadel", "10rubysanctum", "25naxxramas", "25obsidiansanctum", "25vaultofarchavon", "25eyeofeternity", "25ulduar", "25trialofthecrusader", "25onyxiaslair", "25icecrowncitadel", "25rubysanctum" }
	L.Variables.PVPSorted = { "any", "world", "av", "wg", "ab", "eyeofthestorm" }
	L.Variables.PlayerClass = { -- Roles = Tank, Healer, DPS
		["warrior"]		= { ["roles"] = { true, false, true }, ["map"] = { ["sx"] = .625, ["ex"] = .75, ["sy"] = 0, ["ey"] = .25 } },	-- warrior { tank = { "protection" }, heals = {}, dps = { "arms", "fury" } }
		["paladin"]		= { ["roles"] = { true, true, true }, ["map"] = { ["sx"] = .625, ["ex"] = .75, ["sy"] = .5, ["ey"] = .75 } },	-- paladin { tank = { "protection" }, heals = { "holy" }, dps = { "reribution" } }
		["hunter"]		= { ["roles"] = { false, false, true }, ["map"] = { ["sx"] = .625, ["ex"] = .75, ["sy"] = .25, ["ey"] = .5 } },	-- hunter { tank = {}, heals = {}, dps = { "survival", "marksmanship", "beast mastery" } }
		["rogue"]		= { ["roles"] = { false, false, true }, ["map"] = { ["sx"] = .875, ["ex"] = 1, ["sy"] = 0, ["ey"] = .25 } },	-- rogue { tank = {}, heals = {}, dps = { "assassination", "combat", "subtlety" } }
		["priest"]		= { ["roles"] = { false, true, true }, ["map"] = { ["sx"] = .875, ["ex"] = 1, ["sy"] = .25, ["ey"] = .5 } },	-- priest { tank = {}, heals = { "holy", "discipline" }, dps = { "shadow" } }
		["shaman"]		= { ["roles"] = { false, true, true }, ["map"] = { ["sx"] = .75, ["ex"] = .875, ["sy"] = .25, ["ey"] = .5 } },	-- shaman { tank = {}, heals = { "restoration" }, dps = { "elemental", "enhancement" } }
		["mage"]		= { ["roles"] = { false, false, true }, ["map"] = { ["sx"] = .75, ["ex"] = .875, ["sy"] = 0, ["ey"] = .25 } },	-- mage { tank = {}, heals = {}, dps = { "arcane", "fire", "frost" } }
		["warlock"]		= { ["roles"] = { false, false, true }, ["map"]  = { ["sx"] = .75, ["ex"] = .875, ["sy"] = .75, ["ey"] = 1 } },	-- warlock { tank = {}, heals = {}, dps = { "affliction" , "demonology", "destruction" } }
		["lock"]		= { ["roles"] = { false, false, true }, ["map"]  = { ["sx"] = .75, ["ex"] = .875, ["sy"] = .75, ["ey"] = 1 } },	-- warlock { tank = {}, heals = {}, dps = { "affliction" , "demonology", "destruction" } }
		["druid"]		= { ["roles"] = { true, true, true }, ["map"] = { ["sx"] = .625, ["ex"] = .75, ["sy"] = .75, ["ey"] = 1 } },	-- druid { tank = { "feral" }, heals = { "restoration" }, dps = { "balance", "feral" } }
		["deathnight"]	= { ["roles"] = { true, false, true }, ["map"] = { ["sx"] = .75, ["ex"] = .875, ["sy"] = .5, ["ey"] = .75 } }, -- DK
	}

	L.Variables.PlayerRace = {
		["Human"]		= { ["map"] = { ["sx"] = 0, ["ex"] = .125, ["sy"] = 0, ["ey"] = .25 } },
		["Dwarf"]		= { ["map"] = { ["sx"] = .125, ["ex"] = .25, ["sy"] = 0, ["ey"] = .25 } },
		["Gnome"]		= { ["map"] = { ["sx"] = .25, ["ex"] = .375, ["sy"] = 0, ["ey"] = .25 } },
		["NightElf"]	= { ["map"] = { ["sx"] = .375, ["ex"] = .5, ["sy"] = 0, ["ey"] = .25 } },
		["Draenei"]		= { ["map"] = { ["sx"] = .5, ["ex"] = .625, ["sy"] = 0, ["ey"] = .25 } },
		["Tauren"]		= { ["map"] = { ["sx"] = 0, ["ex"] = .125, ["sy"] = .25, ["ey"] = .5 } },
		["Scourge"]		= { ["map"] = { ["sx"] = .125, ["ex"] = .25, ["sy"] = .25, ["ey"] = .5 } },
		["Troll"]		= { ["map"] = { ["sx"] = .25, ["ex"] = .375, ["sy"] = .25, ["ey"] = .5 } },
		["Orc"]			= { ["map"] = { ["sx"] = .375, ["ex"] = .5, ["sy"] = .25, ["ey"] = .5 } },
		["BloodElf"]	= { ["map"] = { ["sx"] = .5, ["ex"] = .625, ["sy"] = .25, ["ey"] = .5 } },
	}

	L.Variables.didMovingEyeDelay = true
	L.Variables.MovingEyeDelay = 0
	L.Variables.MovingEyeFrame = 0
	L.Variables.MovingEyeActionIndex = 0
	L.Variables.MovingEyeKey = {
		["x"] =	{ 0, .125, .25, .375, .5, .625, .75, .875 },
		["y"] = { 0, .25, .5, .75 },
		["dimensions"] = { .125, .25 }
	}

	L.Variables.MovingEyeActions = {	-- {index of loop start, index of loop end, index of delay}
		{ 1, 10, 5 }, -- Close
		{ 10, 20, 15 }, -- Look left
		{ 20, 29, 25 }, -- Look right
		{ 10, 29, 0 } -- Look left, right then center no delay
	}

	-- Get current Players name and server
	L.Variables.Player, L.Variables.Server = UnitFullName("player")
	L.Variables.Player = L.Variables.Player:lower()
