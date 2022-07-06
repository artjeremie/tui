local f = CreateFrame("frame")
f:RegisterEvent("ADDON_LOADED")

f:SetScript("OnEvent", function(self, event, name)
    if (name == "Blizzard_AchievementUI") then
        for i, v in pairs({
            AchievementFrameHeaderRight,
            AchievementFrameHeaderLeft,
            AchievementFrameWoodBorderTopLeft,
            AchievementFrameWoodBorderBottomLeft,
            AchievementFrameWoodBorderTopRight,
            AchievementFrameWoodBorderBottomRight,
            AchievementFrameMetalBorderBottom,
            AchievementFrameMetalBorderBottomLeft,
            AchievementFrameMetalBorderBottomRight,
            AchievementFrameMetalBorderLeft,
            AchievementFrameMetalBorderRight,
            AchievementFrameMetalBorderTop,
            AchievementFrameMetalBorderTopLeft,
            AchievementFrameMetalBorderTopRight
        }) do
            v:SetVertexColor(.15, .15, .15)
        end

        self:UnregisterEvent("ADDON_LOADED")
        f:SetScript("OnEvent", nil)
    end
end)