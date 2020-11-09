local L = BigWigsAPI:NewLocale("BigWigs", "koKR")
if not L then return end

-- Core.lua
L.berserk = "광폭화"
L.berserk_desc = "우두머리가 언제 광폭화하는지 바와 시간 경고를 표시합니다."
L.altpower = "보조 마력 표시"
L.altpower_desc = "보조 마력 창을 표시합니다, 자신의 파티/공격대원의 보조 마력 수치를 표시합니다."
L.infobox = "정보 상자"
L.infobox_desc = "우두머리 전투와 관련된 정보를 담은 상자를 표시합니다."
L.stages = "단계"
L.stages_desc = "근접, 바, 기타 등등 우두머리의 다양한 단계와 관련된 기능을 사용합니다."
L.warmup = "준비"
L.warmup_desc = "우두머리와의 전투가 시작되기 까지 시간입니다."

L.already_registered = "|cffff0000경고:|r |cff00ff00%s|r (|cffffff00%s|r)|1은;는; 이미 BigWigs 내에 모듈로 존재합니다, 하지만 무엇인가 다시 등록하려고 시도했습니다. 이는 일반적으로 몇몇 애드온 업데이터 오류로 인해 애드온 폴더 내에 이 모듈의 사본을 가지고 있다는 것을 의미합니다. 설치된 모든 BigWigs 폴더를 삭제한 후 처음부터 다시 설치하는 것을 권장합니다."
--L.testNameplate = "Target detected, creating a test nameplate bar over target nameplate. |cFF33FF99This feature is rarely used, is usually just 1 bar, and is needed to keep track of cooldowns when fighting multiple bosses/ads that cast the same spell.|r"

-- Loader / Options.lua
--L.classicWarning1 = "|cFF33FF99BigWigs|r: You're using the wrong version of BigWigs on a classic server."
--L.classicWarning2 = "|cFF33FF99BigWigs|r: Please install the classic version of BigWigs."
L.officialRelease = "당신은 BigWigs %s (%s)의 공식 배포 버전을 실행 중입니다"
L.alphaRelease = "당신은 BigWigs %s (%s)의 알파 버전을 실행 중입니다"
L.sourceCheckout = "당신은 저장소로부터 직접 가져온 BigWigs %s의 소스를 실행 중입니다."
L.getNewRelease = "당신의 BigWigs는 구버전이지만 (/bwv) Twitch 클라이언트를 사용해 쉽게 업데이트할 수 있습니다. 또는 curseforge.com이나 wowinterface.com에서 직접 업데이트할 수 있습니다."
L.warnTwoReleases = "당신의 BigWigs는 최신 버전보다 2번 앞서 배포된 구버전입니다! 당신의 버전은 오류가 있거나, 기능이 누락됐거나, 완전히 틀린 타이머를 가지고 있을 수 있습니다. 업데이트를 강력히 권장합니다."
L.warnSeveralReleases = "|cffff0000당신의 BigWigs는 최신 버전보다 %d번 앞서 배포된 구버전입니다!! 다른 플레이어와 동기화 문제를 방지하기 위해 업데이트를 강력히 권장합니다!|r"

L.tooltipHint = "옵션에 접근하려면 |cffeda55f오른쪽 클릭|r하세요."
L.activeBossModules = "활성화된 우두머리 모듈:"

L.oldVersionsInGroup = "파티 내에 BigWigs가 없거나 구버전을 가진 사람입니다. /bwv 명령어로 더 자세한 정보를 얻을 수 있습니다."
L.upToDate = "최신 버전:"
L.outOfDate = "구버전:"
L.dbmUsers = "DBM 사용자:"
L.noBossMod = "우두머리 모듈 없음:"
L.offline = "접속 종료"

L.missingAddOn = "이 지역에서 타이머를 표시하려면 |cFF436EEE%s|r 플러그인이 필요합니다."
L.disabledAddOn = "|cFF436EEE%s|r 애드온이 비활성화 중이므로 타이머를 표시할 수 없습니다."

L.removeAddon = "'|cFF436EEE%s|r'|1이;가; '|cFF436EEE%s|r'|1으로;로; 대체되었으므로 제거해주세요."
L.alternativeName = "%s (|cFF436EEE%s|r)"

-- Media.lua
L.Beware = "조심해라 (알갈론)"
L.FlagTaken = "깃발 뺏김 (PvP)"
L.Destruction = "파괴 (킬제덴)"
L.RunAway = "도망쳐라 꼬마야 달아나라 (커다란 나쁜 늑대)"

-- Options.lua
L.options = "옵션"
L.raidBosses = "공격대 우두머리"
L.dungeonBosses = "던전 우두머리"
L.introduction = "우두머리 전투가 배회하는 BigWigs에 오신 걸 환영합니다. 안전 벨트를 착용하고, 땅콩을 먹으며 탑승을 즐기세요. 당신의 아이들을 먹진 않지만, 당신의 공격대를 위한 7-코스 저녁 식사로 새로운 우두머리 전투를 준비하는 데 도움을 줄겁니다."
L.toggleAnchorsBtn = "고정기 표시 전환"
L.toggleAnchorsBtn_desc = "모든 고정기의 표시와 숨기기를 전환합니다."
L.testBarsBtn = "테스트 바 만들기"
L.testBarsBtn_desc = "당신의 현재 표시 설정으로 테스트용 바를 만듭니다."
L.sound = "소리"
L.flashScreen = "화면 깜빡임"
L.flashScreenDesc = "특정 능력은 당신의 모든 주의를 기울일 정도로 중요합니다. 이 능력들이 당신에게 영향을 줄 때 BigWigs가 화면을 깜빡일 수 있습니다."
L.minimapIcon = "미니맵 아이콘"
L.minimapToggle = "미니맵 아이콘의 표시/숨기기를 전환합니다."
L.configure = "구성"
L.test = "테스트"
L.resetPositions = "위치 초기화"
L.colors = "색상"
L.selectEncounter = "우두머리 전투 선택"
L.listAbilities = "파티/공격대 대화에 능력 나열하기"

L.dbmFaker = "DBM을 사용 중인 것처럼 위장하기"
L.dbmFakerDesc = "DBM 사용자가 DBM의 버전을 확인하여 누가 DBM을 사용하는지 확인할 때 DBM 사용자 명단에 당신을 표시합니다. DBM 사용을 강제하는 길드에서 유용합니다."
L.chatMessages = "대화 창 메시지"
L.chatMessagesDesc = "모든 BigWigs 메시지를 표시 설정과 더불어 기본 대화 창에도 출력합니다."
L.zoneMessages = "지역 메시지 표시"
L.zoneMessagesDesc = "비활성하면 설치하지 않았지만 BigWigs에 타이머가 있는 지역에 입장했을 때 메시지 표시를 중지합니다. 당신이 유용하다고 느끼는 새로운 지역에 대한 타이머를 우리가 갑자기 만들었을 때 받을 수 있는 유일한 알림이기 때문에 이 기능을 사용하는 걸 권장합니다."

L.slashDescTitle = "|cFFFED000대화 명령어:|r"
L.slashDescPull = "|cFFFED000/pull:|r 공격대에 전투 예정 초읽기를 보냅니다."
L.slashDescBreak = "|cFFFED000/break:|r 공격대에 휴식 타이머를 보냅니다."
L.slashDescRaidBar = "|cFFFED000/raidbar:|r 공격대에 사용자 설정 바를 보냅니다."
L.slashDescLocalBar = "|cFFFED000/localbar:|r 자신만 볼 수 있는 사용자 설정 바를 만듭니다."
L.slashDescRange = "|cFFFED000/range:|r 거리 지시기를 엽니다."
L.slashDescVersion = "|cFFFED000/bwv:|r BigWigs 버전 확인을 수행합니다."
L.slashDescConfig = "|cFFFED000/bw:|r BigWigs 구성을 엽니다."

L.gitHubDesc = "|cFF33FF99BigWigs는 GitHub에 호스트되는 오픈 소스 소프트웨어입니다. 우리는 우리를 도와줄 새로운 사람들을 항상 찾고 있으며 우리의 코드를 누구나 살펴보는 것을 환영합니다, 기고를 만들고 오류 보고를 제출하세요. BigWigs는 현재 WoW 커뮤니티로부터 큰 도움을 받고 있습니다.|r"

L.BAR = "바"
L.MESSAGE = "메시지"
L.ICON = "아이콘"
L.SAY = "일반 대화"
L.FLASH = "깜빡임"
L.EMPHASIZE = "강조"
L.ME_ONLY = "나에게 걸렸을 때만"
L.ME_ONLY_desc = "이 옵션을 활성화하면 이 능력이 자신에게 영향을 끼칠때만 메시지를 표시합니다. 예를 들어, 나에게 걸렸을 때만 '폭탄: 플레이어'를 표시합니다."
L.PULSE = "맥박"
L.PULSE_desc = "화면을 깜빡이는 것과 더불어, 당신의 주의를 끌기 위해 특정 능력과 연관된 아이콘을 화면 중앙에 즉시 표시하도록 할 수 있씁니다."
L.MESSAGE_desc = "대부분의 우두머리 전투 능력은 BigWigs가 화면에 표시하는 하나 이상의 메시지를 갖고 있습니다. 이 옵션을 비활성하면, 메시지를 표시하지 않습니다."
L.BAR_desc = "몇몇 우두머리 전투 능력에 대한 바가 적절한 때에 표시됩니다. 이 능력이 따르는 바를 숨기고 싶다면 이 옵션을 비활성화하세요."
L.FLASH_desc = "몇몇 능력은 다른 능력보다 더 중요합니다. 이 능력이 임박하거나 사용됐을 때 화면을 깜빡이고 싶다면 이 옵션을 체크하세요."
L.ICON_desc = "BigWigs는 능력에 영향을 받는 캐릭터에 아이콘으로 표시할 수 있습니다. 눈에 더 잘 띄게 해줍니다."
L.SAY_desc = "대화 말풍선은 눈에 잘 띕니다. BigWigs는 자신에게 걸린 효과에 대하여 주위 사람에게 알리는데 일반 대화 메시지를 사용합니다."
L.EMPHASIZE_desc = "활성화하면 이 능력과 연관된 모든 메시지를 강조합니다, 더 크고 더 잘 보이게 만듭니다. 강조된 메시지의 크기와 글꼴을 주 옵션의 \"메시지\"에서 설정할 수 있습니다."
L.PROXIMITY = "근접 표시"
L.PROXIMITY_desc = "능력은 종종 산개 진형을 요구합니다. 근접 표시는 이 능력에 맞게 설정되므로 자신의 안전 여부를 한눈에 확인할 수 있습니다."
L.ALTPOWER = "보조 자원 표시"
L.ALTPOWER_desc = "몇몇 우두머리 전투는 파티 내의 플레이어에게 보조 자원 원리를 사용합니다. 보조 자원 표시는 최소/최대 보조 자원을 가진 사람을 간략하게 보여줍니다, 특정 공략이나 전술에 유용할 수 있습니다."
L.TANK = "방어 전담만"
L.TANK_desc = "몇몇 능력은 방어 전담에게만 중요합니다. 이 능력에 대한 경고를 역할에 관계없이 보고싶다면, 이 옵션을 비활성하세요."
L.HEALER = "치유 전담만"
L.HEALER_desc = "몇몇 능력은 치유 전담에게만 중요합니다. 이 능력에 대한 경고를 역할에 관계없이 보고싶다면, 이 옵션을 비활성하세요."
L.TANK_HEALER = "방어 & 치유 전담만"
L.TANK_HEALER_desc = "몇몇 능력은 방어와 치유 전담에게만 중요합니다. 이 능력에 대한 경고를 역할에 관계없이 보고싶다면, 이 옵션을 비활성하세요."
L.DISPEL = "무효화 시전자만"
L.DISPEL_desc = "이 능력에 대한 경고를 무효화할 수 없을때라도 보고싶다면, 이 옵션을 비활성하세요."
L.VOICE = "음성"
L.VOICE_desc = "음성 플러그인을 설치하고, 이 옵션을 활성화하면 이 경고를 소리내어 말해주는 소리 파일을 재생합니다."
L.COUNTDOWN = "초읽기"
L.COUNTDOWN_desc = "활성화하면, 마지막 5초에 음성과 시각적 초읽기가 추가됩니다. 화면 가운데에 \"5... 4... 3... 2... 1...\"의 큰 숫자와 함께 초읽기를 해줍니다."
L.INFOBOX = L.infobox
L.INFOBOX_desc = L.infobox_desc
L.SOUND = "소리 내기"
L.SOUND_desc = "보스의 능력들을 소리를 통해서 알려줍니다. 이 옵션을 비활성화 한다면 이 능력에 해당하는 소리가 들리지 않을 것입니다."
L.CASTBAR = "시전 바"
L.CASTBAR_desc = "주로 특정 중요 능력들을 시전하는 보스들을 상대할 때는 시전바가 표시됩니다. 이 능력에 해당하는 시전바를 숨기고 싶다면 이 옵션을 비활성화하세요."
L.SAY_COUNTDOWN = "카운트 표시"
L.SAY_COUNTDOWN_desc = "말풍선은 매우 알아보기 쉽습니다. BigWigs는 여러가지 말풍선으로 주위 사람들에게 어떤 능력이 만료된다는 것을 알려줍니다."
L.ME_ONLY_EMPHASIZE = "강조(나에게 걸렸을 때만)"
L.ME_ONLY_EMPHASIZE_desc = "이 옵션을 활성화하면 이 능력이 자신에게 영향을 끼칠때 메세지를 더 크고 는에 띄게 표시합니다."
-- L.NAMEPLATEBAR = "Nameplate Bars"
-- L.NAMEPLATEBAR_desc = "Bars are sometimes attached to nameplates when more than one mob casts the same spell. If this ability is accompanied by a nameplate bar that you want to hide, disable this option."

L.advanced = "고급 옵션"
L.back = "<< 뒤로"

L.tank = "|cFFFF0000방어 전담만 경보합니다.|r "
L.healer = "|cFFFF0000치유 전담만 경보합니다.|r "
L.tankhealer = "|cFFFF0000방어 & 치유 전담만 경보합니다.|r "
L.dispeller = "|cFFFF0000무효화 시전자만 경보합니다.|r "

-- Statistics
L.statistics = "통계"
L.lfr = "공찾"
L.normal = "일반"
L.heroic = "영웅"
L.mythic = "신화"
L.wipes = "전멸:"
L.kills = "처치:"
L.best = "최고 기록:"
