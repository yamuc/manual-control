local p = table.deepcopy(data.raw["decider-combinator"]["decider-combinator"])
p.name = "yc-passthrough-switch"
p.minable.result = "yc-passthrough-switch"


data:extend{p}