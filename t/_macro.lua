local f = CreateFrame("frame")
f:RegisterEvent("ADDON_LOADED")

f:SetScript("OnEvent", function(self, event, name)
    if (name == "Blizzard_MacroUI") then
        for i, v in pairs({
            MacroFrame.NineSlice.TopEdge,
            MacroFrame.NineSlice.RightEdge,
            MacroFrame.NineSlice.BottomEdge,
            MacroFrame.NineSlice.LeftEdge,
            MacroFrame.NineSlice.TopRightCorner,
            MacroFrame.NineSlice.TopLeftCorner,
            MacroFrame.NineSlice.BottomLeftCorner,
            MacroFrame.NineSlice.BottomRightCorner
        }) do
            v:SetVertexColor(.15, .15, .15)
        end

        for i, v in pairs({
            MacroFrameInset.NineSlice.TopEdge,
            MacroFrameInset.NineSlice.TopRightCorner,
            MacroFrameInset.NineSlice.RightEdge,
            MacroFrameInset.NineSlice.BottomRightCorner,
            MacroFrameInset.NineSlice.BottomEdge,
            MacroFrameInset.NineSlice.BottomLeftCorner,
            MacroFrameInset.NineSlice.LeftEdge,
            MacroFrameInset.NineSlice.TopLeftCorner,
        }) do
            v:SetVertexColor(.4, .4, .4)
        end

        for i, v in pairs({
            MacroFrame.Bg,
            MacroFrame.TitleBg,
        }) do
            v:SetVertexColor(.4, .4, .4)
        end

        for i, v in pairs({
            MacroButtonScrollFrameTop,
            MacroButtonScrollFrameMiddle,
            MacroButtonScrollFrameBottom,
            MacroButtonScrollFrameScrollBarThumbTexture,
            MacroButtonScrollFrameScrollBarScrollUpButton.Normal,
            MacroButtonScrollFrameScrollBarScrollDownButton.Normal,
            MacroButtonScrollFrameScrollBarScrollUpButton.Disabled,
            MacroButtonScrollFrameScrollBarScrollDownButton.Disabled,
        }) do
            v:SetVertexColor(.4, .4, .4)
        end
        MacroHorizontalBarLeft:Hide();

        self:UnregisterEvent("ADDON_LOADED")
        f:SetScript("OnEvent", nil)
    end
end)