within SystemModels.Temp;

model quarterCar_temp
  extends Modelica.Icons.Example;
  //-----
  Modelica.Mechanics.Translational.Components.Mass massTire(L = 0.2, a(fixed = false), m = 50, s(start = massTire.L/2), v(fixed = false)) annotation(
    Placement(visible = true, transformation(origin = {50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Translational.Components.SpringDamper tire(c = 10000, d = 50, s_rel(start = 0.0), s_rel0 = 0, stateSelect = StateSelect.default, v_rel(fixed = false)) annotation(
    Placement(visible = true, transformation(origin = {50, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Step step1(height = 0.05, offset = 0, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-30, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sources.Position roadSurface(exact = true, useSupport = false, v(fixed = false)) annotation(
    Placement(visible = true, transformation(origin = {30, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Mass massCarBody(L = 0.2, a(fixed = false), m = 1000, s(start = massTire.L + massCarBody.L/2 + 0.05), v(fixed = false)) annotation(
    Placement(visible = true, transformation(origin = {50, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Translational.Components.SpringDamper Suspension(c = 1000, d = 100, s_rel(start = 0.0), s_rel0 = 0.05, stateSelect = StateSelect.default, v_rel(fixed = false)) annotation(
    Placement(visible = true, transformation(origin = {50, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 10, height = 0.5, offset = 0, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-30, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Trapezoid trapezoid(amplitude = 0.05, falling = 0.1, nperiod = 1, period = 10, rising = 0.1, startTime = 10, width = 0.05) annotation(
    Placement(visible = true, transformation(origin = {-30, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Suspension.flange_b, massCarBody.flange_a) annotation(
    Line(points = {{50, 50}, {50, 50}, {50, 60}, {50, 60}}, color = {0, 127, 0}));
  connect(massTire.flange_b, Suspension.flange_a) annotation(
    Line(points = {{50, 20}, {50, 20}, {50, 30}, {50, 30}}, color = {0, 127, 0}));
  connect(tire.flange_b, massTire.flange_a) annotation(
    Line(points = {{50, -10}, {50, -10}, {50, -10}, {50, -10}, {50, 0}, {50, 0}, {50, 0}, {50, 0}}, color = {0, 127, 0}));
  connect(roadSurface.flange, tire.flange_a) annotation(
    Line(points = {{40, -50}, {50, -50}, {50, -30}}, color = {0, 127, 0}));
  connect(step1.y, roadSurface.s_ref) annotation(
    Line(points = {{-18, -90}, {2, -90}, {2, -50}, {18, -50}}, color = {0, 0, 127}));
equation

  annotation(
    uses(Modelica(version = "3.2.2")),
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.01),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
    Diagram);
end quarterCar_temp;