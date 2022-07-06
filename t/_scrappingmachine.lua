local f = CreateFrame("frame")
f:RegisterEvent("ADDON_LOADED")

f:SetScript("OnEvent", function(self, event, name)
    if (name == "Blizzard_ScrappingMachineUI") then
        for i, v in pairs({
            ScrappingMachineFrame.NineSlice.TopEdge,
            ScrappingMachineFrame.NineSlice.RightEdge,
            ScrappingMachineFrame.NineSlice.BottomEdge,
            ScrappingMachineFrame.NineSlice.LeftEdge,
            ScrappingMachineFrame.NineSlice.TopRightCorner,
            ScrappingMachineFrame.NineSlice.TopLeftCorner,
            ScrappingMachineFrame.NineSlice.BottomLeftCorner,
            ScrappingMachineFrame.NineSlice.BottomRightCorner
        }) do
            v:SetVertexColor(.15, .15, .15)
        end

        self:UnregisterEvent("ADDON_LOADED")
        f:SetScript("OnEvent", nil)
    end
end)