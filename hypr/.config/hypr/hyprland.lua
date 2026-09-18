-- THEME
local colors = require("mocha")

------------------
---- MONITORS ----
------------------

hl.monitor({ output = "desc:Iiyama North America PL2770Q 1239851620174", mode = "2560x1440@144.00", position = "-2560x0", scale = "auto" })
hl.monitor({ output = "desc:AU Optronics 0x60A3", mode = "preferred", position = "0x0", scale = 1.5 })
hl.monitor({ output = "desc:Samsung Electric Company C34J79x HNTW202213", mode = "3440x1440@99.98", position = "auto", scale = 1.25 })
hl.monitor({ output = "desc:Synaptics Inc Non-PnP 0x00BC614", mode = "1920x1080@60.00", position = "auto", scale = 1 })
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })

-- TODO: switch-device binds (Lid Switch) aren't confirmed in the Lua API docs I found.
-- Keep these in your old hyprland.conf for now (still sourceable), or check
-- https://wiki.hypr.land/Configuring/Basics/Binds/ for the current syntax:
-- bindl=,switch:on:Lid Switch,exec,loginctl lock-session

-------------------
---- PROGRAMS ----
-------------------

terminal = "kitty"
fileManager = "dolphin"
menu = "wofi --show drun"

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("brave --password-store=basic", { workspace = "1 silent" })
    hl.exec_cmd(terminal, { workspace = "2 silent" })
    hl.exec_cmd("obsidian --force-device-scale-factor=1.5", { workspace = "3 silent" })
    hl.exec_cmd("nm-applet & blueman-applet & deconnect-indicator")
    hl.exec_cmd("waybar & hyprpaper")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("synology-drive")
    hl.exec_cmd("sleep 1 && pactl set-sink-volume @DEFAULT_SINK@ 30%")
    hl.exec_cmd("clipse -listen")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd('echo "export HYPRLAND_INSTANCE_SIGNATURE=$HYPRLAND_INSTANCE_SIGNATURE" > /tmp/hypr_env')
    hl.exec_cmd("sleep 1 && ~/.scripts/wallpaper.sh")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XDG_DATA_DIRS", "/usr/share:/usr/local/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share")
hl.env("HYPRSHOT_DIR", "/home/andydz/Pictures/screenshots")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
-- hl.env("AQ_NO_MODIFIERS", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 0,
        border_size = 2,
        col = {
            active_border = colors.lavender,
            inactive_border = colors.crust,
        },
        resize_on_border = true,
        layout = "dwindle",
    },

    decoration = {
        rounding = 7,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = false,
    },

    master = {
        new_status = "master",
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
    },

    xwayland = {
        force_zero_scaling = true,
    },
})

-- NOTE: bezier/animation definitions are unused since animations.enabled = false above,
-- so I skipped converting them. Say the word if you want them ported anyway.

-----------------
---- INPUT ----
-----------------

hl.config({
    input = {
        kb_layout = "pl",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0.2,
        touchpad = {
            natural_scroll = true,
        },
    },
})

hl.device({
    name = "dell-computer-corp-dell-universal-receiver-mouse",
    sensitivity = 0,
})

-------------------------------------
---- WINDOWS AND WORKSPACES ----
-------------------------------------

hl.workspace_rule({ workspace = "1", persistent = true })
hl.workspace_rule({ workspace = "2", persistent = true })
hl.workspace_rule({ workspace = "3", persistent = true })

hl.window_rule({ name = "suppress-maximize", match = { class = ".*" }, suppress_event = "maximize" })
hl.window_rule({ name = "floating-term-float", match = { class = "^floating-term$" }, float = true })
hl.window_rule({ name = "floating-term-size", match = { class = "^floating-term$" }, size = "1300 800" })
hl.window_rule({ name = "clipse-float", match = { class = "^clipse$" }, float = true })
hl.window_rule({ name = "clipse-size", match = { class = "^clipse$" }, size = "1000 900" })

-- KEYBINDS
require("binds")
