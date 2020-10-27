-- Locale
local AceLocale = LibStub:GetLibrary("AceLocale-3.0");
local AL = AceLocale:NewLocale("RareScanner", "ptBR", false);

if AL then
	AL["ALARM_MESSAGE"] = "Um PNJ raro acaba de aparecer. Olhe seu mapa!"
	AL["ALARM_SOUND"] = "Som de alerta para PNJs raros"
	AL["ALARM_SOUND_DESC"] = "Som produzido quando se detecta um PNJ raro na proximidade"
	AL["ALARM_TREASURES_SOUND"] = "Som de alerta para eventos/tesouros"
	AL["ALARM_TREASURES_SOUND_DESC"] = "Som produzido quando se detecta um tesouro/baú ou evento no seu minimapa"
	AL["AUTO_HIDE_BUTTON"] = "Esconder botão e miniatura automaticamente"
	AL["AUTO_HIDE_BUTTON_DESC"] = "Esconder botão e miniatura automaticamente, depois de passado o tempo selecionado (em segundos). Se marcar zero segundos, estes não se esconderão automaticamente"
	AL["CLASS_HALLS"] = "Salões de Ordem"
	AL["CLEAR_FILTERS_SEARCH"] = "Limpar"
	AL["CLEAR_FILTERS_SEARCH_DESC"] = "Retorna a forma a seu estado original"
	AL["CLICK_TARGET"] = "Clique para selecionar o PNJ"
	AL["CMD_HELP1"] = "Lista de comandos"
	AL["CONTAINER"] = "Recipiente"
	AL["DATABASE_HARD_RESET"] = "Com a mais recente expansão e com a última versão do RareScanner, grandes mudanças ocorreram na base de dados. Esta foi reiniciada para evitar inconsistências. Pedimos desculpa pelo incómodo."
	AL["DISABLE_SEARCHING_RARE_TOOLTIP"] = "Desativa alertas para este PNJ raro"
	AL["DISABLE_SOUND"] = "Desativa alertas de som"
	AL["DISABLE_SOUND_DESC"] = "Quando esteja activo, não serão produzidos sons de alerta"
	AL["DISABLED_SEARCHING_RARE"] = "Desativados os alertas para este PNJ raro:"
	AL["DISPLAY"] = "Mostrar"
	AL["DISPLAY_BUTTON"] = "Mostrar botão e miniatura"
	AL["DISPLAY_BUTTON_CONTAINERS"] = "Alterna mostrando o botão para tesouro/baú"
	AL["DISPLAY_BUTTON_CONTAINERS_DESC"] = "Alterna mostrando o botão de tesouro/baú. Não afeta o som de alarme nem os alertas de chat"
	AL["DISPLAY_BUTTON_DESC"] = "Quando desativado, deixa de mostrar o botão e a miniatura. Não afeta o som de alarme nem as mensagens de chat"
	AL["DISPLAY_LOOT_ON_MAP"] = "Mostra o loot nas dicas de contexto (tooltips) do mapa"
	AL["DISPLAY_LOOT_ON_MAP_DESC"] = "Alterna mostrando o loot de PNJ/recipientes nas dicas de contexto (tooltips) que aparecem quando você move o mouse sobre os ícones"
	AL["DISPLAY_LOOT_PANEL"] = "Mostrar barra de saque (loot)"
	AL["DISPLAY_LOOT_PANEL_DESC"] = "Quando ativado, mostrará uma barra com o saque (loot) soltado pelo PNJ encontrado"
	AL["DISPLAY_MAP_NOT_DISCOVERED_ICONS"] = "Mostrar ícones não descobertos no mapa. "
	AL["DISPLAY_MAP_NOT_DISCOVERED_ICONS_DESC"] = "Quando desativado, os ícones de PNJs raros não descobertos (os ícones vermelhos e laranja), recipientes ou eventos não aparecerão no mapa mundo"
	AL["DISPLAY_MAP_OLD_NOT_DISCOVERED_ICONS"] = "Mostra, no mapa, ícones não descobertos de expansões antigas. "
	AL["DISPLAY_MAP_OLD_NOT_DISCOVERED_ICONS_DESC"] = "Quando desativado, os ícones de PNJs raros não descobertos (os ícones vermelhos e laranja), recipientes ou eventos não aparecerão no mapa mundo em áreas que pertençam a expansões antigas. "
	AL["DISPLAY_MINIATURE"] = "Mostrar a miniatura"
	AL["DISPLAY_MINIATURE_DESC"] = "Quando desativado, a miniatura não aparecerá novamente. "
	AL["DISPLAY_OPTIONS"] = "Mostrar opções"
	AL["DUNGEONS_SCENARIOS"] = "Masmorras/Cenários"
	AL["ENABLE_MARKER"] = "Alternar o marcador de destino"
	AL["ENABLE_SCAN_CONTAINERS"] = "Ativa a busca de tesouros ou baús"
	AL["ENABLE_SCAN_CONTAINERS_DESC"] = "Quando ativado, aparecerá um aviso visual e sonoro cada vez que um tesouro ou baú apareça no seu minimapa."
	AL["ENABLE_SCAN_EVENTS"] = "Ativar a busca de eventos"
	AL["ENABLE_SCAN_EVENTS_DESC"] = "Quando ativado, aparecerá um aviso visual e sonoro cada vez que um evento apareça no seu minimapa "
	AL["ENABLE_SCAN_GARRISON_CHEST"] = "Ativa a busca de tesouros de sua guarnição"
	AL["ENABLE_SCAN_GARRISON_CHEST_DESC"] = "Quando ativado, será avisado com som e visualmente cada vez que um cofre de sua guarnição apareça no minimapa."
	AL["ENABLE_SCAN_IN_INSTANCE"] = "Ativar escaneio em instâncias"
	AL["ENABLE_SCAN_IN_INSTANCE_DESC"] = "Quando ativado, o addon funcionará como de costume enquanto estiver numa instância (masmorra, raide, etc)"
	AL["ENABLE_SCAN_RARES"] = "Ativa a busca de PNJs raros"
	AL["ENABLE_SCAN_RARES_DESC"] = "Quando ativado, aparecerá um aviso visual e sonoro cada vez que um NPC raro apareça no minimapa"
	AL["ENABLE_SEARCHING_RARE_TOOLTIP"] = "Habilita alertas de busca para este PNJ raro"
	AL["ENABLED_SEARCHING_RARE"] = "Habilitou a busca deste PNJ raro: "
	AL["EVENT"] = "Evento"
	AL["EXPEDITION_ISLANDS"] = "Ilhas de expedições"
	AL["FILTER"] = "Filtros de PNJ"
	AL["FILTER_CONTINENT"] = "Continente/Categoria"
	AL["FILTER_CONTINENT_DESC"] = "Nome de continente ou categoria"
	AL["FILTER_RARE_LIST"] = "Filtros de busca para PNJs raros"
	AL["FILTER_RARE_LIST_DESC"] = "Ativar a busca deste PNJ raro. Quando desativado, não será avisado ao encontrar este PNJ. "
	AL["FILTER_ZONE"] = "Zona"
	AL["FILTER_ZONE_DESC"] = "Zona dentro do continente ou categoria "
	AL["FILTER_ZONES_LIST"] = "Lista de zonas"
	AL["FILTER_ZONES_LIST_DESC"] = "Ativa alertas para esta zona. Quando desativado, não será avisado ao encontrar um tesouro, evento ou PNJ raro nesta zona."
	AL["FILTERS"] = "Filtro para PNJs raros"
	AL["FILTERS_SEARCH"] = "Buscar"
	AL["FILTERS_SEARCH_DESC"] = "Escreva o nome do PNJ para filtrar na lista de baixo"
	AL["GENERAL_OPTIONS"] = "Opções gerais"
	AL["JUST_SPAWNED"] = "%s acabou de aparecer. Olhe seu mapa!"
	AL["LEFT_BUTTON"] = "Botão esquerdo"
	AL["LOOT_CATEGORY_FILTERED"] = "Filtro ativo para a categoria/subcategoria: %s/%s. Você pode desativar este filtro clicando novamente no ícone de loot (saque) ou através do menu do addon RareScanner"
	AL["LOOT_CATEGORY_FILTERS"] = "Filtros de Categoria"
	AL["LOOT_CATEGORY_FILTERS_DESC"] = "Filtra o saque (loot) mostrado pela categoria"
	AL["LOOT_CATEGORY_NOT_FILTERED"] = "Filtro desativado para a categoria/subcategoria: %s/%s"
	AL["LOOT_DISPLAY_OPTIONS"] = "Mostrar opções"
	AL["LOOT_DISPLAY_OPTIONS_DESC"] = "Mostrar opções para a barra de loot"
	AL["LOOT_FILTER_COLLECTED"] = "Filtrar pets coleccionadas, montarias e brinquedos. "
	AL["LOOT_FILTER_COLLECTED_DESC"] = "Quando ativado, apenas montarias, mascotes e brinquedos que ainda não tenha colecionado serão mostrados na barra de loot (saque). Este filtro não afeta outros tipos de itens looteáveis (saqueáveis). "
	AL["LOOT_FILTER_NOT_EQUIPABLE"] = "Filtrar itens não-equipáveis"
	AL["LOOT_FILTER_NOT_EQUIPABLE_DESC"] = "Quando desativado, armas e armaduras que seu personagem não possa usar não aparecerão na barra de loot (saque). Este filtro não afeta outros tipos de itens looteáveis (saqueáveis). "
	AL["LOOT_FILTER_NOT_TRANSMOG"] = "Mostrar apenas armadura e armas de transmog"
	AL["LOOT_FILTER_NOT_TRANSMOG_DESC"] = "Quando ativado, apenas armas e armaduras que ainda não tenha colecionado serão mostrados na barra de loot (saque). Este filtro não afeta outros tipos de itens looteáveis (saqueáveis). "
	AL["LOOT_FILTER_SUBCATEGORY_DESC"] = "Mostra este tipo de loot na barra de loot (saque). Quando desativado, você não verá nenhum item que corresponda a essa categoria no loot mostrado quando você encontrar um PNJ raro."
	AL["LOOT_FILTER_SUBCATEGORY_LIST"] = "Subcategorias"
	AL["LOOT_ITEMS_PER_ROW"] = "Números de itens mostrados, por barra"
	AL["LOOT_ITEMS_PER_ROW_DESC"] = "Define o número de itens a serem exibidos, por linha, na barra de loot (saque). Se o número for menor que o máximo, várias linhas serão exibidas."
	AL["LOOT_MAIN_CATEGORY"] = "Categoria principal"
	AL["LOOT_MAX_ITEMS"] = "Número de itens mostrados"
	AL["LOOT_MAX_ITEMS_DESC"] = "Determina o número máximo de itens mostrados na barra de loot. "
	AL["LOOT_MIN_QUALITY"] = "Qualidade mínima do saque"
	AL["LOOT_MIN_QUALITY_DESC"] = "Define a qualidade mínima do saque mostrado no painel de saque"
	AL["LOOT_OPTIONS"] = "Opções de loot "
	AL["LOOT_OTHER_FILTERS"] = "Outros filtros"
	AL["LOOT_OTHER_FILTERS_DESC"] = "Outros filtros"
	AL["LOOT_PANEL_OPTIONS"] = "Opções painel de saque (loot)"
	AL["LOOT_SUBCATEGORY_FILTERS"] = "Filtros de subcategorias "
	AL["LOOT_TOGGLE_FILTER"] = "Clique para ativar filtro"
	AL["LOOT_TOOLTIP_POSITION"] = "Posição do tooltip (dica de contexto) do saque (loot)"
	AL["LOOT_TOOLTIP_POSITION_DESC"] = "Define a posição na qual se mostra o tooltip (dica de contexto/janela flutuante) com a descrição do saque ao passar o mouse por cima dos ícones, em relação ao botão"
	AL["MAIN_BUTTON_OPTIONS"] = "Opções do botão principal"
	AL["MAP_MENU_SHOW_NOT_DISCOVERED"] = "Entidades não descobertas"
	AL["MAP_MENU_SHOW_NOT_DISCOVERED_OLD"] = "Entidades não descobertas (expansões antigas)"
	AL["MAP_NEVER"] = "Nunca"
	AL["MAP_OPTIONS"] = "Opções de mapa"
	AL["MAP_SHOW_ICON_AFTER_COLLECTED"] = "Continua mostrando ícones de contêiner após looteados (saqueados)"
	AL["MAP_SHOW_ICON_AFTER_COLLECTED_DESC"] = "Quando desativado, o ícone desaparecerá depois de lootear (saquear) o contêiner.  "
	AL["MAP_SHOW_ICON_AFTER_DEAD"] = "Continuar mostrando ícones de PNJ depois da morte"
	AL["MAP_SHOW_ICON_AFTER_DEAD_DESC"] = "Quando desativado, o ícone desaparecerá depois de matar o PNJ. O ícone reaparecerá assim que encontre o PNJ novamente. Esta opção apenas funcionará com PNJs que continuem sendo raros  mesmo depois de mortos. "
	AL["MAP_SHOW_ICON_CONTAINER_MAX_SEEN_TIME"] = "Temporizador para ocultar ícones de contêiner (em minutos)"
	AL["MAP_SHOW_ICON_CONTAINER_MAX_SEEN_TIME_DESC"] = "Determina o número máximo de minutos desde que viu por última vez o recipiente. Depois disso, o ícone não aparecerá no mapa mundo até que encontre esse mesmo recipiente outra vez. Se selecionar zero minutos, os ícones aparecerão independentemente de quanto tempo tenha passado desde que você viu esse recipiente. Este filtro não afeta recipientes que sejam parte de uma Conquista."
	AL["MAP_SHOW_ICON_MAX_SEEN_TIME"] = "Temporizador para esconder ícones de PNJ raros (em horas) "
	AL["MAP_SHOW_ICON_MAX_SEEN_TIME_DESC"] = "Determina o número máximo de horas desde que viu por última vez o PNJ. Depois desse tempo, o ícone não aparecerá no mapa mundo até que encontre esse mesmo PNJ outra vez. Se selecionar zero horas, os ícones aparecerão independentemente de quanto tempo tenha passado desde que você viu esse PNJ raro."
	AL["MAP_TOOLTIP_ACHIEVEMENT"] = "Este é um objetivo da conquista %s"
	AL["MAP_TOOLTIP_ALREADY_KILLED"] = "Este PNJ foi assassinado. Reinício em: %s"
	AL["MAP_TOOLTIP_ALREADY_OPENED"] = "Este recipiente já está aberto. Reinício em: %s"
	AL["MAP_TOOLTIP_CONTAINER_LOOTED"] = "Shift-Clique-esquerdo para determinar como looteado (saqueado). "
	AL["MAP_TOOLTIP_DAYS"] = "dias"
	AL["MAP_TOOLTIP_EVENT_DONE"] = "Shift-clique-esquerdo para determinar como completado"
	AL["MAP_TOOLTIP_KILLED"] = "Shift-Clique-esquerdo para determinar como morto"
	AL["MAP_TOOLTIP_NOT_FOUND"] = "Ainda não tinha visto este PNJ e ninguém o tinha partilhado com você"
	AL["MAP_TOOLTIP_SEEN"] = "Visto anteriormente: %s"
	AL["MESSAGE_OPTIONS"] = "Opções de mensagens "
	AL["MIDDLE_BUTTON"] = "Clique no botão do meio (scroll)"
	AL["NOT_TARGETEABLE"] = "Não é selecionável"
	AL["NOTE_130350"] = "Você tem que montar este raro e levá-lo até ao recipiente que você encontrará seguindo o caminho à direita desta posição."
	AL["NOTE_131453"] = "Você tem que montar [Guardião da Nascente] e trazê-lo a esta posição. O cavalo é um raro amigável que você encontrará seguindo o caminho à esquerda deste recipiente."
	AL["NOTE_280951"] = "Siga a ferrovia até encontrar um carrinho. Monte-o para descobrir o tesouro."
	AL["NOTE_287239"] = "Apenas disponível para a Horda. Você tem de completar a campanha de Vol'dun para poder ter acesso ao templo. "
	AL["NOTE_292673"] = "1 de 5 pergaminhos. Leia todos eles para descobrir o tesouro [Segredo das Profundezas]. Está no porão. Esconda este ícone manualmente depois de o ter lido."
	AL["NOTE_292674"] = "2 de 5 pergaminhos. Leia todos eles para descobrir o tesouro [Segredo das Profundezas]. Está debaixo do chão de madeira, no canto, ao lado de um aglomerado de velas. Esconda este ícone manualmente depois de o ter lido."
	AL["NOTE_292675"] = "3 de 5 pergaminhos. Leia todos eles para descobrir o tesouro [Segredo das Profundezas]. Está no porão. Esconda este ícone manualmente depois de o ter lido. "
	AL["NOTE_292676"] = "4 de 5 pergaminhos. Leia todos eles para descobrir o tesouro [Segredo das Profundezas]. Está no último andar. Esconda este ícone manualmente depois de o ter lido. "
	AL["NOTE_292677"] = "5 de 5 pergaminhos. Leia todos eles para descobrir o tesouro [Segredo das Profundezas]. Está numa cave subterrânea. A entrada está debaixo de água nas coordenadas 72.40 (piscina de água no mosteiro). Esconda este ícone manualmente depois de o ter lido. "
	AL["NOTE_292686"] = "Depois de ler os 5 pergaminhos, use o [Ominous Altar] para obter [Segredo das Profundezas]. Aviso: usar o altar o teletransportará para o meio do mar. Esconda o ícone manualmente assim que o use. "
	AL["NOTE_293349"] = "É dentro do galpão, em cima de uma prateleira."
	AL["NOTE_293350"] = "Este tesouro está escondido numa caverna subterrânea. Vá para as coordenadas 61.38, coloque a câmara olhando desde cima, depois salte para trás através da pequena fissura no chão e aterrisse na borda. "
	AL["NOTE_293852"] = "Não poderá ver isto até que coleccione [Mapa do Tesouro Encharcado] dos piratas no Freehold. "
	AL["NOTE_293880"] = "Não poderá ver isto até que coleccione [Mapa do Tesouro Esmaecido] dos piratas no Freehold. "
	AL["NOTE_293881"] = "Não poderá ver isto até que coleccione [Mapa do Tesouro Amarelado] dos piratas no Freehold. "
	AL["NOTE_293884"] = "Não poderá ver isto até que coleccione [Mapa do Tesouro Chamuscado] dos piratas no Freehold. "
	AL["NOTE_297828"] = "O corvo que sobrevoa os domínios contém a chave. Mate-o. "
	AL["NOTE_297891"] = "Você tem que desativar as runas nesta ordem: Esquerda, Baixo, Cima, Direita. "
	AL["NOTE_297892"] = "Você tem que desativar as runas nesta ordem: Esquerda , Direita, Baixo, Cima. "
	AL["NOTE_297893"] = "Você tem que desativar as runas nesta ordem: Direita, Cima, Esquerda, Baixo"
	AL["PROFILES"] = "Perfis"
	AL["RAIDS"] = "Raides"
	AL["SHOW_CHAT_ALERT"] = "Mostrar alertas de chat"
	AL["SHOW_CHAT_ALERT_DESC"] = "Mostra no chat uma mensagem privada, cada vez que se detecte um cofre, tesouro ou NPC."
	AL["SOUND"] = "Áudio"
	AL["SOUND_OPTIONS"] = "Opções de áudio"
	AL["TEST"] = "Iniciar teste"
	AL["TEST_DESC"] = "Pulse o botão para mostrar um exemplo de alerta. Pode arrastar o botão até outra posição onde se mostrarão alertas futuros."
	AL["TOC_NOTES"] = "Scanner do minimapa. Avisa com uma mensagem, uma miniatura e produz um sinal sonoro cada vez que um NPC raro, tesouro ou evento aparece no seu minimapa."
	AL["TOGGLE_FILTERS"] = "Ativa/desativa filtros"
	AL["TOGGLE_FILTERS_DESC"] = "Ativa/desativa todos os filtros simultaneamente"
	AL["TOOLTIP_BOTTOM"] = "Lado inferior"
	AL["TOOLTIP_CURSOR"] = "Siga o cursor"
	AL["TOOLTIP_LEFT"] = "Lado esquerdo"
	AL["TOOLTIP_RIGHT"] = "Lado direito"
	AL["TOOLTIP_TOP"] = "Lado superior"
	AL["UNKNOWN"] = "Desconhecido"
	AL["UNKNOWN_TARGET"] = "Objetivo desconhecido"
	AL["ZONE_1332"] = "%s (Front de Guerra)"
	AL["ZONE_943"] = "%s (Front de Guerra)"
	AL["ZONES_FILTER"] = "Filtros de zonas"
	AL["ZONES_FILTERS_SEARCH_DESC"] = "Escreva o nome da zona para filtrar na lista de baixo"

	-- CONTINENT names
	AL["ZONES_CONTINENT_LIST"] = {
		[9999] = "Salões de Ordem"; --Class Halls
		[9998] = "Ilha de Negraluna"; --Darkmoon Island
		[9997] = "Masmorras/Cenários"; --Dungeons/Scenarios
		[9996] = "Raides"; --Raids
		[9995] = "Desconhecido"; --Unknown
		[9994] = "Ilhas de expedições"; --Expedition islands
	}
end