---- ############################## ----
---- ### RYAN'S HYPRLAND CONFIG ### ----
---- ############################## ----

---------------------
---- MY PROGRAMS ----
---------------------

local terminal = "foot"
local fileManager = "thunar"
local browser = "helium-browser"
local ipc = "noctalia msg "

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function ()
  hl.exec_cmd("/usr/lib/hyprpolkitagent/hyprpolkitagent")
  hl.exec_cmd("noctalia")
  hl.exec_cmd("$HOME/.cargo/bin/shikane")
  hl.exec_cmd("hyprpm reload")
  hl.exec_cmd(terminal)
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic-Gruvbox")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Classic-Gruvbox")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("GDK_SCALE", "1")
hl.env("GDK_BACKEND", "wayland,x11")

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
  general = {
    gaps_in = 4,
    gaps_out = 18,
    border_size = 2,
    resize_on_border = false,
    allow_tearing = false,
    layout = "scrolling",
  },

  decoration = {
    rounding = 6,
    rounding_power = 2,

    active_opacity = 1.0,
    inactive_opacity = 1.0,

    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = 0xee1a1a1a,
    },

    blur = {
      enabled = true,
      size = 8,
      passes = 3,
      vibrancy = 0.1696,
    },
  },

-- Animations
  animations = {
    enabled = true,
  },
})

hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

-- Layout
hl.config({
  dwindle = {
    preserve_split = true,
    force_split = 2,
  },
})

hl.config({
  master = {
    new_status = "slave",
    mfact = 0.60,
    orientation = "center",
    slave_count_for_center_master = 0,
  },
})

hl.config({
  scrolling = {
    fullscreen_on_one_column = true,
  },
})

hl.config({
  misc = {
    force_default_wallpaper = 0,
    disable_hyprland_logo = false,
  },
})

---------------
---- INPUT ----
---------------

hl.config({
  input = {
    kb_layout = "us",
    kb_variant = "",
    kb_model = "",
    kb_options = "",
    kb_rules = "",

    follow_mouse = 1,

    sensitivity = 0.5,

    touchpad = {
      natural_scroll = true,
    },
  },
})

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace"
})

hl.device({
  name = "epic-mouse-v1",
  sensitivity = -0.5,
})

---------------------
---- KEYBINDINGS ----
---------------------

-- Mod Key
local mainMod = "SUPER"

-- Main Binds
hl.bind(mainMod .. " + return", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())

hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("$HOME/.cargo/bin/shikane"))

hl.bind("ALT + SPACE", hl.dsp.exec_cmd(ipc .. "panel-toggle launcher"))
hl.bind("ALT + Tab", hl.dsp.exec_cmd(ipc .. "window-switcher"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(ipc .. "session lock"))
hl.bind(mainMod .. " + escape", hl.dsp.exec_cmd(ipc .. "panel-toggle session"))

-- Workspace Binds
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Media Controls
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. "volume-up"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. "volume-down"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd(ipc .. "volume-mute"),     { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd(ipc .. "brightness-up"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd(ipc .. "brightness-down"),                  { locked = true, repeating = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Scrolling Layout
hl.bind(mainMod .. " + period", hl.dsp.layout("move +col"))
hl.bind(mainMod .. " + comma", hl.dsp.layout("move -col"))
hl.bind(mainMod .. " + SHIFT + period", hl.dsp.layout("movewindowto r"))
hl.bind(mainMod .. " + SHIFT + comma", hl.dsp.layout("movewindowto l"))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.layout("movewindowto u"))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.layout("movewindowto d"))
hl.bind(mainMod .. " + minus", hl.dsp.layout("colresize -0.1"))
hl.bind(mainMod .. " + equal", hl.dsp.layout("colresize +0.1"))
hl.bind(mainMod .. " + home", hl.dsp.layout("swapcol l"))
hl.bind(mainMod .. " + end", hl.dsp.layout("swapcol r"))

-- Switch Layouts
hl.bind("SUPER + tab", function ()
    local layouts     = { "scrolling", "dwindle", "master", "monocle" }
    local workspace   = hl.get_active_workspace()
	if hl.get_active_special_workspace() then
		workspace = hl.get_active_special_workspace()
	end

    local next_layout = "dwindle"

    if not workspace then
        return
    end

    for i = 1, #layouts do
        if layouts[i] == workspace.tiled_layout then
            local next_layout_idx = (i % #layouts) + 1
            next_layout = layouts[next_layout_idx]
            break
        end
    end

	if workspace.special then
		hl.workspace_rule({ workspace = tostring(workspace.name), layout = next_layout })
	else
		hl.workspace_rule({ workspace = tostring(workspace.id), layout = next_layout })
	end
end)

-- Print Screen
hl.bind("print", function()
    hl.plugin.hyprcapture.open()
end)

hl.bind(mainMod .. " + print", function()
  hl.plugin.hyprcapture.open("window")
end)

hl.bind(mainMod .. " + SHIFT + print", function()
    hl.plugin.hyprcapture.open("region")
end)

----------------------
---- WINDOW RULES ----
----------------------

local suppressMaximizeRule = hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.window_rule({
    match = { class = "dev.noctalia.Noctalia" },
    float = true,
    size = { 1080, 920 },
})

hl.layer_rule({
  name = "noctalia",
  match = {
    namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$",
  },
  no_anim = true,
  ignore_alpha = 0.5,
  blur = true,
  blur_popups = true,
})

-----------------
---- PLUGINS ----
-----------------

hl.config({
    plugin = {
        hyprcapture = {
            default_mode = "fullscreen",
            fusion_mode = true,
            confirm_before_capture = false,
            fullscreen_scope = "all",
            window_background = "follow-system",
            save = true,
            clipboard = true,
            show_thumbnail = true,
            helper = "$HOME/.local/bin/hyprcapture-ui",
        },
    },
})

-- This loads Noctalia-generated Hyprland colors.
dofile("/home/ryan/.config/hypr/noctalia/noctalia-colors.lua")

-- For Noctalia Color templates
require("noctalia").apply_theme()
