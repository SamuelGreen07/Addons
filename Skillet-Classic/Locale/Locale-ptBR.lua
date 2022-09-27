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

local L = LibStub("AceLocale-3.0"):NewLocale("Skillet", "ptBR")
if not L then return end

L[" days"] = " dias"
L["About"] = "Sobre"
L["ABOUTDESC"] = "Sobre o Skillet"
L["Add Recipe to Ignored List"] = "Adicionar receita à lista ignorada"
L["Add to Ignore Materials"] = "Add aos Materiais Ignorados"
L["alts"] = "alts"
L["Appearance"] = "Aparência"
L["APPEARANCEDESC"] = "Opções de visualização do Skillet"
L["Auction"] = "Leilão"
L["Bank"] = "Banco"
L["bank"] = "banco"
L["Blizzard"] = "Blizzard"
L["Buy Reagents"] = "Comprar Reagentes"
L["buyable"] = "comprável"
L["Buyout"] = "Comprar"
L["By Difficulty"] = "Por Dificuldade"
L["By Item Level"] = "Por Nível do Iten"
L["By Level"] = "Por Nível"
L["By Name"] = "Por Nome"
L["By Quality"] = "Por Qualidade"
L["By Skill Level"] = "Por Habilidade"
L["can be created by crafting reagents"] = "pode ser criado por elaboração de reagentes"
L["can be created from reagents in your inventory"] = "pode ser criado a partir de reagentes em seu inventário"
L["can be created from reagents on all characters"] = "pode ser criado a partir de reagentes em todos os personagens"
L["can be created from reagents on other characters"] = "Pode ser criado com reagentes de todos seus personagens"
L["can be created with reagents bought at vendor"] = "pode ser criado com reagentes comprados no vendedor"
L["Changing profession to"] = "Mudando de profissão para"
L["CLAMPTOSCREENDESC"] = "Forçar quadros a permanecerem na tela"
L["CLAMPTOSCREENNAME"] = "Fixe os quadros na tela"
L["Clear"] = "Limpar"
L["Click"] = "Clique"
L["click here to add a note"] = "clique aqui para adicionar uma nota"
L["Click to toggle favorite"] = "Clique para alternar o favorito"
L["Collapse all groups"] = "Contrair todos os grupos"
L["Config"] = "Configuração"
L["CONFIGDESC"] = "Abre a tela de configuração do Skillet"
L["CONFIRMQUEUECLEARDESC"] = "Use Alt-clique esquerdo em vez de clicar com o botão esquerdo para limpar a fila"
L["CONFIRMQUEUECLEARNAME"] = "Use Alt-click to clear queue"
L["Conflict with the addon TradeSkillMaster"] = "Conflito com o addon TradeSkillMaster"
L["Copy"] = "Copiar"
L["Could not find bag space for"] = "Não há espaço na mochila"
L["craftable"] = "Produzivel"
L["CRAFTBUTTONSDESC"] = "Incluir botões de artesanato no quadro"
L["CRAFTBUTTONSNAME"] = "Incluir botões de artesanato"
L["Crafted By"] = "Feito Por"
L["Create"] = "Criar"
L["Create All"] = "Criar Todos"
L["Cut"] = "Cortar"
L["DBMarket"] = "DBMarket"
L["Delete"] = "Apagar"
L["DISPLAYITEMLEVELDESC"] = [=[Se o iten a ser criado tiver um nível de item, esse nível será exibido junto com a receita
]=]
L["DISPLAYITEMLEVELNAME"] = "Exibir nível do iten"
L["DISPLAYREQUIREDLEVELDESC"] = "Se o item requer um nível minimo para ser usado, este nível será mostrado com a receita"
L["DISPLAYREQUIREDLEVELNAME"] = "Mostrar nivel necessario"
L["DISPLAYSHOPPINGLIST"] = "Exibir lista de compras em:"
L["DISPLAYSHOPPINGLISTATAUCTIONDESC"] = "Mostrar uma lista de compras de itens necessarios para fabricação das receitas que estão na lista mas não estão na sua bolsa"
L["DISPLAYSHOPPINGLISTATAUCTIONNAME"] = "Mostra a lista de compras no leilão"
L["DISPLAYSHOPPINGLISTATBANKDESC"] = "Mostrar uma lista de compras de itens necessarios para fabricação das receitas que estão na lista mas não estão na sua bolsa"
L["DISPLAYSHOPPINGLISTATBANKNAME"] = "Mostrar lista de itens no banco"
L["DISPLAYSHOPPINGLISTATGUILDBANKDESC"] = "Mostrar uma lista de compras de itens necessarios para fabricação das receitas que estão na lista mas não estão na sua bolsa"
L["DISPLAYSHOPPINGLISTATGUILDBANKNAME"] = "Mostrar lista e itens no banco do clã"
L["DISPLAYSHOPPINGLISTATMERCHANTDESC"] = "Mostrar uma lista de compras de itens necessarios para fabricação das receitas que estão na lista mas não estão na sua bolsa"
L["DISPLAYSHOPPINGLISTATMERCHANTNAME"] = "Mostrar lista de compras nos vendedores"
L["Draenor Engineering"] = "Engenharia Draenor"
L["Empty Group"] = "Grupo vazio"
L["Enabled"] = "Hablitado"
L["Enchant"] = "Encantamento"
--[[Translation missing --]]
L["ENCHANTSCROLLSDESC"] = "Use the enchant scroll item for links"
--[[Translation missing --]]
L["ENCHANTSCROLLSNAME"] = "Use enchant scrolls"
L["ENHANCHEDRECIPEDISPLAYDESC"] = "Quando habilitado, aparecera um ou mais caractere '+' ao lado da receita pra indicar a dificuldade"
L["ENHANCHEDRECIPEDISPLAYNAME"] = "Mostrar dificuldade da receita como um texto"
L["Expand all groups"] = "Expandir todos os grupos"
L["Features"] = "Caracteristicas"
L["FEATURESDESC"] = "Habilita ou deshabilita Caracteristicas extras"
L["Filter"] = "Filtro"
L["Filter recipes by source"] = "Filtrar receitas por fonte "
L["Flat"] = "Plano"
L["Flush All Data"] = "Baixar dados"
L["Flush Player Data"] = "Excluir dados do jogador"
L["Flush Recipe Data"] = "Baixar Dados"
L["FLUSHALLDATADESC"] = "Baixar todos os dados do Skillet"
L["FLUSHPLAYERDATADESC"] = "Exclui os dados deste personagem"
L["FLUSHRECIPEDATADESC"] = "Baixar dados de receitas do Skillet"
L["From Selection"] = "Da seleção"
L["Glyph "] = "Glifos"
L["Gold earned"] = "Ouro ganho"
L["Grouping"] = "Agrupando"
L["Guild bank"] = "Banco da guilda"
L["has cooldown of"] = "tem espera de "
L["have"] = "possui"
L["Hide trivial"] = "Esconder triviais"
L["Hide uncraftable"] = "Esconde não produziveis"
L["HIDEBLIZZARDFRAMEDESC"] = "Ocultar o quadro da profissão Blizzard ao exibir o quadro Skillet"
L["HIDEBLIZZARDFRAMENAME"] = "Ocultar quadro da Blizzard"
L["Ignore"] = "Ignorar"
L["IGNOREBANKEDREAGENTSDESC"] = "Ignore reagentes no banco ao enfileirar reagentes fabricáveis"
L["IGNOREBANKEDREAGENTSNAME"] = "Ignore reagentes no banco"
--[[Translation missing --]]
L["IGNORECHANGEDESC"] = "Ignore first profession change"
--[[Translation missing --]]
L["IGNORECHANGENAME"] = "Ignore first profession change"
L["IGNORECLEARDESC"] = "Limpa todas as entradas na lista de Materiais Ignorados"
L["Ignored List"] = "Lista de ignorados"
L["Ignored Materials Clear"] = "Limpar Materiais Ignorados"
L["Ignored Materials List"] = "Materiais Ignorados"
L["IGNORELISTDESC"] = "Abrir a lista de materiais ignorados"
L["Illusions"] = "Ilusões"
L["in your bank"] = "no seu banco"
L["in your inventory"] = "no seu inventário"
L["Include alts"] = "Incluir alts"
L["Include bank"] = "Incluir banco"
L["Include guild"] = "Incluir guilda"
L["INCLUDEREAGENTSDESC"] = "Adicione nomes de reagentes ao texto do iten pesquisado."
L["INCLUDEREAGENTSNAME"] = "Incluir reagentes na pesquisa"
L["INTERRUPTCLEARDESC"] = "Mover, pular, fechar o quadro ou clicar no botão Pausar limpa a entrada da fila em andamento"
L["INTERRUPTCLEARNAME"] = "A interrupção de feitiço limpa a entrada da fila"
L["inventory"] = "inventário"
L["Inventory"] = "Inventorio"
L["INVENTORYDESC"] = "Informações o inventario"
L["InvSlot"] = "InvSlot"
L["is now disabled"] = "esta desabilitado"
L["is now enabled"] = "esta habilitado"
L["Learned"] = "Aprendido"
L["Left-Click to toggle"] = "Clique com o botão esquerdo para alternar"
L["Library"] = "Biblioteca"
L["Link Recipe"] = "Linkar receita"
L["LINKCRAFTABLEREAGENTSDESC"] = "Torna os reagentes clicaveis"
L["LINKCRAFTABLEREAGENTSNAME"] = "Fazer reagentes ser clicavel"
L["Load"] = "Carregar"
L["Lock/Unlock"] = "Bloquear/Desbloquear"
L["Market"] = "Mercado"
L["Merchant"] = "Comerciante"
L["Merge items"] = "Unir itens"
L["Move Down"] = "Mover abaixo"
L["Move to Bottom"] = "Mover para o final"
L["Move to Top"] = "Mover para o topo"
L["Move Up"] = "Mover acima"
L["need"] = "necessário"
L["New"] = "Novo"
L["New Group"] = "Novo Grupo"
L["No Data"] = "Sem informação"
L["No headers, try again"] = "Sem cabeçalhos, tente novamente"
L["No such queue saved"] = "Nenhuma fila salva"
L["None"] = "Nenhum"
L["not yet cached"] = "ainda não armazenados em cache"
L["Notes"] = "Notas"
L["Number of items to queue/create"] = "Número de itens para fila/criar"
L["Options"] = "Opções"
L["Order by item"] = "Organizar pelo iten"
L["Paste"] = "Colar"
L["Pause"] = "Pausa"
L["Plugins"] = "Plugins"
L["Press"] = "Pressione"
L["Press Okay to continue changing professions"] = "Pressione Ok para continuar mudando de profissão"
L["Press Process to continue"] = "Pressione Processar para continuar"
L["Process"] = "Processar"
L["Purchased"] = "Comprados"
L["Queue"] = "Fila"
L["Queue All"] = "Todos na Fila"
L["Queue is empty"] = "A fila está vazia"
L["Queue is not empty. Overwrite?"] = "A fila não está vazia. Sobrescrever?"
L["Queue with this name already exsists. Overwrite?"] = "Fila com este nome ja existe, sobreescrever?"
L["QUEUECRAFTABLEREAGENTSDESC"] = "Se você pode criar um item necessario para receita, e você não tem, então o reagente sera colocado na fila"
L["QUEUECRAFTABLEREAGENTSNAME"] = "Colocar na fila reagentes fabricaveis"
L["QUEUECRAFTSDESC"] = "Permite que os encantamentos sejam enfileirados, o que adiciona os reagentes necessários à lista de compras. Os encantamentos não podem ser processados ​​da fila e serão removidos."
L["QUEUECRAFTSNAME"] = "Reagentes de encantamento no fila"
L["QUEUEGLYPHREAGENTSDESC"] = "Se você pode criar um item necessario para receita, e você não tem, então o reagente sera colocado na fila"
L["QUEUEGLYPHREAGENTSNAME"] = "Colocar na fila reagente para Glifos"
L["QUEUEONLYVIEWDESC"] = "Mostrar janela da fila autônoma apenas quando definido, mostra a janela da fila autônoma e a janela do Skillet quando desmarcada."
L["QUEUEONLYVIEWNAME"] = "Mostrar apenas fila independente"
L["Queues"] = "Filas"
L["reagent id seems corrupt!"] = "A identificação do reagente parece corrompida!"
L["Reagents"] = "Reagentes"
L["reagents in inventory"] = "Reagentes no inventario"
L["Really delete this queue?"] = "Você realmente quer apagar esta fila?"
L["Remove Favorite"] = "Remover Favorito"
L["Remove Recipe from Ignored List"] = "Remover receita da lista ignorada"
L["Rename"] = "Renomear"
L["Rename Group"] = "Renomear Grupo"
L["Request to queue %s items.\\n Are you sure?"] = "Pedido para enfileirar itens %s.\\n Tem certeza?"
L["Rescan"] = "Rescanear"
L["Reset"] = "Redefinir"
L["Reset Recipe Filter"] = "Limpar o filtro"
L["RESETDESC"] = "Redefinir posição do Skillet"
L["RESETRECIPEFILTERDESC"] = "Limpar o filtro"
L["Retrieve"] = "Recuperar"
L["Right-Click for filtering options"] = "Clique com o botão direito para opções de filtragem "
L["Same faction"] = "Mesma facção"
L["Save"] = "Salvar"
L["Scale"] = "Escala"
L["SCALEDESC"] = "Escala da janela principal"
L["SCALETOOLTIPDESC"] = "Defina a escala das dicas de habilidade e reagente para corresponder à dica da receita (escala global da interface do usuário)."
L["SCALETOOLTIPNAME"] = "Escalar todas as dicas"
L["Scan completed"] = "Verificação concluida"
L["Scanning tradeskill"] = "Verificando as receitas"
--[[Translation missing --]]
L["Scroll of"] = "Scroll of"
L["Search"] = "Procurar"
L["Select All"] = "Selecionar todos"
L["Select None"] = "Limpar seleção"
L["Select skill difficulty threshold"] = "Selecione o limite de dificuldade da habilidade"
L["Selected Addon"] = "Addon Selecionado"
L["Selection"] = "Seleção"
L["Sells for "] = "Vender por"
L["Set Favorite"] = "Definir favorito"
L["shift-click to link"] = "clique com a tecla Shift pressionada para vincular"
L["Shopping Clear"] = "Limpar lista"
L["Shopping List"] = "Lista de Compras"
L["SHOPPINGCLEARDESC"] = "Limpar a lista de compras"
L["SHOPPINGLISTDESC"] = "Mostra a lista de compras"
L["Show favorite recipes only. Click on a star on the left side of a recipe to set favorite."] = "Mostrar receitas favoritas apenas. Clique em uma estrela no lado esquerdo de uma receita para definir favorito."
L["SHOWBANKALTCOUNTSDESC"] = "Quando calcular os itens possiveis de fabricação usa os itens do banco de de personagens alternativos"
L["SHOWBANKALTCOUNTSNAME"] = "Incluir itens no banco e em personagens alternativos"
L["SHOWCRAFTCOUNTSDESC"] = "Mostra o numero possivel de itens para fabricação, não o total de itens produzidos"
L["SHOWCRAFTCOUNTSNAME"] = "Mostrar a contagem de itens fabricaveis"
L["SHOWCRAFTERSTOOLTIPDESC"] = "Mostrar o nome do personagem alternativo que pode criar este item nas informações do item."
L["SHOWCRAFTERSTOOLTIPNAME"] = "Mostrar criador nas informações"
L["SHOWDETAILEDRECIPETOOLTIPDESC"] = "Mostrar toda a informação do item a ser criado. Se você desligar vera apenas uma informação parcial(Segure ctrl para a descrição completa)"
L["SHOWDETAILEDRECIPETOOLTIPNAME"] = "Mostrar dicas para as receitas"
L["SHOWFULLTOOLTIPDESC"] = "Mostrar toda a informação de um item a ser fabricado. Se você desligar, apenas vera uma pequena informação (Segure Ctrl para uma descrição completa)"
L["SHOWFULLTOOLTIPNAME"] = "Usar caixa de informação padrão"
L["SHOWITEMNOTESTOOLTIPDESC"] = "Adiciona as notas que você forneceu para um iten nas informações desse iten"
L["SHOWITEMNOTESTOOLTIPNAME"] = "Adicionar notas do usuários as informações do iten"
L["SHOWITEMTOOLTIPDESC"] = "Mostrar informações do iten a ser fabricado, em vez das informações da receita."
L["SHOWITEMTOOLTIPNAME"] = "Mostra informações quando possível"
L["SHOWMAXUPGRADEDESC"] = "Quando definido, mostre receitas atualizáveis ​​como \"(atual/máximo)\". Quando não estiver definido, mostre como \"(atual)\""
L["SHOWMAXUPGRADENAME"] = "Mostrar receitas atualizáveis ​​como (atual/máx.)"
L["SHOWRECIPESOURCEFORLEARNEDDESC"] = "Mostrar fonte da receita para receitas aprendidas"
L["SHOWRECIPESOURCEFORLEARNEDNAME"] = "Mostrar fonte da receita para receitas aprendidas"
L["Skillet Trade Skills"] = "Skillet-Clássico"
L["Skipping"] = "Pulando"
L["Sold amount"] = "Total vendido"
L["SORTASC"] = "Organiza a lista do maior (topo) para o menor (abaixo)"
L["SORTDESC"] = "Organiza a lista do menor (topo) para o maior (abaixo)"
L["Sorting"] = "Ordenando"
L["Source:"] = "Origem:"
L["STANDBYDESC"] = "Habilita e desabilita o modo de espera"
L["STANDBYNAME"] = "Aguardar"
L["Start"] = "Iniciar"
L["Stop"] = "Pare"
L["SubClass"] = "Subclasse"
L["SUPPORTCRAFTINGDESC"] = "Incluir suporte para profissões de artesanato (requer um /reload)"
L["SUPPORTCRAFTINGNAME"] = "Suporte de Artesanato"
L["Supported Addons"] = "Addons Suportados"
L["SUPPORTEDADDONSDESC"] = "Addons suportados que são usados para escanear seu inventario"
L["This merchant sells reagents you need!"] = "Este vendedor tem itens que você precisa!"
L["TOOLTIPSCALEDESC"] = "Escala a lista de receitas, detalhes do iten e dicas de reagentes"
L["Total Cost:"] = "Custo Total:"
L["Total spent"] = "Total gasto"
L["TRADEBUTTONSDESC"] = "Incluir botões de profissão no quadro"
L["TRADEBUTTONSNAME"] = "Incluir botões de profissão"
L["TradeSkillMaster must be in 'WOW UI' mode to use Skillet-Classic"] = "TradeSkillMaster deve estar no modo 'WOW UI' para usar o Skillet-Classic"
L["Trained"] = "Aprendida"
L["TRANSPARAENCYDESC"] = "Transparência da janela principal"
L["Transparency"] = "Transparência"
L["Unknown"] = "Desconhecido"
L["Unlearned"] = "Desaprender"
L["Use Action Bar button to change professions"] = "Use o botão Action Bar para mudar de profissão"
L["USEALTCURRVENDITEMSDESC"] = "Os itens do vendedor comprados com moedas alternativas são considerados fornecidos pelo vendedor."
L["USEALTCURRVENDITEMSNAME"] = "Use itens de vendedores comprados com moedas alternativas"
--[[Translation missing --]]
L["USEBANKASALTDESC"] = "Use the contents of the bank as if it was another alternate."
--[[Translation missing --]]
L["USEBANKASALTNAME"] = "Use bank as another alt"
L["USEBLIZZARDFORFOLLOWERSDESC"] = "Usar Interface da Blizzard para seguidores garrison"
L["USEBLIZZARDFORFOLLOWERSNAME"] = "Usar Interface da Blizzard para seguidores"
L["USEGUILDBANKASALTDESC"] = "Usar o conteúdo do banco da guilda como se fosse outro alternativo."
L["USEGUILDBANKASALTNAME"] = "Usar o banco da guilda"
L["Using Bank for"] = "Usando banco por"
L["Using Reagent Bank for"] = "Usando Reagente do banco"
L["VENDORAUTOBUYDESC"] = "Se você tiver receitas na fila e falar com um vendedor que tenha algo para aquelas receitas, isto será comprado automaticamente."
L["VENDORAUTOBUYNAME"] = "Comprar reagentes automaticamente"
L["VENDORBUYBUTTONDESC"] = "Mostra o botão de compra de reagentes nos vendedores"
L["VENDORBUYBUTTONNAME"] = "Mostrar botão de compra nos vendedores"
L["View Crafters"] = "Ver artesões"

