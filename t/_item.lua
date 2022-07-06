local f = CreateFrame("frame")
f:RegisterEvent("ADDON_LOADED")

f:SetScript("OnEvent", function(self, event)

    for i, v in pairs({
        ItemTextFrame.NineSlice.TopEdge,
        ItemTextFrame.NineSlice.RightEdge,
        ItemTextFrame.NineSlice.BottomEdge,
        ItemTextFrame.NineSlice.LeftEdge,
        ItemTextFrame.NineSlice.TopRightCorner,
        ItemTextFrame.NineSlice.TopLeftCorner,
        ItemTextFrame.NineSlice.BottomLeftCorner,
        ItemTextFrame.NineSlice.BottomRightCorner,
    }) do
        v:SetVertexColor(.15, .15, .15)
    end

    for i, v in pairs({
        PetitionFrame.NineSlice.TopEdge,
        PetitionFrame.NineSlice.RightEdge,
        PetitionFrame.NineSlice.BottomEdge,
        PetitionFrame.NineSlice.LeftEdge,
        PetitionFrame.NineSlice.TopRightCorner,
        PetitionFrame.NineSlice.TopLeftCorner,
        PetitionFrame.NineSlice.BottomLeftCorner,
        PetitionFrame.NineSlice.BottomRightCorner,
    }) do
        v:SetVertexColor(.15, .15, .15)
    end

    for i, v in pairs({
        PetitionFrame.Bg,
        PetitionFrame.TitleBg,
        PetitionFrameInset.Bg
    }) do
        v:SetVertexColor(.3, .3, .3)
    end

    self:UnregisterEvent("ADDON_LOADED")
    f:SetScript("OnEvent", nil)
end)