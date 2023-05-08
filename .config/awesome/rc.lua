-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

-- error handling
if awesome.startup_errors then
  naughty.notify({
    preset = naughty.config.presets.critical,
    title = "Oops, there were errors during startup!",
    text = awesome.startup_errors
  })
end

do
  local in_error = false
  awesome.connect_signal("debug::error", function(err)
    -- Make sure we don't go into an endless error loop
    if in_error then return end
    in_error = true

    naughty.notify({
      preset = naughty.config.presets.critical,
      title = "Oops, an error happened!",
      text = tostring(err)
    })
    in_error = false
  end)
end

-- theme
beautiful.init(gears.filesystem.get_configuration_dir() .. "theme.lua")

-- variables
terminal = "alacritty -o font.size=12"
editor = "nvim"
editor_cmd = terminal .. " -e " .. editor
browser = "brave"
fileman = "thunar"

modkey = "Mod4"

-- layouts
awful.layout.layouts = {
  awful.layout.suit.tile,
  awful.layout.suit.tile.left,
  awful.layout.suit.floating,
  awful.layout.suit.tile.bottom,
  awful.layout.suit.tile.top,
  awful.layout.suit.max,
  awful.layout.suit.max.fullscreen,
}
-- enable gaps
beautiful.useless_gap = 6
beautiful.gap_single_client = true

-- fix window snapping
awful.mouse.snap.edge_enabled = false

-- wallpaper
local function set_wallpaper(s)
  if beautiful.wallpaper then
    local wallpaper = beautiful.wallpaper
    -- If wallpaper is a function, call it with the screen
    if type(wallpaper) == "function" then
      wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)
  end
end

-- re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

-- screen
awful.screen.connect_for_each_screen(function(s)
  set_wallpaper(s)

  -- Each screen has its own tag table.
  awful.tag({ "1", "2", "3", "4", "5", "6" }, s, awful.layout.layouts[1])
end)

-- key bindings
globalkeys = gears.table.join(
-- focus
  awful.key({ modkey, }, "j",
    function()
      awful.client.focus.global_bydirection("down")
    end,
    { description = "focus down", group = "client" }
  ),
  awful.key({ modkey, }, "k",
    function()
      awful.client.focus.global_bydirection("up")
    end,
    { description = "focus up", group = "client" }
  ),
  awful.key({ modkey, }, "h",
    function()
      awful.client.focus.global_bydirection("left")
    end,
    { description = "focus left", group = "client" }
  ),
  awful.key({ modkey, }, "l",
    function()
      awful.client.focus.global_bydirection("right")
    end,
    { description = "focus right", group = "client" }
  ),

  -- swap
  awful.key({ modkey, "Control" }, "j",
    function()
      awful.client.swap.global_bydirection("down")
    end,
    { description = "swap down", group = "client" }
  ),
  awful.key({ modkey, "Control" }, "k",
    function()
      awful.client.swap.global_bydirection("up")
    end,
    { description = "swap up", group = "client" }
  ),
  awful.key({ modkey, "Control" }, "h",
    function()
      awful.client.swap.global_bydirection("left")
    end,
    { description = "swap left", group = "client" }
  ),
  awful.key({ modkey, "Control" }, "l",
    function()
      awful.client.swap.global_bydirection("right")
    end,
    { description = "swap right", group = "client" }
  ),

  -- resize
  awful.key({ modkey, "Shift" }, "j", function()
      awful.client.incwfact(0.025)
    end,
    { description = "size down", group = "client" }
  ),
  awful.key({ modkey, "Shift" }, "k", function()
      awful.client.incwfact(-0.025)
    end,
    { description = "size up", group = "client" }
  ),
  awful.key({ modkey, "Shift" }, "h", function()
      awful.tag.incmwfact(-0.025)
    end,
    { description = "size left", group = "client" }
  ),
  awful.key({ modkey, "Shift" }, "l", function()
      awful.tag.incmwfact(0.025)
    end,
    { description = "size right", group = "client" }
  ),
  -- change number of master clients/columnns
  awful.key({ modkey }, "m", function() awful.tag.incnmaster(1, nil, true) end,
    { description = "increase the number of master clients", group = "layout" }),
  awful.key({ modkey, "Shift" }, "m", function() awful.tag.incnmaster(-1, nil, true) end,
    { description = "decrease the number of master clients", group = "layout" }),
  awful.key({ modkey, }, "n", function() awful.tag.incncol(1, nil, true) end,
    { description = "increase the number of columns", group = "layout" }),
  awful.key({ modkey, "Shift" }, "n", function() awful.tag.incncol(-1, nil, true) end,
    { description = "decrease the number of columns", group = "layout" }),

  -- set specific layout
  awful.key({ modkey, }, "d", function()
      awful.layout.set(awful.layout.suit.tile)
    end,
    { description = "tile", group = "layout" }
  ),
  awful.key({ modkey, "Shift" }, "d", function()
      awful.layout.set(awful.layout.suit.tile.left)
    end,
    { description = "tile left", group = "layout" }
  ),
  awful.key({ modkey, }, "a", function()
      awful.layout.set(awful.layout.suit.tile.top)
    end,
    { description = "tile top", group = "layout" }
  ),
  awful.key({ modkey, "Shift" }, "a", function()
      awful.layout.set(awful.layout.suit.tile.bottom)
    end,
    { description = "tile bottom", group = "layout" }
  ),
  awful.key({ modkey, }, "f", function()
      awful.layout.set(awful.layout.suit.max)
    end,
    { description = "max", group = "layout" }
  ),
  awful.key({ modkey, }, "s", function()
      awful.layout.set(awful.layout.suit.floating)
    end,
    { description = "float", group = "layout" }
  ),


  -- launch program
  -- terminal
  awful.key({ modkey, }, "Return", function() awful.spawn(terminal) end,
    { description = "open a terminal", group = "launcher" }),

  -- browser
  awful.key({ modkey, }, "w", function() awful.spawn(browser) end,
    { description = "open a browser", group = "launcher" }),

  -- browser
  -- awful.key({ modkey, }, "n", function() awful.spawn(fileman) end,
  --   { description = "open a terminal", group = "launcher" }),

  -- awesome related
  awful.key({ modkey, "Control" }, "r", awesome.restart,
    { description = "reload awesome", group = "awesome" }),
  awful.key({ modkey, "Shift" }, "q", awesome.quit,
    { description = "quit awesome", group = "awesome" }),
  awful.key({ modkey, "Shift", "Control" }, "h", hotkeys_popup.show_help,
    { description = "show help", group = "awesome" }),

  awful.key({ modkey, }, "Tab", awful.tag.history.restore,
    { description = "go back", group = "awesome" }),

  -- Menubar
  awful.key({ modkey }, "p", function() menubar.show() end,
    { description = "show the menubar", group = "launcher" }),

  -- Multimedia
  awful.key({}, "XF86AudioRaiseVolume", function()
      awful.spawn.with_shell("amixer -D pulse sset Master 5%+ ")
    end,
    { description = "raise volume", group = "media" }),

  awful.key({}, "XF86AudioLowerVolume", function()
      awful.spawn.with_shell("amixer -D pulse sset Master 5%- ")
    end,
    { description = "lower volume", group = "media" }),

  awful.key({ "Shift", }, "XF86AudioRaiseVolume", function()
      awful.spawn.with_shell("amixer -D pulse sset Master 1%+ ")
    end,
    { description = "raise volume", group = "media" }),

  awful.key({ "Shift", }, "XF86AudioLowerVolume", function()
      awful.spawn.with_shell("amixer -D pulse sset Master 1%- ")
    end,
    { description = "lower volume", group = "media" }),

  awful.key({}, "XF86AudioPlay", function()
      awful.spawn.with_shell("playerctl play")
    end,
    { description = "play", group = "media" }),

  awful.key({}, "XF86AudioPause", function()
      awful.spawn.with_shell("playerctl pause")
    end,
    { description = "pause", group = "media" }),

  awful.key({}, "XF86AudioNext", function()
      awful.spawn.with_shell("playerctl next")
    end,
    { description = "next", group = "media" }),

  awful.key({}, "XF86AudioPrev", function()
      awful.spawn.with_shell("playerctl prev")
    end,
    { description = "prev", group = "media" }),

  awful.key({}, "XF86AudioMute", function()
      awful.spawn.with_shell("amixer sset Master toggle")
    end,
    { description = "mute", group = "media" })

)

clientkeys = gears.table.join(
  awful.key({ modkey, "Shift" }, "f",
    function(c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end,
    { description = "toggle fullscreen", group = "client" }),

  -- awful.key({ modkey, }, "o", awful.client.floating.toggle,
  --   { description = "toggle floating", group = "client" }),


  awful.key({ modkey, }, "q", function(c) c:kill() end,
    { description = "close", group = "client" }),


  awful.key({ modkey, "Control" }, "space", awful.client.floating.toggle,
    { description = "toggle floating", group = "client" }),
  awful.key({ modkey, "Control" }, "Return", function(c) c:swap(awful.client.getmaster()) end,
    { description = "move to master", group = "client" }),
  awful.key({ modkey, }, "o", function(c) c:move_to_screen() end,
    { description = "move to screen", group = "client" }),
  awful.key({ modkey, }, "t", function(c) c.ontop = not c.ontop end,
    { description = "toggle keep on top", group = "client" }),

  awful.key({ modkey, }, "n",
    function(c)
      -- The client currently has the input focus, so it cannot be
      -- minimized, since minimized clients can't have the focus.
      c.minimized = true
    end,
    { description = "minimize", group = "client" }),

  awful.key({ modkey, "Shift" }, "u",
    function(c)
      c.maximized = not c.maximized
      c:raise()
    end,
    { description = "(un)maximize", group = "client" })
  --
  -- awful.key({ modkey, "Shift" }, "i",
  --   function(c)
  --     c.maximized_vertical = not c.maximized_vertical
  --     c:raise()
  --   end,
  --   { description = "(un)maximize vertically", group = "client" }),
  -- awful.key({ modkey, "Control", "Shift" }, "m",
  --   function(c)
  --     c.maximized_horizontal = not c.maximized_horizontal
  --     c:raise()
  --   end,
  --   { description = "(un)maximize horizontally", group = "client" })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
  globalkeys = gears.table.join(globalkeys,
    -- View tag only.
    awful.key({ modkey }, "#" .. i + 9,
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          tag:view_only()
        end
      end,
      { description = "view tag #" .. i, group = "tag" }),
    -- Move client to tag.
    awful.key({ modkey, "Control" }, "#" .. i + 9,
      function()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:move_to_tag(tag)
            tag:view_only()
          end
        end
      end,
      { description = "move focused client to tag #" .. i, group = "tag" }),
    -- Toggle tag display.
    awful.key({ modkey, "Shift" }, "#" .. i + 9,
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          awful.tag.viewtoggle(tag)
        end
      end,
      { description = "toggle tag #" .. i, group = "tag" }),
    -- Toggle tag on focused client.
    awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
      function()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:toggle_tag(tag)
          end
        end
      end,
      { description = "toggle focused client on tag #" .. i, group = "tag" })
  )
end

-- mouse bindings
root.buttons(gears.table.join(
-- awful.button({}, 3, function() mymainmenu:toggle() end),
  awful.button({}, 4, awful.tag.viewnext),
  awful.button({}, 5, awful.tag.viewprev)
))

clientbuttons = gears.table.join(
  awful.button({}, 1, function(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
  end),
  awful.button({ modkey }, 1, function(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
    awful.mouse.client.move(c)
  end),
  awful.button({ modkey }, 3, function(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
    awful.mouse.client.resize(c)
  end)
)

-- set keys
root.keys(globalkeys)

-- rules
awful.rules.rules = {
  -- default
  {
    rule = {},
    properties = {
      border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus = awful.client.focus.filter,
      raise = true,
      keys = clientkeys,
      buttons = clientbuttons,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap + awful.placement.no_offscreen
    }
  },

  -- float
  {
    rule_any = {
      instance = {
        "copyq", -- Includes session name in class.
        "pinentry",
      },
      class = {
        "Arandr",
        "Blueman-manager",
        "Gpick",
        "Kruler",
        "MessageWin",  -- kalarm.
        "Sxiv",
        "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
        "Wpa_gui",
        "veromix",
        "xtightvncviewer" },

      -- Note that the name property shown in xprop might be set slightly after creation of the client
      -- and the name shown there might not match defined rules here.
      name = {
        "Event Tester", -- xev.
      },
      role = {
        "AlarmWindow",   -- Thunderbird's calendar.
        "ConfigManager", -- Thunderbird's about:config.
        "pop-up",        -- e.g. Google Chrome's (detached) Developer Tools.
      }
    },
    properties = { floating = true }
  },

  -- Add titlebars to normal clients and dialogs
  {
    rule_any = { type = { "normal", "dialog" }
    },
    properties = { titlebars_enabled = false }
  },

  {
    rule = { class = "Brave" },
    properties = { screen = 1, tag = "2" }
  },

  {
    rule = { instance = "polybar" },
    properties = { border_width = 0, focusable = false }
  },
}

-- signals
client.connect_signal("manage", function(c)
  -- Set the windows at the slave,
  -- i.e. put it at the end of others instead of setting it master.
  -- if not awesome.startup then awful.client.setslave(c) end

  if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
    -- Prevent clients from being unreachable after screen count changes.
    awful.placement.no_offscreen(c)
  end
end)

-- -- Enable sloppy focus, so that focus follows mouse.
-- client.connect_signal("mouse::enter", function(c)
--   c:emit_signal("request::activate", "mouse_enter", { raise = false })
-- end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

os.execute("xset r rate 300 50")
awful.spawn.with_shell("ibus-daemon -rxR")
awful.spawn.with_shell("$HOME/.config/polybar/launch.sh")
