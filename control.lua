local function onTick()
  --button processing
  if global.active_buttons then
    for i, control in pairs(global.active_buttons) do
      global.active_buttons[i][2] = global.active_buttons[i][2] - 1 --decrement timer
      --game.print("New timer on id " .. i .. " is: " .. global.active_buttons[i][2])

      if global.active_buttons[i][2] <= 0 then --if the timer is up
        if global.active_buttons[i][1].valid then
          global.active_buttons[i][1].enabled = false --deactiveate
        end
        global.active_buttons[i] = nil --remove from list
      end
    end
  end
end

script.on_event(defines.events.on_gui_opened, function(event)
  if event.gui_type == defines.gui_type.entity and event.entity.name == "yc-button" then

      local player = game.get_player(event.player_index)
      
      local custom_frame = player.gui.screen.add{type="frame", caption="Custom Inserter Interface"}
      player.opened = custom_frame
  end
end)


-- Adapted from the pushbutton mod 
local function onKey(event)
  local p = game.players[event.player_index]
  local ent = p.selected
  if ent and ent.valid and p.can_reach_entity(ent) then
    if ent.name == "yc-button" then
      --game.print("Button Pressed")
      local control = ent.get_or_create_control_behavior()
      control.enabled=true
      if not global.active_buttons then global.active_buttons = {} end
      global.active_buttons[ent.unit_number] = {control, 120} -- TODO: Replace 1 with a call to find delay from gui

    elseif ent.name == "yc-passthrough-button" then
      local control = ent.get_or_create_control_behavior()
      control.enabled=true
      if not global.active_buttons then global.active_buttons = {} end
      global.active_buttons[ent.unit_number] = {control, 20} -- TODO: Replace 1 with a call to find delay from gui

    elseif ent.name == "yc-switch" then
      local control = ent.get_or_create_control_behavior()
      control.enabled = not control.enabled
    end
  end
end

local function onBuilt(entity)  -- turn off when placed
  if entity.name == "yc-button" then
    local control = entity.get_or_create_control_behavior()
    control.enabled=false
  end
end

local function onPaste(event) -- turn off when pasted into
  local button = event.destination
  if button.name == "yc-button" then
    local control = button.get_or_create_control_behavior()
    control.enabled=false
    --TODO make this copy the length from the ui setting
  end
end 

script.on_event(defines.events.on_tick, onTick)
script.on_event(defines.events.on_entity_settings_pasted,onPaste)
script.on_event("yc-interact-key", onKey)

local filters = {
  {filter="name",name="yc-button"}
}
script.on_event(defines.events.on_built_entity, function(event) onBuilt(event.created_entity) end, filters)
script.on_event(defines.events.on_robot_built_entity, function(event) onBuilt(event.created_entity) end, filters)
script.on_event(defines.events.script_raised_built, function(event) onBuilt(event.entity) end)
script.on_event(defines.events.script_raised_revive, function(event) onBuilt(event.entity) end)
script.on_event(defines.events.on_entity_cloned, function(event) onBuilt(event.destination) end)





-- taken from hookenz' answer on https://stackoverflow.com/questions/9168058/how-to-dump-a-table-to-console
function dump(o)
  if type(o) == 'table' then
     local s = '{ '
     for k,v in pairs(o) do
        if type(k) ~= 'number' then k = '"'..k..'"' end
        s = s .. '['..k..'] = ' .. dump(v) .. ','
     end
     return s .. '} '
  else
     return tostring(o)
  end
end

