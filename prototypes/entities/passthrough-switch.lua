local p = table.deepcopy(data.raw["decider-combinator"]["decider-combinator"])
p.name = "passthrough-switch"
p.minable.result = "passthrough-switch"


data:extend{p}