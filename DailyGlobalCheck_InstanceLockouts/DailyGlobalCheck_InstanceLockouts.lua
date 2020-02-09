-- Daily Global Check - Instance Lockouts plugin
-- Jadya EU-Well of Eternity
local addonName, addonTable = ...

local Z = DailyGlobalCheck.Z

local list = {
 ["Title"] = "Instance Lockouts",
 ["Icon"]  = "Interface\\Icons\\INV_Helm_Suncrown_D_01",
 ["Version"] = 1004,
 ["Order"] = {
              {
               {GUILD_INTEREST_RAID.." (Legion)"},
	           {PLAYER_DIFFICULTY1,
			    "instance#1520#14", -- normal emerald
			    "instance#1648#14", -- normal trial
			    "instance#1530#14", -- normal nighthold
                "instance#1676#14", -- normal tomb
                "instance#1712#14", -- normal antorus
			   },
			   {ENCOUNTER_JOURNAL_SECTION_FLAG3,
			    "instance#1520#15", -- heroic emerald
			    "instance#1648#15", -- heroic trial
			    "instance#1530#15", -- heroic nighthold
                "instance#1676#15", -- heroic tomb
                "instance#1712#15", -- heroic antorus
			   },
			   {ENCOUNTER_JOURNAL_SECTION_FLAG12,
			    "instance#1520#16", -- mythic emerald
			    "instance#1648#16", -- mythic trial
			    "instance#1530#16", -- mythic nighthold
			    "instance#1676#16", -- mythic tomb
			    "instance#1712#16", -- mythic antorus
			   },
			  },
		      {
			   {BUG_CATEGORY3.." (Legion)"},
			   {ENCOUNTER_JOURNAL_SECTION_FLAG3,
			    "instance#1466#2", -- darkheart             
			    "instance#1501#2", -- black rook
			    "instance#1477#2", -- halls of valor
			    "instance#1492#2", -- maw
			    "instance#1456#2", -- azshara
			    "instance#1493#2", -- wardens
			    "instance#1516#2", -- arcway
			    "instance#1571#2", -- court
			    "instance#1458#2", -- neltharion
			    "instance#1544#2", -- violet
                "instance#1651#2", -- kara
			    "instance#1677#2", -- cath
			    "instance#1753#2", -- seat
			   },
			   {ENCOUNTER_JOURNAL_SECTION_FLAG12,
			    "instance#1466#23", -- darkheart
			    "instance#1501#23", -- black rook
			    "instance#1477#23", -- halls of valor
			    "instance#1492#23", -- maw
			    "instance#1456#23", -- azshara
			    "instance#1493#23", -- wardens
			    "instance#1516#23", -- arcway
			    "instance#1571#23", -- court
			    "instance#1458#23", -- neltharion
			    "instance#1544#23", -- violet
			    "instance#1651#23", -- kara
			    "instance#1677#23", -- cath
			    "instance#1753#23", -- seat
			   },
			  },
			  {
			   {PLAYER_DIFFICULTY3.." (Legion)"},
			   { Z[1094], -- the emerald nightmare
                 --"raidfinder#1287#1_3_5",
                 --"raidfinder#1288#2_4_6",
                 --"raidfinder#1289#7",

                 "raidfinder#1287#1_2_3",
                 "raidfinder#1288#1_2_3",
                 "raidfinder#1289#1",
			   },
               { Z[1114], -- trial
                 "raidfinder#1411#1_2_3",
               },
			   { Z[1088], -- nighthold
			     "raidfinder#1290#1_2_3",
			     "raidfinder#1291#1_2_3",
			     "raidfinder#1292#1_2_3",
			     "raidfinder#1293#1",
			   },
               { Z[1147], -- tomb
			     "raidfinder#1494#1_2_3",
			     "raidfinder#1495#1_2_3",
			     "raidfinder#1496#1_2",
			     "raidfinder#1497#1",
			   },
               --{ Z[1171], -- antorus
			   --  "raidfinder#1610#1_2_3",
			   --  "raidfinder#1611#1_2_3",
			   --  "raidfinder#1612#1_2",
			   --  "raidfinder#1613#1",
			   --}
			  },
              { -- page 1
               {GUILD_INTEREST_RAID.." ("..EXPANSION_NAME5..")"},
	           {PLAYER_DIFFICULTY1,
			    "instance#1228#14", -- normal hm
			    "instance#1205#14", -- normal brf
			    "instance#1448#14", -- normal hellfire
			   },
			   {ENCOUNTER_JOURNAL_SECTION_FLAG3,
			    "instance#1228#15", -- heroic hm
			    "instance#1205#15", -- heroic brf
			    "instance#1448#15", -- heroic hellfire
			   },
			   {ENCOUNTER_JOURNAL_SECTION_FLAG12,
			    "instance#1228#16", -- mythic hm
			    "instance#1205#16", -- mythic brf
			    "instance#1448#16", -- mythic hellfire
			   },
			  },
			  { -- page 2
			   {BUG_CATEGORY3.." ("..EXPANSION_NAME5..")"},
			   {ENCOUNTER_JOURNAL_SECTION_FLAG3,
			    "instance#1182#2", -- auchi
			    "instance#1175#2", -- bloodmaul
			    "instance#1208#2", -- grimrail
			    "instance#1195#2", -- docks
			    "instance#1176#2", -- shadowmoon
			    "instance#1209#2", -- skyreach
			    "instance#1279#2", -- everbloom
			    "instance#1358#2", -- upper
			   },
			   {ENCOUNTER_JOURNAL_SECTION_FLAG12,
			    "instance#1182#23", -- auchi
			    "instance#1175#23", -- bloodmaul
			    "instance#1208#23", -- grimrail
			    "instance#1195#23", -- docks
			    "instance#1176#23", -- shadowmoon
			    "instance#1209#23", -- skyreach
			    "instance#1279#23", -- everbloom
			    "instance#1358#23", -- upper
			   },
			  },
			  { -- page 3
			   {PLAYER_DIFFICULTY3.." ("..EXPANSION_NAME5..")"},
			   {select(1, EJ_GetInstanceInfo(477)),
			    "raidfinder#849#1_2_3",
			    "raidfinder#850#4_5_6",
			    "raidfinder#851#7",
			   },
			   {select(1, EJ_GetInstanceInfo(457)),
			    "raidfinder#847#1_2_7",
			    "raidfinder#846#3_5_8",
			    "raidfinder#848#4_6_9",
			    "raidfinder#823#10",
			   },
			   {select(1, EJ_GetInstanceInfo(669)),
			    "raidfinder#982#1_2_3",
			    "raidfinder#983#4_5_6",
			    "raidfinder#984#7_8_11",
			    "raidfinder#985#9_10_12",
			    "raidfinder#986#13",
			   },
			  },
			  {
               {EXPANSION_NAME4,
			    "instance#1008#all", -- mogu'shan
				"instance#1009#all", -- heart of fear
				"instance#996#all", -- terrace
				"instance#1098#all", -- throne of thunder
			   },
			   {"",
				"instance#1136#14", -- siege of orgrimmar
				"instance#1136#15", -- siege of orgrimmar
				"instance#1136#16", -- siege of orgrimmar
			   },
			   {DUNGEON_DIFFICULTY1,
			    "instance#962#2", -- gate
			    "instance#994#2", -- mogu
			    "instance#1001#2", -- scarlet h
			    "instance#1004#2", -- scarlet m
			    "instance#1007#2", -- scholo
			    "instance#959#2", -- shado
			    "instance#1011#2", -- niuz
			    "instance#961#2", -- brew
				"instance#960#2", -- jade
			   },
			  },
              { -- page 5
               {CINEMATIC_NAME_4,
			    "instance#967#all", -- dragon soul
				"instance#720#all", -- firelands
				"instance#754#all", -- throne
				"instance#671#all", -- bastion
				"instance#669#all", -- blackwing
				"instance#757#all", -- baradin hold
			   },
			   {DUNGEON_DIFFICULTY1,
			    "instance#645#2", -- blackrock
			    "instance#36#2", -- deadmines
			    "instance#670#2", -- grim batol
			    "instance#644#2", -- halls
			    "instance#755#2", -- lost
			    "instance#33#2", -- shadowfang
			    "instance#725#2", -- stonecore
			    "instance#657#2", -- vortex
				"instance#643#2", -- throne
				"instance#568#2", -- zul'aman
				"instance#859#2", -- zul'gurub
				"instance#940#2", -- hour
				"instance#939#2", -- well
				"instance#938#2", -- end time
			   },
			  },
              { -- page 6
               {EXPANSION_NAME2,
			    "instance#724#all", -- ruby
				"instance#631#all", -- icc
				"instance#649#all", -- toc
				"instance#603#all", -- ulduar
				"instance#249#all", -- onyxia
				"instance#615#all", -- obsidian
				"instance#616#all", -- eye
				"instance#533#all", -- naxx
				"instance#624#all", -- archa
			   },
			   {DUNGEON_DIFFICULTY1,
			    "instance#619#2", -- ahkn
			    "instance#601#2", -- azjo
			    "instance#600#2", -- drak
			    "instance#604#2", -- gund
			    "instance#599#2", -- halls of st
			    "instance#602#2", -- halls of lig
			    "instance#595#2", -- stratholme
			    "instance#576#2", -- nexus
				"instance#578#2", -- oculus
				"instance#608#2", -- violet
				"instance#650#2", -- trial
				"instance#574#2", -- utgarde keep
				"instance#575#2", -- utgarde pinnacle
				"instance#632#2", -- forge
				"instance#658#2", -- pit of saron
				"instance#668#2", -- halls of ref
			   },
			  },
			  { -- page 7
               {EXPANSION_NAME0,
			    "instance#469#all", -- black
				"instance#409#all", -- molten
				"instance#531#all", -- temple
				"instance#509#all", -- ruins
			   },
               {EXPANSION_NAME1,
			    "instance#532#all", -- kara
				"instance#565#all", -- gruul
				"instance#544#all", -- maghter
				"instance#548#all", -- serpent
				"instance#534#all", -- hyjal
				"instance#550#all", -- eye
				"instance#564#all", -- black
				"instance#580#all", -- sunwell
			   },
			   {DUNGEON_DIFFICULTY1,
			    "instance#558#2", -- auchenai
			    "instance#543#2", -- hellfire
			    "instance#585#2", -- magi
			    "instance#557#2", -- mana
			    "instance#560#2", -- hills
			    "instance#556#2", -- sethekk
			    "instance#555#2", -- shadow
			    "instance#552#2", -- arca
				"instance#269#2", -- morass
				"instance#542#2", -- furnace
				"instance#553#2", -- bota
				"instance#554#2", -- mecha
				"instance#540#2", -- shatt
				"instance#547#2", -- slave
				"instance#545#2", -- steam
				"instance#546#2", -- under
			   },
			  },
			 },
 }
 
local questsdata = {}
local function GenerateData()

 local difficulty_localization =
  {
   ["all"] = ALL,
   [1]     = PLAYER_DIFFICULTY1,
   [2]     = PLAYER_DIFFICULTY2,
   [3]     = RAID_DIFFICULTY1,
   [4]     = RAID_DIFFICULTY2,
   [5]     = RAID_DIFFICULTY3,
   [6]     = RAID_DIFFICULTY4,
   [13]    = PLAYER_DIFFICULTY3,
   [14]    = PLAYER_DIFFICULTY1,
   [15]    = PLAYER_DIFFICULTY2,
   [16]    = PLAYER_DIFFICULTY6,
   [23]    = PLAYER_DIFFICULTY6, -- Mythic 5 Player
   --[24]    = PLAYER_DIFFICULTY_TIMEWALKER,
  }
 -- creates a set of given difficulties for an instance
 local function createInstanceSet(zone, ID, loc, ...)
  local name = type(loc) == "string" and loc or (EJ_GetInstanceInfo(loc) or "Instance #"..loc)
  for i = 1, select("#", ...) do
   local diff = select(i, ...)
   questsdata["instance#"..ID.."#"..diff] = {zone, name, nil, " "..difficulty_localization[diff], nil,nil,11}
  end
 end
 
 -- Legion

 -- The Emerald Nightmare LFR
 --questsdata["raidfinder#1287#1_3_5"] = {Z[1018], GetLFGDungeonInfo(1287) or "", nil, nil, nil, nil, 3} -- Darkbough
 --questsdata["raidfinder#1288#2_4_6"] = {Z[1018], GetLFGDungeonInfo(1288) or "", nil, nil, nil, nil, 3} -- Tormented Guardians
 --questsdata["raidfinder#1289#7"]     = {Z[1018], GetLFGDungeonInfo(1289) or "", nil, nil, nil, nil, 3} -- Rift of Aln
 
 -- for some reason the emerald nightmare LFR changed to 1_2_3 bosses for each wing
 -- while the nighthold stays the same as before
 questsdata["raidfinder#1287#1_2_3"] = {Z[1018], GetLFGDungeonInfo(1287) or "", nil, nil, nil, nil, 3} -- Darkbough
 questsdata["raidfinder#1288#1_2_3"] = {Z[1018], GetLFGDungeonInfo(1288) or "", nil, nil, nil, nil, 3} -- Tormented Guardians
 questsdata["raidfinder#1289#1"]     = {Z[1018], GetLFGDungeonInfo(1289) or "", nil, nil, nil, nil, 3} -- Rift of Aln
 
 -- Trial of Valor LFR
 questsdata["raidfinder#1411#1_2_3"] = {Z[1017], GetLFGDungeonInfo(1411) or "", nil, nil, nil, nil, 3} -- Trial of Valor
 
 -- The Nighthold LFR
 questsdata["raidfinder#1290#1_2_3"] = {Z[1033], GetLFGDungeonInfo(1290) or "", nil, nil, nil, nil, 3} -- Arcing Aqueducts
 questsdata["raidfinder#1291#1_2_3"] = {Z[1033], GetLFGDungeonInfo(1291) or "", nil, nil, nil, nil, 3} -- Royal Athenaeum
 questsdata["raidfinder#1292#1_2_3"] = {Z[1033], GetLFGDungeonInfo(1292) or "", nil, nil, nil, nil, 3} -- Nightspire
 questsdata["raidfinder#1293#1"]     = {Z[1033], GetLFGDungeonInfo(1293) or "", nil, nil, nil, nil, 3} -- Betrayer's Rise
 
 -- Tomb of Sargeras
 questsdata["raidfinder#1494#1_2_3"] = {Z[1021], GetLFGDungeonInfo(1494) or "", nil, nil, nil, nil, 3} -- The Gates of Hell
 questsdata["raidfinder#1495#1_2_3"] = {Z[1021], GetLFGDungeonInfo(1495) or "", nil, nil, nil, nil, 3} -- Wailing Halls
 questsdata["raidfinder#1496#1_2"]   = {Z[1021], GetLFGDungeonInfo(1496) or "", nil, nil, nil, nil, 3} -- Chambers of the Avatar
 questsdata["raidfinder#1497#1"]     = {Z[1021], GetLFGDungeonInfo(1497) or "", nil, nil, nil, nil, 3} -- Deceiver's Fall

 -- Antorus the Burning Throne
 questsdata["raidfinder#1610#1_2_3"] = {Z[1171], GetLFGDungeonInfo(1610) or "", nil, nil, nil, nil, 3} -- Light's Breach
 questsdata["raidfinder#1611#1_2_3"] = {Z[1171], GetLFGDungeonInfo(1611) or "", nil, nil, nil, nil, 3} -- Forbidden Descent
 questsdata["raidfinder#1612#1_2"]   = {Z[1171], GetLFGDungeonInfo(1612) or "", nil, nil, nil, nil, 3} -- Hope's End
 questsdata["raidfinder#1613#1"]     = {Z[1171], GetLFGDungeonInfo(1613) or "", nil, nil, nil, nil, 3} -- Seat of the Pantheon
 
 -- 7.0
 createInstanceSet(Z[1018], 1520, 768, 13, 14, 15, 16) -- emerald
 createInstanceSet(Z[1033], 1530, 786, 13, 14, 15, 16) -- nighthold
 createInstanceSet(Z[1017], 1648, 861, 13, 14, 15, 16) -- trial
 createInstanceSet(Z[1021], 1676, 875, 13, 14, 15, 16) -- tomb
 createInstanceSet(Z[1171], 1712, 946, 13, 14, 15, 16) -- antorus
 
 -- Legion 5-man Dungeons
 createInstanceSet(Z[1018], 1466, 762, 2, 23) -- darkheart
 createInstanceSet(Z[1018], 1501, 740, 2, 23) -- black rook
 createInstanceSet(Z[1017], 1477, 721, 2, 23) -- halls of valor
 createInstanceSet(Z[1017], 1492, 727, 2, 23) -- maw
 createInstanceSet(Z[1015], 1456, 716, 2, 23) -- azshara
 createInstanceSet(Z[1015], 1493, 707, 2, 23) -- wardens
 createInstanceSet(Z[1033], 1516, 726, 2, 23) -- arcway
 createInstanceSet(Z[1033], 1571, 800, 2, 23) -- court
 createInstanceSet(Z[1024], 1458, 767, 2, 23) -- neltharion
 createInstanceSet(Z[1014], 1544, 777, 2, 23) -- violet  
 createInstanceSet(Z[32]  , 1651, 860, 2, 23) -- kara
 createInstanceSet(Z[1021], 1677, 900, 2, 23) -- cathedral
 createInstanceSet(Z[1170], 1753, 945, 2, 23) -- seat of the triumvirate

-- Warlords of Draenor

 -- Highmaul LFR
 questsdata["raidfinder#849#1_2_3"] = {Z[950], select(1, GetLFGDungeonInfo(849)), nil, nil, nil, nil, 3} -- Walled City
 questsdata["raidfinder#850#4_5_6"] = {Z[950], select(1, GetLFGDungeonInfo(850)), nil, nil, nil, nil, 3} -- Arcane Sanctum
 questsdata["raidfinder#851#7"]     = {Z[950], select(1, GetLFGDungeonInfo(851)), nil, nil, nil, nil, 3} -- Imperator's Rise
 
 -- Blackrock Foundry LFR
 questsdata["raidfinder#847#1_2_7"] = {Z[950], select(1, GetLFGDungeonInfo(847)), nil, nil, nil, nil, 3} -- Slagworks
 questsdata["raidfinder#846#3_5_8"] = {Z[950], select(1, GetLFGDungeonInfo(846)), nil, nil, nil, nil, 3} -- The Black Forge
 questsdata["raidfinder#848#4_6_9"] = {Z[950], select(1, GetLFGDungeonInfo(848)), nil, nil, nil, nil, 3} -- The Iron Assembly
 questsdata["raidfinder#823#10"]    = {Z[950], select(1, GetLFGDungeonInfo(823)), nil, nil, nil, nil, 3} -- Blackhand's Crucible
 
 -- Hellfire Citadel LFR
 questsdata["raidfinder#982#1_2_3"]   = {Z[950], select(1, GetLFGDungeonInfo(982)), nil, nil, nil, nil, 3} -- Hellbreach
 questsdata["raidfinder#983#4_5_6"]   = {Z[950], select(1, GetLFGDungeonInfo(983)), nil, nil, nil, nil, 3} -- Halls of Blood
 questsdata["raidfinder#984#7_8_11"]  = {Z[950], select(1, GetLFGDungeonInfo(984)), nil, nil, nil, nil, 3} -- Bastion of Shadows
 questsdata["raidfinder#985#9_10_12"] = {Z[950], select(1, GetLFGDungeonInfo(985)), nil, nil, nil, nil, 3} -- Destructor's Rrise
 questsdata["raidfinder#986#13"]      = {Z[950], select(1, GetLFGDungeonInfo(986)), nil, nil, nil, nil, 3} -- The Black Gate
 
 -- Warlords of Draenor Raids
 -- 6.2
 createInstanceSet(Z[945], 1448, 669, 13, 14, 15, 16) -- hellfire
 -- 6.0
 createInstanceSet(Z[950], 1228, 477, 13, 14, 15, 16) -- highmaul
 createInstanceSet(Z[949], 1205, 457, 13, 14, 15, 16) -- foundry

 -- Warlords of Draenor 5-man Dungeons 
 createInstanceSet(Z[946], 1182, 547, 2, 23) -- auchi
 createInstanceSet(Z[941], 1175, 385, 2, 23) -- bloodmaul
 createInstanceSet(Z[949], 1208, 536, 2, 23) -- grimrail
 createInstanceSet(Z[949], 1195, 558, 2, 23) -- docks
 createInstanceSet(Z[947], 1176, 537, 2, 23) -- shadowmoon
 createInstanceSet(Z[948], 1209, 476, 2, 23) -- skyreach
 createInstanceSet(Z[949], 1279, 556, 2, 23) -- everbloom
 createInstanceSet(Z[28], 1358, 559, 2, 23) -- upper
 
 -- Mists of Pandaria Raids
 createInstanceSet(Z[937], 1136, 369, 14, 15, 16) -- siege of orgrimmar (flex)
 createInstanceSet(Z[809], 1008, 317, "all") -- mogu'shan vaults
 createInstanceSet(Z[858], 1009, 330, "all") -- heart of fear
 createInstanceSet(Z[873], 996, 320, "all") -- terrace
 createInstanceSet(Z[928], 1098, 362, "all") -- throne of thunder
 
 -- Mists of Pandaria 5-man Dungeons
 createInstanceSet(Z[937], 962, 303, 2) -- gate of the setting sun
 createInstanceSet(Z[937], 994, 321, 2) -- mogu'shan palace
 createInstanceSet(Z[20], 1001, 311, 2) -- scarlet halls
 createInstanceSet(Z[20], 1004, 316, 2) -- scarlet monastery
 createInstanceSet(Z[22], 1007, 246, 2) -- scholo
 createInstanceSet(Z[809], 959, 312, 2) -- shadopan
 createInstanceSet(Z[810], 1011, 324, 2) -- niuzao
 createInstanceSet(Z[807], 961, 302, 2) -- brewery
 createInstanceSet(Z[806], 960, 313, 2) -- jade serpent

 -- Cataclysm
 createInstanceSet(Z[161], 967, 187, "all") -- dragon soul
 createInstanceSet(Z[606], 720, 78, "all") -- firelands
 createInstanceSet(Z[720], 754, 74, "all") -- throne
 createInstanceSet(Z[770], 671, 72, "all") -- bastion
 createInstanceSet(Z[28], 669, 73, "all") -- blackwing
 createInstanceSet(Z[708], 757, 75, "all") -- baradin hold
 
 -- Cataclysm 5-man Dungeons
 createInstanceSet(Z[28], 645, 66, 2) -- blackrock
 createInstanceSet(Z[39], 36, 63, 2) -- deadmines
 createInstanceSet(Z[700], 670, 71, 2) -- grim batol
 createInstanceSet(Z[495], 644, 70, 2) -- halls of orig
 createInstanceSet(Z[720], 755, 69, 2) -- lost city
 createInstanceSet(Z[21], 33, 64, 2) -- shadowfang
 createInstanceSet(Z[640], 725, 67, 2) -- stonecore
 createInstanceSet(Z[720], 657, 68, 2) -- vortex
 createInstanceSet(Z[614], 643, 65, 2) -- throne
 createInstanceSet(Z[37], 568, 77, 2) -- zul'aman
 createInstanceSet(Z[37], 859, 76, 2) -- zul'gurub
 createInstanceSet(Z[161], 940, 186, 2) -- hour of twi
 createInstanceSet(Z[161], 939, 185, 2) -- well
 createInstanceSet(Z[161], 938, 184, 2) -- end time
 
  -- Wotlk
 createInstanceSet(Z[488], 724, Z[609], "all") -- ruby sanctum
 createInstanceSet(Z[492], 631, Z[604], "all") -- icc
 createInstanceSet(Z[492], 649, Z[543], "all") -- toc
 createInstanceSet(Z[495], 603, Z[529], "all") -- ulduar
 createInstanceSet(Z[851], 249, Z[718], "all") -- onyxia
 createInstanceSet(Z[488], 615, Z[531], "all") -- obsidian
 createInstanceSet(Z[486], 616, Z[527], "all") -- eye
 createInstanceSet(Z[488], 533, Z[535], "all") -- naxxramas
 createInstanceSet(Z[501], 624, Z[532], "all") -- archavon

 -- Wotlk 5-man Dungeons
 createInstanceSet(Z[488], 619, 271, 2) -- ahkn
 createInstanceSet(Z[488], 601, 272, 2) -- azjo
 createInstanceSet(Z[496], 600, 273, 2) -- drak
 createInstanceSet(Z[496], 604, 274, 2) -- gund
 createInstanceSet(Z[495], 599, 277, 2) -- halls of st
 createInstanceSet(Z[495], 602, 275, 2) -- halls of lig
 createInstanceSet(Z[161], 595, 279, 2) -- stratholme
 createInstanceSet(Z[486], 576, 281, 2) -- nexus
 createInstanceSet(Z[486], 578, 282, 2) -- oculus
 createInstanceSet(Z[504], 608, 283, 2) -- violet
 createInstanceSet(Z[492], 650, 284, 2) -- trial
 createInstanceSet(Z[491], 574, 285, 2) -- utgarde keep
 createInstanceSet(Z[491], 575, 286, 2) -- utgarde pinnacle
 createInstanceSet(Z[604], 632, 280, 2) -- forge
 createInstanceSet(Z[604], 658, 278, 2) -- pit of saron
 createInstanceSet(Z[604], 668, 276, 2) -- halls of ref
 
 -- The Burning Crusade
 --[[createInstanceSet(Z[32], 532, GetAchievementCriteriaInfo(1286,7), "all") -- karazhan
 createInstanceSet(Z[475], 565, GetAchievementCriteriaInfo(1286,2), "all") -- gruul
 createInstanceSet(Z[465], 544, GetAchievementCriteriaInfo(1286,5), "all") -- maghter
 createInstanceSet(Z[467], 548, GetAchievementCriteriaInfo(1286,1), "all") -- serpent
 createInstanceSet(Z[161], 534, GetAchievementCriteriaInfo(1286,3), "all") -- hyjal
 createInstanceSet(Z[479], 550, GetAchievementCriteriaInfo(1286,6), "all") -- eye
 createInstanceSet(Z[473], 564, GetAchievementCriteriaInfo(1286,8), "all") -- black
 createInstanceSet(Z[499], 580, GetAchievementCriteriaInfo(1286,4), "all") -- sunwell]]
 
 createInstanceSet(Z[32] , 532, "Karazhan", "all") -- karazhan
 createInstanceSet(Z[475], 565, "Gruul's Lair", "all") -- gruul
 createInstanceSet(Z[465], 544, "Maghteridon's Lair", "all") -- maghter
 createInstanceSet(Z[467], 548, "Serpentshrine Cavern", "all") -- serpent
 createInstanceSet(Z[161], 534, "The Battle for Mount Hyjal", "all") -- hyjal
 createInstanceSet(Z[479], 550, "Tempest Keep", "all") -- eye
 createInstanceSet(Z[473], 564, "The Black Temple", "all") -- black
 createInstanceSet(Z[499], 580, "Sunwell Plateau", "all") -- sunwell

 -- The Burning Crusade 5-man Dungeons
 createInstanceSet(Z[478], 558, 247, 2) -- auchenai
 createInstanceSet(Z[465], 543, 248, 2) -- hellfire
 createInstanceSet(Z[499], 585, 249, 2) -- magister
 createInstanceSet(Z[478], 557, 250, 2) -- mana tombs
 createInstanceSet(Z[161], 560, 251, 2) -- hillsbrad
 createInstanceSet(Z[478], 556, 252, 2) -- sethekk
 createInstanceSet(Z[478], 555, 253, 2) -- shadow
 createInstanceSet(Z[479], 552, 254, 2) -- the arcatraz
 createInstanceSet(Z[161], 269, 255, 2) -- morass
 createInstanceSet(Z[465], 542, 256, 2) -- furnace
 createInstanceSet(Z[479], 553, 257, 2) -- botanica
 createInstanceSet(Z[479], 554, 258, 2) -- mechanar
 createInstanceSet(Z[465], 540, 259, 2) -- shattered
 createInstanceSet(Z[467], 547, 260, 2) -- slave
 createInstanceSet(Z[467], 545, 261, 2) -- steamvault
 createInstanceSet(Z[467], 546, 262, 2) -- underbog

 -- Classic
 --[[createInstanceSet(Z[28], 469, GetAchievementCriteriaInfo(1285,1), "all") -- blackwing
 createInstanceSet(Z[28], 409, GetAchievementCriteriaInfo(1285,2), "all") -- molten
 createInstanceSet(Z[261], 531, GetAchievementCriteriaInfo(1285,3), "all") -- temple
 createInstanceSet(Z[261], 509, GetAchievementCriteriaInfo(1285,4), "all") -- ruins]]
 
 createInstanceSet(Z[28], 469, "Blackwing Lair", "all") -- blackwing
 createInstanceSet(Z[28], 409, "Molten Core", "all") -- molten
 createInstanceSet(Z[261], 531, "Temple of Ahn'Qiraj", "all") -- temple
 createInstanceSet(Z[261], 509, "Ruins of Ahn'Qiraj", "all") -- ruins
end

list.GenerateData = GenerateData
DailyGlobalCheck:LoadPlugin(list, questsdata)
