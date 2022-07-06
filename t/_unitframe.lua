local f = CreateFrame("frame")
f:RegisterEvent("ADDON_LOADED")

f:SetScript("OnEvent", function(self, event)
    for i, v in pairs({
        PlayerFrameTexture,
        TargetFrameTextureFrameTexture,
        PlayerFrameAlternateManaBarBorder,
        PlayerFrameAlternateManaBarLeftBorder,
        PlayerFrameAlternateManaBarRightBorder,
        PaladinPowerBarFrameBG,
        PaladinPowerBarFrameBankBG,
        ComboPointPlayerFrame.Background,
        ComboPointPlayerFrame.Combo1.PointOff,
        ComboPointPlayerFrame.Combo2.PointOff,
        ComboPointPlayerFrame.Combo3.PointOff,
        ComboPointPlayerFrame.Combo4.PointOff,
        ComboPointPlayerFrame.Combo5.PointOff,
        ComboPointPlayerFrame.Combo6.PointOff,
        PetFrameTexture,
        PartyMemberFrame1Texture,
        PartyMemberFrame2Texture,
        PartyMemberFrame3Texture,
        PartyMemberFrame4Texture,
        PartyMemberFrame1PetFrameTexture,
        PartyMemberFrame2PetFrameTexture,
        PartyMemberFrame3PetFrameTexture,
        PartyMemberFrame4PetFrameTexture,
        FocusFrameTextureFrameTexture,
        TargetFrameToTTextureFrameTexture,
        FocusFrameToTTextureFrameTexture,
        Boss1TargetFrameTextureFrameTexture,
        Boss2TargetFrameTextureFrameTexture,
        Boss3TargetFrameTextureFrameTexture,
        Boss4TargetFrameTextureFrameTexture,
        Boss5TargetFrameTextureFrameTexture,
        Boss1TargetFrameSpellBar.Border,
        Boss2TargetFrameSpellBar.Border,
        Boss3TargetFrameSpellBar.Border,
        Boss4TargetFrameSpellBar.Border,
        Boss5TargetFrameSpellBar.Border,
        CastingBarFrame.Border,
        FocusFrameSpellBar.Border,
        TargetFrameSpellBar.Border,
        StatusTrackingBarManager.SingleBarLargeUpper,
        StatusTrackingBarManager.SingleBarSmallUpper,
    }) do
        v:SetVertexColor(.15, .15, .15)
    end

    self:UnregisterEvent("ADDON_LOADED")
    f:SetScript("OnEvent", nil)
end)