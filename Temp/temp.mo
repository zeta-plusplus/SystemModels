within SystemModels.Temp;

model temp
  package Medium1 = Buildings.Media.Air "Medium model";
  
  Buildings.Fluid.Sources.Boundary_pT bou(redeclare package Medium = Medium1, use_T_in = true) annotation(
    Placement(visible = true, transformation(origin = {-28, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 5, height = 500, offset = 300, startTime = 5)  annotation(
    Placement(visible = true, transformation(origin = {-76, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp.y, bou.T_in) annotation(
    Line(points = {{-64, 38}, {-40, 38}}, color = {0, 0, 127}));
annotation(
    experiment(StartTime = 0, StopTime = 15, Tolerance = 1e-6, Interval = 0.03));
end temp;
