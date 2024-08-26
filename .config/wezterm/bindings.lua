local wezterm = require("wezterm")
local act = wezterm.action

local mod = {}
mod.NONE = "NONE"
mod.SUPER = "SUPER"
mod.CTRL = "CTRL"
mod.ALT = "ALT"
mod.SHIFT = "SHIFT"
mod.SUPER_CTRL = "SUPER|CTRL"
mod.SUPER_SHIFT = "SUPER|SHIFT"
mod.SHIFT_CTRL = "SHIFT|CTRL"

local keys = {
  -- font_size
  { key = "-", mods = mod.SUPER, action = act.DecreaseFontSize },
  { key = "=", mods = mod.SUPER, action = act.IncreaseFontSize },
  { key = "0", mods = mod.SUPER, action = act.ResetFontSize },

  -- tab
  { key = "1", mods = mod.SUPER, action = act.ActivateTab(0) },
  { key = "2", mods = mod.SUPER, action = act.ActivateTab(1) },
  { key = "3", mods = mod.SUPER, action = act.ActivateTab(2) },
  { key = "4", mods = mod.SUPER, action = act.ActivateTab(3) },
  { key = "5", mods = mod.SUPER, action = act.ActivateTab(4) },
  { key = "6", mods = mod.SUPER, action = act.ActivateTab(5) },
  { key = "7", mods = mod.SUPER, action = act.ActivateTab(6) },
  { key = "8", mods = mod.SUPER, action = act.ActivateTab(7) },
  { key = "9", mods = mod.SUPER, action = act.ActivateTab(-1) },
  { key = "Tab", mods = mod.CTRL, action = act.ActivateTabRelative(1) },
  { key = "[", mods = mod.SUPER, action = act.ActivateTabRelative(-1) },
  { key = "]", mods = mod.SUPER, action = act.ActivateTabRelative(1) },

  -- essential
  { key = "a", mods = mod.SUPER, action = act.ActivateCopyMode },
  { key = "c", mods = mod.SUPER, action = act.CopyTo("Clipboard") },
  { key = "d", mods = mod.SUPER, action = act.ShowDebugOverlay },
  { key = "f", mods = mod.SUPER, action = act.Search({ CaseInSensitiveString = "" }) },
  { key = "h", mods = mod.SUPER_SHIFT, action = act.SplitHorizontal{ domain =  "CurrentPaneDomain" } },
  { key = "l", mods = mod.SUPER, action = act.ShowLauncher },
  { key = "n", mods = mod.SUPER, action = act.SpawnWindow },
  { key = "p", mods = mod.SUPER_SHIFT, action = act.ActivateCommandPalette },
  { key = "q", mods = mod.SUPER, action = act.QuitApplication },
  { key = "r", mods = mod.SUPER, action = act.ReloadConfiguration },
  { key = "t", mods = mod.SUPER, action = act.SpawnTab("DefaultDomain") },
  { key = "v", mods = mod.SUPER, action = act.PasteFrom("Clipboard") },
  { key = "v", mods = mod.SUPER_SHIFT, action = act.SplitVertical{ domain =  "CurrentPaneDomain" } },
  { key = "w", mods = mod.SUPER, action = act.CloseCurrentTab({ confirm = false }) },
  { key = "A", mods = mod.SUPER, action = act.ActivateCopyMode },
  { key = "C", mods = mod.SUPER, action = act.CopyTo("Clipboard") },
  { key = "D", mods = mod.SUPER, action = act.ShowDebugOverlay },
  { key = "F", mods = mod.SUPER, action = act.Search({ CaseInSensitiveString = "" }) },
  { key = "H", mods = mod.SUPER_SHIFT, action = act.SplitHorizontal{ domain =  "CurrentPaneDomain" } },
  { key = "L", mods = mod.SUPER, action = act.ShowLauncher },
  { key = "N", mods = mod.SUPER, action = act.SpawnWindow },
  { key = "P", mods = mod.SUPER_SHIFT, action = act.ActivateCommandPalette },
  { key = "Q", mods = mod.SUPER, action = act.QuitApplication },
  { key = "T", mods = mod.SUPER, action = act.SpawnTab("DefaultDomain") },
  { key = "V", mods = mod.SUPER, action = act.PasteFrom("Clipboard") },
  { key = "V", mods = mod.SUPER_SHIFT, action = act.SplitVertical{ domain =  "CurrentPaneDomain" } },
  { key = "W", mods = mod.SUPER, action = act.CloseCurrentTab({ confirm = false }) },
  { key = "Enter", mods = mod.ALT, action = act.ToggleFullScreen },
  { key = "PageUp", mods = mod.SHIFT, action = act.ScrollByPage(-1) },
  { key = "PageDown", mods = mod.SHIFT, action = act.ScrollByPage(1) },
  { key = "LeftArrow", mods = mod.SHIFT_CTRL, action = act.ActivatePaneDirection "Left" },
  { key = "RightArrow", mods = mod.SHIFT_CTRL, action = act.ActivatePaneDirection "Right" },
  { key = "UpArrow", mods = mod.SHIFT_CTRL, action = act.ActivatePaneDirection "Up" },
  { key = "DownArrow", mods = mod.SHIFT_CTRL, action = act.ActivatePaneDirection "Down" },
  { key = "phys:Space", mods = mod.SHIFT_CTRL, action = act.QuickSelect },
}

local key_tables = {
  search_mode = {
    { key = "Enter", mods = mod.NONE, action = act.CopyMode "PriorMatch" },
    { key = "Escape", mods = mod.NONE, action = act.CopyMode "Close" },
    { key = "n", mods = mod.CTRL, action = act.CopyMode "NextMatch" },
    { key = "p", mods = mod.CTRL, action = act.CopyMode "PriorMatch" },
    { key = "r", mods = mod.CTRL, action = act.CopyMode "CycleMatchType" },
    { key = "u", mods = mod.CTRL, action = act.CopyMode "ClearPattern" },
    { key = "N", mods = mod.CTRL, action = act.CopyMode "NextMatch" },
    { key = "P", mods = mod.CTRL, action = act.CopyMode "PriorMatch" },
    { key = "R", mods = mod.CTRL, action = act.CopyMode "CycleMatchType" },
    { key = "U", mods = mod.CTRL, action = act.CopyMode "ClearPattern" },
    { key = "PageUp", mods = mod.NONE, action = act.CopyMode "PriorMatchPage" },
    { key = "PageDown", mods = mod.NONE, action = act.CopyMode "NextMatchPage" },
    { key = "UpArrow", mods = mod.NONE, action = act.CopyMode "PriorMatch" },
    { key = "DownArrow", mods = mod.NONE, action = act.CopyMode "NextMatch" },
  },
}

local mouse_bindings = {
  { event = { Up = { streak = 1, button = "Left" } }, mods = mod.SUPER, action = act.OpenLinkAtMouseCursor },
  { event = { Down = { streak = 1, button = "Left" } }, mods = mod.NONE, action = act.SelectTextAtMouseCursor("Cell") },
  { event = { Up = { streak = 1, button = "Left" } }, mods = mod.NONE, action = act.ExtendSelectionToMouseCursor("Cell") },
  { event = { Drag = { streak = 1, button = "Left" } }, mods = mod.NONE, action = act.ExtendSelectionToMouseCursor("Cell") },
  { event = { Down = { streak = 2, button = "Left" } }, mods = mod.NONE, action = act.SelectTextAtMouseCursor("Word") },
  { event = { Down = { streak = 3, button = "Left" } }, mods = mod.NONE, action = act.SelectTextAtMouseCursor("Line") },
  { event = { Down = { streak = 1, button = { WheelUp = 1 } } }, mods = mod.NONE, action = act.ScrollByCurrentEventWheelDelta },
  { event = { Down = { streak = 1, button = { WheelDown = 1 } } }, mods = mod.NONE, action = act.ScrollByCurrentEventWheelDelta },
}

return {
  disable_default_key_bindings = true,
  disable_default_mouse_bindings = true,
  leader = { key = "Space", mods = mod.SUPER_CTRL },
  keys = keys,
  key_tables = key_tables,
  mouse_bindings = mouse_bindings,
}
