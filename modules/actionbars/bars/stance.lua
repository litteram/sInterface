local _, ns = ...
local C = ns.C

if not C.actionbars.enabled then return end

local BUTTON_SPACING = 6
local BUTTON_SIZE = ActionButton1:GetHeight()

local stancebar = ns.sInterfaceBars.stancebar

stancebar:SetSize(BUTTON_SIZE, BUTTON_SIZE)
stancebar:SetPoint(unpack(C.actionbars.stancebar.position))

StanceBarFrame.ignoreFramePositionManager = true
StanceBarFrame:SetParent(stancebar)
StanceBarFrame:ClearAllPoints()
StanceBarFrame:SetPoint("TOPLEFT", stancebar, "TOPLEFT")
StanceBarFrame:SetSize(ActionButton1:GetHeight()*4+(BUTTON_SPACING*3), ActionButton1:GetHeight())
RegisterStateDriver(StanceBarFrame, "visibility", C.actionbars.stancebar.visibility or "show")

StanceButton1:ClearAllPoints()
StanceButton1:SetPoint("TOPLEFT", StanceBarFrame, "TOPLEFT", 0, 0)
