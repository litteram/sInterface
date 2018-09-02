local _, ns = ...
local C = ns.C

if not C.actionbars.enabled then return end

local BUTTON_SPACING = 6
local BUTTON_SIZE = ActionButton1:GetHeight()

local possessbar = ns.sInterfaceBars.possessbar

possessbar:SetSize(BUTTON_SIZE, BUTTON_SIZE)
possessbar:SetScale(C.actionbars.scale)

possessbar:SetPoint(unpack(C.actionbars.possessbar.position))

PossessBarFrame.ignoreFramePositionManager = true
PossessBarFrame:SetParent(possessbar)
PossessBarFrame:ClearAllPoints()
PossessBarFrame:SetPoint("TOPLEFT", possessbar, "TOPLEFT")
PossessBarFrame:SetSize(ActionButton1:GetHeight()*4+(BUTTON_SPACING*3), ActionButton1:GetHeight())
RegisterStateDriver(PossessBarFrame, "visibility", C.actionbars.possessbar.visibility or "show")

PossessButton1:ClearAllPoints()
PossessButton1:SetPoint("TOPLEFT", PossessBarFrame, "TOPLEFT", 0, 0)
