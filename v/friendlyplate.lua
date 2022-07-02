local tui = CreateFrame("Frame")
tui:RegisterEvent("PLAYER_ENTERING_WORLD")
tui:SetScript("OnEvent", function(self, event)

    -- Set the size for friendly nameplates
    C_NamePlate.SetNamePlateFriendlySize(70, 20)
end)