local f = CreateFrame("frame")
f:RegisterEvent("ADDON_LOADED")

f:SetScript("OnEvent", function(self, event)

    for i = 1, 5 do
        _G["ContainerFrame".. i .."BackgroundTop"]:SetVertexColor(.4, .4, .4)
        _G["ContainerFrame".. i .."BackgroundMiddle1"]:SetVertexColor(.4, .4, .4)
        _G["ContainerFrame".. i .."BackgroundMiddle2"]:SetVertexColor(.4, .4, .4)
        _G["ContainerFrame".. i .."BackgroundBottom"]:SetVertexColor(.4, .4, .4)
    end

    BackpackTokenFrame:GetRegions():SetVertexColor(.4, .4, .4)

    self:UnregisterEvent("ADDON_LOADED")
    f:SetScript("OnEvent", nil)
end)