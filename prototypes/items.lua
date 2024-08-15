local order = "c[combinators]-d[manual-control]"

data:extend{
  {
    type = "item",
    name = "button",
    icon = "__manual-control__/graphics/button/button-icon.png",
    icon_size = 32,
    subgroup = "circuit-network",
    place_result="button",
    order = order .. "-a",
    stack_size = 50,
  },
  {
    type = "item",
    name = "switch",
    icon = "__manual-control__/graphics/switch/switch-icon.png",
    icon_size = 32,
    subgroup = "circuit-network",
    place_result="switch",
    order = order .. "-a",
    stack_size = 50,
  },
  {
    type = "item",
    name = "passthrough-button",
    icon = "__manual-control__/graphics/passthrough-button/passthrough-button-icon.png",
    icon_size = 64,
    subgroup = "circuit-network",
    place_result= "passthrough-button",
    order = order .. "-b",
    stack_size = 50,
  },
  {
    type = "item",
    name = "passthrough-switch",
    icon = "__manual-control__/graphics/passthrough-switch/passthrough-switch-icon.png",
    icon_size = 64,
    subgroup = "circuit-network",
    place_result= "passthrough-switch",
    order = order .. "-b",
    stack_size = 50,
  },
  }
