local L = BigWigs:NewBossLocale("General Rajaxx", "ruRU")
if not L then return end
if L then
	--L.wave = "Waves Warnings"
	--L.wave_desc = "Warn for incoming waves"

	--L.wave_trigger1a = "Kill first, ask questions later... Incoming!"
	--L.wave_trigger1b = "Remember, Rajaxx, when I said I'd kill you last?"
	--L.wave_trigger3 = "The time of our retribution is at hand! Let darkness reign in the hearts of our enemies!"
	--L.wave_trigger4 = "No longer will we wait behind barred doors and walls of stone! No longer will our vengeance be denied! The dragons themselves will tremble before our wrath!"
	--L.wave_trigger5 = "Fear is for the enemy! Fear and death!"
	--L.wave_trigger6 = "Staghelm will whimper and beg for his life, just as his whelp of a son did! One thousand years of injustice will end this day!"
	--L.wave_trigger7 = "Fandral! Your time has come! Go and hide in the Emerald Dream and pray we never find you!"
	--L.wave_trigger8 = "Impudent fool! I will kill you myself!"

	--L.wave_message = "Wave (%d/8)"
end

L = BigWigs:NewBossLocale("Buru the Gorger", "ruRU")
if L then
	L.fixate = "Сосредоточение внимания"
	L.fixate_desc = "Сосредотачивается на цели, игнорируя угрозу от других атакующих."
end

L = BigWigs:NewBossLocale("Ossirian the Unscarred", "ruRU")
if L then
	L.debuff = "Слабость"
	L.debuff_desc = "Предупреждать о наложении слабости на игроков."
end

L = BigWigs:NewBossLocale("Ruins of Ahn'Qiraj Trash", "ruRU")
if L then
	L.guardian = "Анубисат-страж"
end
