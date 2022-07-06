local f = CreateFrame("frame")
f:RegisterEvent("ADDON_LOADED")

f:SetScript("OnEvent", function(self, event, addon)

    if (addon == "Blizzard_TimeManager") then
        for i, v in pairs({
            MinimapBorder,
            MinimapBorderTop,
            MiniMapMailBorder,
            QueueStatusMinimapButtonBorder,
            select(1, TimeManagerClockButton:GetRegions())
        }) do
            v:SetVertexColor(.2, .2, .2)
        end

        select(2, TimeManagerClockButton:GetRegions()):SetVertexColor(1, 1, 1)

        self:UnregisterEvent("ADDON_LOADED")
        f:SetScript("OnEvent", nil)
    end
end)