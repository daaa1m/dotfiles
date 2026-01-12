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

-- apps shortcuts
local appShortcuts = {
	a = "Claude",
	b = "Brave Browser",
	c = "Google Chrome",
	e = "Microsoft Outlook",
	o = "Obsidian",
	s = "Mate Translate",
	t = "kitty",
	w = "WhatsApp",
}

for key, app in pairs(appShortcuts) do
	hs.hotkey.bind(hyper, key, function()
		hs.application.launchOrFocus(app)
	end)
end

-- manual config reload: Hyper+h
hs.hotkey.bind(hyper, "h", function()
	hs.reload()
end)
hs.alert.show("Config loaded")
