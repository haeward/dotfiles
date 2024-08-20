local wezterm = require("wezterm")

local GLYPH_SEMI_CIRCLE_LEFT = ""
-- local GLYPH_SEMI_CIRCLE_LEFT = utf8.char(0xe0b6)
local GLYPH_SEMI_CIRCLE_RIGHT = ""
-- local GLYPH_SEMI_CIRCLE_RIGHT = utf8.char(0xe0b4)

local Title = {}

Title.cells = {}

Title.colors = {
  default = {
    bg = "#2EC7FF",
    fg = "#20202E",
  },
  is_active = {
    bg = "#8795FF",
    fg = "#20202E",
  },
}

Title.set_process_name = function(s)
  local a = string.gsub(s, "(.*[/\\])(.*)", "%2")
  return a:gsub("%.exe$", "")
end

Title.set_title = function(process_name, static_title, active_title, max_width, inset)
  local title
  inset = inset or 6

  if process_name:len() > 0 and static_title:len() == 0 then
    title = "  " .. process_name .. " ~ " .. " "
  elseif static_title:len() > 0 then
    title = "󰌪  " .. static_title .. " ~ " .. " "
  else
    title = "󰌽  " .. active_title .. " ~ " .. " "
  end

  if title:len() > max_width - inset then
    local diff = title:len() - max_width + inset
    title = wezterm.truncate_right(title, title:len() - diff)
  end

  return title
end

Title.check_if_admin = function(p)
  if p:match("^Administrator: ") then
    return true
  end
  return false
end

---@param fg string
---@param bg string
---@param attribute table
---@param text string
Title.push = function(bg, fg, attribute, text)
  table.insert(Title.cells, { Background = { Color = bg } })
  table.insert(Title.cells, { Foreground = { Color = fg } })
  table.insert(Title.cells, { Attribute = attribute })
  table.insert(Title.cells, { Text = text })
end

Title.setup = function()
  wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    Title.cells = {}

    local bg
    local fg
    local process_name = Title.set_process_name(tab.active_pane.foreground_process_name)
    local is_admin = Title.check_if_admin(tab.active_pane.title)
    local title = Title.set_title(process_name, tab.tab_title, tab.active_pane.title, max_width, (is_admin and 8))

    if tab.is_active then
      bg = Title.colors.is_active.bg
      fg = Title.colors.is_active.fg
    else
      bg = Title.colors.default.bg
      fg = Title.colors.default.fg
    end

    local has_unseen_output = false
    for _, pane in ipairs(tab.panes) do
      if pane.has_unseen_output then
        has_unseen_output = true
        break
      end
    end

    -- Left semi-circle
    Title.push(fg, bg, { Intensity = "Bold" }, GLYPH_SEMI_CIRCLE_LEFT)

    -- Title
    Title.push(bg, fg, { Intensity = "Bold" }, " " .. title)

    -- Right padding
    Title.push(bg, fg, { Intensity = "Bold" }, " ")

    -- Right semi-circle
    Title.push(fg, bg, { Intensity = "Bold" }, GLYPH_SEMI_CIRCLE_RIGHT)

    return Title.cells
  end)
end

return Title

-- local CMD_ICON = utf8.char(0xe62a)
-- local NU_ICON = utf8.char(0xe7a8)
-- local PS_ICON = utf8.char(0xe70f)
-- local ELV_ICON = utf8.char(0xfc6f)
-- local WSL_ICON = utf8.char(0xf83c)
-- local YORI_ICON = utf8.char(0xf1d4)
-- local NYA_ICON = utf8.char(0xf61a)
--
-- local VIM_ICON = utf8.char(0xe62b)
-- local PAGER_ICON = utf8.char(0xf718)
-- local FUZZY_ICON = utf8.char(0xf0b0)
-- local HOURGLASS_ICON = utf8.char(0xf252)
-- local SUNGLASS_ICON = utf8.char(0xf9df)
--
-- local PYTHON_ICON = utf8.char(0xf820)
-- local NODE_ICON = utf8.char(0xe74e)
-- local DENO_ICON = utf8.char(0xe628)
-- local LAMBDA_ICON = utf8.char(0xfb26)
--
-- local SOLID_LEFT_ARROW = utf8.char(0xe0ba)
-- local SOLID_LEFT_MOST = utf8.char(0x2588)
-- local SOLID_RIGHT_ARROW = utf8.char(0xe0bc)
-- local ADMIN_ICON = utf8.char(0xf49c)
