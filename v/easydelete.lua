local tui = CreateFrame("Frame")
tui:RegisterEvent("PLAYER_LOGIN")
tui:SetScript("OnEvent", function(self, event)

    -- Delete item or gear above rare without typing DELETE
    hooksecurefunc(StaticPopupDialogs ["DELETE_GOOD_ITEM"], "OnShow", function(s)
        s.editBox:SetText(DELETE_ITEM_CONFIRM_STRING)
    end)
end)