-- ╔══════════════════════════════════════════════════════════════╗
-- ║  EYE OF GOD — Helix Nebula theme. Full Hyprland showcase:      ║
-- ║  a LIVING border (teal↔gold, flows + rotates forever via a     ║
-- ║  Lua timer), macOS-style frosted glass everywhere, teal glow.  ║
-- ╚══════════════════════════════════════════════════════════════╝

local activeBorder = { colors = { "rgb(1fd4ee)", "rgb(5fecff)", "rgb(e6b15a)" }, angle = 45 }
local inactiveBorder = "rgba(5a6e6c55)"

hl.config({
  general = {
    border_size = 2, gaps_in = 6, gaps_out = 12, resize_on_border = true,
    col = { active_border = activeBorder, inactive_border = inactiveBorder },
  },
  group = { col = { border_active = activeBorder, border_inactive = inactiveBorder } },
  decoration = {
    rounding = 0, rounding_power = 2.0,
    active_opacity = 0.90, inactive_opacity = 0.80, fullscreen_opacity = 1.0,
    dim_inactive = true, dim_strength = 0.2, dim_special = 0.4,
    blur = {
      enabled = true, size = 10, passes = 4, new_optimizations = true,
      ignore_opacity = true, noise = 0.008, contrast = 0.95,
      brightness = 0.92, vibrancy = 0.25, vibrancy_darkness = 0.5,
      special = true, popups = true, popups_ignorealpha = 0.2,
    },
    shadow = { enabled = true, range = 50, render_power = 4, scale = 1.05,
      color = "rgba(1fd4eeaa)", color_inactive = "rgba(0d1417cc)" },
  },
  animations = { enabled = true },
})

hl.layer_rule({ match = { namespace = "waybar" }, blur = true })
hl.layer_rule({ match = { namespace = "walker" }, blur = true })
hl.layer_rule({ match = { namespace = "notifications" }, blur = true })
hl.layer_rule({ match = { namespace = "swayosd" }, blur = true })

hl.curve("eogPop", { type = "bezier", points = { { 0.34, 1.56 }, { 0.64, 1.0 } } })
hl.curve("eogGlide", { type = "bezier", points = { { 0.25, 0.46 }, { 0.45, 0.94 } } })
hl.animation({ leaf = "windows", enabled = true, speed = 4.0, bezier = "eogPop", style = "popin 82%" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.0, bezier = "eogPop", style = "popin 78%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3.4, bezier = "eogGlide", style = "popin 86%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 4.4, bezier = "eogGlide" })
hl.animation({ leaf = "border", enabled = true, speed = 8, bezier = "eogGlide" })
hl.animation({ leaf = "fade", enabled = true, speed = 4.5, bezier = "eogGlide" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 4.5, bezier = "eogGlide", style = "slidefade 18%" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 4.5, bezier = "eogPop", style = "slidevert" })
hl.animation({ leaf = "layers", enabled = true, speed = 4, bezier = "eogPop", style = "popin 90%" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "eogPop", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 3, bezier = "eogGlide", style = "fade" })

-- ✦ LIVING BORDER — Helix spectrum (teal → aqua → gold → rust → back),
-- flows + rotates + glow pulses forever. ~2% CPU. Delete to make static.
if not _G.__eog_alive then
  _G.__eog_alive = true
  local cycle = {
    "1fd4ee","3fe6f0","6fd8c0","8fce9a","c7c06a","e6b15a","e0935a",
    "d9674a","e0935a","e6b15a","c7c06a","8fce9a","6fd8c0","3fe6f0",
  }
  local n = #cycle
  local i = 0
  local function pulse()
    i = i + 1
    local a = cycle[(i % n) + 1]
    local b = cycle[((i + 4) % n) + 1]
    local angle = (i * 7) % 360
    hl.config({
      general = { col = { active_border = { colors = { "rgb(" .. a .. ")", "rgb(" .. b .. ")" }, angle = angle } } },
      decoration = { shadow = { color = "rgba(" .. a .. "cc)" } },
    })
    hl.timer(pulse, { timeout = 95, type = "oneshot" })
  end
  pulse()
end
