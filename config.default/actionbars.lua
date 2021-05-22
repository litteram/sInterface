local A, ns = ...
local C = ns.C

C["actionbars"] = {
    enabled = true,

    bar1 = {
        framePoint      = { "BOTTOM", UIParent, "BOTTOM", -400, 30 },
        frameScale      = 0.8,
        framePadding    = 5,
        buttonWidth     = 32,
        buttonHeight    = 32,
        buttonMargin    = 7,
        numCols         = 6,
        startPoint      = "BOTTOMLEFT",
        frameVisibility = "[petbattle]hide;[combat][cursor][mod][mod:alt][mod:shift][@vehicle,exists][overridebar][shapeshift][vehicleui][possessbar][@target,exists] show; hide",
        mouseover       = false,
    },

    bar2 = {
        framePoint      = { "BOTTOMRIGHT", A.."Bar1", "BOTTOMLEFT", 0, 0 },
        frameScale      = 0.8,
        framePadding    = 5,
        buttonWidth     = 32,
        buttonHeight    = 32,
        buttonMargin    = 7,
        numCols         = 3,
        startPoint      = "BOTTOMLEFT",
        frameVisibility = "[petbattle]hide;[cursor][combat][mod][mod:alt][@target,exists]show;hide",
        mouseover       = false,
    },

    bar3 = {
        framePoint      = { "BOTTOM", A.."Bar1", "TOP", 0, -3 },
        frameScale      = 0.8,
        framePadding    = 5,
        buttonWidth     = 32,
        buttonHeight    = 32,
        buttonMargin    = 7,
        numCols         = 6,
        startPoint      = "BOTTOMLEFT",
        frameVisibility = "[petbattle]hide;[cursor][combat][mod][mod:alt][@target,exists]show;hide",
        mouseover       = false,
    },

    bar4 = {
        -- framePoint      = { "TOPLEFT", A.."Bar1", "RIGHT", 30, 0 },
        framePoint      = { "TOPRIGHT", UIParent, "CENTER", -260, -220 },
        frameScale      = 1,
        framePadding    = 5,
        buttonWidth     = 24,
        buttonHeight    = 24,
        buttonMargin    = 7,
        numCols         = 4,
        startPoint      = "TOPLEFT",
        -- frameVisibility = "[cursor][mod:alt] show; hide",
        frameVisibility = "show",
        mouseover       = false,
        -- frameVisibility = "[petbattle] hide;[combat][cursor][mod][mod:alt][mod:shift][@vehicle,exists][overridebar][shapeshift][vehicleui][possessbar][@target,exists] show; hide",
    },

    bar5 = {
        framePoint      = { "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -60, 60 },
        frameScale      = 1.1,
        framePadding    = 5,
        buttonWidth     = 32,
        buttonHeight    = 32,
        buttonMargin    = 7,
        numCols         = 3,
        startPoint      = "TOPLEFT",
        -- frameVisibility = "[cursor][mod:alt] show; hide",
        frameVisibility = "show",
        mouseover       = true,
    },

    possessexitbar = {
        framePoint      = { "BOTTOM", A.."VehicleExitBar", "TOP", 0, 5 },
        frameScale      = 0.95,
        framePadding    = 5,
        buttonWidth     = 32,
        buttonHeight    = 32,
        buttonMargin    = 7,
        numCols         = 1,
        startPoint      = "BOTTOMLEFT",
        mouseover       = false,
    },

    petbar = {
        framePoint      = { "RIGHT", UIParent, "RIGHT", 5, 0 },
        frameScale      = 0.9,
        framePadding    = 5,
        buttonWidth     = 32,
        buttonHeight    = 32,
        buttonMargin    = 7,
        numCols         = 1,
        startPoint      = "TOPLEFT",
        frameVisibility = "[cursor][pet] show; hide",
        mouseover       = false,
    },

    stancebar = {
        framePoint      = { "TOP", A.."Bar1", "BOTTOM", 0, -7 },
        frameScale      = 0.8,
        framePadding    = 5,
        buttonWidth     = 32,
        buttonHeight    = 32,
        buttonMargin    = 7,
        numCols         = 4,
        startPoint      = "TOPLEFT",
        frameVisibility = "[petbattle]hide; [combat][mod:alt] show",
        mouseover       = true,
    },

    vehicleexitbar = {
        framePoint      = { "BOTTOMLEFT", "ChatFrame1", "TOPLEFT", 0, 70 },
        frameScale      = 0.95,
        framePadding    = 5,
        buttonWidth     = 36,
        buttonHeight    = 36,
        buttonMargin    = 7,
        numCols         = 1,
        startPoint      = "BOTTOMLEFT",
        mouseover       = false,
    },

    extrabar = {
        framePoint      = { "CENTER", UIParent, "BOTTOM", 0, 120},
        frameScale      = 0.95,
        framePadding    = 0,
        buttonWidth     = 36,
        buttonHeight    = 36,
        buttonMargin    = 7,
        numCols         = 1,
        startPoint      = "CENTER",
        mouseover       = false,
        frameVisibility = "show",
    },

    bagbar = {
        framePoint      = { "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 4, 4 },
        frameScale      = 1,
        framePadding    = 5,
        buttonWidth     = 32,
        buttonHeight    = 32,
        buttonMargin    = 2,
        numCols         = 1, --number of buttons per column
        startPoint      = "BOTTOMRIGHT", --start postion of first button: BOTTOMLEFT, TOPLEFT, TOPRIGHT, BOTTOMRIGHT
        frameVisibility = "show",
        mouseover       = true
    },

    micromenubar = {
        framePoint      = { "TOP", UIParent, "TOP", 0, 4 },
        frameScale      = 0.7,
        framePadding    = 5,
        buttonWidth     = 28,
        buttonHeight    = 38,
        buttonMargin    = 0,
        numCols         = 12,
        startPoint      = "LEFT",
        mouseover       = true,
    }
}
