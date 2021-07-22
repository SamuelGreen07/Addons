-------------------------------------------------------------------------------
-- AddOn namespace.
-------------------------------------------------------------------------------
local FOLDER_NAME, private = ...

private.CONTINENT_ZONE_IDS = {
	[1415] = { zonefilter = true, npcfilter = true, id = 2, zones = {1416,1417,1418,1419,1420,1421,1422,1423,1424,1425,1426,1427,1428,1429,1432,1433,1434,1435,1436,1437,1453,1942,1941} }; --Eastern Kingdoms
	[1414] = { zonefilter = true, npcfilter = true, id = 1, zones = {1411,1412,1413,1438,1439,1440,1441,1442,1443,1444,1445,1446,1447,1448,1449,1451,1452,1456,1950} }; --Kalimdor
	[1945] = { zonefilter = true, npcfilter = true, id = 3, zones = {1944,1946,1948,1949,1951,1952,1953} }; --Outland
	[9995] = { zonefilter = false, npcfilter = true, zones = {0} }; --Unknown
}

private.SUBZONES_IDS = {

}