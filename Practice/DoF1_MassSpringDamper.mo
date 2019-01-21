within SystemModels.Practice;

model DoF1_MassSpringDamper
  extends Modelica.Icons.Example;
  //-----
  Modelica.Mechanics.Translational.Components.Mass mass001(L = 0.2, a(fixed = false), m = 50, s(start = mass001.L / 2), v(fixed = false)) annotation(
    Placement(visible = true, transformation(origin = {-30, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Translational.Components.SpringDamper springDamper001(c = 100, d = 5, s_rel(start = 0.0), s_rel0 = 0, stateSelect = StateSelect.default, v_rel(fixed = false)) annotation(
    Placement(visible = true, transformation(origin = {-30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Step step1(height = 0.05, offset = 0, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-80, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sources.Position position1(exact = true, useSupport = false, v(fixed = false)) annotation(
    Placement(visible = true, transformation(origin = {-50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(springDamper001.flange_b, mass001.flange_a) annotation(
    Line(points = {{-30, 60}, {-30, 60}, {-30, 60}, {-30, 60}, {-30, 70}, {-30, 70}, {-30, 70}, {-30, 70}}, color = {0, 127, 0}));
  connect(step1.y, position1.s_ref) annotation(
    Line(points = {{-69, 22}, {-62, 22}}, color = {0, 0, 127}));
  connect(position1.flange, springDamper001.flange_a) annotation(
    Line(points = {{-40, 20}, {-30, 20}, {-30, 40}}, color = {0, 127, 0}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.01));
  
end DoF1_MassSpringDamper;
