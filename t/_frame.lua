local f = CreateFrame("frame")
f:RegisterEvent("ADDON_LOADED")

f:SetScript("OnEvent", function(self, event)

    for i, v in pairs({
        GameMenuFrame.Border.TopEdge,
        GameMenuFrame.Border.RightEdge,
        GameMenuFrame.Border.BottomEdge,
        GameMenuFrame.Border.LeftEdge,
        GameMenuFrame.Border.TopRightCorner,
        GameMenuFrame.Border.TopLeftCorner,
        GameMenuFrame.Border.BottomLeftCorner,
        GameMenuFrame.Border.BottomRightCorner,
        StaticPopup1.Border.TopEdge,
        StaticPopup1.Border.RightEdge,
        StaticPopup1.Border.BottomEdge,
        StaticPopup1.Border.LeftEdge,
        StaticPopup1.Border.TopRightCorner,
        StaticPopup1.Border.TopLeftCorner,
        StaticPopup1.Border.BottomLeftCorner,
        StaticPopup1.Border.BottomRightCorner
    }) do
        v:SetVertexColor(.15, .15, .15)
    end

    for i, v in pairs({
        GameMenuFrame.Header.CenterBG,
        GameMenuFrame.Header.RightBG,
        GameMenuFrame.Header.LeftBG,
    }) do
        v:SetVertexColor(.6, .6, .6)
    end

    self:UnregisterEvent("ADDON_LOADED")
    f:SetScript("OnEvent", nil)
end)