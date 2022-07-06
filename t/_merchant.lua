local f = CreateFrame("frame")
f:RegisterEvent("ADDON_LOADED")

f:SetScript("OnEvent", function(self, event)

    for i, v in pairs({
        MerchantFrame.NineSlice.TopEdge,
        MerchantFrame.NineSlice.RightEdge,
        MerchantFrame.NineSlice.BottomEdge,
        MerchantFrame.NineSlice.LeftEdge,
        MerchantFrame.NineSlice.TopRightCorner,
        MerchantFrame.NineSlice.TopLeftCorner,
        MerchantFrame.NineSlice.BottomLeftCorner,
        MerchantFrame.NineSlice.BottomRightCorner,
        StackSplitFrame.SingleItemSplitBackground,
    }) do
        v:SetVertexColor(.15, .15, .15)
    end

    for i, v in pairs({
        MerchantFrame.Bg,
        MerchantFrame.TitleBg,
        MerchantFrameInset.Bg
    }) do
        v:SetVertexColor(.3, .3, .3)
    end

    self:UnregisterEvent("ADDON_LOADED")
    f:SetScript("OnEvent", nil)
end)