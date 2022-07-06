--  Hide some minimap textures
MinimapZoomIn:Hide()
MinimapZoomOut:Hide()
GameTimeFrame:Hide()
GameTimeFrame:UnregisterAllEvents()
GameTimeFrame.Show = kill
MiniMapTracking:Hide()
MiniMapTracking:UnregisterAllEvents()
MiniMapTracking.Show = kill
MiniMapWorldMapButton:Hide()

-- Scrollwheel to zoom in and zoom out
MinimapZoneText:SetPoint("CENTER", Minimap, 0, 80)
Minimap:EnableMouseWheel(true)
Minimap:SetScript("OnMouseWheel", function(self, z)
    local c = Minimap:GetZoom()
    if (z > 0 and c < 5) then
        Minimap:SetZoom(c + 1)
    elseif (z < 0 and c > 0) then
        Minimap:SetZoom(c -1)
    end
end)

Minimap:SetScript("OnMouseUp", function(self, btn)
    if btn == "RightButton" then
        _G.GameTimeFrame:Click()
    elseif btn == "MiddleButton" then
        _G.ToggleDropDownMenu(1, nil, _G.MiniMapTrackingDropDown, self)
    else
        _G.Minimap_OnClick(self)
    end
end)