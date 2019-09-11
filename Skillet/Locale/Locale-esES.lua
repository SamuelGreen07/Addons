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

local L = LibStub("AceLocale-3.0"):NewLocale("Skillet", "esES")
if not L then return end

L[" days"] = "días"
L["About"] = "Acerca de"
L["ABOUTDESC"] = "Imprime información acerca de Skillet"
--Translation missing 
L["Add to Ignore Materials"] = "Add to Ignore Materials"
L["alts"] = "alts"
L["Appearance"] = "Apariencia"
L["APPEARANCEDESC"] = "Opciones que controlan como Skillet es mostrado"
L["bank"] = "banco"
L["Blizzard"] = "Blizzard"
L["Buy Reagents"] = "Comprar Reactivos"
L["buyable"] = "vendible"
--Translation missing 
L["Buyout"] = "Buyout"
L["By Difficulty"] = "Por Dificultad"
L["By Item Level"] = "Por Nivel del Objeto"
L["By Level"] = "Por Nivel"
L["By Name"] = "Por Nombre"
L["By Quality"] = "Por Calidad"
L["By Skill Level"] = "Por Nivel de Habilidad"
--Translation missing 
L["can be created by crafting reagents"] = "can be created by crafting reagents"
L["can be created from reagents in your inventory"] = "puede ser creado con los reactivos de tu inventario"
L["can be created from reagents on other characters"] = "puede ser creado con los reactivos de todos tus caracteres"
--Translation missing 
L["can be created with reagents bought at vendor"] = "can be created with reagents bought at vendor"
L["Clear"] = "Limpiar"
L["click here to add a note"] = "Click aquí para añadir una nota"
--Translation missing 
L["Click to toggle favorite"] = "Click to toggle favorite"
L["Collapse all groups"] = "Contraer todos los grupos"
L["Config"] = "Configuración"
L["CONFIGDESC"] = "Abre una ventana de configuración para Skillet"
--Translation missing 
L["CONFIRMQUEUECLEARDESC"] = "Use Alt-left-click instead of left-click to clear the queue"
--Translation missing 
L["CONFIRMQUEUECLEARNAME"] = "Use Alt-click to clear queue"
--Translation missing 
L["Copy"] = "Copy"
L["Could not find bag space for"] = "No puedo encontrar un espacio en la bolsa para"
L["craftable"] = "Manufacturable"
L["Crafted By"] = "Manufacturado por"
L["Create"] = "Crear"
L["Create All"] = "Crear Todo"
--Translation missing 
L["Cut"] = "Cut"
--Translation missing 
L["DBMarket"] = "DBMarket"
L["Delete"] = "Borrar"
L["DISPLAYREQUIREDLEVELDESC"] = "Si el elemento fabricado requiere un nivel mínimo para utilizar, este nivel será mostrado con la receta"
L["DISPLAYREQUIREDLEVELNAME"] = "Mostrar nivel necesario"
L["DISPLAYSHOPPINGLISTATAUCTIONDESC"] = "Mostrar una Lista de la Compra de los elementos que son necesarios para fabricar recetas encoladas pero que no están en tus bolsas"
L["DISPLAYSHOPPINGLISTATAUCTIONNAME"] = "Mostrar Lista de la Compra en la Subasta"
L["DISPLAYSHOPPINGLISTATBANKDESC"] = "Mostrar una Lista de la Compra de los elementos que son necesarios para fabricar recetas encoladas pero que no están en tus bolsas"
L["DISPLAYSHOPPINGLISTATBANKNAME"] = "Mostrar Lista de la Compra en los Bancos"
L["DISPLAYSHOPPINGLISTATGUILDBANKDESC"] = "Muestra una lista de compra de Objetos que son necesarios para manufacturar las recetas encoladaspe ro no estan en bolsas"
L["DISPLAYSHOPPINGLISTATGUILDBANKNAME"] = "Muestra lista de compra en Banco de Hermandad"
--Translation missing 
L["DISPLAYSHOPPINGLISTATMERCHANTDESC"] = "Display a shopping list of the items that are needed to craft queued recipes but are not in your bags"
--Translation missing 
L["DISPLAYSHOPPINGLISTATMERCHANTNAME"] = "Display Shopping List at Merchants"
--Translation missing 
L["Draenor Engineering"] = "Draenor Engineering"
--Translation missing 
L["Empty Group"] = "Empty Group"
L["Enabled"] = "Habilitado"
L["Enchant"] = "Encantar"
L["ENHANCHEDRECIPEDISPLAYDESC"] = "Cuando activo, nombres de las recetas tendrán uno o más caracteres '+' añadido a su nombre para indicar la dificultad de la receta."
L["ENHANCHEDRECIPEDISPLAYNAME"] = "Mostrar la dificultad de la receta como texto"
L["Expand all groups"] = "Expandir todos los grupos"
L["Features"] = "Características"
L["FEATURESDESC"] = "Comportamiento opcional que puede activarse y desactivarse"
L["Filter"] = "Filtro"
--Translation missing 
L["Flush All Data"] = "Flush All Data"
--Translation missing 
L["Flush Recipe Data"] = "Flush Recipe Data"
--Translation missing 
L["FLUSHALLDATADESC"] = "Flush all Skillet data"
--Translation missing 
L["FLUSHRECIPEDATADESC"] = "Flush Skillet recipe data"
--Translation missing 
L["From Selection"] = "From Selection"
L["Glyph "] = "Glifo "
L["Gold earned"] = "Oro ganado"
L["Grouping"] = "Agrupando"
--Translation missing 
L["has cooldown of"] = "has cooldown of"
L["have"] = "Tiene"
L["Hide trivial"] = "Ocultar Triviales"
L["Hide uncraftable"] = "Ocultar Imposibles de Crear"
--Translation missing 
L["IGNORECLEARDESC"] = "Clear all entries from the Ignored Materials list."
--Translation missing 
L["Ignored List"] = "Ignored List"
--Translation missing 
L["Ignored Materials Clear"] = "Ignored Materials Clear"
--Translation missing 
L["Ignored Materials List"] = "Ignored Materials List"
--Translation missing 
L["IGNORELISTDESC"] = "Open the Ignored Materials list frame."
--Translation missing 
L["Illusions"] = "Illusions"
--Translation missing 
L["in your inventory"] = "in your inventory"
L["Include alts"] = "Incluir Alts"
--Translation missing 
L["Include bank"] = "Include bank"
--Translation missing 
L["Include guild"] = "Include guild"
L["Inventory"] = "Inventario"
L["INVENTORYDESC"] = "Información del Inventario"
L["is now disabled"] = "ahora esta deshabilitado"
L["is now enabled"] = "ahora esta habilitado"
--Translation missing 
L["Learned"] = "Learned"
L["Library"] = "Librería"
--Translation missing 
L["Link Recipe"] = "Link Recipe"
L["LINKCRAFTABLEREAGENTSDESC"] = "Si puedes crear un reactivo necesario para la receta actual, clickenado el reactivo le llevará a su receta."
L["LINKCRAFTABLEREAGENTSNAME"] = "Hacer reactivos clickeables"
L["Load"] = "Cargar"
--Translation missing 
L["Market"] = "Market"
--Translation missing 
L["Merge items"] = "Merge items"
L["Move Down"] = "Mover abajo"
L["Move to Bottom"] = "Mover al Final"
L["Move to Top"] = "Mover al Inicio"
L["Move Up"] = "Mover arriba"
L["need"] = "necesita"
--Translation missing 
L["New Group"] = "New Group"
L["No Data"] = "No Datos"
L["No such queue saved"] = "Esta cola no esta guardada"
L["None"] = "Ninguno"
L["not yet cached"] = "aún no en caché"
L["Notes"] = "Notas"
L["Number of items to queue/create"] = "Número de elementos a encolar/crear"
L["Options"] = "Opciones"
--Translation missing 
L["Order by item"] = "Order by item"
--Translation missing 
L["Paste"] = "Paste"
L["Pause"] = "Pausar"
--Translation missing 
L["Plugins"] = "Plugins"
L["Process"] = "Procesando"
L["Purchased"] = "Comprado"
L["Queue"] = "Encolar"
L["Queue All"] = "Encolar Todo"
L["Queue is empty"] = "La cola esta vacía"
L["Queue is not empty. Overwrite?"] = "La cola no esta vacía. Sobrescribir?"
L["Queue with this name already exsists. Overwrite?"] = "La cola con este nombre ya existe. Sobrescribir?"
L["QUEUECRAFTABLEREAGENTSDESC"] = "Si puedes crear un reactivo necesario para la receta actual, y no tienes suficientes, entonces estos reactivos serán añadidos a la cola"
L["QUEUECRAFTABLEREAGENTSNAME"] = "Encolar reactivos fabricables"
L["QUEUEGLYPHREAGENTSDESC"] = "Si puede crear un producto necesario para la receta actual, y no tiene suficiente, entonces el producto será añadido a la cola. Esta opción es solo para Gilfos."
L["QUEUEGLYPHREAGENTSNAME"] = "Cola de productos necesarios para Gilfos"
--Translation missing 
L["QUEUEONLYVIEWDESC"] = "Show Standalone Queue Window only when set, show both Standalone Queue Window and Skillet Window when clear."
--Translation missing 
L["QUEUEONLYVIEWNAME"] = "Only show Standalone Queue"
L["Queues"] = "Encolado Guardar/ Cargar"
--Translation missing 
L["Reagents"] = "Reagents"
L["reagents in inventory"] = "reactivos en el inventario"
L["Really delete this queue?"] = "Borrar esta cola realmente?"
--Translation missing 
L["Remove Favorite"] = "Remove Favorite"
--Translation missing 
L["Rename Group"] = "Rename Group"
L["Rescan"] = "Rescanear"
--Translation missing 
L["Reset"] = "Reset"
--Translation missing 
L["Reset Recipe Filter"] = "Reset Recipe Filter"
--Translation missing 
L["RESETDESC"] = "Reset Skillet position"
--Translation missing 
L["RESETRECIPEFILTERDESC"] = "Reset Recipe Filter"
L["Retrieve"] = "Recuperar"
L["Save"] = "Guardar"
L["Scale"] = "Escala"
L["SCALEDESC"] = "Escala de la venta de Habilidades de Comercio (predeterminado 1.0)"
L["Scan completed"] = "Escaneo completado"
L["Scanning tradeskill"] = "Escaneando Habilidades de Comercio"
--Translation missing 
L["Search"] = "Search"
--Translation missing 
L["Select All"] = "Select All"
--Translation missing 
L["Select None"] = "Select None"
L["Select skill difficulty threshold"] = "Selecciona el umbral de nivel de habilidad"
L["Selected Addon"] = "Addon Seleccionado"
--Translation missing 
L["Selection"] = "Selection"
L["Sells for "] = "Se vende por"
--Translation missing 
L["Set Favorite"] = "Set Favorite"
--Translation missing 
L["Shopping Clear"] = "Shopping Clear"
L["Shopping List"] = "Lista Compra"
--Translation missing 
L["SHOPPINGCLEARDESC"] = "Clear the shopping list"
L["SHOPPINGLISTDESC"] = "Mostrar la Lista de la Compra"
--Translation missing 
L["Show favorite recipes only. Click on a star on the left side of a recipe to set favorite."] = "Show favorite recipes only. Click on a star on the left side of a recipe to set favorite."
L["SHOWBANKALTCOUNTSDESC"] = "Cuando se calcula y se muestra contador de elementos fabricables, incluir elementos de tu banco y de tus otros caracteres."
L["SHOWBANKALTCOUNTSNAME"] = "Incluir contenido del banco y caracter alt"
L["SHOWCRAFTCOUNTSDESC"] = "Mostrar el número de veces que se puede elaborar una receta, no el número total de elementos elaborables"
L["SHOWCRAFTCOUNTSNAME"] = "Mostrar Contador Fabricación"
L["SHOWCRAFTERSTOOLTIPDESC"] = "Muestra el carácter alternativo que puede manufacturar un objeto en la información de las notas de este objeto."
L["SHOWCRAFTERSTOOLTIPNAME"] = "Muestra los artesanos en la información de las notas."
L["SHOWDETAILEDRECIPETOOLTIPDESC"] = "Mostrar un tooltip detallado cuando se cierne sobre recetas en el panel izquierdo"
L["SHOWDETAILEDRECIPETOOLTIPNAME"] = "Mostrar tooltip detallado para recipientes"
L["SHOWFULLTOOLTIPDESC"] = "Muestra toda la información acerca de un objeto para crearlo. Si Ud. lo desactiva solo vera la información de las notas compacta (mantener Ctrl para mostral toda la informacion de las notas)"
L["SHOWFULLTOOLTIPNAME"] = "Usar la información de las notas normal."
L["SHOWITEMNOTESTOOLTIPDESC"] = "Añadir notas proporcionadas para un elemento al tooltip para ese elemento"
L["SHOWITEMNOTESTOOLTIPNAME"] = "Añadir notas usuario especificadas al tooltip"
L["SHOWITEMTOOLTIPDESC"] = "Muestra Notas de información de objetos manufacturables, en vez de la nota de la receta."
L["SHOWITEMTOOLTIPNAME"] = "Muestra Nota de información cuando es posible"
--Translation missing 
L["SHOWMAXUPGRADEDESC"] = "When set, show upgradable recipes as \"(current/maximum)\". When not set, show as \"(current)\""
--Translation missing 
L["SHOWMAXUPGRADENAME"] = "Show upgradable recipes as (current/max)"
--Translation missing 
L["SHOWRECIPESOURCEFORLEARNEDDESC"] = "Show Recipe Source for Learned Recipes"
--Translation missing 
L["SHOWRECIPESOURCEFORLEARNEDNAME"] = "Show Recipe Source for Learned Recipes "
L["Skillet Trade Skills"] = "Skillet - Habilidades de Comercio"
L["Skipping"] = "Saltarse"
L["Sold amount"] = "Cantidad vendida"
L["SORTASC"] = "Ordenar la lista de recetas del mayor (arriba) al menor (abajo)"
L["SORTDESC"] = "Ordenar la lista de recetas del menor (arriba) al mayor (abajo)"
L["Sorting"] = "Sorting"
L["Source:"] = "Procedencia::"
L["STANDBYDESC"] = "Intercambio pausa on/off"
L["STANDBYNAME"] = "Pausa"
L["Start"] = "Iniciar"
L["Supported Addons"] = "Addons Soportados"
L["SUPPORTEDADDONSDESC"] = "Addons soportados que pueden o son usados para rastrear el inventario"
L["This merchant sells reagents you need!"] = "¡Este mercader vende los reactivos que necesitas!"
L["Total Cost:"] = "Coste Total:"
L["Total spent"] = "Total gastado"
L["Trained"] = "Aprendido"
L["TRANSPARAENCYDESC"] = "Transparencia de la ventana principal de las Habilidades de Comercio"
L["Transparency"] = "Transparencia"
L["Unknown"] = "Desconocido"
--Translation missing 
L["Unlearned"] = "Unlearned"
--Translation missing 
L["USEALTCURRVENDITEMSDESC"] = "Vendor items bought with alternate currencies are considered vendor supplied."
--Translation missing 
L["USEALTCURRVENDITEMSNAME"] = "Use vendor items bought with alternate currencies"
--Translation missing 
L["USEBLIZZARDFORFOLLOWERSDESC"] = "Use the Blizzard UI for garrison follower tradeskills"
--Translation missing 
L["USEBLIZZARDFORFOLLOWERSNAME"] = "Use Blizzard UI for followers"
--Translation missing 
L["USEGUILDBANKASALTDESC"] = "Use the contents of the guildbank as if it was another alternate."
--Translation missing 
L["USEGUILDBANKASALTNAME"] = "Use guildbank as another alt"
--Translation missing 
L["Using Bank for"] = "Using Bank for"
--Translation missing 
L["Using Reagent Bank for"] = "Using Reagent Bank for"
L["VENDORAUTOBUYDESC"] = "Si tiene recetas en cola y habla con un vendedor que vende algo necesario para las recetas, se adquiere automáticamente."
L["VENDORAUTOBUYNAME"] = "Automáticamente comprar los reactivos"
L["VENDORBUYBUTTONDESC"] = "Muestra un botón cuando hable con los vendedores que le permitirá ver los reactivos necesarios para todas las recetas en cola."
L["VENDORBUYBUTTONNAME"] = "Mostrar botón comprar reactivos en proveedores"
L["View Crafters"] = "Ver artesanos"

