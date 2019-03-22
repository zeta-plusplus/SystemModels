within SystemModels.Practice;

model PID
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Ramp ramp1(duration = 0.1, height = 1, offset = 2, startTime = 30)  annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(visible = true, transformation(origin = {-40, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.SecondOrder secondOrder1(D = 1, k = 1, w = 10)  annotation(
    Placement(visible = true, transformation(origin = {50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.PI PI(T = 1, k = 100)  annotation(
    Placement(visible = true, transformation(origin = {10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(feedback1.y, PI.u) annotation(
    Line(points = {{-30, 30}, {-4, 30}, {-4, 30}, {-2, 30}}, color = {0, 0, 127}));
  connect(PI.y, secondOrder1.u) annotation(
    Line(points = {{22, 30}, {36, 30}, {36, 30}, {38, 30}}, color = {0, 0, 127}));
  connect(secondOrder1.y, feedback1.u2) annotation(
    Line(points = {{62, 30}, {72, 30}, {72, -22}, {-40, -22}, {-40, 22}}, color = {0, 0, 127}));
  connect(ramp1.y, feedback1.u1) annotation(
    Line(points = {{-58, 30}, {-48, 30}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 120, Tolerance = 1e-6, Interval = 0.01),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));end PID;
