within SystemModels.Practice;

model DCmotor002
  extends Modelica.Icons.Example;
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 100) annotation(
    Placement(visible = true, transformation(origin = {30, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage1 annotation(
    Placement(visible = true, transformation(origin = {-50, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Constant const(k = 9 * 5) annotation(
    Placement(visible = true, transformation(origin = {-80, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-50, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Inductor inductor1(L = 1) annotation(
    Placement(visible = true, transformation(origin = {30, 40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.EMF emf(k = 10, useSupport = false) annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 0.1, w(fixed = true, start = 0)) annotation(
    Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.BearingFriction bearingFriction1(tau_pos = [0, 0.2; 10, 1; 100, 10]) annotation(
    Placement(visible = true, transformation(origin = {60, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Ideal.IdealOpeningSwitch idealOpeningSwitch1 annotation(
    Placement(visible = true, transformation(origin = {-10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.BooleanStep booleanStep1(startTime = 20) annotation(
    Placement(visible = true, transformation(origin = {-10, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Electrical.Analog.Ideal.IdealDiode idealDiode1 annotation(
    Placement(visible = true, transformation(origin = {0, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(emf.n, idealDiode1.p) annotation(
    Line(points = {{30, 0}, {0, 0}, {0, 30}, {0, 30}}, color = {0, 0, 255}));
  connect(idealDiode1.n, resistor1.p) annotation(
    Line(points = {{0, 50}, {0, 50}, {0, 80}, {30, 80}, {30, 80}}, color = {0, 0, 255}));
  connect(resistor1.n, inductor1.p) annotation(
    Line(points = {{30, 60}, {30, 60}, {30, 50}, {30, 50}}, color = {0, 0, 255}));
  connect(signalVoltage1.p, resistor1.p) annotation(
    Line(points = {{-50, 30}, {-50, 30}, {-50, 94}, {30, 94}, {30, 80}, {30, 80}}, color = {0, 0, 255}));
  connect(ground1.p, idealOpeningSwitch1.n) annotation(
    Line(points = {{-50, -30}, {-20, -30}}, color = {0, 0, 255}));
  connect(signalVoltage1.n, ground1.p) annotation(
    Line(points = {{-50, 10}, {-50, -30}}, color = {0, 0, 255}));
  connect(booleanStep1.y, idealOpeningSwitch1.control) annotation(
    Line(points = {{-10, -49}, {-10, -49}, {-10, -39}, {-10, -39}}, color = {255, 0, 255}));
  connect(idealOpeningSwitch1.p, emf.n) annotation(
    Line(points = {{0, -30}, {30, -30}, {30, 0}}, color = {0, 0, 255}));
  connect(inductor1.n, emf.p) annotation(
    Line(points = {{30, 30}, {30, 30}, {30, 20}, {30, 20}}, color = {0, 0, 255}));
  connect(emf.flange, bearingFriction1.flange_a) annotation(
    Line(points = {{40, 10}, {45, 10}, {45, 10}, {50, 10}, {50, 10}, {50, 10}, {50, 10}, {50, 10}}));
  connect(bearingFriction1.flange_b, inertia1.flange_a) annotation(
    Line(points = {{70, 10}, {78, 10}, {78, 10}, {79, 10}, {79, 10}, {80, 10}}));
  connect(const.y, signalVoltage1.v) annotation(
    Line(points = {{-68, 20}, {-58, 20}, {-58, 20}, {-58, 20}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(initialScale = 0.05)),
    Diagram(coordinateSystem(initialScale = 0.05)),
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.01),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end DCmotor002;
