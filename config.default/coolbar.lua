local _, ns = ...
local C = ns.C

C["coolbar"] = {
	enabled = true,
	width = 400,
	height = 9,
	oocTransparency = 0.3,
    pos = { "BOTTOM", UIParent, "BOTTOM", 0, 30 },
	disabled = {
		[GetItemInfo(6948) or "Hearthstone"] = true,
		[GetItemInfo(110560) or "Garrison Hearthstone"] = true,
	}
}

