within SystemModels.Temp;

model LTISS_ex01
  extends Modelica.Icons.Example;
  Modelica.Blocks.Continuous.StateSpace stateSpace1(A = [-0.023564, 41.0074, 0, -32.2; -0.000241, -1.296, 0.9846, 0; 0.00020571, -3.5094, -2.4142, 0; 0, 0, 1, 0], B = [0, 0; -0.0821, 0; -15.7002, 0; 0.0, 0], C = [1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1], initType = Modelica.Blocks.Types.Init.InitialState) annotation(
    Placement(visible = true, transformation(origin = {10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_deg from_deg1 annotation(
    Placement(visible = true, transformation(origin = {-30, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_deg from_deg2 annotation(
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.StateSpace stateSpace2(A = [-0.2356, -0.0006, -0.9967, 0.0551; -60.0566, -4.9625, 3.8814, 0; 13.1748, 0.0309, -0.4081, 0; 0, 1, 0.0157, 0], B = [0, 56.7314; 0.9937, 0; 0.0066, 26.6886; -9.6945, 0], C = [1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1]) annotation(
    Placement(visible = true, transformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_deg from_deg3 annotation(
    Placement(visible = true, transformation(origin = {-30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression1(y = if 2 <= time and time <= 4 then -3 elseif 30 <= time and time <= 32 then 3 else 0)  annotation(
    Placement(visible = true, transformation(origin = {-70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression2(y = if 2 <= time and time <= 4 then 0 elseif 30 <= time and time <= 32 then 0 else 0) annotation(
    Placement(visible = true, transformation(origin = {-70, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression4(y = if 2 <= time and time <= 3 then -6 elseif 22 <= time and time <= 23 then 6 else 0) annotation(
    Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression3(y = if 2 <= time and time <= 4 then 0 elseif 30 <= time and time <= 32 then 0 else 0) annotation(
    Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(realExpression3.y, from_deg2.u) annotation(
    Line(points = {{-58, 0}, {-44, 0}, {-44, 0}, {-42, 0}}, color = {0, 0, 127}));
  connect(realExpression4.y, from_deg3.u) annotation(
    Line(points = {{-58, -30}, {-42, -30}, {-42, -30}, {-42, -30}}, color = {0, 0, 127}));
  connect(realExpression2.y, stateSpace1.u[2]) annotation(
    Line(points = {{-58, 40}, {-10, 40}, {-10, 70}, {-2, 70}, {-2, 70}}, color = {0, 0, 127}));
  connect(realExpression1.y, from_deg1.u) annotation(
    Line(points = {{-59, 70}, {-42, 70}}, color = {0, 0, 127}));
  connect(from_deg1.y, stateSpace1.u[1]) annotation(
    Line(points = {{-18, 70}, {-2, 70}, {-2, 70}, {-2, 70}}, color = {0, 0, 127}));
  connect(from_deg3.y, stateSpace2.u[2]) annotation(
    Line(points = {{-19, -30}, {-11, -30}, {-11, 0}, {-3, 0}, {-3, 0}, {-3, 0}, {-3, 0}}, color = {0, 0, 127}));
  connect(from_deg2.y, stateSpace2.u[1]) annotation(
    Line(points = {{-19, 0}, {-5, 0}, {-5, 0}, {-4, 0}, {-4, 0}, {-3, 0}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 120, Tolerance = 1e-06, Interval = 0.01),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end LTISS_ex01;
