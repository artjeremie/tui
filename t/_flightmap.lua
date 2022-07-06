local f = CreateFrame("frame")
f:RegisterEvent("ADDON_LOADED")

f:SetScript("OnEvent", function(self, event, name)
    if (name == "Blizzard_FlightMap") then
        for i, v in pairs({
            FlightMapFrame.BorderFrame.NineSlice.TopEdge,
            FlightMapFrame.BorderFrame.NineSlice.RightEdge,
            FlightMapFrame.BorderFrame.NineSlice.BottomEdge,
            FlightMapFrame.BorderFrame.NineSlice.LeftEdge,
            FlightMapFrame.BorderFrame.NineSlice.TopRightCorner,
            FlightMapFrame.BorderFrame.NineSlice.TopLeftCorner,
            FlightMapFrame.BorderFrame.NineSlice.BottomLeftCorner,
            FlightMapFrame.BorderFrame.NineSlice.BottomRightCorner,
        }) do
            v:SetVertexColor(.15, .15, .15)
        end

        for i, v in pairs({
            FlightMapFrame.Bg,
            FlightMapFrame.TitleB
        }) do
            v:SetVertexColor(.3, .3, .3)
        end

        self:UnregisterEvent("ADDON_LOADED")
        f:SetScript("OnEvent", nil)
    end
end)