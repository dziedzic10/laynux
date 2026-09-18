local mainMod = "SUPER"

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
--hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("obsidian"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("obsidian --force-device-scale-factor=2"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("teams --force-device-scale-factor=2"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("claude-desktop"))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("brave --password-store=basic"))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("brave --incognito --password-store=basic"))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("wlogout"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(terminal .. " --class clipse -e 'clipse'"))
-- hl.bind(mainMod .. " + HOME", hl.dsp.exec_cmd("~/.scripts/toggle_edp1.sh"), { release = true })
-- hl.bind(mainMod .. " + SHIFT + HOME", hl.dsp.exec_cmd("~/.scripts/toggle_samsung.sh"), { release = true })
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("~/.scripts/wallpaper.sh"))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("kitty --class floating-term -e btop"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("spotify"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t -sw"))

hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("~/.scripts/waybar_reload.sh"))
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("~/.scripts/sway_reload.sh"))

-- Move focus
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "d" }))

-- Switch workspaces / move active window to a workspace
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- FN keys
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("~/.scripts/brightness.sh dec"), { release = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("~/.scripts/brightness.sh inc"), { release = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl --player=spotify play-pause"), { release = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("~/.scripts/volume.sh mute"), { release = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("~/.scripts/volume.sh dec"), { release = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("~/.scripts/volume.sh inc"), { release = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { release = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { release = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"))

-- Directional window moves / workspace scroll / monitor moves
hl.bind(mainMod .. " + ALT + l", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + ALT + h", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + ALT + j", hl.dsp.window.move({ direction = "d" }))
hl.bind(mainMod .. " + ALT + k", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.move({ workspace = "e-1" }))
hl.bind(mainMod .. " + CTRL + SHIFT + l", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + CTRL + SHIFT + h", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + right", hl.dsp.workspace.move({ monitor = "+1" }))
hl.bind(mainMod .. " + left", hl.dsp.workspace.move({ monitor = "-1" }))

-- Resize active window
hl.bind(mainMod .. " + CTRL + h", hl.dsp.window.resize({ x = -200, y = 0, relative = true }))
hl.bind(mainMod .. " + CTRL + l", hl.dsp.window.resize({ x = 200, y = 0, relative = true }))
hl.bind(mainMod .. " + CTRL + k", hl.dsp.window.resize({ x = 0, y = -100, relative = true }))
hl.bind(mainMod .. " + CTRL + j", hl.dsp.window.resize({ x = 0, y = 100, relative = true }))

hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region")) -- --clipboard-only
hl.bind(mainMod .. " + mouse:274", hl.dsp.exec_cmd(terminal .. " --class clipse -e 'clipse'"))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("~/.scripts/colorpicker.sh"))
