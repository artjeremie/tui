-- Main actionbar artwork
MainMenuBarArtFrame.LeftEndCap:Hide()
MainMenuBarArtFrame.RightEndCap:Hide()
MainMenuBarArtFrame.PageNumber:Hide()
MainMenuBarArtFrameBackground.BackgroundSmall:SetAlpha(0)
MainMenuBarArtFrameBackground.BackgroundLarge:SetAlpha(0)

-- Auto add spell in actionbar
IconIntroTracker.RegisterEvent = function() end
IconIntroTracker:UnregisterEvent('SPELL_PUSHED_TO_ACTIONBAR')

-- Extrabar artwork
ExtraActionButton1.style:SetAlpha(0)
ZoneAbilityFrame.Style:SetAlpha(0)