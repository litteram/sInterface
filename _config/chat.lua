local _, ns = ...
local C = ns.C

C["chat"] = {
	enabled = true,
	height = 115,
	width = 415,
	position = { "BOTTOMLEFT", UIParent, "BOTTOMLEFT", C.general.edgeSpacing, C.general.edgeSpacing }
}
