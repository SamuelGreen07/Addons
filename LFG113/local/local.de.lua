local _, L = ...

L.Locals["deDE"] = {
	["LanguageUsed"]			= "Deutsch",
	["TranslatedBy"]			= " by übersetzt von Yuoko",

-- clients
	["Clients"]					= { ["1"] = "Vanilla", ["2"] = "TBC", ["3"] = "WOTLK", ["4"] = "Cata", },

-- StandingIDs
	["StandingID"]				= { "Hated", "Hostile", "Unfriendly", "Neutral", "Friendly", "Honored", "Revered", "Exalted" },

-- Text
	["txtLoaded"] 				= "LFG113 geladen, nutze /lfg zum Öffnen. ",
	["txtUpdate"]				= "Neues Update verfügbar.",
	["txtUpdateMessage"]		= "Die Betaversion von LFG113 ist veraltet. Bitte Aktualisieren.",
	["txtInvalidAny"]			= "Ungültige Instanz ausgewählt. Sie können nicht 'etwas auswählen' nehmen.",
	["txtInvalidInst"]			= "Ungültige Instanz ausgewählt.",
	["txtMissingRole"]			= "Keine Rolle ausgewählt.",
	["DPS"]						= "DPS",
	["Tank"]					= "Tank",
	["Heal"]					= "Heal",
	["NeedAll"]					= "brauche alle",
	["txtRoleType"]				= { "für die Dungeons", "für den Raid", "zum Questen", "für PVP", "" },
	["txtNotes"]				= "Update Anmerkungen:",
	["txtRoles"]				= "Rollen",
	["txtInstances"]			= "Instanzen",
	["txtCustomText"]			= "Eigener Text",
	["txtLevel"]				= "Level",
	["txtReport"]				= "Meldung",
	["txtReportedBy"]			= "Fehler gemeldet von",
	["txtOn"]					= "an",
	["txtBy"]					= "von",
	["txtCounts"]				= "Meldung(en)",
	["txtSaveQuestion"]			= "Als was möchten Sie das speichern??",
	["txtReportQuestion"]		= "Wen möchten Sie melden?",
	["txtAnd"]					= "und",
	["txtOr"]					= "oder",
	["txtFor"]					= "für",
	["txtGuildRun"]				= "Gilden Run",
	["txtAddToBlackList"]		= "Zur Blacklist hinzufügen",
	["txtNeed"]					= "Brauchen",
	["txtGTG"]					= "dann GTG",
	["txtAddToPremade"]			= "Add to Premade",
	["txtShareBlackList"]		= "Sync Blacklist",
	["txtAddQuestion"]			= "New keyword to add",
	["txtShareRating"]			= "Sync Ratings",
	["txtDefaultWhispers"]		= {
		["Accept"]				= "Du kannst mit kommen, wenn du willst.",
		["Decline"]				= "Entschuldige, aber ich nehme dich nicht mit nach {i}.",
		["Join"]				= "die Stufe {l} {c} {r}",
		["Invite"]				= "Ich sende dir eine Einladung und du kannst beitreten für {t} {i}",
		["Missing"]				= "Bitte Flüster mir dein die Stufe und deine Rolle z.B '60 tank/dps' oder genauer 'die Stufe 60 Krieger dps/tank'",
		["Guild"]				= "Ich sende dir eine Gildeneinladung, dann kannst du beitreten für {t} {i}",
		["whisperPartyLeader"]	= "{p} sucht nach der gleichen Instanz."
	},
	["txtDefaultSearch"]		= {
		["LFG"]					= "{l} {c} {r} LFG {i} {s}",
		["LFM"]					= "LF{n}M {r} for {i} {s} {g}",
	},
	["txtClasses"]				= {
		[1]						= "Krieger",
		[2]						= "Paladin",
		[3]						= "Jäger",
		[4]						= "Schurke",
		[5]						= "Priester",
		[7]						= "Schamane",
		[8]						= "Magier",
		[9]						= "Hexenmeister",
		[11]					= "Druide",
	},

	-- Labels
	["lblChannelLoading"]		= "Schakel het laden / lossen van kanalen in",
	["lblWhatYouNeed"]			= "Was brauchst du in deiner Gruppe:",
	["lblWhatToJoinAs"]			= "Als was möchtst du der Gruppe beitreten?:",
	["lblWhatYouView"]			= "Beide anzeigen LFG/LFM:",
	["lblActivity"]				= "Aktivität",
	["lblKeybind"]				= "Tastenbelegung",
	["lblAccurate"]				= "Präziser Scan (kann System verlangsamen)",
	["lblNotifications"]		= "Benachrichtigungen/Warnungen",
	["lblBroadcast"]			= "Gesendet",
	["lblTTB"]					= "Sendezeit",
	["lblTimeToLive"]			= "Nachrichtenleben",
	["lblAutoWhisper"]			= "Automatisch flüstern",
	["lblMessDecline"]			= "Nachricht, wenn Sie jemanden ABLEHNEN",
	["lblMessAccept"]			= "Nachricht, wenn Sie jemanden AKZEPTIEREN",
	["lblMessJoin"]				= "Nachricht, wenn Sie einer Gruppe BEITRETEN",
	["lblMessInvite"]			= "Nachricht, wenn Sie zu Ihrer Gruppe EINLADEN",
	["lblMessGuildInvite"]		= "Nachricht, wenn Sie Gildenmitglieder zu Ihrer Gruppe EINLADEN",
	["lblMessMissing"]			= "Nachricht beim Flüstern wegen fehlender Infos",
	["lblDesignType"]			= "Design Typ (Reload erforderlich)",
	["lblSettings"]				= "Einstellungen",
	["lblFreeMovingEye"]		= "Suchauge auf Minimap",
	["lblUseDMnotVC"]			= "Todesminen Suchinitialien",
	["lblAdditionalChannel"]	 = "Zusätzlicher zu überwachender Kanal",
	["lblSavedSearches"]		= "Gespeicherte Suchen",
	["lblPlayer"]				= "Spieler",
	["lblIssue"]				= "Probleem",
	["lblLanguage"]				= "Sprache",
	["lblSyncBlackList"]		= "Black list syncronization",
	["lblGroup"]				= "Group",
	["lblPremades"]				= "Vorgefertigt",
	["lblChangeLanguage"]		= "Schnittstellen Sprache (Erforderlich / neu laden)",
	["lblCommLanguage"]			= "Kommunikation Sprache",
	["lblOutput"]				= "Ausgabe",
	["lblLFG"]					= "Gruppe beitreten Nachricht",
	["lblLFM"]					= "Gruppe erstellen Nachricht",
	["lblShowNewMessage"]		= "Auto Alert",
	["lblKeywords"]				= "Keywords",
	["lblInstanceKey"]			= "Instance Key",
	["lblPulldown"]				= "Pulldown",
	["lblNewKey"]				= "New Key",

	-- Pull Downs
	["lblSelectAny"]			= "etwas auswählen",
	["lblSelectNone"]			= "nichts auswählen",
	["cmbActivityPull"]			= { "Dungeons", "Raids", "Quests", "PVP", "Benutzerdefiniert" },
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
	["tabGeneral"]				= { "Allgemein", 70 },
	["tabCommunication"]		= { "Kommunikation", 96 },
	["tabWhisper"]				= { "Nachrichten", 77 },
	["tabDisplay"]				= { "Anzeige", 70 },
	["tabPremade"]				= { "Vorgefertigt", 35 },
	["tabKeywords"]				= { "Keys", 64 },
	["tabBlackList"]			= { "Schwarze Liste", 92 },
	["tabRatings"]				= { "Bewertung", 60 },

	-- Popup notification
	["lblLFGNitofication"]		= "LFG113 Popup Benachrichtigung",
	["lblRequestJoin"]			= "Person stellt Beitrittsanfrage",

	-- Checkbox
	["chkChannelLoading"]		= "Enable modifications of channels",
	["chkGuildOnly"]			= "nur Gilde",
	["chkShowAll"]				= "Alle anzeigen",
	["chkForce"]				= "erzwinge Tastenbelegung auf I",
	["chkEnableScan"]			= "Aktiviert (Reload erforderlich)",
	["chkEnableSound"]			= "aktiviere Ton",
	["chkPopUpAlert"]			= "Popup Warnung",
	["chkFullAudio"]			= "Ton bei voller Gruppe",
	["chkPingAlert"]			= "Ping-Alarm",
	["chkTrade"]				= "Handel",
	["chkGeneral"]				= "Allgemein",
	["chkWorld"]				= "Welt",
	["chkLFG"]					= "SucheNachGruppe",
	["chkWhispers"]				= "Erlaube Flüsternachrichten",
	["chkOriginalDisplay"]		= "Original Anzeige",
	["chkFreeMovingEye"]		= "Sperre das Auge auf der Minimap",
	["chkAlwaysShowEye"]		= "Zeige das Auge immer auf der Minimap",
	["chkUseDMnotVC"]			= "Verwenden Sie DM für Todesminen, nicht VC",
	["chkSyncBlackList"]		= "Syncronize List",
	["chkPersonalBL"]			= "Personal Entry",
	["chkCompact"]				= "Compact LFM/LFG",
	["chkDisableAutoNotification"] = "Disable auto broadcast (use Minimap)",
	["chkShowNewMessage"]		= "Visual alert when a new match shows",
	["chkSoundNewMessage"]		= "Audio Alert when a new match shows",
	["chkSoloNewMessage"]		= "Solo: Alert only when active search",

	-- Buttons
	["btnCreateGroup"] 			= "Erstelle Gruppe",
	["btnNEWCG"]				= "          Erstelle\n          Gruppe",
	["btnJoinGroup"]			= "Gruppe beitreten",
	["btnNEWJG"]				= "          Gruppe\n             beitreten",
	["btnPremades"]				= "Vorgefertigt",
	["btnNewPremades"]			= "               Vorgefertigt",
	["btnActiveSearchs"]		= "Gespeicherte Suchen",
	["btnNEWAS"]				= "                  Gespeicherte\n        Suchen",
	["btnBlackList"]			= "Spieler",
	["btnNEWBL"]				= "         Spieler",
	["btnSettings"]				= "Einstellungen",
	["btnNEWSettings"]			= "                    Einstellungen",
	["btnSearch"]				= "Suche",
	["btnCancelSearch"]			= "Halt",
	["btnDefault"]				= "Standard",
	["btnAdd"]					= "Hinzufügen",
	["btnRemove"]				= "Entfernen",
	["btnAccept"]				= "Akzeptieren",
	["btnDecline"]				= "Ablehnen",
	["btnInvite"]				= "Einladen",
	["btnJoin"]					= "Beitreten",
	["btnNotify"]				= "Benachrichtigen",
	["btnAddSearch"]			= "Speichern",
	["btnCancel"]				= "Abbrechen",
	["btnReport"]				= "Melden",
	["btnViewNotes"]			= "Notizen aktualisieren",
	["btnLoad"]					= "Laden",
	["btnUnload"]				= "Unload",
	["btnClear"]				= "Zurücksetzen",
	["btnAcknowledge"]			= "Bestätigen",
	["btnBoth"]					= "Beide",
	["btnReload"]				= "Neu Laden",

	-- Popups
	["pupChannelLoading"]		= "Schakel de mogelijkheid in om kanalen te laden en te ontladen",
	["pupGuildOnly"]			= "Zeige nur Gildenaktivität",
	["pupShowall"]				= "zeige alle Dungeons",
	["pupForce"]				= "Zwinge das System die Taste I zum öffen und schließen von LFG113 zu verwenden",
	["pupAccurate"]				= "Aktivieren Sie genaues Scannen und verlangsamen Sie möglicherweise das Spiel auf langsamen Computern",
	["pupBroadcast"]			= "Legt die Wiederholungszeit in Sekunden fest (Reload erforderlich)",
	["pupTimeToLive"]			= "Die Anzahl der Sekunden, die gewartet wird, dass eine Person im Chat eine Nachricht wiederholt, bevor wir die letzte als tot betrachten und sie von der Anzeige entfernen.",
	["pupEnableSound"]			= "Ton ist aktiviert für das Addon",
	["pupPopuAlert"]			= "Erlaube Popup wenn jemand beitreten möchte",
	["pupFullGroup"]			= "Benachrichtigung mit Ton, wenn die Gruppe voll ist.",
	["pupPingAlert"]			= "Erlaube Ping-Ton, wenn jemand beitreten möchte.",
	["pupTrade"]				= "Aktiviere senden an Handels Channel",
	["pupWorld"]				= "Aktiviere senden an Welt Channel",
	["pupGeneral"]				= "Aktiviere senden an Allgemein Channel",
	["pupLFG"]					= "Aktiviere senden an SucheNachGruppe Channel",
	["pupDisplayType"]			= "Zeige Buttons und zukünftige Updates für das Addon in Classischer Anzeige. Reload erforderlich",
	["pupAcceptWhispers"]		= "Automatisch Flüsternden einladen, wenn sie Ihnen Rolle/Level mitteilen und Sie die Klasse brauchen.",
	["pupFreeMovingEye"]		= "Sperre/Entsperre das Auge auf der Minimap",
	["pupResetEye"]				= "setze das Auge auf der Minimap zurück, wenn Sie es nicht sehen können.",
	["pupAlwaysShowEye"]		= "Immer das Auge auf der Minimap anzeigen oder nur wenn gesucht wird",
	["pupUseDMnotVC"]			= "Wenn aktiviert wird DM Für Todesminen verwendet, nicht VC",
	["pupSyncBlackList"]		= "Schakel synchronisatie van de zwarte lijst met anderen op het netwerk in",
	["pupPersonalBL"]			= "Synchroniseer dit item niet, het is persoonlijk",
	["pupCompact"]				= "Gebruik dit om het LFG / LFM-scherm te comprimeren tot kleinere lijnen die informatie in gevaar brengen",
	["pupDisableAutoNotification"] = "Schakelt automatische melding uit om uit te zenden tijdens het zoeken, in plaats daarvan moet je SHIFT-LINKS KLIKKEN op het minikaartpictogram om uit te zenden wanneer je klaar bent",
	["pupShowNewMessage"]		= "This will alert you through RAID WARNING when a new matching group shows in chat",
	["pupSoundNewMessage"]		= "This will alert you via audio when a new matching group shows in chat",
	["pupSoloNewMessage"]		= "This will choose between allowing alerts when soloing and NOT searching, or only when you are searching",
	["pupActiveSearch"]			= {
		{ "Klassieker op zoek naar groep", 1, 1, 1 },
		{ "Sie haben eine aktive suche!", 1, 1, 1 }, { "\n" },
		{ "Linksklick - Öffnen/Schließen", 0, 1, 1},
		{ "Rechtsklick     - Icon bewegen", 0, 1, 1 },
		{ "Shift-Linksklick - senden suche", 0, 1, 1},
	},

	["pupHowtoUse"]				= {
		{ "WIE MAN ES BENUTZT:", 1, 1, 1 }, { "\n" },
		{ "Geben Sie einen beliebigen Text ein. Sie können die unten aufgeführten Sonderformatzeichenfolgen verwenden:", 0, 1, 1},
		{ "   - {p} Der Spieler, dem Sie antworten", 1, 1, 0 },
		{ "   - {i} Instanz", 1, 1, 0 },
		{ "   - {s} Benutzerdefinierte Zeichenfolge", 1, 1, 0 },
		{ "   - {t} Sonderzeichenfolge, die den Instanztyp enthält.", 1, 1, 0 },
		{ "   - {l} Ihr Level", 1, 1, 0 },
		{ "   - {c} Ihre Klasse", 1, 1, 0 },
		{ "   - {cs} Your current talent spec", 1, 1, 0 },
		{ "   - {r} Ihre Rolle", 1, 1, 0 },
		{ "   - {n} Aantal beschikbare plaatsen over", 1, 1, 0 },
		{"    - {g} Voegt dan GTG aan het einde toe wanneer er nog een beschikbare ruimte over is", 1, 1, 0},
		{ "\n" },
		{ "{t} Gibt abhängig vom dem im Pulldown-Menü ausgewählten Instanztyp EINEN der Strings zurück:", 0, 1, 1 },
		{ "   - Dungeons ausgewählt: 'für die dungeon'", 1, 1, 0 },
		{ "   - Raids ausgewählt: 'für den raid'", 1, 1, 0 },
		{ "   - Questen ausgewählt: 'zum Questen'", 1, 1, 0 },
		{ "   - PVP ausgewählt: 'für PVP'", 1, 1, 0 }, { "\n" },
		{ " Beispiel: wenn Sie ein Kriger des levels 19 sind und haben beides ausgewählt, DPS und TANK -", 0, 1, 1 },
		{ "   Level {l} {c} {r}", 1, 1, 0},
		{ "     wird ausgeben 'Level 19 Krieger Tank/DPS'", 1, 1, 0}
	},

	-- Dungeons
	-- 	= {#people, Name On Pulldown, lowest entry level, highest entry level, text to display in chat,  {#tank,#heals,#dps}, { ["keyword"]=1, ... }, "use PulldownSecondChance #8" }
	["PulldownInstance"]		= {
		["any"]					= {1, "Auswählen", 1, 60, "Irgendeine", {1,1,3}, { }, nil},
		-- Vanilla
		["rfc"]					= {5, "Ragefireabgrund", 13, 18, "RFC", {1,1,3}, { [" rfc "]=1, [" ragefire "]=1, [" ragefire chasm "]=1 }, nil, "Vanilla" },
		["wc"]					= {5, "Die Höhlen des Wehklagens", 17, 24, "WC", {1,1,3}, { [" wc "]=1, [" wailing caverns "]=1 }, nil, "Vanilla"  },
		["vc"]					= {5, "Die Todesminen", 17, 26, "VC", {1,1,3}, { [" vc "]=1, [" deadmines "]=1, [" van cleef "]=1 }, nil, "Vanilla" },
		["sfk"]					= {5, "Burg Schattenfang", 22, 30, "SFK", {1,1,3}, { [" sfk "]=1, [" shadowfang keep "]=1 }, nil, "Vanilla" },
		["bfd"]					= {5, "Die Tiefschwarze Grotte", 24, 32, "BFD", {1,1,3}, { [" bfd "]=1, [" blackfathom deeps "]=1 }, nil, "Vanilla" },
		["stocks"]				= {5, "Das Verlies", 24, 32, "Stocks", {1,1,3}, { [" stocks "]=1, [" stockade "]=1 }, nil, "Vanilla" },
		["gnomer"]				= {5, "Gnomeregan", 29, 38, "Gnomer", {1,1,3}, { [" gnomer "]=1, [" gnomeregan "]=1 }, nil, "Vanilla" },
		["rfk"]	 				= {5, "Kral der Klingenhauer", 29, 38, "RFK", {1,1,3}, { [" rfk "]=1, [" razorfen kraul "]=1 }, nil, "Vanilla" },
		["internalsm"]			= {5, "Das scharlachrote Kloster", 26, 45, "SM", {1,1,3}, {}, "1:sm gy!1:sm lib!1:sm arm!1:sm cath!1:internalsm", "Vanilla" },
		["sm gy"]				= {5, "Das Scharlachrote Kloster - Friedhof", 26, 36, "SM GY", {1,1,3}, { [" sm g"]=1, [" graveyard "]=1, [" gy "]=1 }, "1:sm gy!1:internalsm", "Vanilla" },
		["sm lib"]				= {5, "Das Scharlachrote Kloster - Bucherei", 29, 39, "SM Lib", {1,1,3}, { [" sm l"]=1, [" library "]=1, [" lib "]=1 }, "1:sm lib!1:internalsm", "Vanilla" },
		["sm arm"]				= {5, "Das Scharlachrote Kloster - Waffenkammer", 32, 42, "SM Arm", {1,1,3}, { [" sm a"]=1, [" armory "]=1, [" arm "]=1 }, "1:sm arm!1:internalsm", "Vanilla" },
		["sm cath"]				= {5, "Das Scharlachrote Kloster - Kathedrale", 34, 45, "SM Cath", {1,1,3}, { [" sm c"]=1, [" cathedral "]=1, [" cath "]=1 }, "1:sm cath!1:internalsm", "Vanilla" },
		["rfd"]					= {5, "Die Hügel der Klingenhauer", 37, 46, "RFD", {1,1,3}, { [" rfd "]=1, [" razorfen downs "]=1 }, nil, "Vanilla" },
		["internalulda"]		= {5, "Uldaman", 41, 51, "Ulda", {1,1,3}, {}, "1:ulda front!1:ulda back!1:internalulda", "Vanilla" },
		["ulda front"]			= {5, "Uldaman vorne", 41, 51, "Ulda Front", {1,1,3}, { [" ulda front "]=1, [" front ulda "]=1, [" uldaman front "]=1, [" front uldaman "]=1 }, "1:ulda front!1:internalulda", "Vanilla" },
		["ulda back"]			= {5, "Uldaman hinten", 41, 51, "Ulda Back", {1,1,3}, { [" ulda back "]=1, [" back ulda "]=1, [" uldaman back "]=1, [" back uldaman "]=1 }, "1:ulda back!1:internalulda", "Vanilla" },
		["zf"]					= {5, "Zul'Farrak", 42, 46, "ZF", {1,1,3}, { [" zf "]=1, [" zulfarrak "]=1, [" zul'farrak "]=1 }, nil, "Vanilla" },
		["internalmara"]		= {5, "Maraudon", 46, 55, "Mara", {1,1,3}, {}, "1:mara purple!1:mara orange!1:mara princess!1:internalmara", "Vanilla" },
		["mara purple"]			= {5, "Maraudon Purple", 46, 55, "Mara Purple", {1,1,3}, { [" mara purple "]=1, [" purple mara "]=1, [" maraudon purple "]=1, [" purple maraudon "]=1 }, "1:mara purple!1:internalmara", "Vanilla" },
		["mara orange"]			= {5, "Maraudon Orange", 46, 55, "Mara Orange", {1,1,3}, { [" mara orange "]=1, [" orange mara "]=1, [" maraudon orange "]=1, [" orange maraudon "]=1 }, "1:mara orange!1:internalmara", "Vanilla" },
		["mara princess"]		= {5, "Maraudon Princess", 46, 55, "Mara Princess", {1,1,3}, { [" mara princess "]=1, [" princess mara "]=1, [" maraudon princess "]=1, [" princess maraudon "]=1 }, "1:mara princess!1:internalmara", "Vanilla" },
		["st"]					= {5, "Der Tempel von Atal'Hakkar", 50, 56, "ST", {1,1,3}, { [" st "]=1, [" atal'hakkar "]=1, [" atalhakkar "]=1 }, nil, "Vanilla" },
		["internalbrd"]			= {5, "Schwarzfelstiefen", 52, 60, "BRD", {1,1,3}, {}, "1:brd arena!1:brd anger!1:brd golem!1:internalbrd", "Vanilla" },
		["brd arena"]			= {5, "Schwarzfelstiefen Arena", 52, 60, "BRD Arena", {1,1,3}, { [" arena "]=1, [" brd arena "]=1, [" blackrock depths arena "]=1 }, "1:brd arena!1:internalbrd", "Vanilla" },
		["brd anger"]			= {5, "Schwarzfelstiefen Anger", 52, 60, "BRD Anger", {1,1,3}, { [" anger "]=1, [" brd anger "]=1, [" brd angerforge "]=1, [" blackrock depths anger "]=1 }, "1:brd anger!1:internalbrd", "Vanilla" },
		["brd golem"]			= {5, "Schwarzfelstiefen Golem", 52, 60, "BRD Golem", {1,1,3}, { [" golem "]=1, [" brd golem "]=1, [" blackrock depths golem "]=1 }, "1:brd golem!1:internalbrd", "Vanilla" },
		["lbrs"]				= {5, "Untere Schwarzfelsspitze", 55, 60, "LBRS", {1,1,3}, { [" lbrs "]=1, [" lower blackrock "]=1 }, nil, "Vanilla" },
		["ubrs"]				= {10, "Obere Schwarzfelsspitze", 55, 60, "UBRS", {1,1,3}, { [" ubrs "]=1, [" upper blackrock "]=1 }, nil, "Vanilla" },
		["internaldm"]			= {5, "Düsterbruch", 55, 60, "DM", {1,1,3}, {}, "1:dm west!1:dm north!1:dm east!1:dm tribute!1:internaldm", "Vanilla" },
		["dm west"]				= {5, "Düsterbruch West", 55, 60, "DM West", {1,1,3}, { [" dm w "]=1, [" dm west "]=1, [" west dm "]=1, [" dire maul west "]=1, [" west dire maul "]=1 }, "1:dm west!1:internaldm", "Vanilla" },
		["dm north"]			= {5, "Düsterbruch Nord", 55, 60, "DM North", {1,1,3}, { [" dm n "]=1, [" dm north "]=1, [" north dm "]=1, [" dire maul north "]=1, [" north dire maul "]=1 }, "1:dm north!1:internaldm", "Vanilla" },
		["dm east"]				= {5, "Düsterbruch Ost", 55, 60, "DM East", {1,1,3}, { [" dm e "]=1, [" dm east "]=1, [" east dm "]=1, [" dire maul east "]=1, [" east dire maul "]=1 }, "1:dm east!1:internaldm", "Vanilla" },
		["dm tribute"]			= {5, "Düsterbruch Tribut", 55, 60, "DM Tribute", {1,1,3}, { [" tribute "]=1, [" dm tribute "]=1, [" tribute dm "]=1, [" dire maul tribute "]=1, [" tribute dire maul "]=1, [" tribute run "]=1 }, "1:dm tribute!1:internaldm", "Vanilla" },
		["internalstrat"]		= {5, "Stratholme", 58, 60, "Strat", {1,1,3}, {}, "1:strat live!1:strat dead!1:internalstrat", "Vanilla" },
		["strat live"]			= {5, "Stratholme Live", 58, 60, "Strat Live", {1,1,3}, { [" strat live "]=1, [" strat scarlet "]=1, [" live strat "]=1, [" scarlet strat "]=1, [" stratholme live "]=1, [" live stratholme "]=1 }, "1:strat live!1:internalstrat", "Vanilla" },
		["strat dead"]			= {5, "Stratholme Dead", 58, 60, "Strat Dead", {1,1,3}, { [" strat dead "]=1, [" strat undead "]=1, [" strat scourge "]=1, [" dead strat "]=1, [" undead strat "]=1, [" scourge strat "]=1, [" ud strat "]=1, [" ud strath "]=1, [" strat ud "]=1, [" stratholme dead "]=1, [" stratholme undead "]=1, [" dead stratholme "]=1, [" undead stratholme "]=1 }, "1:strat dead!1:internalstrat", "Vanilla" },
		["scholo"]				= {5, "Scholomance", 58, 60, "Scholo", {1,1,3}, { [" scholo "]=1, [" scholomance "]=1 }, nil, "Vanilla" },
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
		["sm"]					= {5, "Das scharlachrote Kloster", 26, 45, "", {1,1,3}, { [" sm "]=1, [" scarlet monastery "]=1, [" sm full "]=1, [" scarlet monastery full "]=1 }, "1:internalsm!1:sm gy!1:sm lib!1:sm arm!1:sm cath" },
		["ulda"]				= {5, "Uldaman", 41, 51, "", {1,1,3}, { [" uld "]=1, [" ulda "]=1, [" uldaman "]=1, [" ulda full "]=1, [" uld full "]=1, [" uldaman full "]=1 }, "1:internalulda!1:ulda front!1:ulda back" },
		["mara"]				= {5, "Maraudon", 46, 55, "", {1,1,3}, { [" mara "]=1, [" maraudon "]=1, [" mara full "]=1, [" maraudon full "]=1 }, "1:internalmara!1:mara purple!1:mara orange!1:mara princess" },
		["brd"]					= {5, "Schwarzfelstiefen", 52, 60, "", {1,1,3}, { [" brd "]=1, [" blackrock depths "]=1, [" brd full "]=1, ["blackrock depths full "]=1 }, "1:internalbrd!1:brd arena!1:brd anger!1:brd golem" },
		["dm"]					= {5, "Düsterbruch", 55, 60, "", {1,1,3}, { [" dm "]=1, [" dire maul "]=1, [" dm full "]=1, [" dire maul full "]=1 }, "1:internaldm!1:dm west!1:dm north!1:dm east!1:dm tribute" },
		["strat"]				= {5, "Stratholme", 58, 60, "", {1,1,3}, { [" strat "]=1, [" strath "]=1, [" stratholme "]=1, [" strat full "]=1, [" stratholme full "]=1 }, "1:internalstrat!1:strat live!1:strat dead" }
	},

	-- Raids
	["PulldownRaids"]			= {
		-- Vanilla
		["any"]					= {1, "Auswählen", 1, 60, "Irgendeine", {1,1,1}, { }, },
		["ony"]					= {40, "Onyxias Hort", 60, 61, "Ony", {2,8,30}, { [" ony "]=1, [" onyxia "]=1, ["onyxia lair "]=1 }, nil, "Vanilla" },
		["zg"]					= {20, "Zul'Gurub", 60, 61, "ZG", {2,4,14}, { [" zg "]=1, [" zul'gurub "]=1, [" zulgurub "]=1, [" zul gurub "]=1 }, nil, "Vanilla" },
		["mc"]					= {40, "Geschmolzener Kern", 60, 61, "MC", {2,8,30}, { [" mc "]=1, [" molten core "]=1 }, nil, "Vanilla" },
		["bwl"]					= {40, "Pechschwingenhort", 60, 62, "BWL", {2,8,30}, { [" bwl "]=1, [" blackwing lair "]=1 }, nil, "Vanilla" },
		["aq20"]				= {20, "Ruinen von Ahn'Qiraj", 60, 62, "AQ20", {2,4,14}, { [" aq20 "]=1, [" ruins of ahn"]=1 }, nil, "Vanilla" },
		["aq40"]				= {40, "Tempel von Ahn'Qiraj", 60, 63, "AQ40", {2,8,30}, { [" aq40 "]=1, [" temple of ahn"]=1 }, nil, "Vanilla" },
		["naxx"]				= {40, "Naxxramas", 60, 64, "Naxx", {2,8,30}, { [" naxx "]=1, [" naxxramas "]=1 }, nil, "Vanilla" },
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
	}
}