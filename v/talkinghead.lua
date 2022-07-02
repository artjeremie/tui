local tui = CreateFrame("Frame")
tui:RegisterEvent("PLAYER_ENTERING_WORLD")
tui:SetScript("OnEvent", function(self, event)

    local function HookTalkingHead()
        hooksecurefunc("TalkingHeadFrame_PlayCurrent", function()
            TalkingHeadFrame:Hide()
        end)
    end

    if TalkingHeadFrame then
        HookTalkingHead()
    else
        hooksecurefunc('TalkingHead_LoadUI', HookTalkingHead)
    end
end)