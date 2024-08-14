
if data.raw.technology["circuit-network"] then
  if not data.raw.technology["circuit-network"].effects then data.raw.technology["circuit-network"].effects = {} end
  
  table.insert(data.raw.technology["circuit-network"].effects,
    {
      {
        type = "unlock-recipe",
        recipe = "button"
      },
      {
        type = "unlock-recipe",
        recipe = "switch"
      },
      {
        type = "unlock-recipe",
        recipe = "passthrough-button"
      },
      {
        type = "unlock-recipe",
        recipe = "passthrough-switch"
    }
    })
end
