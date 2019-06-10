within SystemModels.Practice;

model temp1
  Modelica.Blocks.Sources.Constant const(k = 1)  annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = 2)  annotation(
    Placement(visible = true, transformation(origin = {-50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Sum sum1(nin = 2)  annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(const1.y, sum1.u[2]) annotation(
    Line(points = {{-38, -10}, {-28, -10}, {-28, 10}, {-22, 10}, {-22, 10}}, color = {0, 0, 127}));
  connect(const.y, sum1.u[1]) annotation(
    Line(points = {{-38, 30}, {-32, 30}, {-32, 10}, {-22, 10}, {-22, 10}}, color = {0, 0, 127}));
annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));end temp1;
