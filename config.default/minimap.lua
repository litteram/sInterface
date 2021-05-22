local _, ns = ...
local C = ns.C

C["minimap"] = {
	enabled = true,
	zoneText = false,
	position = { "TOPRIGHT", UIParent, "TOPRIGHT", -C.general.edgeSpacing, -C.general.edgeSpacing },
	width = 180,
	height = 180,
}
