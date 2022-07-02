-- UI error text
UIErrorsFrame:UnregisterEvent("UI_ERROR_MESSAGE")

-- Loot rolls
AlertFrame:UnregisterEvent("LOOT_ITEM_ROLL_WON")
AlertFrame:UnregisterEvent("SHOW_LOOT_TOAST")

-- Boss banner
BossBanner:UnregisterEvent("ENCOUNTER_LOOT_RECEIVED")
BossBanner:UnregisterEvent("BOSS_KILL")