--[[
 Skillet: A tradeskill window replacement.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
]]--

local L = LibStub("AceLocale-3.0"):NewLocale("Skillet", "itIT")
if not L then return end

L[" days"] = " giorni"
L["About"] = "Riguardo a"
L["ABOUTDESC"] = "Stampa le informazioni riguardo a Skillet"
--Translation missing 
-- L["Add to Ignore Materials"] = ""
L["alts"] = true
L["Appearance"] = "Aspetto"
L["APPEARANCEDESC"] = "Le opzioni che controllano come Skillet viene mostrato"
L["bank"] = "banca"
L["Blizzard"] = "Tempesta"
L["Buy Reagents"] = "Compra Reagenti"
L["buyable"] = "comprabile"
--Translation missing 
-- L["Buyout"] = ""
L["By Difficulty"] = "Per Difficolta'"
L["By Item Level"] = "Per Livello Oggetto"
L["By Level"] = "Per Livello"
L["By Name"] = "Per Nome"
L["By Quality"] = "Per Qualita'"
L["By Skill Level"] = "Per Livello Abilita'"
--Translation missing 
-- L["can be created by crafting reagents"] = ""
L["can be created from reagents in your inventory"] = "puo' essere creato con i reagenti presenti nel tuo inventario"
L["can be created from reagents on other characters"] = "puo' essere creato con i reagenti presenti su tutti i tuoi personaggi"
--Translation missing 
-- L["can be created with reagents bought at vendor"] = ""
L["Clear"] = "Pulisci"
L["click here to add a note"] = "premere qui per aggiungere una nota"
--Translation missing 
-- L["Click to toggle favorite"] = ""
L["Collapse all groups"] = "Collassa tutti i gruppi"
L["Config"] = "Configura"
L["CONFIGDESC"] = "Apre la finestra di configurazione di Skillet"
--Translation missing 
-- L["CONFIRMQUEUECLEARDESC"] = ""
--Translation missing 
-- L["CONFIRMQUEUECLEARNAME"] = ""
--Translation missing 
-- L["Copy"] = ""
L["Could not find bag space for"] = "Non trovo spazio nell borse per"
L["craftable"] = "crabile"
L["Crafted By"] = "Crato da"
L["Create"] = "Crea"
L["Create All"] = "Crea Tutti"
--Translation missing 
-- L["Cut"] = ""
--Translation missing 
-- L["DBMarket"] = ""
L["Delete"] = "Cancella"
L["DISPLAYREQUIREDLEVELDESC"] = "Se l'oggetto creato richiede un livello minimo per essere usato, questo livello viene mostrato a fianco della ricetta"
L["DISPLAYREQUIREDLEVELNAME"] = "Mostra livello richiesto"
L["DISPLAYSHOPPINGLISTATAUCTIONDESC"] = "Mostra una lista della spesa per gli oggetti richiesti, ma non presenti nelle borse, per creare le ricette accodate"
L["DISPLAYSHOPPINGLISTATAUCTIONNAME"] = "Mostra lista della spesa alla casa d'aste"
L["DISPLAYSHOPPINGLISTATBANKDESC"] = "Mostra una lista della spesa per gli oggetti richiesti, ma non presenti nelle borse, per creare le ricette accodate"
L["DISPLAYSHOPPINGLISTATBANKNAME"] = "Mostra una lista della spesa alla banca"
L["DISPLAYSHOPPINGLISTATGUILDBANKDESC"] = "Mostra una lista della spesa per gli oggetti richiesti, ma non presenti nelle borse, per creare le ricette accodate"
L["DISPLAYSHOPPINGLISTATGUILDBANKNAME"] = "Mostra una lista della spesa alla banca di gilda"
--Translation missing 
-- L["DISPLAYSHOPPINGLISTATMERCHANTDESC"] = ""
--Translation missing 
-- L["DISPLAYSHOPPINGLISTATMERCHANTNAME"] = ""
--Translation missing 
-- L["Draenor Engineering"] = ""
--Translation missing 
-- L["Empty Group"] = ""
L["Enabled"] = "Attivato"
L["Enchant"] = "Incantamento"
L["ENHANCHEDRECIPEDISPLAYDESC"] = "Quando abilitato, le ricette avranno uno o piu' '+' per indicarne la difficolta'."
L["ENHANCHEDRECIPEDISPLAYNAME"] = "Mostra la difficolta' delle ricette come testo"
L["Expand all groups"] = "Espandi tutti i gruppi"
L["Features"] = "Caratteristiche"
L["FEATURESDESC"] = "Comportamenti opzionali che possono essere attivati o disattivati"
L["Filter"] = "Filtro"
--Translation missing 
-- L["Flush All Data"] = ""
--Translation missing 
-- L["Flush Recipe Data"] = ""
--Translation missing 
-- L["FLUSHALLDATADESC"] = ""
--Translation missing 
-- L["FLUSHRECIPEDATADESC"] = ""
--Translation missing 
-- L["From Selection"] = ""
L["Glyph "] = "Glifo"
L["Gold earned"] = "Oro guadagnato"
L["Grouping"] = "Raggruppamento"
--Translation missing 
-- L["has cooldown of"] = ""
L["have"] = "hanno"
L["Hide trivial"] = "Nascondi Banali"
L["Hide uncraftable"] = "Nascondi non creabili"
--Translation missing 
-- L["IGNORECLEARDESC"] = ""
--Translation missing 
-- L["Ignored List"] = ""
--Translation missing 
-- L["Ignored Materials Clear"] = ""
--Translation missing 
-- L["Ignored Materials List"] = ""
--Translation missing 
-- L["IGNORELISTDESC"] = ""
--Translation missing 
-- L["Illusions"] = ""
--Translation missing 
-- L["in your inventory"] = ""
L["Include alts"] = "Includi alt"
--Translation missing 
-- L["Include bank"] = ""
L["Include guild"] = "Include gilda"
L["Inventory"] = "Inventario"
L["INVENTORYDESC"] = "Informazioni dell'Inventario"
L["is now disabled"] = "e' ora disabilitato"
L["is now enabled"] = "e' ora abiltiato"
--Translation missing 
-- L["Learned"] = ""
L["Library"] = "Libreria"
--Translation missing 
-- L["Link Recipe"] = ""
L["LINKCRAFTABLEREAGENTSDESC"] = "Se puoi creare un reagente necessario alla ricetta, cliccando il reagente ti portera' alla sua ricetta"
L["LINKCRAFTABLEREAGENTSNAME"] = "Rendi reagenti clickabili"
L["Load"] = "Carica"
--Translation missing 
-- L["Market"] = ""
L["Merge items"] = "Unisce oggetti"
L["Move Down"] = "Muovi verso il basso"
L["Move to Bottom"] = "Muovi al fondo"
L["Move to Top"] = "Muovi all'inizio"
L["Move Up"] = "Muovi verso l'alto"
L["need"] = "necessario"
--Translation missing 
-- L["New Group"] = ""
L["No Data"] = "Nessun Dato"
L["No such queue saved"] = "Nessuna lista simile salvata"
L["None"] = "Nessuno"
L["not yet cached"] = "non ancora salvato"
L["Notes"] = "Note"
L["Number of items to queue/create"] = "Numero di oggetti da accodare/creare"
L["Options"] = "Opzioni"
L["Order by item"] = "Ordina per oggetto"
--Translation missing 
-- L["Paste"] = ""
L["Pause"] = "Pausa"
--Translation missing 
-- L["Plugins"] = ""
L["Process"] = "Processo"
L["Purchased"] = "Comprato"
L["Queue"] = "Coda"
L["Queue All"] = "Accoda Tutti"
L["Queue is empty"] = "La coda e' vuota"
L["Queue is not empty. Overwrite?"] = "La coda non e' vuota. Sovrascrivere?"
L["Queue with this name already exsists. Overwrite?"] = "Una coda con questo nome esiste gia'. Sovrascrivere?"
L["QUEUECRAFTABLEREAGENTSDESC"] = "Se puoi creare il reagente per la ricetta corrente, e non ne hai a sufficenza, allora il reagente verra' aggiunto alla coda"
L["QUEUECRAFTABLEREAGENTSNAME"] = "Accoda reagenti creabili"
L["QUEUEGLYPHREAGENTSDESC"] = "Se puoi creare il reagente per la ricetta corrente, e non ne hai a sufficenza, allora il reagente verra' aggiunto alla coda. Questa opzione e' separata solo per i Glifi."
L["QUEUEGLYPHREAGENTSNAME"] = "Accoda reagenti per Glifi"
--Translation missing 
-- L["QUEUEONLYVIEWDESC"] = ""
--Translation missing 
-- L["QUEUEONLYVIEWNAME"] = ""
L["Queues"] = "Code"
L["Reagents"] = "Reagenti"
L["reagents in inventory"] = "reagenti in inventario"
L["Really delete this queue?"] = "Vuoi cancellare veramente questa coda?"
--Translation missing 
-- L["Remove Favorite"] = ""
--Translation missing 
-- L["Rename Group"] = ""
L["Rescan"] = "Riscansiona"
L["Reset"] = "Comando di reimpostazione posizione"
--Translation missing 
-- L["Reset Recipe Filter"] = ""
L["RESETDESC"] = "Descrizione del comando di reimpostazione posizione"
--Translation missing 
-- L["RESETRECIPEFILTERDESC"] = ""
L["Retrieve"] = "Recupera"
L["Save"] = "Salva"
L["Scale"] = "Scala"
L["SCALEDESC"] = "Scala la finestra delle professioni (di base 1.0)"
L["Scan completed"] = "Scansione Completa"
L["Scanning tradeskill"] = "Scansionamento Professioni"
--Translation missing 
-- L["Search"] = ""
--Translation missing 
-- L["Select All"] = ""
--Translation missing 
-- L["Select None"] = ""
L["Select skill difficulty threshold"] = "Seleziona limite della difficolta' per le professioni"
L["Selected Addon"] = "Addon Selezionato"
--Translation missing 
-- L["Selection"] = ""
L["Sells for "] = "Vendibile per "
--Translation missing 
-- L["Set Favorite"] = ""
L["Shopping Clear"] = "Lista della Spesa pulita"
L["Shopping List"] = "Lista della Spesa"
L["SHOPPINGCLEARDESC"] = "Pulisci la Lista della Spesa"
L["SHOPPINGLISTDESC"] = "Mostra la lista della spesa"
--Translation missing 
-- L["Show favorite recipes only. Click on a star on the left side of a recipe to set favorite."] = ""
L["SHOWBANKALTCOUNTSDESC"] = "Quando vengono calcolati e mostrati i conteggi per gli oggetti, includere quelli presenti in banca e su altri personaggi"
L["SHOWBANKALTCOUNTSNAME"] = "Includi banca e alt"
L["SHOWCRAFTCOUNTSDESC"] = "Mostra il numero di volte che puoi creare una ricetta, non il totale di oggetti producibili"
L["SHOWCRAFTCOUNTSNAME"] = "Mostra conteggio creabili"
L["SHOWCRAFTERSTOOLTIPDESC"] = "Mostra l'alt che e' in grado di creare l'oggetto nelle informazioni"
L["SHOWCRAFTERSTOOLTIPNAME"] = "Mostra creatori nelle informazioni"
L["SHOWDETAILEDRECIPETOOLTIPDESC"] = "Mostra un'informazione quando si passa sopra una ricetta"
L["SHOWDETAILEDRECIPETOOLTIPNAME"] = "Mostra informazioni per le ricette"
L["SHOWFULLTOOLTIPDESC"] = "Mostra tutte le informazioni su un oggetto che puo' essere creato. Se si disattiva questa opzione si vedranno solo informazioni compresse (tenere premuto Ctrl per mostrare le informazioni complete)"
L["SHOWFULLTOOLTIPNAME"] = "Usa informazioni di base"
L["SHOWITEMNOTESTOOLTIPDESC"] = "Aggiungi note pesonalizzate alle informazioni di un oggetto"
L["SHOWITEMNOTESTOOLTIPNAME"] = "Aggiungi note personalizzate alle informazioni"
L["SHOWITEMTOOLTIPDESC"] = "Mostra informazioni oggetto, invece che le informazioni ricetta."
L["SHOWITEMTOOLTIPNAME"] = "Mostra informazioni oggetto quando possibile"
--Translation missing 
-- L["SHOWMAXUPGRADEDESC"] = ""
--Translation missing 
-- L["SHOWMAXUPGRADENAME"] = ""
--Translation missing 
-- L["SHOWRECIPESOURCEFORLEARNEDDESC"] = ""
--Translation missing 
-- L["SHOWRECIPESOURCEFORLEARNEDNAME"] = ""
L["Skillet Trade Skills"] = "Skillet Abilità di Commercio"
L["Skipping"] = "Saltare"
L["Sold amount"] = "Ammontare di vendita"
L["SORTASC"] = "Elenca la lista ricette dal piu' alto al piu' basso"
L["SORTDESC"] = "Elenca la lista delle ricette dal piu' basso al piu' alto"
L["Sorting"] = "Riordinango"
L["Source:"] = "Sorgente:"
L["STANDBYDESC"] = "Scambia stato di attesa acceso/spento"
L["STANDBYNAME"] = "attesa"
L["Start"] = "Inizia"
L["Supported Addons"] = "Addon Supportati"
L["SUPPORTEDADDONSDESC"] = "Addon supportati che possono o sono utilizzati per esaminare l'inventario"
L["This merchant sells reagents you need!"] = "Questo mercante vende i reagenti che ti servono!"
L["Total Cost:"] = "Costo totale:"
L["Total spent"] = "Totale speso"
L["Trained"] = "Allenato"
L["TRANSPARAENCYDESC"] = "Trasparenza della finestra principale"
L["Transparency"] = "Trasparenza"
L["Unknown"] = "Sconosciuto"
--Translation missing 
-- L["Unlearned"] = ""
--Translation missing 
-- L["USEALTCURRVENDITEMSDESC"] = ""
--Translation missing 
-- L["USEALTCURRVENDITEMSNAME"] = ""
--Translation missing 
-- L["USEBLIZZARDFORFOLLOWERSDESC"] = ""
--Translation missing 
-- L["USEBLIZZARDFORFOLLOWERSNAME"] = ""
--Translation missing 
-- L["USEGUILDBANKASALTDESC"] = ""
--Translation missing 
-- L["USEGUILDBANKASALTNAME"] = ""
--Translation missing 
-- L["Using Bank for"] = ""
--Translation missing 
-- L["Using Reagent Bank for"] = ""
L["VENDORAUTOBUYDESC"] = "Se hai accodato ricette e parli con un mercante che vende qualdoca che ti serve per quelle ricette, verra' automaticamente acquistato."
L["VENDORAUTOBUYNAME"] = "Compra reagenti in automatico"
L["VENDORBUYBUTTONDESC"] = "Mostra un bottone quando parli ad un mercante che permette di comprare i reagenti necessari per le ricette accodate."
L["VENDORBUYBUTTONNAME"] = "Mostra pulsante dai mercanti"
L["View Crafters"] = "Mostra Creatori"

