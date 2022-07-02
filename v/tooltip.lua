local tui = CreateFrame("Frame")
tui:RegisterEvent("PLAYER_LOGIN")
tui:SetScript("OnEvent", function(self, event)

    FONT = STANDARD_TEXT_FONT
    local classColorHex, factionColorHex = {}, {}

    local TooltipFrame = CreateFrame('Frame', "TooltipFrame", UIParent)
    TooltipFrame:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -80, 110)
    TooltipFrame:SetSize(150, 25)

    hooksecurefunc("GameTooltip_SetDefaultAnchor", function(tooltip, parent)
        tooltip:SetOwner(parent, "ANCHOR_NONE")
        tooltip:ClearAllPoints()
        tooltip:SetPoint("BOTTOMRIGHT", TooltipFrame, "BOTTOMRIGHT")
    end)

    local cfg = {
        textColor = {0.4,0.4,0.4},
        bossColor = {1,0,0},
        eliteColor = {1,0,0.5},
        rareeliteColor = {1,0.5,0},
        rareColor = {1,0.5,0},
        levelColor = {0.8,0.8,0.5},
        deadColor = {0.5,0.5,0.5},
        targetColor = {1,0.5,0.5},
        guildColor = {0.8, 0.0, 0.6},
        afkColor = {0,1,1},
        scale = 0.95,
        fontFamily = STANDARD_TEXT_FONT,
    }

    local function GetHexColor(color)
        if color.r then
            return ("%.2x%.2x%.2x"):format(color.r*255, color.g*255, color.b*255)
        else
            local r,g,b,a = unpack(color)
            return ("%.2x%.2x%.2x"):format(r*255, g*255, b*255)
        end
    end

    local function GetTarget(unit)
        if UnitIsUnit(unit, "player") then
            return ("|cffff0000%s|r"):format("<YOU>")
        elseif UnitIsPlayer(unit, "player") then
            local _, class = UnitClass(unit)
            return ("|cff%s%s|r"):format(classColorHex[class], UnitName(unit))
        elseif UnitReaction(unit, "player") then
            return ("|cff%s%s|r"):format(factionColorHex[UnitReaction(unit, "player")], UnitName(unit))
        else
            return ("|cffffffff%s|r"):format(UnitName(unit))
        end
    end

    local function OnTooltipSetUnit(self)
        local unitName, unit = self:GetUnit()
        if not unit then return end
        -- Color tooltip textleft
        for i = 2, GameTooltip:NumLines() do
            local line = _G["GameTooltipTextLeft"..i]
            if line then
                line:SetTextColor(unpack(cfg.textColor))
            end
        end
        -- Position raidicon
        local raidIconIndex = GetRaidTargetIndex(unit)
        if raidIconIndex then
            GameTooltipTextLeft1:SetText(("%s %s"):format(ICON_LIST[raidIconIndex].."14|t", unitName))
        end

        if not UnitIsPlayer(unit) then
            local reaction = UnitReaction(unit, "player")
            if reaction then
                local color = FACTION_BAR_COLORS[reaction]
                if color then
                    cfg.barColor = color
                    GameTooltipStatusBar:SetStatusBarColor(color.r,color.g,color.b)
                    GameTooltipTextLeft1:SetTextColor(color.r,color.g,color.b)
                end
            end
            -- Color textleft2 by classificationcolor
            local unitClassification = UnitClassification(unit)
            local levelLine
            if string.find(GameTooltipTextLeft2:GetText() or "empty", "%a%s%d") then
                levelLine = GameTooltipTextLeft2
            elseif GameTooltipTextLeft3 ~= nil and string.find(GameTooltipTextLeft3:GetText() or "empty", "%a%s%d") then
                GameTooltipTextLeft2:SetTextColor(unpack(cfg.guildColor))
                levelLine = GameTooltipTextLeft3
            end

            if levelLine then
                local l = UnitLevel(unit)
                local color = GetCreatureDifficultyColor((l > 0) and l or 999)
                levelLine:SetTextColor(color.r,color.g,color.b)
            end

            if unitClassification == "worldboss" or UnitLevel(unit) == -1 then
                self:AppendText(" |cffff0000{B}|r")
                GameTooltipTextLeft2:SetTextColor(unpack(cfg.bossColor))
            elseif unitClassification == "rare" then
                self:AppendText(" |cffff9900{R}|r")
            elseif unitClassification == "rareelite" then
                self:AppendText(" |cffff0000{R+}|r")
            elseif unitClassification == "elite" then
                self:AppendText(" |cffff6666{E}|r")
            end
        else
            -- Unit is any player
            local _, unitClass = UnitClass(unit)
            -- Color textleft1 and statusbar by class color
            local color = RAID_CLASS_COLORS[unitClass]
            cfg.barColor = color
            GameTooltipStatusBar:SetStatusBarColor(color.r,color.g,color.b)
            _G["GameTooltipTextLeft1"]:SetTextColor(color.r,color.g,color.b)

            -- Color textleft2 by guildcolor
            local guildName, guildRank = GetGuildInfo(unit)
            if guildName then
                _G["GameTooltipTextLeft2"]:SetText("<"..guildName.."> ["..guildRank.."]")
                _G["GameTooltipTextLeft2"]:SetTextColor(unpack(cfg.guildColor))
            end

            local levelLine = guildName and _G["GameTooltipTextLeft3"] or _G["GameTooltipTextLeft2"]
            local l = UnitLevel(unit)
            local color = GetCreatureDifficultyColor((l > 0) and l or 999)
            levelLine:SetTextColor(color.r,color.g,color.b)
            -- afk
            if UnitIsAFK(unit) then
                self:AppendText((" |cff%s<AFK>|r"):format(cfg.afkColorHex))
            end
        end
        -- Dead
        if UnitIsDeadOrGhost(unit) then
            _G["GameTooltipTextLeft1"]:SetTextColor(unpack(cfg.deadColor))
        end

        -- Target line
        if (UnitExists(unit.."target")) then
            GameTooltip:AddDoubleLine(("|cff%s%s|r"):format(cfg.targetColorHex, "Target"),GetTarget(unit.."target") or "Unknown")
        end
    end

    local function SetStatusBarColor(self,r,g,b)
        if not cfg.barColor then return end
        if r == cfg.barColor.r and g == cfg.barColor.g and b == cfg.barColor.b then return end
        self:SetStatusBarColor(cfg.barColor.r,cfg.barColor.g,cfg.barColor.b)
    end

    -- Hex class colors
    for class, color in next, RAID_CLASS_COLORS do
        classColorHex[class] = GetHexColor(color)
    end

    -- Hex reaction colors
    -- for idx, color in next, FACTION_BAR_COLORS do
    for i = 1, #FACTION_BAR_COLORS do
        factionColorHex[i] = GetHexColor(FACTION_BAR_COLORS[i])
    end

    cfg.targetColorHex = GetHexColor(cfg.targetColor)
    cfg.afkColorHex = GetHexColor(cfg.afkColor)

    GameTooltipHeaderText:SetFont(cfg.fontFamily, 14, "NONE")
    GameTooltipHeaderText:SetShadowOffset(1,-2)
    GameTooltipHeaderText:SetShadowColor(0,0,0,0.75)
    GameTooltipText:SetFont(cfg.fontFamily, 12, "NONE")
    GameTooltipText:SetShadowOffset(1,-2)
    GameTooltipText:SetShadowColor(0,0,0,0.75)
    Tooltip_Small:SetFont(cfg.fontFamily, 11, "NONE")
    Tooltip_Small:SetShadowOffset(1,-2)
    Tooltip_Small:SetShadowColor(0,0,0,0.75)

    --  Gametooltip statusbar
    GameTooltipStatusBar:ClearAllPoints()
    GameTooltipStatusBar:SetPoint("LEFT",5,0)
    GameTooltipStatusBar:SetPoint("RIGHT",-5,0)
    GameTooltipStatusBar:SetPoint("TOP",0,-2.5)
    GameTooltipStatusBar:SetHeight(4)
    -- Gametooltip statusbar bg
    GameTooltipStatusBar.bg = GameTooltipStatusBar:CreateTexture(nil,"BACKGROUND",nil,-8)
    GameTooltipStatusBar.bg:SetAllPoints()
    GameTooltipStatusBar.bg:SetColorTexture(1,1,1)
    GameTooltipStatusBar.bg:SetVertexColor(0,0,0,0.5)

    hooksecurefunc(GameTooltipStatusBar,"SetStatusBarColor", SetStatusBarColor)
    GameTooltip:HookScript("OnTooltipSetUnit", OnTooltipSetUnit)

    -- Loop over menues
    local menues = {
        DropDownList1MenuBackdrop,
        DropDownList2MenuBackdrop,
    }

    for i, menu in next, menues do
        menu:SetScale(cfg.scale)
    end

    -- SpellID Line
    -- Func TooltipAddSpellID
    local function TooltipAddSpellID(self,spellid)
        if not spellid then return end
        self:AddDoubleLine("|cff0099ffID|r",spellid)
        self:Show()
    end

    --  Hooksecurefunc GameTooltip SetUnitBuff
    hooksecurefunc(GameTooltip, "SetUnitBuff", function(self,...)
        TooltipAddSpellID(self,select(10,UnitBuff(...)))
    end)

    --  Hooksecurefunc GameTooltip SetUnitDebuff
    hooksecurefunc(GameTooltip, "SetUnitDebuff", function(self,...)
        TooltipAddSpellID(self,select(10,UnitDebuff(...)))
    end)

    --  Hooksecurefunc GameTooltip SetUnitAura
    hooksecurefunc(GameTooltip, "SetUnitAura", function(self,...)
        TooltipAddSpellID(self,select(10,UnitAura(...)))
    end)

    --  Hooksecurefunc SetItemRef
    hooksecurefunc("SetItemRef", function(link)
        local type, value = link:match("(%a+):(.+)")
        if type == "spell" then
            TooltipAddSpellID(ItemRefTooltip,value:match("([^:]+)"))
        end
    end)

    --  HookScript GameTooltip OnTooltipSetSpell
    GameTooltip:HookScript("OnTooltipSetSpell", function(self)
        TooltipAddSpellID(self,select(2,self:GetSpell()))
    end)
end)