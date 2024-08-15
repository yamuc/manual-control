data:extend{
  {
    type = "recipe",
    name = "yc-button",
    enabled = false,
    ingredients =
    {
      {"constant-combinator", 1},
      {"electronic-circuit", 1},
      {"advanced-circuit", 1},
    },
    result="yc-button",
  },
  {
    type = "recipe",
    name = "yc-switch",
    enabled = false,
    ingredients =
    {
      {"constant-combinator", 1},
      {"electronic-circuit", 1},
      {"advanced-circuit", 1},
      {"iron-stick", 1},
    },
    result="yc-switch",
  },
  {
    type = "recipe",
    name = "yc-passthrough-button",
    enabled = false,
    ingredients =
    {
      {"decider-combinator", 1},
      {"electronic-circuit", 2},
      {"advanced-circuit", 2},
    },
    result="yc-passthrough-button",
  },
  {
    type = "recipe",
    name = "yc-passthrough-switch",
    enabled = false,
    ingredients =
    {
      {"decider-combinator", 1},
      {"electronic-circuit", 2},
      {"advanced-circuit", 2},
      {"iron-stick", 1}
    },
    result="yc-passthrough-switch",
  },
}
