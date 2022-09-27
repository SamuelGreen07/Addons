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

local L = LibStub("AceLocale-3.0"):NewLocale("Skillet", "esMX")
if not L then return end

L[" days"] = " días"
L["About"] = "Acerca de"
L["ABOUTDESC"] = "Mostrar información acerca de Skillet"
L["Add Recipe to Ignored List"] = "Añadir receta a la lista ignorada"
L["Add to Ignore Materials"] = "Añadir a Materiales Ignorados"
L["alts"] = "alts"
L["Appearance"] = "Apariencia"
L["APPEARANCEDESC"] = "Opciones que controlan como Skillet es mostrado"
L["Auction"] = "Subasta"
L["Bank"] = "Banco"
L["bank"] = "banco"
L["Blizzard"] = "Blizzard"
L["Buy Reagents"] = "Comprar componentes"
L["buyable"] = "comprable"
L["Buyout"] = "Compra"
L["By Difficulty"] = "Por Dificultad"
L["By Item Level"] = "Por Nivel del Objeto"
L["By Level"] = "Por Nivel"
L["By Name"] = "Por Nombre"
L["By Quality"] = "Por Calidad"
L["By Skill Level"] = "Por Nivel de Habilidad"
L["can be created by crafting reagents"] = "se puede crear creando componentes"
L["can be created from reagents in your inventory"] = "se puede crear a partir de componentes en su inventario"
L["can be created from reagents on all characters"] = "se puede crear a partir de componentes en todos los personajes"
L["can be created from reagents on other characters"] = "se puede crear a partir de componentes en otros personajes"
L["can be created with reagents bought at vendor"] = "se puede crear con componentes comprados en el vendedor"
L["Changing profession to"] = "Cambiar de profesión a"
L["CLAMPTOSCREENDESC"] = "Sujeta a que los marcos permanezcan en la pantalla"
L["CLAMPTOSCREENNAME"] = "Sujeta los marcos a la pantalla"
L["Clear"] = "Limpiar"
L["Click"] = "Haz Clic"
L["click here to add a note"] = "Haz clic aquí para añadir una nota"
L["Click to toggle favorite"] = "Clic para alternar favorito"
L["Collapse all groups"] = "Colapsar todos los grupos"
L["Config"] = "Configuración"
L["CONFIGDESC"] = "Abrir una ventana de configuración para Skillet"
L["CONFIRMQUEUECLEARDESC"] = "Usa alt+clic izquierdo en vez de clic izquierdo para limpiar la cola"
L["CONFIRMQUEUECLEARNAME"] = "Usa alt+clic para limpiar la cola"
L["Conflict with the addon TradeSkillMaster"] = "Conflicto con el addon TradeSkillMaster"
L["Copy"] = "Copiar"
L["Could not find bag space for"] = "No es posible encontrar espacio en la bolsa para"
L["craftable"] = "Posible de fabricar"
L["CRAFTBUTTONSDESC"] = "Incluye botones de fabricación en el marco"
L["CRAFTBUTTONSNAME"] = "Incluir botones de fabricación"
L["Crafted By"] = "Creado por"
L["Create"] = "Crear"
L["Create All"] = "Crear todo"
L["Cut"] = "Cortar"
L["DBMarket"] = "DBMarket"
L["Delete"] = "Borrar"
L["DISPLAYITEMLEVELDESC"] = "Si el objeto a fabricar tiene un nivel de objeto, ese nivel se mostrará junto con la receta"
L["DISPLAYITEMLEVELNAME"] = "Mostrar nivel de objeto"
L["DISPLAYREQUIREDLEVELDESC"] = "Si el objeto a ser creado requiere un nivel mínimo para usarlo, ese nivel debe ser mostrado con la receta"
L["DISPLAYREQUIREDLEVELNAME"] = "Mostrar nivel requerido"
L["DISPLAYSHOPPINGLIST"] = "Mostrar lista de compras en:"
L["DISPLAYSHOPPINGLISTATAUCTIONDESC"] = "Muestra una lista de compras de los objetos que son necesarios para crear las recetas en la lista pero no están en tus bolsas"
L["DISPLAYSHOPPINGLISTATAUCTIONNAME"] = "Mostrar la lista de compras en las subastas"
L["DISPLAYSHOPPINGLISTATBANKDESC"] = "Muestra una lista de compras de los objetos necesarios para fabricar recetas en cola pero que no están en sus bolsas"
L["DISPLAYSHOPPINGLISTATBANKNAME"] = "Mostrar lista de compras en bancos"
L["DISPLAYSHOPPINGLISTATGUILDBANKDESC"] = "Muestra una lista de compras de los objetos necesarios para fabricar recetas en cola pero que no están en sus bolsas"
L["DISPLAYSHOPPINGLISTATGUILDBANKNAME"] = "Mostrar la lista de compras en los bancos de hermandad"
L["DISPLAYSHOPPINGLISTATMERCHANTDESC"] = "Muestra una lista de compras de los objetos necesarios para fabricar recetas en cola pero que no están en sus bolsas"
L["DISPLAYSHOPPINGLISTATMERCHANTNAME"] = "Mostrar lista de compras en vendedores"
L["Draenor Engineering"] = "Draenor Ingeniería"
L["Empty Group"] = "Grupo Vacío"
L["Enabled"] = "Activa"
L["Enchant"] = "Encantar"
--[[Translation missing --]]
L["ENCHANTSCROLLSDESC"] = "Use the enchant scroll item for links"
--[[Translation missing --]]
L["ENCHANTSCROLLSNAME"] = "Use enchant scrolls"
L["ENHANCHEDRECIPEDISPLAYDESC"] = "Cuando está habilitado, los nombres de las recetas tendrán uno o más caracteres '+' anexados a su nombre para indicar la dificultad de la receta."
L["ENHANCHEDRECIPEDISPLAYNAME"] = "Mostrar dificultad de la receta como texto"
L["Expand all groups"] = "Expandir todos los grupos"
L["Features"] = "Características"
L["FEATURESDESC"] = "Comportamiento opcional que se puede habilitar y deshabilitar"
L["Filter"] = "Filtro"
L["Filter recipes by source"] = "Filtrar recetas por fuente"
L["Flat"] = "Plano"
L["Flush All Data"] = "Limpiar todos los datos"
L["Flush Player Data"] = "Borrar datos de jugadores"
L["Flush Recipe Data"] = "Limpiar datos de recetas"
L["FLUSHALLDATADESC"] = "Limpiar todos los datos de Skillet"
L["FLUSHPLAYERDATADESC"] = "Borra los datos de este personaje"
L["FLUSHRECIPEDATADESC"] = "Limpiar todos los datos de recetas de Skillet"
L["From Selection"] = "Desde la selección"
L["Glyph "] = "Glifo"
L["Gold earned"] = "Oro ganado"
L["Grouping"] = "Grupo"
L["Guild bank"] = "Banco de hermandad"
L["has cooldown of"] = "Tiene tiempo de reutilización de"
L["have"] = "tiene"
L["Hide trivial"] = "Ocultar trivial"
L["Hide uncraftable"] = "Ocultar los que no son posible fabricar"
L["HIDEBLIZZARDFRAMEDESC"] = "Oculta el marco de Blizzard al mostrar el marco de Skillet"
L["HIDEBLIZZARDFRAMENAME"] = "Ocultar marco de Blizzard"
L["Ignore"] = "Ignorar"
L["IGNOREBANKEDREAGENTSDESC"] = "Ignora los componentes en el banco al poner en cola componentes fabricables"
L["IGNOREBANKEDREAGENTSNAME"] = "Ignora los componentes en el banco"
--[[Translation missing --]]
L["IGNORECHANGEDESC"] = "Ignore first profession change"
--[[Translation missing --]]
L["IGNORECHANGENAME"] = "Ignore first profession change"
L["IGNORECLEARDESC"] = "Borra todas las entradas de la lista de materiales ignorados."
L["Ignored List"] = "Ignorados"
L["Ignored Materials Clear"] = "Materiales ignorados borrados"
L["Ignored Materials List"] = "Lista de materiales ignorados"
L["IGNORELISTDESC"] = "Abra el marco de la lista materiales ignorados."
L["Illusions"] = "Ilusiones"
L["in your bank"] = "en tu banco"
L["in your inventory"] = "en tu inventario"
L["Include alts"] = "Incluir alts"
L["Include bank"] = "Incluir banco"
L["Include guild"] = "Incluir hermandad"
L["INCLUDEREAGENTSDESC"] = "Añade nombres de componentes al texto del objeto que se busca."
L["INCLUDEREAGENTSNAME"] = "Incluir componentes en la búsqueda"
L["INTERRUPTCLEARDESC"] = "Al mover, saltar, cerrar el marco o hacer clic en el botón Pausa borra la entrada de la cola en progreso"
L["INTERRUPTCLEARNAME"] = "La interrupción de hechizos borra la entrada de la cola"
L["inventory"] = "inventario"
L["Inventory"] = "Inventario"
L["INVENTORYDESC"] = "Información del Inventario"
L["InvSlot"] = "Casilla"
L["is now disabled"] = "está ahora desactivado"
L["is now enabled"] = "está ahora activado"
L["Learned"] = "Aprendido"
L["Left-Click to toggle"] = "Clic-Izquierdo para alternar"
L["Library"] = "Biblioteca"
L["Link Recipe"] = "Vincular receta"
L["LINKCRAFTABLEREAGENTSDESC"] = "Si puede crear un componente necesario para la receta actual, hacer clic en el componente lo llevará a su receta."
L["LINKCRAFTABLEREAGENTSNAME"] = "Hacer componentes cliqueables"
L["Load"] = "Cargar"
L["Lock/Unlock"] = "Bloquear/Desbloquear"
L["Market"] = "Mercado"
L["Merchant"] = "Mercader"
L["Merge items"] = "Unir objetos"
L["Move Down"] = "Mover Abajo"
L["Move to Bottom"] = "Mover al fondo"
L["Move to Top"] = "Mover a la cima"
L["Move Up"] = "Mover Arriba"
L["need"] = "necesita"
L["New"] = "Nuevo"
L["New Group"] = "Nuevo Grupo"
L["No Data"] = "Sin Información"
L["No headers, try again"] = "Sin encabezados, intente nuevamente"
L["No such queue saved"] = "No se ha guardado esa cola"
L["None"] = "Ninguno"
L["not yet cached"] = "aún no almacenado en caché"
L["Notes"] = "Notas"
L["Number of items to queue/create"] = "Número de objetos para poner en cola/crear"
L["Options"] = "Opciones"
L["Order by item"] = "Ordenar por objeto"
L["Paste"] = "Pegar"
L["Pause"] = "Pausar"
L["Plugins"] = "Plugins"
L["Press"] = "Presionar"
L["Press Okay to continue changing professions"] = "Presiona Aceptar para continuar cambiando profesiones"
L["Press Process to continue"] = "Presiona Procesar para continuar"
L["Process"] = "Procesar"
L["Purchased"] = "Comprado"
L["Queue"] = "Encolar"
L["Queue All"] = "Encolar todo"
L["Queue is empty"] = "La cola está vacía"
L["Queue is not empty. Overwrite?"] = "La cola no está vacía ¿Sobrescribir?"
L["Queue with this name already exsists. Overwrite?"] = "Ya existe una cola con este nombre ¿Sobrescribir?"
L["QUEUECRAFTABLEREAGENTSDESC"] = "Si puede crear un componente necesario para la receta actual y no tiene suficiente, entonces ese componente se añadirá a la cola"
L["QUEUECRAFTABLEREAGENTSNAME"] = "Encolar componentes fabricables"
L["QUEUECRAFTSDESC"] = "Permite que los encantamientos se pongan en cola, lo que agrega los componentes necesarios a la lista de compras. Los encantamientos no se pueden procesar de la cola y se eliminarán."
L["QUEUECRAFTSNAME"] = "Componentes de encantamiento en cola"
L["QUEUEGLYPHREAGENTSDESC"] = "Si puede crear un componente necesario para la receta actual y no tiene suficiente, entonces ese componente se añadirá a la cola. Esta opción es independiente solo para glifos."
L["QUEUEGLYPHREAGENTSNAME"] = "Componentes de cola para glifos"
L["QUEUEONLYVIEWDESC"] = "Muestra la ventana de cola independiente solo cuando se establece, mostrar tanto la ventana de cola independiente como la ventana de Skillet cuando está desactivada."
L["QUEUEONLYVIEWNAME"] = "Mostrar solo cola independiente"
L["Queues"] = "Cola"
L["reagent id seems corrupt!"] = "¡ID de componente parece corrupto!"
L["Reagents"] = "Componentes"
L["reagents in inventory"] = "componentes en inventario"
L["Really delete this queue?"] = "¿Realmente borrar esta cola?"
L["Remove Favorite"] = "Eliminar favorito"
L["Remove Recipe from Ignored List"] = "Eliminar receta de la lista ignorada"
L["Rename"] = "Renombrar"
L["Rename Group"] = "Renombrar grupo"
L["Request to queue %s items.\\n Are you sure?"] = "Solicitud para poner en cola %s objetos.\\n ¿Estás seguro?"
L["Rescan"] = "Escanear de nuevo"
L["Reset"] = "Restablecer"
L["Reset Recipe Filter"] = "Restablecer filtro de receta"
L["RESETDESC"] = "Restablecer posición de Skillet"
L["RESETRECIPEFILTERDESC"] = "Restablecer filtro de receta"
L["Retrieve"] = "Recuperar"
L["Right-Click for filtering options"] = "Clic-Derecho para opciones de filtración"
L["Same faction"] = "Misma facción"
L["Save"] = "Guardar"
L["Scale"] = "Escalar"
L["SCALEDESC"] = "Escala la ventana de profesión (por defecto 1.0)"
L["SCALETOOLTIPDESC"] = "Establezca la escala del tooltip de habilidades y componentes para que coincida con el tooltip de receta (escala global)."
L["SCALETOOLTIPNAME"] = "Escalar todos los tooltips"
L["Scan completed"] = "Escaneo completado"
L["Scanning tradeskill"] = "Escaneando profesión"
--[[Translation missing --]]
L["Scroll of"] = "Scroll of"
L["Search"] = "Buscar"
L["Select All"] = "Seleccionar todo"
L["Select None"] = "Deseleccionar"
L["Select skill difficulty threshold"] = "Seleccionar umbral de dificultad de habilidad"
L["Selected Addon"] = "Addon seleccionado"
L["Selection"] = "Selección"
L["Sells for "] = "Vendido por"
L["Set Favorite"] = "Fijar como favorito"
L["shift-click to link"] = "shift-clic para vincular"
L["Shopping Clear"] = "Compra estuvo borrada"
L["Shopping List"] = "Lista Compra"
L["SHOPPINGCLEARDESC"] = "Borrar la lista de compras"
L["SHOPPINGLISTDESC"] = "Mostrar la lista de compras"
L["Show favorite recipes only. Click on a star on the left side of a recipe to set favorite."] = "Mostrar solo las recetas favoritas. Haga clic en una estrella en el lado izquierdo de una receta para establecer el favorito."
L["SHOWBANKALTCOUNTSDESC"] = "Cuando calcule y muestre recuentos de objetos creables, incluya objetos de su banco y de sus otros personajes"
L["SHOWBANKALTCOUNTSNAME"] = "Incluir contenido de banco y personajes alternativos"
L["SHOWCRAFTCOUNTSDESC"] = "Muestra la cantidad de veces que puede fabricar una receta, no la cantidad total de objetos producibles"
L["SHOWCRAFTCOUNTSNAME"] = "Mostrar recuentos creables"
L["SHOWCRAFTERSTOOLTIPDESC"] = "Muestra los caracteres alternativos que pueden crear un objeto en el tooltip del objeto."
L["SHOWCRAFTERSTOOLTIPNAME"] = "Mostrar artesanos en tooltip"
L["SHOWDETAILEDRECIPETOOLTIPDESC"] = "Muestra un tooltip al pasar el cursor sobre las recetas en el panel izquierdo"
L["SHOWDETAILEDRECIPETOOLTIPNAME"] = "Mostrar tooltip para recetas"
L["SHOWFULLTOOLTIPDESC"] = "Muestra toda la información sobre un objeto que se va a confeccionar. Si lo desactiva, solo verá tooltips comprimidos (mantenga presionada la tecla Ctrl para mostrar el tooltip completo)"
L["SHOWFULLTOOLTIPNAME"] = "Utilizar tooltip estándar"
L["SHOWITEMNOTESTOOLTIPDESC"] = "Añade notas que proporciona para un objeto al tooltip para ese objeto"
L["SHOWITEMNOTESTOOLTIPNAME"] = "Añadir notas especificadas por el usuario al tooltip"
L["SHOWITEMTOOLTIPDESC"] = "Muestra tooltips de objetos que se puedan fabricar, en lugar de un tooltip de recetas."
L["SHOWITEMTOOLTIPNAME"] = "Mostrar tooltip del objeto cuando sea posible"
L["SHOWMAXUPGRADEDESC"] = "Cuando esté configurado, muestre las recetas actualizables como \"(actual/máximo)\". Cuando no está configurado, se muestra como \"(actual)\""
L["SHOWMAXUPGRADENAME"] = "Mostrar recetas actualizables como (actual/máxima)"
L["SHOWRECIPESOURCEFORLEARNEDDESC"] = "Muestra fuente de recetas para recetas aprendidas"
L["SHOWRECIPESOURCEFORLEARNEDNAME"] = "Mostrar fuente de recetas para recetas aprendidas"
L["Skillet Trade Skills"] = "Skillet-Clásico"
L["Skipping"] = "Saltando"
L["Sold amount"] = "Cantidad vendida"
L["SORTASC"] = "Ordenar la lista de recetas de la más alta (arriba) a la más baja (abajo)"
L["SORTDESC"] = "Ordena la lista de recetas de la más baja (arriba) a la más alta (abajo)"
L["Sorting"] = "Ordenando"
L["Source:"] = "Fuente:"
L["STANDBYDESC"] = "Activar/desactivar el modo de espera"
L["STANDBYNAME"] = "Espera"
L["Start"] = "Iniciar"
L["Stop"] = "Parar"
L["SubClass"] = "Subclase"
L["SUPPORTCRAFTINGDESC"] = "Incluye soporte para profesiones de fabricación (requiere una /reload)"
L["SUPPORTCRAFTINGNAME"] = "Apoyar fabricación"
L["Supported Addons"] = "Addons Soportados"
L["SUPPORTEDADDONSDESC"] = "Addons compatibles que pueden o están siendo utilizados para rastrear inventario"
L["This merchant sells reagents you need!"] = "¡Este vendedor vende los componentes que necesita!"
L["TOOLTIPSCALEDESC"] = "Escala la lista de recetas, detalle del objeto y el tooltip de componentes"
L["Total Cost:"] = "Costo total:"
L["Total spent"] = "Total gastado"
L["TRADEBUTTONSDESC"] = "Incluye botones de profesión en el marco"
L["TRADEBUTTONSNAME"] = "Incluir botones de profesión"
L["TradeSkillMaster must be in 'WOW UI' mode to use Skillet-Classic"] = "TradeSkillMaster debe estar en modo 'WOW UI' para usar Skillet-Classic"
L["Trained"] = "Entrenado"
L["TRANSPARAENCYDESC"] = "Transparencia de la ventana principal de la profesión."
L["Transparency"] = "Transparencia"
L["Unknown"] = "Desconocido"
L["Unlearned"] = "Sin aprender"
L["Use Action Bar button to change professions"] = "Usa el botón de la barra de acción para cambiar de profesión"
L["USEALTCURRVENDITEMSDESC"] = "Los objetos del vendedor comprados con monedas alternativas se consideran suministrados por el vendedor."
L["USEALTCURRVENDITEMSNAME"] = "Usar objetos de vendedores comprados con monedas alternativas"
--[[Translation missing --]]
L["USEBANKASALTDESC"] = "Use the contents of the bank as if it was another alternate."
--[[Translation missing --]]
L["USEBANKASALTNAME"] = "Use bank as another alt"
L["USEBLIZZARDFORFOLLOWERSDESC"] = "Usa la interfaz de usuario de Blizzard para las habilidades comerciales de los seguidores de la guarnición"
L["USEBLIZZARDFORFOLLOWERSNAME"] = "Usar la interfaz de usuario de Blizzard para los seguidores"
L["USEGUILDBANKASALTDESC"] = "Usa el contenido del banco de hermandad como si fuera otra alternativa."
L["USEGUILDBANKASALTNAME"] = "Usa banco de hermandad como otra alternativa"
L["Using Bank for"] = "Usando banco para"
L["Using Reagent Bank for"] = "Uso de banco de componentes para"
L["VENDORAUTOBUYDESC"] = "Si ha puesto en cola recetas y habla con un vendedor que vende algo necesario para esas recetas, se comprará automáticamente."
L["VENDORAUTOBUYNAME"] = "Comprar componentes automáticamente"
L["VENDORBUYBUTTONDESC"] = "Muestra un botón cuando hable con los vendedores que le permitirá comprar los componentes necesarios para todas las recetas en cola."
L["VENDORBUYBUTTONNAME"] = "Mostrar el botón de compra de componentes en los vendedores"
L["View Crafters"] = "Ver artesanos"

