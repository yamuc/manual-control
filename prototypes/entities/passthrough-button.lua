local p = table.deepcopy(data.raw["decider-combinator"]["decider-combinator"])
p.name = "passthrough-button"
p.minable.result = "passthrough-button"

data:extend{p}