using AnyMOD, Gurobi

# ! storage 
# create model
anyM = anyModel(["modelData","dailyTimeseries"],"results");
createOptModel!(anyM)
setObjective!(:costs,anyM)

# solve model
set_optimizer(anyM.optModel,Gurobi.Optimizer) # select a solver
set_optimizer_attribute(anyM.optModel, "Method", 2)
set_optimizer_attribute(anyM.optModel, "Crossover", 0)
set_optimizer_attribute(anyM.optModel, "BarconvTol", 1e-4)
optimize!(anyM.optModel) # solve the model