

-- rButtonTemplate_Zork: theme
-- zork, 2016

-- Zork's Button Theme for rButtonTemplate

-----------------------------
-- Variables
-----------------------------

local A, L = ...

-----------------------------
-- mediapath
-----------------------------

local mediapath = "interface\\addons\\"..A.."\\media\\"



-----------------------------
-- copyTable
-----------------------------

local function copyTable(orig)
  local orig_type = type(orig)
  local copy
  if orig_type == 'table' then
    copy = {}
    for orig_key, orig_value in next, orig, nil do
      copy[copyTable(orig_key)] = copyTable(orig_value)
    end
    setmetatable(copy, copyTable(getmetatable(orig)))
  else -- number, string, boolean, etc
    copy = orig
  end
  return copy
end

-----------------------------
-- actionButtonConfig
-----------------------------

local actionButtonConfig = {}

--make it global for rFilter
rButtonTemplate_rFilter_ActionButtonConfig = actionButtonConfig

--backdrop
actionButtonConfig.backdrop = {
  bgFile = mediapath.."backdrop",
  edgeFile = mediapath.."backdropBorder",
  tile = true,
  tileSize = 42,
  edgeSize = 1,
  insets = {
    left = 5,
    right = 5,
    top = 5,
    bottom = 5,
  },
  backgroundColor = {0.1,0.1,0.1,0.8},
  borderColor = {0,0,0,1},
  points = {
    {"TOPLEFT", -3, 3 },
    {"BOTTOMRIGHT", 3, -3 },
  },
}

--icon
actionButtonConfig.icon = {
	texCoord = {0.1,0.9,0.1,0.9},
	points = {
		{"TOPLEFT", 2, -2 },
		{"BOTTOMRIGHT", -2, 2 },
	},
}

--flyoutBorder
actionButtonConfig.flyoutBorder = {
  file = ""
}

--flyoutBorderShadow
actionButtonConfig.flyoutBorderShadow = {
  file = ""
}

--border
actionButtonConfig.border = {
  file = mediapath.."border",
  points = {
    {"TOPLEFT", -2, 2 },
    {"BOTTOMRIGHT", 2, -2 },
  },
}

--normalTexture
actionButtonConfig.normalTexture = {
  file = mediapath.."normal",
  color = {0.5,0.5,0.5,1},
  points = {
    {"TOPLEFT", 0, 0 },
    {"BOTTOMRIGHT", 0, 0 },
  },
}


--pushedTexture
actionButtonConfig.pushedTexture = {
  file = mediapath.."pushed",
  points = {
    {"TOPLEFT", 0, 0 },
    {"BOTTOMRIGHT", 0, 0 },
  },
}
--highlightTexture
actionButtonConfig.highlightTexture = {
  file = mediapath.."highlight",
  points = {
    {"TOPLEFT", 0, 0 },
    {"BOTTOMRIGHT", 0, 0 },
  },
}
--checkedTexture
actionButtonConfig.checkedTexture = {
  file = mediapath.."checked",
  points = {
    {"TOPLEFT", 0, 0 },
    {"BOTTOMRIGHT", 0, 0 },
  },
}

--cooldown
actionButtonConfig.cooldown = {
  points = {
    {"TOPLEFT", 0, 0 },
    {"BOTTOMRIGHT", 0, 0 },
  },
}

--name (macro name fontstring)
actionButtonConfig.name = {
  font = { STANDARD_TEXT_FONT, 10, "OUTLINE"},
  points = {
    {"BOTTOMLEFT", 0, 0 },
    {"BOTTOMRIGHT", 0, 0 },
  },
  alpha = 1,
}

--hotkey
actionButtonConfig.hotkey = {
  font = { STANDARD_TEXT_FONT, 11, "OUTLINE"},
  points = {
    {"TOPRIGHT", 0, 0 },
    {"TOPLEFT", 0, 0 },
  },
  alpha = 0,
}

--count
actionButtonConfig.count = {
  font = { STANDARD_TEXT_FONT, 13, "OUTLINE"},
  points = {
    {"BOTTOMLEFT", 4, 4 },

  },
}

--rButtonTemplate:StyleAllActionButtons
rButtonTemplate:StyleAllActionButtons(actionButtonConfig)
--style rActionBar vehicle exit button
rButtonTemplate:StyleActionButton(_G["rActionBarVehicleExitButton"],actionButtonConfig)

-----------------------------
-- itemButtonConfig
-----------------------------

local itemButtonConfig = {}

itemButtonConfig.backdrop = copyTable(actionButtonConfig.backdrop)
itemButtonConfig.icon = copyTable(actionButtonConfig.icon)
itemButtonConfig.count = copyTable(actionButtonConfig.count)
itemButtonConfig.stock = copyTable(actionButtonConfig.name)
itemButtonConfig.stock.alpha = 1
itemButtonConfig.border = { file = "" }
itemButtonConfig.normalTexture = copyTable(actionButtonConfig.normalTexture)

--rButtonTemplate:StyleItemButton
-- local itemButtons = { MainMenuBarBackpackButton, CharacterBag0Slot, CharacterBag1Slot, CharacterBag2Slot, CharacterBag3Slot }
-- for i, button in next, itemButtons do
  -- rButtonTemplate:StyleItemButton(button, itemButtonConfig)
-- end

-----------------------------
-- extraButtonConfig
-----------------------------

local extraButtonConfig = copyTable(actionButtonConfig)
extraButtonConfig.buttonstyle = { file = "" }

--rButtonTemplate:StyleExtraActionButton
rButtonTemplate:StyleExtraActionButton(extraButtonConfig)

-----------------------------
-- auraButtonConfig
-----------------------------

local auraButtonConfig = {}

auraButtonConfig.backdrop = copyTable(actionButtonConfig.backdrop)
auraButtonConfig.icon = copyTable(actionButtonConfig.icon)
auraButtonConfig.border = copyTable(actionButtonConfig.border)
auraButtonConfig.border.texCoord = {0,1,0,1} --fix the settexcoord on debuff borders
auraButtonConfig.normalTexture = copyTable(actionButtonConfig.normalTexture)
auraButtonConfig.count = copyTable(actionButtonConfig.count)
auraButtonConfig.duration = copyTable(actionButtonConfig.hotkey)
auraButtonConfig.duration.alpha = 1
auraButtonConfig.symbol = copyTable(actionButtonConfig.name)
auraButtonConfig.symbol.alpha = 1

-- auraButtonConfig.duration.points = { {"TOPRIGHT", 0, -8 }, {"TOPLEFT", 0, -8 }, }
auraButtonConfig.duration.points = { {"TOPRIGHT", 0, 4 }, {"TOPLEFT", 0, 4 }, }
auraButtonConfig.count.points = { {"BOTTOMRIGHT", 0, -4 }, {"BOTTOMLEFT", 0, -4 },}

auraButtonConfig.count.font = { STANDARD_TEXT_FONT, 13, "OUTLINE"}
auraButtonConfig.duration.font = { STANDARD_TEXT_FONT, 13, "OUTLINE"}

--fix blizzard time abbrev
HOUR_ONELETTER_ABBR = "%dh"
DAY_ONELETTER_ABBR = "%dd"
MINUTE_ONELETTER_ABBR = "%dm"
SECOND_ONELETTER_ABBR = "%ds"

--rButtonTemplate:StyleBuffButtons + rButtonTemplate:StyleTempEnchants
rButtonTemplate:StyleBuffButtons(auraButtonConfig)
rButtonTemplate:StyleTempEnchants(auraButtonConfig)

-----------------------------
-- debuffButtonConfig
-----------------------------

local debuffButtonConfig = copyTable(auraButtonConfig)



--rButtonTemplate:StyleDebuffButtons
rButtonTemplate:StyleDebuffButtons(debuffButtonConfig)
