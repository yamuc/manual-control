data:extend{
  {
    type = "recipe",
    name = "button",
    enabled = false,
    ingredients =
    {
      {"constant-combinator", 1},
      {"electronic-circuit", 1},
      {"advanced-circuit", 1},
    },
    result="button",
  },
  {
    type = "recipe",
    name = "switch",
    enabled = false,
    ingredients =
    {
      {"constant-combinator", 1},
      {"electronic-circuit", 1},
      {"advanced-circuit", 1},
      {"iron-stick", 1},
    },
    result="switch",
  },
  {
    type = "recipe",
    name = "passthrough-button",
    enabled = false,
    ingredients =
    {
      {"decider-combinator", 1},
      {"electronic-circuit", 2},
      {"advanced-circuit", 2},
    },
    result="passthrough-button",
  },
  {
    type = "recipe",
    name = "passthrough-switch",
    enabled = false,
    ingredients =
    {
      {"decider-combinator", 1},
      {"electronic-circuit", 2},
      {"advanced-circuit", 2},
      {"iron-stick", 1}
    },
    result="passthrough-switch",
  },
}
