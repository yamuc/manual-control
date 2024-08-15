
if data.raw.technology["circuit-network"] then
  if not data.raw.technology["circuit-network"].effects then data.raw.technology["circuit-network"].effects = {} end
  local circuitTechs = {
    {
      type = "unlock-recipe",
      recipe = "yc-button"
    },
    {
      type = "unlock-recipe",
      recipe = "yc-switch"
    },
    {
      type = "unlock-recipe",
      recipe = "yc-passthrough-button"
    },
    {
      type = "unlock-recipe",
      recipe = "yc-passthrough-switch"
    },
  }

  for _, tech in ipairs(circuitTechs) do
    table.insert(data.raw.technology["circuit-network"].effects, tech)
  end
  
end
