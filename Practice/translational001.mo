within SystemModels.Practice;

model translational001
  Modelica.Mechanics.Translational.Components.Mass mass1(L = 0.1, m = 1, s(fixed = true, start = 0 + mass1.L / 2))  annotation(
    Placement(visible = true, transformation(origin = {-20, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sources.Force force1 annotation(
    Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 5, height = 0, offset = 10, startTime = 5)  annotation(
    Placement(visible = true, transformation(origin = {-90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp1.y, force1.f) annotation(
    Line(points = {{-78, 50}, {-62, 50}, {-62, 50}, {-62, 50}}, color = {0, 0, 127}));
  connect(force1.flange, mass1.flange_a) annotation(
    Line(points = {{-40, 50}, {-33, 50}, {-33, 50}, {-30, 50}, {-30, 50}, {-30, 50}, {-30, 50}, {-30, 50}}, color = {0, 127, 0}));
annotation(
    experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-6, Interval = 0.04),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));end translational001;
