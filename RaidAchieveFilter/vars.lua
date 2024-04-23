--RaidAchieveFilter Achievement IDs
--Please do not use without permission
RAFdb = {}
RAFdb.AchID, RAFdb.MapID, RAFdb.MapName = {}, {}, {}
local uFaction = "H"
if UnitFactionGroup("player") == "Alliance" then uFaction = "A" end
--Raids
RAFdb.AchID[1] = {4534,4535,4536,4537,4531,4628,4577,4538,4578,4528,4629,4582,4539,4529,4630,4579,4580,4527,4631,4601,4581,4530,4532,4636,4583}--ICC10
RAFdb.AchID[2] = {4610,4611,4612,4613,4604,4632,4615,4614,4616,4605,4633,4617,4618,4606,4634,4619,4620,4607,4635,4621,4622,4597,4608,4637,4584}--ICC25
RAFdb.AchID[3] = {1997,1858,562,1996,2182,566,2176,568,1856,2178,2180,564,2146,572,2184,574,576,578}--Naxx10
RAFdb.AchID[4] = {2140,1859,563,2139,2183,567,2177,569,1857,2179,2181,565,2147,573,2185,575,577,579}--Naxx25
RAFdb.AchID[5] = {4404,4402,4403,4396,4407,4405,4406,4397}--Onyxia10
RAFdb.AchID[6] = {2148,1869,1874,622,2149,1870,1875,623}-- Malygos
RAFdb.AchID[7] = {2047,624,1876,2049,2050,2051}--Sarth10
RAFdb.AchID[8] = {2048,1877,625,2052,2053,2054}--Sarth25
RAFdb.AchID[9] = {4817,4818,4815,4816}--Halion
RAFdb.AchID[10] = {3797,3936,3996,3798,3799,3800,3917,3918}--ToC10
RAFdb.AchID[11] = {3937,3813,3997,3815,3816,3916,3812}--Toc25
RAFdb.AchID[12] = {12315,12312,12314,12313,12316,12317,12318,12319,12320,12321,12322,12323,12324,12325,12326,12327,12328,12329,12330,12332,12333,12334,12335,12336,12337,12338,12339,12340,12341,12342,12343,12344,12345,12346,12347,12348,12349,12350,12351,12352,12360,12361,12362,12363,12364,12365,12366,12367,12368,12369,12372,12373,12384,12385,12386,12387,12388,12395,12396,12397,12398,12399,12400,12297,12302,12309,12310,12311}--Ulduar
RAFdb.AchID[13] = {5306,5307,5310,5308,5309,4849,5094,5107,5108,5109,5115,5116,4842}--BWD
RAFdb.AchID[14] = {5300,4852,5311,5312,5118,5117,5119,5120,5121,4850}--BoT
RAFdb.AchID[15] = {5304,5305,5122,5123,4851}--To4W
RAFdb.AchID[16] = {5821,5829,5810,5813,5830,5799,5855,5807,5808,5806,5809,5805,5804,5803,5802}--Firelands
RAFdb.AchID[17] = {6174,6128,6129,6175,6084,6105,6133,6180,6109,6110,6111,6112,6113,6114,6115,6116,6106,6107,6177}--DragonSoul
RAFdb.AchID[18] = {6937,6936,6553,6683,6518,6922,6725,6726,6727,6728,6729,6730,6718,6845}--HoF
RAFdb.AchID[19] = {6823,6674,7056,6687,7933,6686,6455,6719,6720,6721,6722,6723,6724,6458,6844}--MSV
RAFdb.AchID[20] = {6717,6933,6824,6825,6731,6732,6733,6734,6689}--Terrace
RAFdb.AchID[21] = {8094,8038,8073,8077,8082,8097,8098,8037,8081,8087,8086,8090,8056,8057,8058,8059,8060,8061,8062,8063,8064,8065,8066,8067,8068,8069,8070,8071,8072}--ToT
RAFdb.AchID[22] = {8536,8528,8532,8521,8530,8520,8453,8448,8538,8529,8527,8543,8531,8537,8463,8465,8466,8467,8468,8469,8470,8471,8472,8478,8479,8480,8481,8482,8458,8459,8461,8462}--Siege
RAFdb.AchID[23] = {8978,8979,8981,8929,8980,8982,8930,8983,8984,8952,8966,8967,8956,8932,8968,8969,8970,8971,8972,8973,8989,8990,8991,8992}--BRFoundry
if uFaction == "A" then tinsert(RAFdb.AchID[23], 8679) else tinsert(RAFdb.AchID[23], 8680) end 
RAFdb.AchID[24] = {10026,10057,10013,10054,9972,9979,9988,10086,10012,10087,9989,10030,10073,10027,10032,10033,10034,10035,10253,10037,10040,10038,10039,10041,10042,10043,10023,10024,10025,10020,10019}--Hellfire
RAFdb.AchID[25] = {8948,8947,8974,8975,8958,8976,8977,8949,8960,8961,8962,8963,8964,8965,8986,8987,8988}--Highmaul
RAFdb.AchID[26] = {11930,12065,12129,11928,12067,11949,12030,11948,12046,11915,12257,11988,11989,11990,11991,11992,11993,11994,11995,11996,11997,11998,11999,12000,12001,12002}--Antorus
RAFdb.AchID[27] = {10555,10771,10830,10753,10663,10772,10755,10821,10822,10823,10824,10825,10826,10827,10818,10819,10820}--ENightmare
RAFdb.AchID[28] = {10678,10697,10742,10817,10704,10575,10754,10851,10699,10696,10840,10842,10843,10844,10847,10848,10846,10845,10849,10850,10829,10837,10838,10839}--Nighthold
RAFdb.AchID[29] = {11724,11696,11699,11676,11773,11674,11675,11683,11770,11767,11774,11775,11776,11777,11778,11779,11780,11781,11787,11788,11789,11790}--Tomb
RAFdb.AchID[30] = {11337,11386,11377,11394,11426,11396,11397,11398,11387}--ToValor
if uFaction == "A" then
	RAFdb.AchID[31] = {13383,13431,13345,13325,13425,13401,13430,13410,13293,13298,13299,13300,13311,13312,13313,13314,13321}--Dazar'alor
else
	RAFdb.AchID[31] = {13383,13431,13345,13325,13425,13401,13430,13410,13293,13295,13299,13300,13311,13312,13313,13314,13321}--Dazar'alor
end

local id, name, points, completed = GetAchievementInfo(13414)
if completed == true then RAFdb.AchID[32] = {13414,13415,13416,13417} else RAFdb.AchID[32] = {13414,13416,13417} end--Crucible (13415 doesn't render if 13414 not complete)
RAFdb.AchID[33] = {13684,13628,13767,13629,13724,13633,13716,13768,13726,13728,13727,13729,13730,13731,13732,13733}--EternalPalace
RAFdb.AchID[34] = {14019,14008,14024,14023,14050,14193,14194,14195,14196,14041,14043,14044,14045,14046,14048,14049,14052,14139,14051,14054,14055}--Ny'althoa
RAFdb.AchID[35] = {12937,12938,12823,12828,12772,12830,12836,12551,12521,12522,12523,12524,12526,12530,12527,12529,12531,12532,12533}--Uldir
RAFdb.AchID[36] = {14293,14523,14617,14376,14294,14610,14356,14357,14360,14359,14358,14361,14362,14363,14364,14365}--CastleNathria
RAFdb.AchID[37] = {14998,15065,15003,15122,15058,15105,15131,15123,15132,15040,15108,15124,15133,15125,15112,15113,15114,15115,15116,15117,15118,15119,15120,15121}--SanctumofDomination
RAFdb.AchID[38] = {15381,15401,15398,15397,15419,15386,15315,15478,15479,15480,15481,15482,15483,15484,15485,15486,15487,15488,15489,15490}--Sepulcher
RAFdb.AchID[39] = {16335,16365,16450,16419,16458,16450,16343,17111,17112,17110,16355,16346,16347,16348,16349,16350,16351,16352,16353}--VaultIncarnates
--Lich King Dungeons
RAFdb.AchID[40] = {2038,2056,1862,481,492} --Ahn'kahet
RAFdb.AchID[41] = {1296,1297,1860,480,491} --Azjol'nerub
RAFdb.AchID[42] = {1872,1817,479,500} --Culling of Strat
RAFdb.AchID[43] = {2151,2057,2039,482,493} --Drak'tharon
RAFdb.AchID[44] = {4522,4523,4516,4519} --Forge of Souls
RAFdb.AchID[45] = {2058,2040,1864,2152,484,495} --Gun'drak
RAFdb.AchID[46] = {1834,2042,1867,486,497} --Halls of Lightning
RAFdb.AchID[47] = {4526,4518,4521} --Halls of Reflection
RAFdb.AchID[49] = {2154,1866,2155,485,496} --Halls of Stone
RAFdb.AchID[40] = {2150,2037,2036,478,490} --Nexus
RAFdb.AchID[50] = {1868,2046,2045,2044,1871,487,498} --Oculus
RAFdb.AchID[51] = {4524,4525,4517,4520} --Pit of Saron
if uFaction == "A" then RAFdb.AchID[52] = {3802,3803,3804,4296,4298} else RAFdb.AchID[52] = {3802,3803,3804,3778,4297} end --Trial of the Champion
RAFdb.AchID[53] = {1919,477,489} --Utgarde Keep
RAFdb.AchID[54] = {2043,1873,2156,2157,488,499} --Utgarde Pinnacle
RAFdb.AchID[55] = {2153,2041,1865,1816,483,494} --Violet Hold
-- Cataclysm Dungeons
RAFdb.AchID[56] = {5281,5282,5283,5284,4833,5060} --Blackrock Caverns
RAFdb.AchID[57] = {5366,5367,5368,5369,5370,5371,5083} -- Deadmines
RAFdb.AchID[58] = {5995,6130,6117} --End Time
RAFdb.AchID[59] = {5297,5298,4840,5062} --Grim Batol
RAFdb.AchID[60] = {5293,5294,5296,5295,4841,5065} --Halls of Origination
RAFdb.AchID[61] = {6132,6119} --Hour of Twilight
RAFdb.AchID[62] = {5291,5290,5292,4848,5066} --Lost City of Tol'vir
RAFdb.AchID[63] = {5503,5504,5505,5093}--Shadowfang Keep
RAFdb.AchID[64] = {5287,4846,5063} --Stonecore
RAFdb.AchID[65] = {5285,5286,4839,5061} --Throne of Tides
RAFdb.AchID[66] = {5289,5288,4847,5064} --Vortex Pinnacle
RAFdb.AchID[67] = {6127,6070,6118} --Well of Eternity
RAFdb.AchID[68] = {5761,5750,5858,5760,5769} --Zul'Aman
RAFdb.AchID[69] = {5743,5762,5765,5744,5759,5768} --Zul'gurub
-- MoP Dungeons
RAFdb.AchID[70] = {6479,6476,6945,10010,6759} --Gate of the Setting Sun
RAFdb.AchID[71] = {6713,6478,6736,6755,6756} --Mogu'shan Palace
RAFdb.AchID[72] = {6684,6427,6760} --Scarlet Halls
RAFdb.AchID[73] = {6929,6928,6946,6761} --Scarlet Monastery
RAFdb.AchID[74] = {6394,6396,6531,6715,6821,6762} --Scholomance
RAFdb.AchID[75] = {6471,6477,6472,6469,6470} --Shado-Pan
RAFdb.AchID[76] = {6485,6822,6688,10011,6763} --Siege of Niuzao Temple
RAFdb.AchID[77] = {6420,6400,6089,6402,6457,6456} --Stormstout Brewery
RAFdb.AchID[78] = {6475,6460,6671,6757,6758} --Temple of the Jade Serpent
-- WoD Dungeons
RAFdb.AchID[79] = {9023,9551,9552,9039,9049,10080}--Auchindoun
RAFdb.AchID[80] = {8993,9005,9008,9037,9046,10076}--Bloodmaul Slag Mines
RAFdb.AchID[81] = {9024,9007,9043,9052,10082}--Grimrail Depot
RAFdb.AchID[82] = {9083,9081,9082,9038,9047,10079}--Iron Docks
RAFdb.AchID[83] = {9018,9025,9026,9041,9054,10084}--Shadowmoon Burial Grounds
RAFdb.AchID[84] = {9033,9034,9035,9036,8843,8844,10081}--Skyreach
RAFdb.AchID[85] = {9017,9493,9223,9044,9053,10083}--The Everbloom
RAFdb.AchID[86] = {9045,9058,9056,9057,9042,9055,10085}--UBRS
-- Legion Dungeons
RAFdb.AchID[87] = {10554,10553,10798,10799,10800}--Violet Hold
RAFdb.AchID[88] = {10710,10711,10709,10804,10805,10806}--Black Rook Hold
RAFdb.AchID[89] = {11768,11769,11703,11700,11701,11702}--Cathedral
RAFdb.AchID[90] = {10610,10611,10816}--Court of Stars
RAFdb.AchID[91] = {10766,10769,10783,10784,10785}--Darkheart Thicket
RAFdb.AchID[92] = {10456,10457,10458,10780,10781,10782}--Eye of Azshara
RAFdb.AchID[93] = {10542,10544,10543,10786,10788,10789}--Halls of Valor
RAFdb.AchID[94] = {11335,11338,11432,11431,11433,11429,11430}--Karazhan
RAFdb.AchID[95] = {10411,10413,10412,10807,10808,10809}--Maw of Souls
RAFdb.AchID[96] = {10996,10875,10795,10796,10797}--Neltharion's Lair
RAFdb.AchID[97] = {12004,12005,12009,12007,12008}--Seat
RAFdb.AchID[98] = {10773,10775,10776,10803}--The Arcway
RAFdb.AchID[99] = {10707,10679,10680,10801,10802,10803}--Vault of the Wardens
-- BfA Dungeons
RAFdb.AchID[100] = {12824,12825,12826}--Atal'dazar
RAFdb.AchID[101] = {12548,12998,12831,12832,12833}--Freehold
RAFdb.AchID[102] = {12848}--King's Rest
RAFdb.AchID[103] = {13698,13545,13723,13706}--Operation Mechagon
RAFdb.AchID[104] = {12600,12601,12602,12835,12837,12838}--Shrine of the Storm
RAFdb.AchID[105] = {12727,12726,12847}--Siege of Boralus
RAFdb.AchID[106] = {12504,12505,12506}--Temple of Sethraliss
RAFdb.AchID[107] = {12844,12845,12846}--The Motherlode!!
RAFdb.AchID[108] = {12498,12549,12499,12500,12501,12502}--The Underrot
RAFdb.AchID[109] = {12457,12462,12840,12841,12842}--Tol Dagor
RAFdb.AchID[110] = {12489,12495,12490,12483,12484,12488}--Waycrest Manor
-- Shadowlands Dungeons
RAFdb.AchID[111] = {14374,14606,14354,14373,14408,14409}--De Other Side
RAFdb.AchID[112] = {14284,14352,14370,14410,14411}--Halls of Atonement
RAFdb.AchID[113] = {14503,14291,14375,14371,14412,14413}--Mists of Tirna Scithe
RAFdb.AchID[114] = {14295,14320,14285,14366,14367,14368}--The Necrotic Wake
RAFdb.AchID[115] = {14347,14296,14292,14369,14414,14415}--Plaguefall
RAFdb.AchID[116] = {14286,14290,14289,14197,14198,14199}--Sanguine Depths
RAFdb.AchID[117] = {14331,14323,14327,14326,14324,14325}--Spires of Ascension
RAFdb.AchID[118] = {15190,15106,15179,15109}--Tazavesh
RAFdb.AchID[119] = {14297,14607,14533,14372,14416,14417}--Theater of Pain
-- Shadowlands Dungeons
RAFdb.AchID[120] = {16402,16320,16440,16267,16268}--Ruby Life Pools
RAFdb.AchID[121] = {16447,16456,16620,16275,16276,16277}--Nokhud Offensive
RAFdb.AchID[122] = {16110,16296,16762,16430,16404,16255,16256,16257}--Brackenhide Hollow
RAFdb.AchID[123] = {16517,16426,16427,16260,16261,16262}--Halls of Infusion
RAFdb.AchID[124] = {16434,16329,16441,16269,16270,16271}--Algeth'ar Academy
RAFdb.AchID[125] = {16438,16432,16453,16263,16264,16265}--Neltharus
RAFdb.AchID[126] = {16445,16330,16331,16272,16273,16274}--The Azure Vault
RAFdb.AchID[127] = {16337,16282,16281,16278,16279,16280}--Uldaman

RAFdb.MapID = {
--Raids
186,186,162,162,248,141,155,155,200,172,172,147,--LK
285,294,328,367,409,--Cata
474,471,456,508,556,--MoP
596,661,610,--WoD
909,777,764,850,806,--Legion
1352,1363,1512,1580,1148,--BfA
1735,2003,2061,2119,--SL
--Dungeons
132,157,130,160,183,154,138,185,140,129,142,184,171,133,136,168,--LK
283,291,401,293,297,399,277,311,324,322,325,398,333,337,--Cata
437,453,431,435,476,443,457,439,429,--MoP
593,573,606,595,574,601,620,616,--WoD
732,751,845,761,733,713,703,809,706,731,903,749,710,--Legion
934,936,1004,1490,1039,1162,1038,1010,1041,980,1015,--BfA
1677,1663,1669,1666,1697,1675,1692,1997,1683,--SL
2094,2093,2096,2082,2097,2080,2073,230}--DF
--Scenarios
if uFaction == "A" then 
	RAFdb.AchID[128] = {7261,7258,7257,7252,8310}--Brewing
	RAFdb.AchID[129] = {7989,7990,7991,7992,7993,7988}--Patience
	RAFdb.AchID[130] = {7273,7272,7271}--Arena
	RAFdb.AchID[131] = {8016,8017}--Assault
	RAFdb.AchID[132] = {8347,8314,8364}--Battle
	RAFdb.AchID[133] = {8329,8330,8316,8312}--Blood
	RAFdb.AchID[134] = {6931,6930,6923}--Brewmoon
	RAFdb.AchID[135] = {7275,7276,8368,7522,8311}--Crypt
	RAFdb.AchID[136] = {7987,7984,7986,8009}--Dagger
	RAFdb.AchID[137] = {8319,8317,8318}--DarkHeart
	RAFdb.AchID[138] = {7267,7266,7265}--Greenstone
	RAFdb.AchID[139] = {8012,8011,8010}--Lion's
	RAFdb.AchID[140] = {8295,8294,8327}--Ragefire
	RAFdb.AchID[141] = {7526,7527,7523}--Theramore
	RAFdb.AchID[142] = {7231,7232,7239,7249,7248}--Unga
	local MapIDs = {447,487,480,451,524,523,452,481,488,520,448,911,522,483,450,1}
	for i = 1, #MapIDs do tinsert(RAFdb.MapID, MapIDs[i]) end
	for i = 1, 142 do RAFdb.MapName[i] = C_Map.GetMapInfo(RAFdb.MapID[i]).name; end
	RAFdb.MapName[130] = "Arena of Annihilation"-- (Proving Grounds)
	RAFdb.MapName[133] = "Blood in the Snow"-- (Dun Morogh)
	RAFdb.MapName[137] = "Dark Heart of Pandaria"-- (Vale of Eternal Blossoms)
	RAFdb.MapName[138] = "Greenstone Village"-- (Jade Forest)
	RAFdb.MapName[139] = "Lion's Landing"-- (Krasarang Wilds)
	RAFdb.MapName[141] = "Theramore's Fall"-- (Dustwallow Marsh)
else
	RAFdb.AchID[128] = {7261,7258,7257,7252,8310}--Brewing
	RAFdb.AchID[129] = {7989,7990,7991,7992,7993,7988}--Patience
	RAFdb.AchID[130] = {7273,7272,7271}--Arena
	RAFdb.AchID[131] = {8016,8017}--Assault
	RAFdb.AchID[132] = {8347,8315,8366}--Battle
	RAFdb.AchID[133] = {8329,8330,8316,8312}--Blood
	RAFdb.AchID[134] = {6931,6930,6923}--Brewmoon
	RAFdb.AchID[135] = {7275,7276,8368,7522,8311}--Crypt
	RAFdb.AchID[136] = {7987,7984,7986,8009}--Dagger
	RAFdb.AchID[137] = {8319,8317,8318}--DarkHeart
	RAFdb.AchID[138] = {8015,8014,8013}--Domination
	RAFdb.AchID[139] = {7267,7266,7265}--Greenstone
	RAFdb.AchID[140] = {8295,8294,8327}--Ragefire
	RAFdb.AchID[141] = {7529,7530,7524}--Theramore
	RAFdb.AchID[142] = {7231,7232,7239,7249,7248}--Unga
	local MapIDs = {447,487,480,451,524,523,452,481,488,520,498,448,522,416,450,1}
	for i = 1, #MapIDs do tinsert(RAFdb.MapID, MapIDs[i]) end
	for i = 1, 142 do RAFdb.MapName[i] = C_Map.GetMapInfo(RAFdb.MapID[i]).name end
	RAFdb.MapName[130] = "Arena of Annihilation"--(Proving Grounds)
	RAFdb.MapName[133] = "Blood in the Snow"--(Dun Morogh)
	RAFdb.MapName[137] = "Dark Heart of Pandaria"--(Vale of Eternal Blossoms)
	RAFdb.MapName[138] = "Domination Point"--(Krasarang Wilds)
	RAFdb.MapName[139] = "Greenstone Village"--(Jade Forest)
	RAFdb.MapName[141] = "Theramore's Fall"--(Dustwallow Marsh)
end
RAFdb.MapName[87] = "Assault on Violet Hold"
RAFdb.MapName[95] = "Maw of Souls"

RAFdb.MapName[1] = RAFdb.MapName[1].." [10]"
RAFdb.MapName[2] = RAFdb.MapName[2].." [25]"--ICC
RAFdb.MapName[3] = RAFdb.MapName[3].." [10]"
RAFdb.MapName[4] = RAFdb.MapName[4].." [25]"--Naxx
RAFdb.MapName[5] = RAFdb.MapName[5].." [10/25]"--Onyxia
RAFdb.MapName[6] = RAFdb.MapName[6].." [10/25]"--Malygos
RAFdb.MapName[7] = RAFdb.MapName[7].." [10]"
RAFdb.MapName[8] = RAFdb.MapName[8].." [25]"--Sarth
RAFdb.MapName[9] = RAFdb.MapName[9].." [10/25]"--Halion
RAFdb.MapName[10] = RAFdb.MapName[10].." [10]"
RAFdb.MapName[11] = RAFdb.MapName[11].." [25]"--ToC