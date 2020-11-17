local addon, ns = ...
local E = ns.E

if not E:C('orderhall', 'enabled') then return end

local orderhall = CreateFrame('Frame', addon..'OrderHall')

orderhall:RegisterEvent('ADDON_LOADED')
orderhall:SetScript('OnEvent', function(self, event, ...)
	local addonname = ...
	if (addonname == "Blizzard_OrderHallUI") then
		local b = OrderHallCommandBar
		b:UnregisterAllEvents()
		b:SetScript("OnShow", b.Hide)
		b:Hide()
		self:UnregisterAllEvents()
	end
end)
