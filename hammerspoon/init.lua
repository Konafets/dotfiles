hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()


-- ------------------
-- Modifier shortcuts
-- ------------------

local activationKeys = {"shift", "ctrl"}

-- -----------------
-- Window management
-- -----------------


local monMac = 'Color LCD'
local monCurved = 'C27F398'
local monLong = 'BenQ GL2450H'

function moveToScreen(screen)
  local currentWindow = hs.window.focusedWindow()
  local frame = currentWindow:frame()
  local targetScreen = hs.screen(screen)
  local max = targetScreen:frame()

  currentWindow:moveToScreen(screen)

  frame.x = max.x 
  frame.y = max.y
  frame.w = max.w
  frame.h = max.h
  currentWindow:setFrame(frame)
end

-- Resize window for chunk of screen.
-- For x and y: use 0 to expand fully in that dimension, 0.5 to expand halfway
-- For w and h: use 1 for full, 0.5 for half
function push(x, y, w, h)
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x + (max.w * x)
	f.y = max.y + (max.h * y)
	f.w = max.w * w
	f.h = max.h * h
	win:setFrame(f)
end

-- No windows animation
hs.window.animationDuration = 0

-- Push to screen edges
hs.hotkey.bind(activationKeys, "Left", function() push(0, 0, 0.5, 1) end)
hs.hotkey.bind(activationKeys, "Right", function() push(0.5, 0, 0.5, 1) end)
hs.hotkey.bind(activationKeys, "Up", function() push(0, 0, 1, 0.5)end)
hs.hotkey.bind(activationKeys, "Down", function() push(0, 0.5, 1, 0.5)end)

-- Push focused window to Mac screen
hs.hotkey.bind(activationKeys, "1", function() moveToScreen(monMac) end)

-- Push focused window to Curved screen
hs.hotkey.bind(activationKeys, "2", function() moveToScreen(monCurved) end)

-- Push focused window to long screen
hs.hotkey.bind(activationKeys, "3", function() moveToScreen(monLong) end)

-- Multi-Monitor layout
local windowLayout = {
	{"Skim", nil, monLong, hs.layout.maximized, nil, nil },
	{"Preview", nil, monLong, hs.layout.maximized, nil, nil },
	{"IntelliJ IDEA", nil, monMac, hs.layout.maximized, nil, nil },
	{"Google Chrome", nil, monCurved, hs.layout.maximized, nil, nil },
}

hs.layout.apply(windowLayout)