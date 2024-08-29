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
      global.active_buttons[ent.unit_number] = {control, global.button_delays[ent.unit_number]} -- TODO: Replace 1 with a call to find delay from gui

    elseif ent.name == "yc-passthrough-button" then
      local control = ent.get_or_create_control_behavior()
      control.enabled=true
      if not global.active_buttons then global.active_buttons = {} end
      global.active_buttons[ent.unit_number] = {control, global.button_delays[ent.unit_number]} -- TODO: Replace 1 with a call to find delay from gui

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
    if not global.button_delays then global.button_delays = {} end
    global.button_delays[entity.unit_number] = 1
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







local function addButtonGUI(player)
  local anchor = {gui = defines.relative_gui_type.constant_combinator_gui, position = defines.relative_gui_position.right, names = buttonNames}
  local frame = player.gui.relative.add{name="yc-buttonGUI", type="frame", direction="vertical", anchor = anchor}

  local titleBar = frame.add{type="flow", direction="horizontal"}
    titleBar.add{type="label", caption="Button Delay", style="frame_title"}

  local contentFrame = frame.add{type="frame", direction="horizontal", style="inside_shallow_frame_with_padding"}
    contentFrame.add{name = "yc-buttonSlider", type="slider", minimum_value = 0, maximum_value = 120, value = 1, style = "other_settings_slider"}
    contentFrame.add{name = "yc-buttonSlider-txt", type="textfield", numeric=true, text = 1, clear_and_focus_on_right_click = true, lose_focus_on_confirm = true, style = "slider_value_textfield"}

end

local function destroyButtonGUI(event)
  local buttonNames = {"yc-button", "yc-passthrough-button"}
  if event.gui_type == defines.gui_type.entity and listContains(buttonNames, event.entity.name) then
    local gui = game.get_player(event.player_index).gui.relative.children_names
    game.print(dump(gui))
  end
end

local function openButtonGUI(event)
  local buttonNames = {"yc-button", "yc-passthrough-button"}
  if event.gui_type == defines.gui_type.entity and listContains(buttonNames, event.entity.name) then

    local player = game.get_player(event.player_index)

    if not listContains(player.gui.relative.children_names, "yc-buttonGUI") then addButtonGUI(player) end


  end
end

script.on_event(defines.events.on_gui_opened, openButtonGUI)
script.on_event(defines.events.on_gui_closed, destroyButtonGUI)



function listContains(list, value)
  for _, v in pairs(list) do
    if v == value then return true end
  end
  return false
end

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

