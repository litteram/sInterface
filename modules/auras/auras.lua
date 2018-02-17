local addon, ns = ...
local E, C = ns.E, ns.C

if not C.auras.enabled then return end;

local sInterfaceBuffFrame = CreateFrame('Frame', addon..'BuffFrame', UIParent)
local sInterfaceBuffFrameWidth = (C.auras.size * C.auras.max_per_row) + ((-C.auras.spacing - 1) * C.auras.max_per_row)
local sInterfaceBuffFrameHeight  = C.auras.size
sInterfaceBuffFrame:SetSize(sInterfaceBuffFrameWidth, sInterfaceBuffFrameHeight)

local function updateBuffFrameAnchor()
	if (Minimap:IsShown()) then
		sInterfaceBuffFrame:SetPoint("TOPRIGHT", Minimap, "TOPLEFT", C.auras.spacing, 0);
	else
		sInterfaceBuffFrame:SetPoint("TOPRIGHT", sInterfaceFrame, "TOPRIGHT", -C.general.edgeSpacing, -C.general.edgeSpacing);
	end
end
updateBuffFrameAnchor()

Minimap:HookScript("OnHide", updateBuffFrameAnchor)
Minimap:HookScript("OnShow", updateBuffFrameAnchor)

local function style(aura)
	if not aura or (aura and aura.styled) then return end

	local name = aura:GetName()
	local icon = _G[name.."Icon"]
	icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)

	local border = _G[name.."Border"]
	if border then border:SetAlpha(0) end

	aura:SetSize(C.auras.size, C.auras.size)

	aura.duration:SetParent(aura)
	aura.duration:SetPoint("TOP", aura, "BOTTOM", 0, 6)
	aura.duration:SetJustifyH("CENTER")
	aura.duration:SetFont(C.general.displayFont.typeface, C.general.displayFont.size, C.general.displayFont.flag)

	E:ShadowedBorder(aura)

	aura.styled = true
end

local function updateBuffAnchors()
	local buff, previousBuff, aboveBuff
	for i = 1, BUFF_ACTUAL_DISPLAY do
		buff = _G["BuffButton"..i]
		style(buff)

		if i > 1 and mod(i, C.auras.max_per_row) == 1 then
			buff:SetPoint("TOPRIGHT", aboveBuff, "BOTTOMRIGHT", 0, C.auras.spacing*2)
			aboveBuff = buff
		elseif i == 1 then
			buff:SetPoint("TOPRIGHT", sInterfaceBuffFrame, "TOPRIGHT", 0, 0)
			aboveBuff = buff
		else
			buff:SetPoint("RIGHT", previousBuff, "LEFT", C.auras.spacing, 0)
		end
		previousBuff = buff
	end

end

local function updateDebuffAnchors()
	local debuff, previousDebuff, aboveDebuff
	for i = 1, DEBUFF_MAX_DISPLAY do
		debuff = _G["DebuffButton"..i]
		if not debuff then return end
		style(debuff)

		if i > 1 and mod(i, C.auras.max_per_row) == 1 then
			debuff:SetPoint("TOPRIGHT", aboveDebuff, "BOTTOMRIGHT", 0, C.auras.spacing*2)
			aboveDebuff = debuff
		elseif i ==1 then
			if BUFF_ACTUAL_DISPLAY == 0 then
				debuff:SetPoint("TOPRIGHT", sInterfaceBuffFrame, "TOPRIGHT", 0, 0)
			else
				local anchorIndex, anchor, modulo, ab
				modulo = BUFF_ACTUAL_DISPLAY % C.auras.max_per_row
				ab = abs(modulo - 1)
				anchorIndex = modulo == 0 and (BUFF_ACTUAL_DISPLAY - (C.auras.max_per_row - 1)) or (BUFF_ACTUAL_DISPLAY - ab)
				anchor = _G["BuffButton"..anchorIndex]
				debuff:ClearAllPoints()
				debuff:SetPoint("TOPRIGHT", anchor, "BOTTOMRIGHT", 0, C.auras.spacing*6)
			end
			aboveDebuff = debuff
		else
			debuff:SetPoint("RIGHT", previousDebuff, "LEFT", C.auras.spacing, 0)
		end
		previousDebuff = debuff
	end
end

hooksecurefunc("BuffFrame_UpdateAllBuffAnchors", updateBuffAnchors)
hooksecurefunc("DebuffButton_UpdateAnchors", updateDebuffAnchors)
