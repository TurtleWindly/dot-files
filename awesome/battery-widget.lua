local awful = require("awful")
local watch = require("awful.widget.watch")
local gears = require("gears")
local gfs = require("gears.filesystem")
local wibox = require("wibox")
local naughty = require("naughty")
local beautiful = require("beautiful")

local battery_widget = {}

local ICON_DIR = gfs.get_configuration_dir() .. "icon/"
local battery_capacity_cmd = "cat /sys/class/power_supply/BAT0/capacity"

-- example 
-- state: discharging
local battery_charging_cmd = "echo $(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep state)"
local is_discharging = true

local function battery_notification(title, text)
    naughty.notify({
        title = title,
        text  = text,
        timeout = 5,
    })
end

local function worker(user_args)
    local args = user_args or {}
    local timeout = args.timeout or 180
    local path_to_icon = args.path_to_icon or ICON_DIR .. 'bolt.svg'
    local battery_low = args.battery_low or 20
    local battery_high = args.battery_high or 80

    battery_widget.widget = wibox.widget {
            {
                {
                    image = path_to_icon,
                    resize = false,
                    widget = wibox.widget.imagebox,
                },
                valign = 'center',
                layout = wibox.container.place
            },
            {
                id = 'txt',
                widget = wibox.widget.textbox
            },
            spacing = 4,
            layout = wibox.layout.fixed.horizontal,
            set_value = function(self, level)
                local display_level = level
                self:get_children_by_id('txt')[1]:set_text(display_level)
            end
    }

    local function update_state(capacity)
        awful.spawn.easy_async_with_shell(battery_charging_cmd, function(out)
            if out:match("discharging") then
                is_discharging = true
            else
                is_discharging = false
            end

            -- notification if battery is low or charged completed
            if capacity < battery_low and is_discharging then
                battery_notification("Batter is Low !", "You probably need to charge the laptop" )
            elseif capacity > battery_high and not is_discharging then
                battery_notification("Batter charged completed !", "Unplug to help battery not to go fire !" )
            end
        end)
    end

    local update_widget = function(widget, out, _, _, _)
        local capacity = tonumber(out)
        update_state(capacity)

        widget:set_value(out)
    end

    watch(battery_capacity_cmd, timeout, update_widget, battery_widget.widget)

    return battery_widget.widget
end

return setmetatable(battery_widget, {
	__call = function(_, ...)
		return worker(...)
	end,
})
