local f = CreateFrame("frame")
f:RegisterEvent("ADDON_LOADED")

f:SetScript("OnEvent", function(self, event, name)
    if (name == "Blizzard_ChallengesUI") then
        for i, v in pairs({
            ChallengesFrameInset.NineSlice.TopEdge,
            ChallengesFrameInset.NineSlice.TopRightCorner,
            ChallengesFrameInset.NineSlice.RightEdge,
            ChallengesFrameInset.NineSlice.BottomRightCorner,
            ChallengesFrameInset.NineSlice.BottomEdge,
            ChallengesFrameInset.NineSlice.BottomLeftCorner,
            ChallengesFrameInset.NineSlice.LeftEdge,
            ChallengesFrameInset.NineSlice.TopLeftCorner
        }) do
            v:SetVertexColor(.3, .3, .3)
        end

        self:UnregisterEvent("ADDON_LOADED")
        f:SetScript("OnEvent", nil)
    end
end)