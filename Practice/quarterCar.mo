within SystemModels.Practice;

model quarterCar
  extends Modelica.Icons.Example;
  //-----
  Modelica.Mechanics.Translational.Components.Mass mass1(L = 0.2, a(fixed = false), m = 50, s(start = mass1.L / 2), v(fixed = false)) annotation(
    Placement(visible = true, transformation(origin = {-30, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Translational.Components.SpringDamper springDamper1(c = 10000, d = 50, s_rel(start = 0.0), s_rel0 = 0, stateSelect = StateSelect.default, v_rel(fixed = false)) annotation(
    Placement(visible = true, transformation(origin = {-30, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Step step1(height = 0.05, offset = 0, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-80, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sources.Position position1(exact = true, useSupport = false, v(fixed = false)) annotation(
    Placement(visible = true, transformation(origin = {-50, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Mass mass2(L = 0.2, a(fixed = false), m = 1000, s(start = mass1.L + mass2.L / 2 + 0.05), v(fixed = false)) annotation(
    Placement(visible = true, transformation(origin = {-30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Translational.Components.SpringDamper springDamper2(c = 1000, d = 100, s_rel(start = 0.0), s_rel0 = 0.05, stateSelect = StateSelect.default, v_rel(fixed = false)) annotation(
    Placement(visible = true, transformation(origin = {-30, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(springDamper2.flange_b, mass2.flange_a) annotation(
    Line(points = {{-30, 30}, {-30, 30}, {-30, 40}, {-30, 40}}, color = {0, 127, 0}));
  connect(mass1.flange_b, springDamper2.flange_a) annotation(
    Line(points = {{-30, 0}, {-30, 0}, {-30, 10}, {-30, 10}}, color = {0, 127, 0}));
  connect(springDamper1.flange_b, mass1.flange_a) annotation(
    Line(points = {{-30, -30}, {-30, -30}, {-30, -30}, {-30, -30}, {-30, -20}, {-30, -20}, {-30, -20}, {-30, -20}}, color = {0, 127, 0}));
  connect(position1.flange, springDamper1.flange_a) annotation(
    Line(points = {{-40, -70}, {-30, -70}, {-30, -50}}, color = {0, 127, 0}));
  connect(step1.y, position1.s_ref) annotation(
    Line(points = {{-69, -72}, {-62, -72}}, color = {0, 0, 127}));
equation

  annotation(
    uses(Modelica(version = "3.2.2")),
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.01),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
  Diagram);
end quarterCar;
