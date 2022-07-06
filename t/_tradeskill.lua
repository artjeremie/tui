local f = CreateFrame("frame")
f:RegisterEvent("ADDON_LOADED")

f:SetScript("OnEvent", function(self, event, name)
    if (name == "Blizzard_TradeSkillUI") then
        for i, v in pairs({
            TradeSkillFrame.NineSlice.TopEdge,
            TradeSkillFrame.NineSlice.RightEdge,
            TradeSkillFrame.NineSlice.BottomEdge,
            TradeSkillFrame.NineSlice.LeftEdge,
            TradeSkillFrame.NineSlice.TopRightCorner,
            TradeSkillFrame.NineSlice.TopLeftCorner,
            TradeSkillFrame.NineSlice.BottomLeftCorner,
            TradeSkillFrame.NineSlice.BottomRightCorner,
        }) do
            v:SetVertexColor(.15, .15, .15)
        end

        for i, v in pairs({
            TradeSkillFrame.Bg,
            TradeSkillFrame.TitleBg
        }) do
            v:SetVertexColor(.3, .3, .3)
        end

        self:UnregisterEvent("ADDON_LOADED")
        f:SetScript("OnEvent", nil)
    end
end)