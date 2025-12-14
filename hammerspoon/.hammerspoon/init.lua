local hyper = { "ctrl", "alt", "cmd" }

-- allow F7 and F9 key to go back and forth 10 secs
-- need to press fn key as the base F7 and F9 is held for skip backwards and forwards
-- currently set for Brave browser
hs.hotkey.bind({}, "f7", function()
	local browser = hs.application.find("Brave")
	if browser then
		hs.eventtap.keyStroke({}, "j", 0, browser)
	end
end)

hs.hotkey.bind({}, "f9", function()
	local browser = hs.application.find("Brave")
	if browser then
		hs.eventtap.keyStroke({}, "l", 0, browser)
	end
end)

-- press command shift C to clean up files in Finder by date modified
-- Define the shortcut but don't enable it globally yet
local cleanUpHotkey = hs.hotkey.new({ "cmd", "shift" }, ",", function()
	local finder = hs.appfinder.appFromName("Finder")
	-- Select the menu item
	hs.application.launchOrFocus("Finder")
	finder:selectMenuItem({ "View", "Clean Up By", "Date Modified" })
end)

-- Create a filter so this ONLY works when Finder is the active window
local finderFilter = hs.window.filter.new("Finder")

finderFilter:subscribe(hs.window.filter.windowFocused, function()
	cleanUpHotkey:enable()
end)

finderFilter:subscribe(hs.window.filter.windowUnfocused, function()
	cleanUpHotkey:disable()
end)

-- apps shortcuts
local appShortcuts = {
	a = "Claude",
	b = "Brave Browser",
	c = "Google Chrome",
	e = "Microsoft Outlook",
	o = "Obsidian",
	s = "Mate Translate",
	t = "kitty",
	v = "VMWare Fusion",
	w = "WhatsApp",
}

for key, app in pairs(appShortcuts) do
	hs.hotkey.bind(hyper, key, function()
		hs.application.launchOrFocus(app)
	end)
end

-- manual config reload: Hyper+Ks
hs.hotkey.bind(hyper, "K", function()
	hs.reload()
end)
hs.alert.show("Config loaded")
