-- Class color
local function colorBar(healthbar, unit)
    if UnitIsPlayer(unit) and UnitIsConnected(unit) and UnitClass(unit) then
        _, class = UnitClass(unit);
        local c = RAID_CLASS_COLORS[class];
        healthbar:SetStatusBarColor(c.r, c.g, c.b);
    elseif UnitIsPlayer(unit) and (not UnitIsConnected(unit)) then
        healthbar:SetStatusBarColor(0.5,0.5,0.5);
    else
        healthbar:SetStatusBarColor(0,0.9,0);
    end
end

hooksecurefunc("UnitFrameHealthBar_Update", colorBar)
hooksecurefunc("HealthBar_OnValueChanged", function(self)
    colorBar(self, self.unit)
end)

local function tuiUnitReaction(healthbar, unit)
    if UnitExists(unit) and (not UnitIsPlayer(unit)) then
        if (UnitIsTapDenied(unit)) and not UnitPlayerControlled(unit) then
            healthbar:SetStatusBarColor(0.5, 0.5, 0.5)
        elseif (not UnitIsTapDenied(unit)) then
            local reaction = FACTION_BAR_COLORS[UnitReaction(unit,"player")];
            if reaction then
                healthbar:SetStatusBarColor(reaction.r, reaction.g, reaction.b);
            else
                healthbar:SetStatusBarColor(0,0.6,0.1)
            end
        end
    end
end

hooksecurefunc("UnitFrameHealthBar_Update", tuiUnitReaction)
hooksecurefunc("HealthBar_OnValueChanged", function(self)
    tuiUnitReaction(self, self.unit)
end)


-- Disable unitframe status text
PlayerHitIndicator:SetText(nil)
PlayerHitIndicator.SetText = function() end
PetHitIndicator:SetText(nil)
PetHitIndicator.SetText = function() end

-- Disable unitframe glow while in resting area
hooksecurefunc("PlayerFrame_UpdateStatus", function()
if IsResting("player") then
    PlayerStatusTexture:Hide()
    PlayerRestGlow:Hide()
    PlayerStatusGlow:Hide() end
end)

local function tuiPlayerFrame(self)
    PlayerFrameTexture:SetTexture("Interface\\AddOns\\tui\\i\\unitframe\\UI-TargetingFrame");
    self.name:Hide();
    self.name:ClearAllPoints();
    self.name:SetPoint("CENTER", PlayerFrame, "CENTER",50.5, 36);
    --self.name:SetPoint("LEFT", self, 115, 36);
    self.healthbar:SetPoint("TOPLEFT",106,-24);
    self.healthbar:SetHeight(26);
    self.healthbar.LeftText:ClearAllPoints();
    self.healthbar.LeftText:SetPoint("LEFT",self.healthbar,"LEFT",8,0);
    self.healthbar.RightText:ClearAllPoints();
    self.healthbar.RightText:SetPoint("RIGHT",self.healthbar,"RIGHT",-5,0);
    self.healthbar.TextString:SetPoint("CENTER", self.healthbar, "CENTER", 0, 0);
    self.manabar:SetPoint("TOPLEFT",106,-52);
    self.manabar:SetHeight(13);
    self.manabar.LeftText:ClearAllPoints();
    self.manabar.LeftText:SetPoint("LEFT",self.manabar,"LEFT",8,0)     ;
    self.manabar.RightText:ClearAllPoints();
    self.manabar.RightText:SetPoint("RIGHT",self.manabar,"RIGHT",-5,0);
    self.manabar.TextString:SetPoint("CENTER",self.manabar,"CENTER",0,0);
    self.manabar.FullPowerFrame.SpikeFrame.AlertSpikeStay:ClearAllPoints();
    self.manabar.FullPowerFrame.SpikeFrame.AlertSpikeStay:SetPoint("CENTER", self.manabar.FullPowerFrame, "RIGHT", -6, -3);
    self.manabar.FullPowerFrame.SpikeFrame.AlertSpikeStay:SetSize(30,29);
    self.manabar.FullPowerFrame.PulseFrame:ClearAllPoints();
    self.manabar.FullPowerFrame.PulseFrame:SetPoint("CENTER", self.manabar.FullPowerFrame,"CENTER",-6,-2);
    self.manabar.FullPowerFrame.SpikeFrame.BigSpikeGlow:ClearAllPoints();
    self.manabar.FullPowerFrame.SpikeFrame.BigSpikeGlow:SetPoint("CENTER",self.manabar.FullPowerFrame,"RIGHT",5,-4);
    self.manabar.FullPowerFrame.SpikeFrame.BigSpikeGlow:SetSize(30,50);
    PlayerFrameGroupIndicatorText:ClearAllPoints();
    PlayerFrameGroupIndicatorText:SetPoint("BOTTOMLEFT", PlayerFrame,"TOP",0,-20);
    PlayerFrameGroupIndicatorLeft:Hide();
    PlayerFrameGroupIndicatorMiddle:Hide();
    PlayerFrameGroupIndicatorRight:Hide();
end

hooksecurefunc("PlayerFrame_ToPlayerArt", tuiPlayerFrame)

local function tuiTargetFrame(self, forceNormalTexture)
    local classification = UnitClassification(self.unit);
    self.highLevelTexture:SetPoint("CENTER", self.levelText, "CENTER", 0,0);
    self.deadText:SetPoint("CENTER", self.healthbar, "CENTER",0,0);
    self.nameBackground:Hide();
    self.threatIndicator:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Flash");
    self.name:SetPoint("LEFT", self, 15, 36);
    self.healthbar:SetSize(119, 26);
    self.healthbar:SetPoint("TOPLEFT", 5, -24);
    self.healthbar.LeftText:SetPoint("LEFT", self.healthbar, "LEFT", 8, 0);
    self.healthbar.RightText:SetPoint("RIGHT", self.healthbar, "RIGHT", -5, 0);
    self.healthbar.TextString:SetPoint("CENTER", self.healthbar, "CENTER", 0, 0);
    self.manabar:SetPoint("TOPLEFT", 5, -52);
    self.manabar:SetSize(119, 13);
    self.manabar.LeftText:SetPoint("LEFT", self.manabar, "LEFT", 8, 0);
    self.manabar.RightText:ClearAllPoints();
    self.manabar.RightText:SetPoint("RIGHT", self.manabar, "RIGHT", -5, 0);
    self.manabar.TextString:SetPoint("CENTER", self.manabar, "CENTER", 0, 0);
    if TargetFrame.threatNumericIndicator:IsShown() then
        TargetFrame.threatNumericIndicator:SetPoint("BOTTOM", PlayerFrame, "TOP", 72, -21);
    end
    FocusFrame.threatNumericIndicator:SetAlpha(0);
    if (forceNormalTexture) then
        self.borderTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame");
    elseif ( classification == "minus" ) then
        self.borderTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Minus");
        forceNormalTexture = true;
    elseif ( classification == "worldboss" or classification == "elite" ) then
        self.borderTexture:SetTexture("Interface\\Addons\\tui\\i\\unitframe\\UI-TargetingFrame-Elite");
    elseif ( classification == "rareelite" ) then
        self.borderTexture:SetTexture("Interface\\Addons\\tui\\i\\unitframe\\UI-TargetingFrame-Rare-Elite");
    elseif ( classification == "rare" ) then
        self.borderTexture:SetTexture("Interface\\Addons\\tui\\i\\unitframe\\UI-TargetingFrame-Rare");
    else
        self.borderTexture:SetTexture("Interface\\Addons\\tui\\i\\unitframe\\UI-TargetingFrame");
        forceNormalTexture = true;
    end
    if (forceNormalTexture) then
        self.haveElite = nil;
        if (classification == "minus") then
            self.Background:SetSize(119,12);
            self.Background:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 7, 47);
            self.name:SetPoint("LEFT", self, 16, 19);
            self.healthbar:ClearAllPoints();
            self.healthbar:SetPoint("LEFT", 5, 3);
            self.healthbar:SetHeight(12);
            self.healthbar.LeftText:SetPoint("LEFT", self.healthbar, "LEFT", 3, 0);
            self.healthbar.RightText:SetPoint("RIGHT", self.healthbar, "RIGHT", -2, 0);
        else
            self.Background:SetSize(119,42);
            self.Background:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 7, 35);
        end
        if ( self.threatIndicator ) then
            if ( classification == "minus" ) then
                self.threatIndicator:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Minus-Flash");
                self.threatIndicator:SetTexCoord(0, 1, 0, 1);
                self.threatIndicator:SetWidth(256);
                self.threatIndicator:SetHeight(128);
                self.threatIndicator:SetPoint("TOPLEFT", self, "TOPLEFT", -24, 0);
            else
                self.threatIndicator:SetTexCoord(0, 0.9453125, 0, 0.181640625);
                self.threatIndicator:SetWidth(242);
                self.threatIndicator:SetHeight(93);
                self.threatIndicator:SetPoint("TOPLEFT", self, "TOPLEFT", -24, 0);
            end
        end
    else
        self.haveElite = true;
        self.Background:SetSize(119,42);
        if ( self.threatIndicator ) then
            self.threatIndicator:SetTexCoord(0, 0.9453125, 0.181640625, 0.400390625);
            self.threatIndicator:SetWidth(242);
            self.threatIndicator:SetHeight(112);
        end
    end
    self.healthbar.lockColor = true;
end

hooksecurefunc("TargetFrame_CheckClassification", tuiTargetFrame)

local function tuiToTFrame()
    TargetFrameToTTextureFrameDeadText:ClearAllPoints();
    TargetFrameToTTextureFrameDeadText:SetPoint("CENTER", "TargetFrameToTHealthBar","CENTER",1, 0);
    TargetFrameToTTextureFrameName:SetSize(65,10);
    TargetFrameToTTextureFrameTexture:SetTexture("Interface\\Addons\\tui\\i\\unitframe\\UI-TargetofTargetFrame");
    TargetFrameToTHealthBar:ClearAllPoints();
    TargetFrameToTHealthBar:SetPoint("TOPLEFT", 45, -15);
    TargetFrameToTHealthBar:SetHeight(10);
    TargetFrameToTManaBar:ClearAllPoints();
    TargetFrameToTManaBar:SetPoint("TOPLEFT", 45, -25);
    TargetFrameToTManaBar:SetHeight(5);
    FocusFrameToTTextureFrameDeadText:ClearAllPoints();
    FocusFrameToTTextureFrameDeadText:SetPoint("CENTER", "FocusFrameToTHealthBar" ,"CENTER",1, 0);
    FocusFrameToTTextureFrameName:SetSize(65,10);
    FocusFrameToTTextureFrameTexture:SetTexture("Interface\\Addons\\tui\\i\\unitframe\\UI-TargetofTargetFrame");
    FocusFrameToTHealthBar:ClearAllPoints();
    FocusFrameToTHealthBar:SetPoint("TOPLEFT", 43, -15);
    FocusFrameToTHealthBar:SetHeight(10);
    FocusFrameToTManaBar:ClearAllPoints();
    FocusFrameToTManaBar:SetPoint("TOPLEFT", 43, -25);
    FocusFrameToTManaBar:SetHeight(5);
end

hooksecurefunc("TargetFrame_CheckClassification", tuiToTFrame)