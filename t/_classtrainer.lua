local f = CreateFrame("frame")
f:RegisterEvent("ADDON_LOADED")

f:SetScript("OnEvent", function(self, event, name)
    if (name == "Blizzard_TrainerUI") then
        for i, v in pairs({
            ClassTrainerFrame.NineSlice.TopEdge,
            ClassTrainerFrame.NineSlice.RightEdge,
            ClassTrainerFrame.NineSlice.BottomEdge,
            ClassTrainerFrame.NineSlice.LeftEdge,
            ClassTrainerFrame.NineSlice.TopRightCorner,
            ClassTrainerFrame.NineSlice.TopLeftCorner,
            ClassTrainerFrame.NineSlice.BottomLeftCorner,
            ClassTrainerFrame.NineSlice.BottomRightCorner,
        }) do
            v:SetVertexColor(.15, .15, .15)
        end

        for i, v in pairs({
            ClassTrainerFrame.Bg,
            ClassTrainerFrame.TitleBg
        }) do
            v:SetVertexColor(.3, .3, .3)
        end

        self:UnregisterEvent("ADDON_LOADED")
        f:SetScript("OnEvent", nil)
    end
end)