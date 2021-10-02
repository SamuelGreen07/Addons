if not(GetLocale() == "zhCN") then
  return
end

local L = WeakAuras.L

-- WeakAuras
L["   • %d auras added"] = "• 已添加%d个光环"
L["   • %d auras deleted"] = "• 已删除%d个光环"
L["   • %d auras modified"] = "• 已修改%d个光环"
L[ [=[ Filter formats: 'Name', 'Name-Realm', '-Realm'. 

Supports multiple entries, separated by commas
]=] ] = "过滤格式：'名称'，'名称-服务器'，'-服务器'。支持多个条目，由英文逗号分隔。"
L["%s - %i. Trigger"] = "%s - %i. 触发器"
L["%s - Alpha Animation"] = "%s - 透明度动画"
L["%s - Color Animation"] = "%s - 颜色动画"
L["%s - Condition Custom Chat"] = "%s - 条件符合时的自定义聊天框文字"
L["%s - Custom Anchor"] = "%s - 自定义锚点"
L["%s - Custom Grow"] = "%s - 自定义发光"
L["%s - Custom Sort"] = "%s - 自定义排序"
L["%s - Custom Text"] = "%s - 自定义文字"
L["%s - Finish"] = "%s - 结束时"
L["%s - Finish Action"] = "%s - 结束动作"
L["%s - Finish Custom Text"] = "%s - 结束自定义文本"
L["%s - Init Action"] = "%s - 初始动作"
L["%s - Main"] = "%s - 主要"
L["%s - Rotate Animation"] = "%s - 旋转动画 "
L["%s - Scale Animation"] = "%s - 缩放动画"
L["%s - Start"] = "%s - 开始时"
L["%s - Start Action"] = "%s - 开始动作"
L["%s - Start Custom Text"] = "%s - 开始自定义文本"
L["%s - Translate Animation"] = "%s - 平移动画"
L["%s - Trigger Logic"] = "%s - 触发器逻辑"
L["%s Custom Variables"] = "%s 自定义变量"
L["%s Duration Function"] = "%s 持续时间函数"
L["%s Icon Function"] = "%s 图标函数"
L["%s Name Function"] = "%s 名称函数"
L["%s Overlay Color"] = "%s 覆盖层颜色"
L["%s Overlay Function"] = "%s 覆盖层函数"
L["%s Stacks Function"] = "%s 层数函数"
L["%s Texture Function"] = "%s 材质函数"
L["%s total auras"] = "共%s个光环"
L["%s Trigger Function"] = "%s 触发器函数"
L["%s Untrigger Function"] = "%s 取消触发函数"
L["* Suffix"] = "* 后缀"
L["/wa help - Show this message"] = "/wa help - 显示此信息"
L["/wa minimap - Toggle the minimap icon"] = "/wa minimap - 显示/隐藏小地图图标"
L["/wa pprint - Show the results from the most recent profiling"] = "/wa pprint - 显示最近的性能分析结果"
L["/wa pstart - Start profiling. Optionally include a duration in seconds after which profiling automatically stops. To profile the next combat/encounter, pass a \"combat\" or \"encounter\" argument."] = "/wa pstart - 开始性能分析。可以传入持续时间（秒）以在指定时间后自动结束。可以传入\"combat\"或者“encounter”以在下次战斗或者首领战斗时开始。"
L["/wa pstop - Finish profiling"] = "/wa pstop - 结束性能分析"
L["/wa repair - Repair tool"] = "/wa repair - 修复工具"
L["|cffeda55fLeft-Click|r to toggle showing the main window."] = "|cffeda55f左键|r显示/隐藏主窗口。"
L["|cffeda55fMiddle-Click|r to toggle the minimap icon on or off."] = "|cffeda55f中键|r显示/隐藏小地图图标。"
L["|cffeda55fRight-Click|r to toggle performance profiling window."] = "|cffeda55f右键|r显示/隐藏性能分析窗口。"
L["|cffeda55fShift-Click|r to pause addon execution."] = "|cffeda55fShift + 左键|r暂停插件执行。"
L["|cFFFF0000Not|r Item Bonus Id Equipped"] = "|cFFFF0000非|r 已装备物品增益ID"
L["|cFFFF0000Not|r Player Name/Realm"] = "|cFFFF0000非|r 玩家名字/服务器"
L["|cFFffcc00Extra Options:|r %s"] = "|cFFffcc00额外选项：|r%s"
L["|cFFffcc00Extra Options:|r None"] = "|cFFffcc00额外选项：|r无"
L["10 Man Raid"] = "10人团队"
L["10 Player Raid (Heroic)"] = "10人团队副本（英雄）"
L["10 Player Raid (Normal)"] = "10人团队副本（普通）"
L["20 Man Raid"] = "20人团队"
L["25 Man Raid"] = "25人团队"
L["25 Player Raid (Heroic)"] = "25人团队副本（英雄）"
L["25 Player Raid (Normal)"] = "25人团队副本（普通）"
L["40 Man Raid"] = "40人团队"
L["40 Player Raid"] = "40人团队副本"
L["5 Man Dungeon"] = "5人地下城"
L["Abbreviate"] = "缩写"
L["AbbreviateLargeNumbers (Blizzard)"] = "缩写大数字（暴雪）"
L["AbbreviateNumbers (Blizzard)"] = "缩写数字（暴雪）"
L["Absorb"] = "吸收"
L["Absorb Display"] = "吸收量显示"
L["Absorb Heal Display"] = "治疗吸收量显示"
L["Absorbed"] = "已吸收"
L["Action Button Glow"] = "动作条按钮发光"
L["Action Usable"] = "动作可以使用"
L["Actions"] = "动作"
L["Active"] = "活跃"
L["Add"] = "添加"
L["Add Missing Auras"] = "添加缺少的光环"
L["Additional Trigger Replacements"] = "额外触发器动态文字"
L["Affected"] = "受到影响"
L["Affected Unit Count"] = "受影响的单位数量"
L["Aggro"] = "仇恨"
L["Agility"] = "敏捷"
L["Ahn'Qiraj"] = "安其拉"
L["Akil'zon"] = "埃基尔松"
L["Al'ar"] = "奥"
L["Alert Type"] = "警报类型"
L["Alive"] = "存活"
L["All"] = "全部"
L["All Triggers"] = "全部符合"
L["Alliance"] = "联盟"
L["Allow partial matches"] = "允许部分匹配"
L["Alpha"] = "透明度"
L["Alternate Power"] = "特殊能量"
L["Always"] = "总是"
L["Always active trigger"] = "总是启用触发器"
L["Always include realm"] = "总是包含服务器"
L["Always True"] = "总是真"
L["Amount"] = "数量"
L["And Talent"] = "和天赋"
L["Anetheron"] = "安纳塞隆"
L["Animations"] = "动画"
L["Anticlockwise"] = "逆时针"
L["Anub'Rekhan"] = "阿努布雷坎"
L["Any"] = "任意"
L["Any Triggers"] = "任意符合"
L["AOE"] = "范围性伤害"
L["Arcane Resistance"] = "奥术抗性"
L["Archimonde"] = "阿克蒙德"
L["Arena"] = "竞技场"
L["Armor (%)"] = "护甲 (%)"
L["Armor against Target (%)"] = "针对目标的护甲 (%)"
L["Armor Rating"] = "护甲等级"
L["Array"] = "数组"
L["Ascending"] = "升序"
L["Assigned Role"] = "团队职责"
L["Assigned Role Icon"] = "团队职责图标"
L["At Least One Enemy"] = "至少一个敌人"
L["At missing Value"] = "于缺失值"
L["At Percent"] = "于百分比"
L["At Value"] = "于值"
L["Attach to End"] = "依附到末尾"
L["Attach to Start"] = "依附到开头"
L["Attack Power"] = "攻击强度"
L["Attackable"] = "可攻击的"
L["Attackable Target"] = "可攻击的目标"
L["Attumen the Huntsman"] = "猎手阿图门"
L["Aura"] = "光环"
L["Aura '%s': %s"] = "光环'%s'：%s"
L["Aura Applied"] = "获得光环"
L["Aura Applied Dose"] = "光环堆叠"
L["Aura Broken"] = "光环被打破"
L["Aura Broken Spell"] = "打破光环的法术"
L["Aura Name"] = "光环名称"
L["Aura Names"] = "光环名称"
L["Aura Refresh"] = "光环刷新"
L["Aura Removed"] = "光环被移除"
L["Aura Removed Dose"] = "光环效果减少"
L["Aura Stack"] = "光环层数"
L["Aura Type"] = "光环类型"
L["Aura(s) Found"] = "光环被找到"
L["Aura(s) Missing"] = "光环未找到"
L["Aura:"] = "光环："
L["Auras:"] = "光环："
L["Author Options"] = "作者选项"
L["Auto"] = "自动"
L["Autocast Shine"] = "自动施法闪烁"
L["Automatic"] = "自动"
L["Automatic Length"] = "自动长度"
L["Automatic Repair Confirmation Dialog"] = "自动修复确认对话框"
L["Automatic Rotation"] = "自动旋转"
L["Avoidance (%)"] = "闪避 (%)"
L["Avoidance Rating"] = "闪避等级"
L["Ayamiss the Hunter"] = "狩猎者阿亚米斯"
L["Azgalor"] = "阿兹加洛"
L["Back and Forth"] = "往返"
L["Background"] = "背景"
L["Background Color"] = "背景颜色"
L["Bar Color"] = "进度条颜色"
L["Baron Geddon"] = "迦顿男爵"
L["Battle.net Whisper"] = "战网密语"
L["Battleground"] = "战场"
L["Battleguard Sartura"] = "沙尔图拉"
L["BG>Raid>Party>Say"] = "战场>团队>小队>说"
L["BG-System Alliance"] = "联盟战场事件"
L["BG-System Horde"] = "部落战场事件"
L["BG-System Neutral"] = "中立战场事件"
L["Big Number"] = "大数字"
L["BigWigs Addon"] = "BigWigs 插件"
L["BigWigs Message"] = "BigWigs 信息"
L["BigWigs Stage"] = "BigWigs 阶段"
L["BigWigs Timer"] = "BigWigs 计时器"
L["Black Temple"] = "黑暗神殿"
L["Black Wing Lair"] = "黑翼之巢"
L["Blizzard (2h | 3m | 10s | 2.4)"] = "暴雪格式 （2h | 3m | 10s | 2.4）"
L["Blizzard Combat Text"] = "暴雪战斗文字"
L["Block"] = "格挡"
L["Block (%)"] = "格挡 (%)"
L["Block against Target (%)"] = "针对目标的格挡 (%)"
L["Blocked"] = "被格挡"
L["Bloodlord Mandokir"] = "血领主曼多基尔"
L["Border"] = "边框"
L["Boss"] = "首领"
L["Boss Emote"] = "首领表情"
L["Boss Whisper"] = "首领密语"
L["Bottom"] = "下"
L["Bottom Left"] = "左下"
L["Bottom Right"] = "右下"
L["Bottom to Top"] = "从下到上"
L["Bounce"] = "弹跳"
L["Bounce with Decay"] = "衰减地弹跳"
L["Broodlord Lashlayer"] = "勒什雷尔"
L["Brutallus"] = "布鲁塔卢斯"
L["Buff"] = "增益效果"
L["Buffed/Debuffed"] = "获得增益/减益效果"
L["Buru the Gorger"] = "吞咽者布鲁"
L["Can be used for e.g. checking if \"boss1target\" is the same as \"player\"."] = "可以用来检测类似于一号首领的目标（boss1target）是不是玩家自身（player）之类的信息。"
L["Cancel"] = "取消"
L["Can't schedule timer with %i, due to a World of Warcraft bug with high computer uptime. (Uptime: %i). Please restart your computer."] = "由于计算机长时间开机造成的魔兽世界故障，无法设置 %i 秒后的计时器。（开机时间：%i）。请重启你的计算机。"
L["Cast"] = "施法"
L["Cast Bar"] = "施法条"
L["Cast Failed"] = "施法失败"
L["Cast Start"] = "开始施法"
L["Cast Success"] = "施法成功"
L["Cast Type"] = "施法类型"
L["Caster"] = "施放者"
L["Caster Name"] = "施法者名称"
L["Caster Realm"] = "施法者服务器"
L["Caster Unit"] = "施法者单位"
L["Caster's Target"] = "施法者目标"
L["Ceil"] = "向上取整"
L["Center"] = "中间"
L["Centered Horizontal"] = "中部水平对齐"
L["Centered Vertical"] = "中部垂直对齐"
L["Changed"] = "已更改"
L["Channel"] = "频道"
L["Channel (Spell)"] = "引导法术"
L["Character Stats"] = "角色属性"
L["Character Type"] = "角色类型"
L["Charge gained/lost"] = "获取/失去充能层数"
L["Charged Combo Point"] = "充能连击点"
L["Charges"] = "充能"
L["Charges Changed Event"] = "充能变化事件"
L["Chat Frame"] = "聊天窗口"
L["Chat Message"] = "聊天信息"
L["Chess Event"] = "国际象棋"
L["Children:"] = "子项目："
L["Choose a category"] = "选择一个类别"
L["Chromaggus"] = "克洛玛古斯"
L["Circle"] = "环形"
L["Clamp"] = "内缩"
L["Class"] = "职业"
L["Class and Specialization"] = "职业和专精"
L["Classification"] = "分类"
L["Clockwise"] = "顺时针"
L["Clone per Event"] = "复制每项事件"
L["Clone per Match"] = "复制每项符合项"
L["Coilfang: Serpentshrine Cavern"] = "盘牙湖泊：毒蛇神殿"
L["Color"] = "颜色"
L["Combat Log"] = "战斗记录"
L["Conditions"] = "常用状态"
L["Contains"] = "包含"
L["Continuously update Movement Speed"] = "持续更新移动速度"
L["Cooldown"] = "冷却计时"
L["Cooldown Progress (Item)"] = "冷却进度（物品）"
L["Cooldown Progress (Slot)"] = "冷却进度（装备栏）"
L["Cooldown Ready Event"] = "冷却完成事件"
L["Cooldown Ready Event (Item)"] = "冷却完成事件（物品）"
L["Cooldown Ready Event (Slot)"] = "冷却完成事件（装备栏）"
L["Cooldown/Charges/Count"] = "冷却/充能/数量"
L["Count"] = "计数"
L["Counter Clockwise"] = "逆时针"
L["Create"] = "创造物品"
L["Create a Copy"] = "新建拷贝"
L["Critical"] = "爆击(致命一击)"
L["Critical (%)"] = "暴击 (%)"
L["Critical Rating"] = "暴击等级"
L["Crowd Controlled"] = "被控制"
L["Crushing"] = "碾压"
L["C'thun"] = "克苏恩"
L["Current Experience"] = "当前经验值"
L["Current Movement Speed (%)"] = "当前移动速度 (%)"
L[ [=[Current Zone Group
]=] ] = "当前区域组"
L[ [=[Current Zone
]=] ] = "当前区域"
L["Curse"] = "诅咒"
L["Custom"] = "自定义"
L["Custom Check"] = "自定义检查"
L["Custom Color"] = "自定义颜色"
L["Custom Configuration"] = "自定义设置"
L["Custom Function"] = "自定义函数"
L["Daakara"] = "达卡拉"
L["Damage"] = "伤害"
L["Damage Shield"] = "护盾(如:荆棘术)伤害"
L["Damage Shield Missed"] = "护盾伤害未命中"
L["Damage Split"] = "伤害分担"
L["DBM Announce"] = "DBM 通知"
L["DBM Stage"] = "DBM 阶段"
L["DBM Timer"] = "DBM 计时器"
L["Death Knight Rune"] = "死亡骑士符文"
L["Debuff"] = "减益效果"
L["Debuff Class"] = "减益效果类型"
L["Debuff Class Icon"] = "减益效果类型图标"
L["Debuff Type"] = "Debuff 类型"
L["Defense"] = "防御"
L["Deflect"] = "偏斜"
L["Desaturate"] = "褪色"
L["Desaturate Background"] = "背景褪色"
L["Desaturate Foreground"] = "前景褪色"
L["Descending"] = "降序"
L["Description"] = "描述"
L["Dest Raid Mark"] = "目标团队标记"
L["Destination Affiliation"] = "目标所属"
L["Destination GUID"] = "目标GUID"
L["Destination Name"] = "目标名称"
L["Destination NPC Id"] = "目标 NPC ID"
L["Destination Object Type"] = "目标类型"
L["Destination Reaction"] = "目标反应"
L["Destination Unit"] = "目标单位"
L["Disable Spell Known Check"] = "忽略法术已知检查"
L["Disabled Spell Known Check"] = "已忽略法术已知检查"
L["Disease"] = "疾病"
L["Dispel"] = "驱散"
L["Dispel Failed"] = "驱散失败"
L["Display"] = "显示"
L["Distance"] = "距离"
L["Dodge"] = "躲闪"
L["Dodge (%)"] = "闪躲 (%)"
L["Dodge Rating"] = "闪躲等级"
L["Done"] = "完成"
L["Down"] = "下"
L["Down, then Left"] = "向下，然后向左"
L["Down, then Right"] = "向下，然后向右"
L["Drain"] = "引导性吸取"
L["Dropdown Menu"] = "下拉菜单"
L["Dungeon (Heroic)"] = "地下城（英雄）"
L["Dungeon (Mythic)"] = "地下城（史诗）"
L["Dungeon (Normal)"] = "地下城（普通）"
L["Dungeon (Timewalking)"] = "地下城（时空漫游）"
L["Dungeons"] = "地下城"
L["Durability Damage"] = "耐久度下降"
L["Durability Damage All"] = "耐久度上限下降"
L["Dynamic Information"] = "动态信息"
L["Ease In"] = "缓入"
L["Ease In and Out"] = "缓入缓出"
L["Ease Out"] = "缓出"
L["Ebonroc"] = "埃博诺克"
L["Edge"] = "边缘"
L["Edge of Madness"] = "疯狂之缘"
L["Elide"] = "省略"
L["Elite"] = "精英"
L["Emote"] = "表情"
L["Empty"] = "空"
L["Enchant Applied"] = "附魔添加"
L["Enchant Found"] = "有附魔"
L["Enchant Missing"] = "没有附魔"
L["Enchant Name or ID"] = "附魔名称或 ID"
L["Enchant Removed"] = "附魔移除"
L["Enchanted"] = "已附魔"
L["Encounter ID(s)"] = "BOSS 战 ID"
L["Energize"] = "能量值恢复"
L["Enrage"] = "激怒"
L["Enter static or relative values with %"] = "输入绝对值或者是带有%的相对值"
L["Entering"] = "进入"
L["Entering/Leaving Combat"] = "进入/离开战斗"
L["Entry Order"] = "条目排序"
L["Environment Type"] = "环境伤害类型"
L["Environmental"] = "环境伤害"
L["Equipment Set"] = "装备方案"
L["Equipment Set Equipped"] = "装备方案已使用"
L["Equipment Slot"] = "装备栏"
L["Equipped"] = "已装备"
L["Eredar Twins"] = "艾瑞达双子"
L["Error"] = "错误"
L["Error Frame"] = "错误信息框架"
L["Error in aura '%s' in %s. trigger. All States table contains a non table at key: '%s'."] = "光环 %s 的第%s个触发器错误。表allstates的键 %s 为非表元素。"
L["Error not receiving display information from %s"] = "错误：未收到来自 %s 的显示信息"
L[ [=['ERROR: Anchoring %s': 
]=] ] = "'错误: 正在锚定 %s': "
L["Evade"] = "闪避"
L["Event"] = "事件"
L["Event(s)"] = "事件"
L["Every Frame"] = "所有帧"
L["Every Frame (High CPU usage)"] = "所有帧（高CPU占用）"
L["Experience (%)"] = "经验值百分比"
L["Extend Outside"] = "扩展外侧"
L["Extra Amount"] = "额外数量"
L["Extra Attacks"] = "额外攻击"
L["Extra Spell Name"] = "额外法术名称"
L["Faction"] = "阵营"
L["Faction Name"] = "阵营名称"
L["Faction Reputation"] = "阵营声望"
L["Fade In"] = "淡入"
L["Fade Out"] = "淡出"
L["Fail Alert"] = "失误警报"
L["Fallback"] = "后备"
L["Fallback Icon"] = "后备图标"
L["False"] = "假"
L["Fankriss the Unyielding"] = "顽强的范克瑞斯"
L["Fathom-Lord Karathress"] = "深水领主卡拉瑟雷斯"
L["Felmyst"] = "菲米丝"
L["Fetch Legendary Power"] = "获取传说之力"
L["Fetches the name and icon of the Legendary Power that matches this bonus id."] = "获取符合此增益ID的传说之力的名称与图标"
L["Filter messages with format <message>"] = "带格式的过滤器信息 <message>"
L["Fire Resistance"] = "火焰抗性"
L["Firemaw"] = "费尔默"
L["First"] = "第一"
L["First Value of Tooltip Text"] = "鼠标提示文本的第一项值"
L["Fixed"] = "固定"
L["Fixed Names"] = "固定名称"
L["Fixed Size"] = "固定尺寸"
L["Flamegor"] = "弗莱格尔"
L["Flash"] = "闪动"
L["Flex Raid"] = "弹性团队"
L["Flip"] = "翻转"
L["Floor"] = "向下取整"
L["Focus"] = "焦点目标"
L["Font Size"] = "字体尺寸"
L["Forbidden function or table: %s"] = "已禁止的函数或表：%s"
L["Foreground"] = "前景"
L["Foreground Color"] = "前景颜色"
L["Form"] = "形态"
L["Format"] = "格式"
L["Formats |cFFFF0000%unit|r"] = "格式化 |cFFFF0000%unit|r"
L["Formats Player's |cFFFF0000%guid|r"] = "格式化玩家的 |cFFFF0000%guid|r"
L["Forward"] = "正向"
L["Forward, Reverse Loop"] = "正向，反向循环"
L["Frame Selector"] = "选择框体"
L["Frequency"] = "频率"
L["Friendly"] = "友善"
L["Friendly Fire"] = "友方伤害"
L["From"] = "从"
L["Frost Resistance"] = "冰霜抗性"
L["Full"] = "满"
L["Full Bar"] = "整个进度条"
L["Full/Empty"] = "满 / 空"
L["Gahz'ranka"] = "加兹兰卡"
L["Gained"] = "获得了"
L["Garr"] = "加尔"
L["Gehennas"] = "基赫纳斯"
L["General Rajaxx"] = "拉贾克斯将军"
L["Glancing"] = "躲闪"
L["Global Cooldown"] = "公共冷却"
L["Glow"] = "发光"
L["Glow External Element"] = "发光外部元素"
L["Gluth"] = "格拉斯"
L["Golemagg the Incinerator"] = "焚化者古雷曼格"
L["Gothik the Harvester"] = "收割者戈提克"
L["Gradient"] = "梯度"
L["Gradient Pulse"] = "梯度脉动"
L["Grand Widow Faerlina"] = "黑女巫法琳娜"
L["Grid"] = "表格"
L["Grobbulus"] = "格罗布鲁斯"
L["Group"] = "群组/队伍"
L["Group Arrangement"] = "群组排列"
L["Grow"] = "生长"
L["Gruul the Dragonkiller"] = "屠龙者格鲁尔"
L["Gruul's Lair"] = "格鲁尔的巢穴"
L["GTFO Alert"] = "GTFO 警报"
L["Guardian"] = "守护者"
L["Guild"] = "公会"
L["Gurtogg Bloodboil"] = "古尔图格·血沸"
L["Hakkar"] = "哈卡"
L["Halazzi"] = "哈尔拉兹"
L["Has Target"] = "拥有目标"
L["Has Vehicle UI"] = "有载具 UI"
L["HasPet"] = "有宠物"
L["Haste (%)"] = "急速 (%)"
L["Haste Rating"] = "急速等级"
L["Heal"] = "治疗"
L["Heal Absorb"] = "治疗吸收"
L["Heal Absorbed"] = "治疗吸收"
L["Health"] = "生命值"
L["Health (%)"] = "生命值百分比(%%)"
L["Health Deficit"] = "生命值缺口"
L["Heigan the Unclean"] = "肮脏的希尔盖"
L["Height"] = "高度"
L["Hex Lord Malacrass"] = "妖术领主玛拉卡斯"
L["Hide"] = "隐藏"
L["Hide 0 cooldowns"] = "冷却时间为0时隐藏"
L["High Astromancer Solarian"] = "大星术师索兰莉安"
L["High Damage"] = "高伤害"
L["High King Maulgar"] = "莫加尔大王"
L["High Priest Thekal"] = "高阶祭司塞卡尔"
L["High Priest Venoxis"] = "高阶祭司温诺希斯"
L["High Priestess Arlokk"] = "高阶祭司娅尔罗"
L["High Priestess Jeklik"] = "高阶祭司耶克里克"
L["High Priestess Mar'li"] = "高阶祭司玛尔里"
L["High Warlord Naj'entus"] = "高阶督军纳因图斯"
L["Higher Than Tank"] = "比MT高"
L["Hit (%)"] = "命中 (%)"
L["Hit Rating"] = "命中"
L["Holy Resistance"] = "神圣抗性"
L["Horde"] = "部落"
L["Hostile"] = "敌对"
L["Hostility"] = "敌对"
L["Humanoid"] = "人形态"
L["Hybrid"] = "混合"
L["Hydross the Unstable"] = "不稳定的海度斯"
L["Icon"] = "图标"
L["If you require additional assistance, please open a ticket on GitHub or visit our Discord at https://discord.gg/weakauras!"] = "如果你需要进一步的协助，请在 GitHub 上提交工单或是访问我们的 Discord：https://discord.gg/weakauras！"
L["Ignore Dead"] = "忽略已死亡"
L["Ignore Disconnected"] = "忽略已离线"
L["Ignore Rune CD"] = "忽略符文CD"
L["Ignore Rune CDs"] = "忽略符文冷却时间"
L["Ignore Self"] = "忽略自身"
L["Illidan Stormrage"] = "伊利丹·怒风"
L["Immune"] = "免疫"
L["Import"] = "导入"
L["Import as Copy"] = "导入为拷贝"
L["Import as Update"] = "导入后升级"
L["Import Group"] = "导入群组"
L["Import in progress"] = "正在导入"
L["Important"] = "重要"
L["Importing is disabled while in combat"] = "在战斗中时导入被禁用"
L["In Combat"] = "战斗中"
L["In Encounter"] = "首领战中"
L["In Group"] = "在小队中"
L["In Pet Battle"] = "宠物对战中"
L["In Raid"] = "在团队中"
L["In Vehicle"] = "在载具中"
L["Include Bank"] = "包括银行中的"
L["Include Charges"] = "包含使用次数"
L["Include Pets"] = "包括宠物"
L["Incoming Heal"] = "即将到来的治疗"
L["Increase Precision Below"] = "精度提高的阈值"
L["Information"] = "信息"
L["Inherited"] = "继承"
L["Instakill"] = "秒杀"
L["Instance"] = "副本"
L["Instance Difficulty"] = "副本难度"
L["Instance Size Type"] = "副本大小类型"
L["Instance Type"] = "副本类型"
L["Instructor Razuvious"] = "教官拉苏维奥斯"
L["Insufficient Resources"] = "资源不足"
L["Intellect"] = "智力"
L["Interrupt"] = "打断"
L["Interrupt School"] = "打断类型"
L["Interrupted School Text"] = "打断类型文本"
L["Interruptible"] = "可打断"
L["Inverse"] = "反向"
L["Inverse Pet Behavior"] = "反向宠物行为"
L["Is Away from Keyboard"] = "暂离"
L["Is Exactly"] = "完全匹配"
L["Is Moving"] = "移动中"
L["Is Off Hand"] = "副手"
L["is useable"] = "可用的"
L["Island Expedition (Heroic)"] = "海岛探险（英雄）"
L["Island Expedition (Mythic)"] = "海岛探险（史诗）"
L["Island Expedition (Normal)"] = "海岛探险（普通）"
L["Island Expeditions (PvP)"] = "海岛探险（PvP）"
L["It might not work correctly on Classic!"] = "可能不能在怀旧服正确工作！"
L["It might not work correctly on Retail!"] = "可能不能在正式服正常工作！"
L["It might not work correctly with your version!"] = "可能无法在当前版本中正常工作！"
L["Item"] = "物品"
L["Item Bonus Id"] = "物品增益ID"
L["Item Bonus Id Equipped"] = "已装备物品增益ID"
L["Item Count"] = "物品数量"
L["Item Equipped"] = "已装备物品"
L["Item Id"] = "物品ID"
L["Item in Range"] = "物品在距离内"
L["Item Name"] = "物品名称"
L["Item Set Equipped"] = "已装备套装"
L["Item Set Id"] = "套装 ID"
L["Item Slot"] = "物品栏"
L["Item Slot String"] = "物品栏名称"
L["Item Type"] = "物品类型"
L["Item Type Equipped"] = "已装备物品类型"
L["Jan'alai"] = "加亚莱"
L["Jin'do the Hexxer"] = "妖术师金度"
L["Kael'thas Sunstrider"] = "凯尔萨斯·逐日者"
L["Kalecgos"] = "卡雷苟斯"
L["Karazhan"] = "卡拉赞"
L["Kaz'rogal"] = "卡兹洛加"
L["Keep Inside"] = "保持在内"
L["Kel'Thuzad"] = "克尔苏加德"
L["Kil'jaeden"] = "基尔加丹"
L["Kurinnaxx"] = "库林纳克斯"
L["Lady Vashj"] = "瓦丝琪"
L["Large"] = "大"
L["Latency"] = "延迟"
L["Least remaining time"] = "最小剩余时间"
L["Leaving"] = "离开"
L["Leech"] = "吸取"
L["Leech (%)"] = "吸血 (%)"
L["Leech Rating"] = "吸血等级"
L["Left"] = "左"
L["Left to Right"] = "从左到右"
L["Left, then Down"] = "向左，然后向下"
L["Left, then Up"] = "向左，然后向上"
L["Legacy Aura (disabled)"] = "传统光环（已禁用）"
L["Legacy Aura (disabled):"] = "传统光环（已禁用）："
L["Legacy Looking for Raid"] = "传统团队副本（随机）"
L["Legacy RGB Gradient"] = "传统 RGB 变色"
L["Legacy RGB Gradient Pulse"] = "传统 RGB 变色跳动"
L["Legacy Spellname"] = "传统法术名称"
L["Length"] = "长度"
L["Leotheras the Blind"] = "盲眼者莱欧瑟拉斯"
L["Level"] = "等级"
L["Limited"] = "有限的"
L["Lines & Particles"] = "线条和粒子"
L["Load Conditions"] = "加载条件"
L["Loatheb"] = "洛欧塞布"
L["Looking for Raid"] = "团队副本（随机）"
L["Loop"] = "循环"
L["Lost"] = "失去"
L["Low Damage"] = "低伤害"
L["Lower Than Tank"] = "比MT低"
L["Lucifron"] = "鲁西弗隆"
L["Maexxna"] = "迈克斯纳"
L["Magic"] = "魔法"
L["Magmadar"] = "玛格曼达"
L["Magtheridon"] = "玛瑟里顿"
L["Magtheridon's Lair"] = "玛瑟里顿的巢穴"
L["Maiden of Virtue"] = "贞节圣女"
L["Main Stat"] = "主属性"
L["Majordomo Executus"] = "管理者埃克索图斯"
L["Make sure you can trust the person who sent it!"] = "确保来源可靠！"
L["Malformed WeakAuras link"] = "错误的 WeakAuras 链接"
L["Manual Repair Confirmation Dialog"] = "手动修复确认对话框"
L["Manual Rotation"] = "手动旋转"
L["Marked First"] = "标记为最先"
L["Marked Last"] = "标记为最后"
L["Master"] = "主声道"
L["Mastery (%)"] = "精通 (%)"
L["Mastery Rating"] = "精通等级"
L["Match Count"] = "计数匹配"
L["Match Count per Unit"] = "每个单位的匹配数量"
L["Matches (Pattern)"] = "匹配（表达式）"
L["Max Char "] = "最大字符数"
L["Max Charges"] = "最大充能次数"
L["Maximum"] = "最大"
L["Maximum Estimate"] = "最大预估"
L["Medium"] = "中"
L["Message"] = "信息"
L["Message Type"] = "信息类型"
L["Message type:"] = "信息类型："
L["Meta Data"] = "元数据"
L["Mine"] = "玩家自身"
L["Minimum"] = "最小"
L["Minimum Estimate"] = "最小预估"
L["Minus (Small Nameplate)"] = "次要目标（小型姓名版）"
L["Mirror"] = "镜像"
L["Miss"] = "未命中"
L["Miss Type"] = "未命中类型"
L["Missed"] = "未命中"
L["Missing"] = "缺少"
L["Moam"] = "莫阿姆"
L["Model"] = "模型"
L["Modern Blizzard (1h 3m | 3m 7s | 10s | 2.4)"] = "现代暴雪格式 （1小时 3分钟 | 3分钟 7秒 | 10秒 | 2.4）"
L["Molten Core"] = "熔火之心"
L["Monochrome"] = "单色"
L["Monochrome Outline"] = "单色轮廓"
L["Monochrome Thick Outline"] = "单色粗轮廓"
L["Monster Emote"] = "怪物表情"
L["Monster Party"] = "怪物小队"
L["Monster Say"] = "怪物说"
L["Monster Whisper"] = "怪物密语"
L["Monster Yell"] = "怪物大喊"
L["Moroes"] = "莫罗斯"
L["Morogrim Tidewalker"] = "莫洛格里·踏潮者"
L["Most remaining time"] = "最大剩余时间"
L["Mother Shahraz"] = "莎赫拉丝主母"
L["Mounted"] = "在坐骑上"
L["Mouse Cursor"] = "鼠标"
L["Movement Speed Rating"] = "移动速度等级"
L["Multi-target"] = "多目标"
L["M'uru"] = "穆鲁"
L["Mythic Keystone"] = "史诗钥石"
L["Mythic+ Affix"] = "大秘境词缀"
L["Nalorakk"] = "纳洛拉克"
L["Name"] = "名称"
L["Name of Caster's Target"] = "施法者目标的名称"
L["Name/Realm of Caster's Target"] = "施法者目标的名称/服务器"
L["Nameplate"] = "姓名板"
L["Nameplate Type"] = "姓名版类型"
L["Nameplates"] = "姓名板"
L["Names of affected Players"] = "受影响玩家的姓名"
L["Names of unaffected Players"] = "未受影响玩家的姓名"
L["Nature Resistance"] = "自然抗性"
L["Naxxramas"] = "纳克萨玛斯"
L["Nefarian"] = "奈法利安"
L["Netherspite"] = "虚空幽龙"
L["Neutral"] = "中立"
L["Never"] = "从不"
L["Next"] = "下一个"
L["Next Combat"] = "下次战斗"
L["Next Encounter"] = "下次首领战斗"
L["Nightbane"] = "夜之魇"
L["No Children"] = "没有子项目"
L["No Extend"] = "不伸展"
L["No Instance"] = "野外"
L["No Profiling information saved."] = "没有已保存的性能分析信息。"
L["None"] = "无"
L["Non-player Character"] = "NPC"
L["Normal"] = "正常形态"
L["Not in Group"] = "不在小队中"
L["Not on Cooldown"] = "不在冷却中"
L["Not On Threat Table"] = "不在仇恨列表"
L["Note, that cross realm transmission is possible if you are on the same group"] = "注意：如果你和其它服务器的玩家在同一个群组内时，跨服务器传输是可行的"
L["Note: 'Hide Alone' is not available in the new aura tracking system. A load option can be used instead."] = "注意：“不在队伍时隐藏”在新光环追踪系统中不可用，使用加载选项来达到相同效果。"
L["Note: The available text replacements for multi triggers match the normal triggers now."] = "注意：现在普通触发器也可使用多目标触发器可用的文本替换。"
L["Note: This trigger type estimates the range to the hitbox of a unit. The actual range of friendly players is usually 3 yards more than the estimate. Range checking capabilities depend on your current class and known abilities as well as the type of unit being checked. Some of the ranges may also not work with certain NPCs.|n|n|cFFAAFFAAFriendly Units:|r %s|n|cFFFFAAAAHarmful Units:|r %s|n|cFFAAAAFFMiscellanous Units:|r %s"] = "注意：此类型的触发器只是在预估和单位之间的距离，实际和友方玩家的距离一般要比预估值多 3 码。距离预估的可用数值取决于你的职业、已学技能与目标单位类型，某些距离数值不适用于特定NPC。|n|n|cFFAAFFAA友方单位：|r %s|n|cFFFFAAAA敌方单位：|r %s|n|cFFAAAAFF非特定单位：|r %s"
L["Noth the Plaguebringer"] = "瘟疫使者诺斯"
L["NPC"] = "NPC"
L["Npc ID"] = "NPC ID"
L["Number"] = "数字"
L["Number Affected"] = "影响数"
L["Object"] = "对象"
L["Officer"] = "官员"
L["Offset from progress"] = "于进度偏移量"
L["Offset Timer"] = "位移计时器"
L["Old Blizzard (2h | 3m | 10s | 2.4)"] = "传统暴雪格式 （2h | 3m | 10s | 2.4）"
L["On Cooldown"] = "冷却中"
L["On Taxi"] = "在载具中"
L["Only if BigWigs shows it on it's bar"] = "仅当其在 BigWigs 条上出现时"
L["Only if DBM shows it on it's bar"] = "仅当其在 DBM 条上出现时"
L["Only if on a different realm"] = "仅当在不同服务器上"
L["Only if Primary"] = "仅当是首要时"
L["Only if selected"] = "仅当已选择"
L["Onyxia"] = "奥妮克希亚"
L["Onyxia's Lair"] = "奥妮克希亚的巢穴"
L["Opaque"] = "不透明"
L["Opera Hall"] = "歌剧院"
L["Option Group"] = "选项组"
L["Options will finish loading after combat ends."] = "选项窗口将在战斗结束后加载"
L["Options will open after the login process has completed."] = "选项将在登录流程完成后打开"
L["Orbit"] = "轨迹"
L["Orientation"] = "方向"
L["Ossirian the Unscarred"] = "无疤者奥斯里安"
L["Other"] = "其他"
L["Other Addons"] = "其他插件"
L["Other Events"] = "其他事件"
L["Ouro"] = "奥罗"
L["Outline"] = "轮廓"
L["Overhealing"] = "过量治疗"
L["Overkill"] = "过量伤害"
L["Overlay %s"] = "覆盖层 %s"
L["Overlay Charged Combo Points"] = "充能连击点覆盖层"
L["Overlay Cost of Casts"] = "覆盖层显示施法消耗"
L["Overlay Latency"] = "延迟覆盖层"
L["Parry"] = "招架"
L["Parry (%)"] = "偏斜 (%)"
L["Parry Rating"] = "偏斜等级"
L["Party"] = "小队"
L["Party Kill"] = "团/队击杀"
L["Patchwerk"] = "帕奇维克"
L["Path of Ascension: Courage"] = "晋升之路：勇气"
L["Path of Ascension: Humility"] = "晋升之路：谦逊"
L["Path of Ascension: Loyalty"] = "晋升之路：忠诚"
L["Path of Ascension: Wisdom"] = "晋升之路：智慧"
L["Paused"] = "已暂停"
L["Periodic Spell"] = "周期法术"
L["Personal Resource Display"] = "个人资源显示"
L["Pet"] = "宠物"
L["Pet Behavior"] = "宠物姿态"
L["Pet Specialization"] = "宠物专精"
L["Pet Spell"] = "宠物法术"
L["Pets only"] = "仅宠物"
L["Phase"] = "阶段"
L["Pixel Glow"] = "发光像素"
L["Placement"] = "放置"
L["Placement Mode"] = "放置模式"
L["Play"] = "播放"
L["Player"] = "玩家"
L["Player Character"] = "玩家角色"
L["Player Class"] = "玩家职业"
L["Player Covenant"] = "玩家盟约"
L["Player Effective Level"] = "玩家有效等级"
L["Player Experience"] = "玩家经验值"
L["Player Faction"] = "玩家阵营"
L["Player Level"] = "玩家等级"
L["Player Name/Realm"] = "玩家名称/服务器"
L["Player Race"] = "玩家种族"
L["Player(s) Affected"] = "受影响的玩家名称"
L["Player(s) Not Affected"] = "未受影响的玩家名称"
L["Player/Unit Info"] = "玩家/单位信息"
L["Players and Pets"] = "玩家和宠物"
L["Poison"] = "中毒"
L["Power"] = "能量"
L["Power (%)"] = "能量(%%)"
L["Power Deficit"] = "能量值缺口"
L["Power Type"] = "能量类型"
L["Precision"] = "精度"
L["Preset"] = "预设"
L["Prince Malchezaar"] = "玛克扎尔王子"
L["Princess Huhuran"] = "哈霍兰公主"
L["Print Profiling Results"] = "输出性能分析结果"
L["Profiling already started."] = "性能分析已开始。"
L["Profiling automatically started."] = "性能分析自动开始。"
L["Profiling not running."] = "性能分析未开始。"
L["Profiling started."] = "性能分析开始。"
L["Profiling started. It will end automatically in %d seconds"] = "性能分析开始，将在%d秒后结束。"
L["Profiling still running, stop before trying to print."] = "性能分析正在进行，请在打印前停止。"
L["Profiling stopped."] = "性能分析停止。"
L["Progress"] = "进度"
L["Progress Total"] = "总进度"
L["Progress Value"] = "进度值"
L["Pulse"] = "脉动"
L["PvP Flagged"] = "PvP 状态"
L["PvP Talent %i"] = "PvP 天赋 %i"
L["PvP Talent selected"] = "PvP 天赋选择"
L["PvP Talent Selected"] = "已选择PvP天赋"
L["Queued Action"] = "队列中动作"
L["Radius"] = "半径"
L["Rage Winterchill"] = "雷基·冬寒"
L["Ragnaros"] = "拉格纳罗斯"
L["Raid"] = "团队"
L["Raid (Heroic)"] = "团队副本（英雄）"
L["Raid (Mythic)"] = "团队副本（史诗）"
L["Raid (Normal)"] = "团队副本（普通）"
L["Raid (Timewalking)"] = "团队副本（时空漫游）"
L["Raid Mark"] = "团队标记"
L["Raid Role"] = "团队职责"
L["Raid Warning"] = "团队警告"
L["Raids"] = "团队地下城"
L["Range"] = "远程攻击"
L["Range Check"] = "距离检查"
L["Rare"] = "稀有"
L["Rare Elite"] = "稀有精英"
L["Rated Arena"] = "竞技场"
L["Rated Battleground"] = "评级战场"
L["Raw Threat Percent"] = "原始仇恨百分比"
L["Razorgore the Untamed"] = "狂野的拉佐格尔"
L["Ready Check"] = "就位确认"
L["Realm"] = "服务器"
L["Realm Name"] = "服务器名称"
L["Realm of Caster's Target"] = "施法者目标的服务器"
L["Receiving display information"] = "从 %s 中接收群组信息"
L["Reflect"] = "反射"
L["Region type %s not supported"] = "不支持域类型 %s"
L["Relative"] = "相对持续时间"
L["Relative X-Offset"] = "相对 X 偏移"
L["Relative Y-Offset"] = "相对 Y 偏移"
L["Reliquary of Souls"] = "灵魂之匣"
L["Remaining Duration"] = "剩余时间"
L["Remaining Time"] = "剩余时间"
L["Remove Obsolete Auras"] = "移除废弃的光环"
L["Repair"] = "修复"
L["Repeat"] = "重复"
L["Report Summary"] = "报告"
L["Requested display does not exist"] = "请求接收的图示不存在"
L["Requested display not authorized"] = "请求接收的图示没有授权"
L["Requesting display information from %s ..."] = "请求来 %s 的显示信息"
L["Require Valid Target"] = "需要有效目标"
L["Resist"] = "抵抗"
L["Resisted"] = "被抵抗"
L["Resolve collisions dialog"] = [=[你安装的插件中定义了与|cFF8800FFWeakAuras|r 图示相同名称的变量。

你必须重新命名你的图示。

已解决: |cFFFF0000]=]
L["Resolve collisions dialog singular"] = [=[你安装的插件中定义了与|cFF8800FFWeakAuras|r 图示相同名称的变量。

你必须重新命名你的图示。

已解决: |cFFFF0000]=]
L["Resolve collisions dialog startup"] = [=[你安装的插件中定义了与|cFF8800FFWeakAuras|r 图示相同名称的变量。

你必须重新命名你的图示。

已解决: |cFFFF0000]=]
L["Resolve collisions dialog startup singular"] = [=[你安装的插件中定义了与|cFF8800FFWeakAuras|r 图示相同名称的变量。

你必须重新命名你的图示。

已解决: |cFFFF0000]=]
L["Rested"] = "休息"
L["Rested Experience"] = "休息经验值"
L["Rested Experience (%)"] = "休息经验值百分比"
L["Resting"] = "休息状态"
L["Resurrect"] = "复活"
L["Right"] = "右"
L["Right to Left"] = "从右到左"
L["Right, then Down"] = "向右，然后向下"
L["Right, then Up"] = "向右，然后向上"
L["Role"] = "职责"
L["Rotate Left"] = "向左旋转"
L["Rotate Right"] = "向右旋转"
L["Rotation"] = "旋转"
L["Round"] = "四舍五入"
L["Round Mode"] = "四舍五入模式"
L["Ruins of Ahn'Qiraj"] = "安其拉废墟"
L["Run Custom Code"] = "运行自定义代码"
L["Run Speed (%)"] = "跑步速度 (%)"
L["Rune"] = "符文"
L["Rune #1"] = "符文 #1"
L["Rune #2"] = "符文 #2"
L["Rune #3"] = "符文 #3"
L["Rune #4"] = "符文 #4"
L["Rune #5"] = "符文 #5"
L["Rune #6"] = "符文 #6"
L["Runes Count"] = "符文计数"
L["Sapphiron"] = "萨菲隆"
L["Say"] = "说"
L["Scale"] = "缩放"
L["Scenario"] = "场景战役"
L["Scenario (Heroic)"] = "场景战役（英雄）"
L["Scenario (Normal)"] = "场景战役（普通）"
L["Screen/Parent Group"] = "屏幕/上级群组"
L["Second"] = "第二"
L["Second Value of Tooltip Text"] = "鼠标提示文本的第二项值"
L["Seconds"] = "秒"
L["Select Frame"] = "选择框体"
L["Separator"] = "分隔符"
L["Set IDs can be found on websites such as classic.wowhead.com/item-sets"] = "套装 ID 可以在一些数据网站上找到（例如：classic.wowhead.com/item-sets）"
L["Set IDs can be found on websites such as tbc.wowhead.com/item-sets"] = "套装 ID 可以在一些数据网站上找到（例如：tbc.wowhead.com/item-sets）"
L["Set IDs can be found on websites such as wowhead.com/item-sets"] = "套装 ID 可以在一些数据网站上找到（例如：wowhead.com/item-sets）"
L["Set Maximum Progress"] = "设置最大进度"
L["Set Minimum Progress"] = "设置最小进度"
L["Shade of Akama"] = "阿卡玛之影"
L["Shade of Aran"] = "埃兰之影"
L["Shadow Resistance"] = "暗影抗性"
L["Shake"] = "晃动"
L["Shazzrah"] = "沙斯拉尔"
L["Shift-Click to resume addon execution."] = "Shift + 点击来继续插件的执行"
L["Show"] = "显示"
L["Show Absorb"] = "显示吸收量"
L["Show CD of Charge"] = "显示可用次数充能 CD"
L["Show Code"] = "显示代码"
L["Show GCD"] = "显示 GCD"
L["Show Global Cooldown"] = "显示公共冷却"
L["Show Heal Absorb"] = "显示治疗吸收量"
L["Show Incoming Heal"] = "显示即将到来的治疗"
L["Show On"] = "显示于"
L["Show Rested Overlay"] = "显示休息覆盖层"
L["Shrink"] = "收缩"
L["Silithid Royalty"] = "安其拉三宝"
L["Simple"] = "简单"
L["Since Apply"] = "自从获得"
L["Since Apply/Refresh"] = "自从获得/刷新"
L["Since Charge Gain"] = "自从获得充能"
L["Since Charge Lost"] = "自从失去充能"
L["Since Ready"] = "自从就绪"
L["Since Stack Gain"] = "自从获得层数"
L["Since Stack Lost"] = "自从失去层数"
L["Size & Position"] = "尺寸和位置"
L["Slide from Bottom"] = "从下开始滑动"
L["Slide from Left"] = "从左开始滑动"
L["Slide from Right"] = "从右开始滑动"
L["Slide from Top"] = "从上开始滑动"
L["Slide to Bottom"] = "滑动到下方"
L["Slide to Left"] = "滑动到左边"
L["Slide to Right"] = "滑动到右边"
L["Slide to Top"] = "滑动到上方"
L["Slider"] = "滑动条"
L["Small"] = "小"
L["Smart Group"] = "智能群组"
L["Sound"] = "音效"
L["Sound by Kit ID"] = "根据 ID 选择音效"
L["Source"] = "来源"
L["Source Affiliation"] = "来源所属"
L["Source GUID"] = "来源GUID"
L["Source Name"] = "来源名称"
L["Source NPC Id"] = "来源 NPC ID"
L["Source Object Type"] = "来源类型"
L["Source Raid Mark"] = "来源团队标记"
L["Source Reaction"] = "来源反应"
L["Source Unit"] = "来源单位"
L["Source Unit Name/Realm"] = "来源单位名称/服务器"
L["Space"] = "空白"
L["Spacing"] = "间距"
L["Spark"] = "闪光"
L["Spec Role"] = "专精职责"
L["Specific Type"] = "特定类型"
L["Specific Unit"] = "指定单位"
L["Spell"] = "法术"
L["Spell (Building)"] = "法术(攻城伤害)"
L["Spell Activation Overlay Glow"] = "法术可用时发亮"
L["Spell Cost"] = "法术消耗"
L["Spell Count"] = "法术计数"
L["Spell ID"] = "法术 ID"
L["Spell Id"] = "法术 ID"
L["Spell ID:"] = "法术 ID："
L["Spell IDs:"] = "法术 ID："
L["Spell in Range"] = "在法术可用范围内"
L["Spell Known"] = "学会的法术"
L["Spell Name"] = "法术名称"
L["Spell Usable"] = "法术可用"
L["Spin"] = "旋转"
L["Spiral"] = "螺旋"
L["Spiral In And Out"] = "螺旋进入和退出"
L["Stack Count"] = "堆叠数"
L["Stacks"] = "层数"
L["Stage"] = "阶段"
L["Stagger Scale"] = "醉拳缩放比例"
L["Stamina"] = "耐力"
L["Stance/Form/Aura"] = "姿态/形态/光环"
L["Standing"] = "级别"
L["Star Shake"] = "摇动"
L["Start"] = "开始"
L["Start Now"] = "现在开始"
L["Status"] = "状态"
L["Stolen"] = "偷取"
L["Stop"] = "停止"
L["Strength"] = "力量"
L["String"] = "字符串"
L["Subtract Cast"] = "减去施法时间"
L["Subtract Channel"] = "减去引导时间"
L["Subtract GCD"] = "减去 GCD"
L["Sulfuron Harbinger"] = "萨弗隆先驱者"
L["Summon"] = "召唤"
L["Supports multiple entries, separated by commas"] = "支持多个条目，由英文逗号分隔"
L[ [=[Supports multiple entries, separated by commas
]=] ] = "支持多个条目，由英文逗号分隔"
L["Supports multiple entries, separated by commas. Group Zone IDs must be prefixed with 'g', e.g. g277."] = "支持多个条目，由英文逗号分隔。区域组ID必须以g开头，例如 g277。"
L["Supremus"] = "苏普雷姆斯"
L["Swing"] = "近战攻击"
L["Swing Timer"] = "近战攻击计时器"
L["Swipe"] = "旋转动画"
L["System"] = "系统"
L["Tab "] = "标签页 "
L["Talent"] = "天赋"
L["Talent |cFFFF0000Not|r Known"] = "天赋|cFFFF0000不|r可用"
L["Talent |cFFFF0000Not|r Selected"] = "天赋|cFFFF0000未|r选择"
L["Talent Known"] = "天赋可用"
L["Talent Selected"] = "天赋选择"
L["Talent selected"] = "天赋选择"
L["Talent Specialization"] = "专精"
L["Tanking And Highest"] = "做T并且最高"
L["Tanking But Not Highest"] = "做T但不是最高"
L["Target"] = "目标"
L["Targeted"] = "被选中"
L["Tempest Keep"] = "风暴要塞"
L["Terestian Illhoof"] = "特雷斯坦·邪蹄"
L["Teron Gorefiend"] = "塔隆·血魔"
L["Text"] = "文本"
L["Text-to-speech"] = "文本转语音"
L["Thaddius"] = "塔迪乌斯"
L["The aura has overwritten the global '%s', this might affect other auras."] = "此光环覆盖了全局变量'%s'，可能会影响其他光环。"
L["The Battle for Mount Hyjal"] = "海加尔山之战"
L["The Curator"] = "馆长"
L["The effective level differs from the level in e.g. Time Walking dungeons."] = "有效等级和实际等级的差，例如：在时光漫游副本中的等级差。"
L["The Four Horsemen"] = "天启四骑士"
L["The Illidari Council"] = "伊利达雷议会"
L["The Lurker Below"] = "鱼斯拉"
L["The Prophet Skeram"] = "预言者斯克拉姆"
L["The Sunwell Plateau"] = "太阳之井"
L["The trigger number is optional, and uses the trigger providing dynamic information if not specified."] = "触发器编号是可选的，在未指定的情况下会自动使用触发器提供的动态信息。"
L["There are %i updates to your auras ready to be installed!"] = "有 %i 个光环更新已经准备好安装了！"
L["Thick Outline"] = "粗轮廓"
L["Thickness"] = "粗细"
L["Third"] = "第三"
L["Third Value of Tooltip Text"] = "鼠标提示文本的第三项值"
L["This aura contains custom Lua code."] = "这个光环包含自定义 Lua 代码"
L["This aura has legacy aura trigger(s), which are no longer supported."] = "此光环包含了不再支持的传统光环触发器。"
L["This aura was created with a newer version of WeakAuras."] = "这个光环是由更新版本的 WeakAuras 创建的"
L["This aura was created with the Classic version of World of Warcraft."] = "此光环是在魔兽世界怀旧服中创建的"
L["This aura was created with the retail version of World of Warcraft."] = "此光环是在魔兽世界正式服中创建的"
L["This import requires a newer WeakAuras version."] = "此导入需要更新的 WeakAuras 版本。"
L["This is a modified version of your aura, |cff9900FF%s.|r"] = "这是一个你光环的修改版本，|cff9900FF%s.|r"
L["This is a modified version of your group, |cff9900FF%s.|r"] = "这是一个你群组的修改版本，|cff9900FF%s.|r"
L["Threat Percent"] = "仇恨百分比"
L["Threat Situation"] = "仇恨状况"
L["Threat Value"] = "仇恨值"
L["Tick"] = "进度指示"
L["Tier "] = "层 "
L["Time Format"] = "时间格式"
L["Time in GCDs"] = "GCD 时间"
L["Timed"] = "指定时间"
L["Timer Id"] = "计时器 ID"
L["Toggle"] = "切换"
L["Toggle List"] = "打开或关闭列表"
L["Toggle Options Window"] = "打开或关闭选项窗口"
L["Toggle Performance Profiling Window"] = "显示/隐藏性能分析窗口"
L["Tooltip"] = "鼠标提示"
L["Tooltip Value 1"] = "鼠标提示值 1"
L["Tooltip Value 2"] = "鼠标提示值 2"
L["Tooltip Value 3"] = "鼠标提示值 3"
L["Top"] = "上"
L["Top Left"] = "左上"
L["Top Right"] = "右上"
L["Top to Bottom"] = "从上到下"
L["Torghast"] = "托加斯特"
L["Total"] = "总量"
L["Total Duration"] = "总时长"
L["Total Experience"] = "最大经验值"
L["Total Match Count"] = "总共匹配计数"
L["Total Stacks"] = "总层数"
L["Total stacks over all matches"] = "所有单位的总层数"
L["Total Unit Count"] = "总共单位计数"
L["Total Units"] = "全部单位"
L["Totem"] = "图腾"
L["Totem #%i"] = "图腾 #%i"
L["Totem Name"] = "图腾名"
L["Totem Name Pattern Match"] = "图腾名称规则匹配"
L["Totem Number"] = "图腾编号"
L["Track Cooldowns"] = "追踪冷却计时"
L["Tracking Charge %i"] = "追踪充能 %i"
L["Tracking Charge CDs"] = "追踪充能冷却计时"
L["Tracking Only Cooldown"] = "只追踪冷却计时"
L["Transmission error"] = "传输错误"
L["Trigger"] = "触发器"
L["Trigger %i"] = "触发器 %i"
L["Trigger 1"] = "触发器 1"
L["Trigger State Updater (Advanced)"] = "触发器状态更新器（高级）"
L["Trigger Update"] = "触发器更新"
L["Trigger:"] = "触发器"
L["Trivial (Low Level)"] = "低等级（灰色）"
L["True"] = "真"
L["Twin Emperors"] = "双子皇帝"
L["Type"] = "类型"
L["Unaffected"] = "未受影响"
L["Undefined"] = "未定义"
L["Unit"] = "单位"
L["Unit Characteristics"] = "单位特性"
L["Unit Destroyed"] = "单位被摧毁(如:图腾,治疗结界)"
L["Unit Died"] = "单位死亡"
L["Unit Dissipates"] = "单位消散"
L["Unit Frame"] = "单位框体"
L["Unit Frames"] = "单位框架"
L["Unit is Unit"] = "同一单位"
L["Unit Name"] = "单位名称"
L["Unit Name/Realm"] = "单位名称/服务器"
L["Units Affected"] = "受影响的单位"
L["Unlimited"] = "无限制"
L["Up"] = "上"
L["Up, then Left"] = "向上，然后向左"
L["Up, then Right"] = "向上，然后向右"
L["Update Auras"] = "更新光环"
L["Usage:"] = "用法："
L["Use /wa minimap to show the minimap icon again."] = "使用 /wa minimap 来再次显示小地图图标"
L["Use Custom Color"] = "使用自定义颜色"
L["Vaelastrasz the Corrupt"] = "堕落的瓦拉斯塔兹"
L["Value"] = "当前量"
L["Values/Remaining Time above this value are displayed as full progress."] = "值/剩余时间高于此值的将被显示为满进度。"
L["Values/Remaining Time below this value are displayed as no progress."] = "值/剩余时间低于此值的将被显示为无进度。"
L["Versatility (%)"] = "全能 (%)"
L["Versatility Rating"] = "全能等级"
L["Version: "] = "版本："
L["Viscidus"] = "维希度斯"
L["Visibility"] = "可见性"
L["Visions of N'Zoth"] = "恩佐斯的幻象"
L["Void Reaver"] = "空灵机甲"
L["War Mode Active"] = "战争模式开启"
L["Warfront (Heroic)"] = "战争前线（英雄）"
L["Warfront (Normal)"] = "战争前线（普通）"
L["Warning"] = "警告"
L["Warning for unknown aura:"] = "未知光环警告："
L["Warning: Full Scan auras checking for both name and spell id can't be converted."] = "警告：对名称和法术 ID 同时进行完整扫描的光环无法进行转换。"
L["Warning: Name info is now available via %affected, %unaffected. Number of affected group members via %unitCount. Some options behave differently now. This is not automatically adjusted."] = "警告：现在名称信息通过 %affected, %unaffected，受影响的团队成员数量通过 %unitCount 提供。一些选项的工作方式发生了变化，且不会自动进行调整。"
L["Warning: Tooltip values are now available via %tooltip1, %tooltip2, %tooltip3 instead of %s. This is not automatically adjusted."] = "警告：鼠标提示值现在将通过 %tooltip1, %tooltip2, %tooltip3 显示（取代通过 %s ）。这些变化将不会自动调整。"
L["WeakAuras Built-In (63:42 | 3:07 | 10 | 2.4)"] = "WeakAuras内置格式 （63:42 | 3:07 | 10 | 2.4）"
L["WeakAuras has encountered an error during the login process. Please report this issue at https://github.com/WeakAuras/Weakauras2/issues/new."] = "WeakAuras 在登录过程中遇到了一个错误，请于此处报告这个错误：https://github.com/WeakAuras/Weakauras2/issues/new"
L["WeakAuras Profiling"] = "WeakAuras性能分析"
L["WeakAuras Profiling Report"] = "WeakAuras性能分析报告"
L["Weapon"] = "武器"
L["Weapon Enchant"] = "武器附魔"
L["Weapon Enchant / Fishing Lure"] = "武器附魔 / 鱼饵"
L["What do you want to do?"] = "想做点什么？"
L["Whisper"] = "密语"
L["Whole Area"] = "整个区域"
L["Width"] = "宽度"
L["Wobble"] = "摇晃"
L["World Boss"] = "世界首领"
L["Wrap"] = "折叠"
L["Writing to the WeakAuras table is not allowed."] = "写入WeakAuras表是不被允许的。"
L["X-Offset"] = "X 偏移"
L["Yell"] = "大喊"
L["Y-Offset"] = "Y 偏移"
L["You already have this group/aura. Importing will create a duplicate."] = "此组/光环已经存在，继续导入将会复制这些数据。"
L["Your next encounter will automatically be profiled."] = "你的下次首领战斗会自动进行性能分析。"
L["Your next instance of combat will automatically be profiled."] = "你的下次战斗会自动进行性能分析。"
L["Your scheduled automatic profile has been cancelled."] = "你计划的性能分析已被取消。"
L["Your threat as a percentage of the tank's current threat."] = "你的仇恨占当前坦克仇恨的百分比。"
L["Your threat on the mob as a percentage of the amount required to pull aggro. Will pull aggro at 100."] = "你的仇恨占获得仇恨预期的百分比。达到100时会获得仇恨。"
L["Your total threat on the mob."] = "你对怪物的总仇恨。"
L["Zone ID(s)"] = "单个/多个区域 ID"
L["Zone Name"] = "区域名称"
L["Zoom"] = "缩放"
L["Zul'Aman"] = "祖阿曼"
L["Zul'Gurub"] = "祖尔格拉布"

