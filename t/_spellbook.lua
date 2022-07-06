local f = CreateFrame("frame")
f:RegisterEvent("ADDON_LOADED")

f:SetScript("OnEvent", function(self, event)

    for i, v in pairs({
        SpellBookFrame.NineSlice.TopEdge,
        SpellBookFrame.NineSlice.RightEdge,
        SpellBookFrame.NineSlice.LeftEdge,
        SpellBookFrame.NineSlice.TopEdge,
        SpellBookFrame.NineSlice.BottomEdge,
        SpellBookFrame.NineSlice.PortraitFrame,
        SpellBookFrame.NineSlice.TopRightCorner,
        SpellBookFrame.NineSlice.TopLeftCorner,
        SpellBookFrame.NineSlice.BottomLeftCorner,
        SpellBookFrame.NineSlice.BottomRightCorner,
        SpellBookFrameInset.NineSlice.BottomEdge,
    }) do
        v:SetVertexColor(.15, .15, .15)
    end

    for i, v in pairs({
        SpellBookFrame.Bg,
        SpellBookFrame.TitleBg,
        SpellBookFrameInset.Bg
    }) do
        v:SetVertexColor(.4, .4, .4)
    end
    SpellBookFrameInset:SetAlpha(0)

    self:UnregisterEvent("ADDON_LOADED")
    f:SetScript("OnEvent", nil)
end)