within SystemModels.Practice;

model temp
  extends Modelica.Icons.Example;
  //-----
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 100, T = 288.15, T_ref = 288.15) annotation(
    Placement(visible = true, transformation(origin = {0, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-50, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Inductor inductor1(L = 1e-3) annotation(
    Placement(visible = true, transformation(origin = {0, 40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.EMF emf(k = 0.2, useSupport = false) annotation(
    Placement(visible = true, transformation(origin = {0, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 1e-3, w(fixed = false, start = 0)) annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia2(J = 1e-3, w(fixed = false, start = 0)) annotation(
    Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.SpringDamper springDamper1(c = 1e-6, d = 0.001) annotation(
    Placement(visible = true, transformation(origin = {60, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage1 annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 0, height = -1 * ramp1.offset, offset = 9 * 5, startTime = 100)  annotation(
    Placement(visible = true, transformation(origin = {-80, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(springDamper1.flange_b, inertia2.flange_a) annotation(
    Line(points = {{70, 10}, {80, 10}, {80, 10}, {80, 10}}));
  connect(inertia1.flange_b, springDamper1.flange_a) annotation(
    Line(points = {{40, 10}, {50, 10}, {50, 10}, {50, 10}}));
  connect(emf.flange, inertia1.flange_a) annotation(
    Line(points = {{10, 10}, {20, 10}}));
  connect(signalVoltage1.p, resistor1.p) annotation(
    Line(points = {{-50, 40}, {-50, 80}, {0, 80}}, color = {0, 0, 255}));
  connect(resistor1.n, inductor1.p) annotation(
    Line(points = {{0, 60}, {0, 60}, {0, 50}, {0, 50}}, color = {0, 0, 255}));
  connect(inductor1.n, emf.p) annotation(
    Line(points = {{0, 30}, {0, 30}, {0, 20}, {0, 20}}, color = {0, 0, 255}));
  connect(ground1.p, emf.n) annotation(
    Line(points = {{-50, -30}, {0, -30}, {0, 0}}, color = {0, 0, 255}));
  connect(signalVoltage1.n, ground1.p) annotation(
    Line(points = {{-50, 20}, {-50, 20}, {-50, -30}, {-50, -30}}, color = {0, 0, 255}));
  connect(ramp1.y, signalVoltage1.v) annotation(
    Line(points = {{-68, 30}, {-58, 30}, {-58, 30}, {-58, 30}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(initialScale = 0.05)),
    Diagram(coordinateSystem(initialScale = 0.05)),
    experiment(StartTime = 0, StopTime = 200, Tolerance = 1e-06, Interval = 0.01),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end temp;
