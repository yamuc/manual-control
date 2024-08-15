local p = table.deepcopy(data.raw["decider-combinator"]["decider-combinator"])
p.name = "yc-passthrough-button"
p.minable.result = "yc-passthrough-button"

data:extend{p}