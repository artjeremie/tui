local f = CreateFrame("frame")
f:RegisterEvent("ADDON_LOADED")

f:SetScript("OnEvent", function(self, event)
    for i, v in pairs({
        MainMenuBarArtFrameBackground.BackgroundLarge,
        MainMenuBarArtFrameBackground.BackgroundSmall,
        StatusTrackingBarManager.SingleBarLarge,
        StatusTrackingBarManager.SingleBarSmall,
        StatusTrackingBarManager.SingleBarLargeUpper,
        StatusTrackingBarManager.SingleBarSmallUpper,
        SlidingActionBarTexture0,
        SlidingActionBarTexture1,
        MainMenuBarTexture0,
        MainMenuBarTexture1,
        MainMenuBarTexture2,
        MainMenuBarTexture3,
        MainMenuMaxLevelBar0,
        MainMenuMaxLevelBar1,
        MainMenuMaxLevelBar2,
        MainMenuMaxLevelBar3,
        MainMenuXPBarTextureLeftCap,
        MainMenuXPBarTextureRightCap,
        MainMenuXPBarTextureMid,
        ReputationWatchBarTexture0,
        ReputationWatchBarTexture1,
        ReputationWatchBarTexture2,
        ReputationWatchBarTexture3,
        ReputationXPBarTexture0,
        ReputationXPBarTexture1,
        ReputationXPBarTexture2,
        ReputationXPBarTexture3,
    }) do
        v:SetVertexColor(.4, .4, .4)
    end

    for i, v in pairs({
        MainMenuBarArtFrame.LeftEndCap,
        MainMenuBarArtFrame.RightEndCap,
        StanceBarLeft,
        StanceBarMiddle,
        StanceBarRight,
    }) do
        v:SetVertexColor(.4, .4, .4)
    end

    for i, v in pairs({
        ActionBarUpButton:GetRegions(),
    }) do
        v:SetVertexColor(.4, .4, .4)
    end

    for i, v in pairs({
        ActionBarDownButton:GetRegions()
    }) do
        v:SetVertexColor(.4, .4, .4)
    end

    self:UnregisterEvent("ADDON_LOADED")
    f:SetScript("OnEvent", nil)
end)