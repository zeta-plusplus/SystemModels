within SystemModels.Practice;

model ForceFlow1D
  extends Modelica.Icons.Example;
  Modelica.Mechanics.Translational.Sources.ConstantForce constantForce(f_constant = 1)  annotation(
    Placement(visible = true, transformation(origin = {-60, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sources.ConstantForce constantForce1(f_constant = 2) annotation(
    Placement(visible = true, transformation(origin = {-30, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sources.ConstantForce constantForce2(f_constant = 3) annotation(
    Placement(visible = true, transformation(origin = {-30, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Mass mass(m = 1)  annotation(
    Placement(visible = true, transformation(origin = {22, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation(
    Placement(visible = true, transformation(origin = {6, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
equation
  connect(constantForce1.flange, mass.flange_b) annotation(
    Line(points = {{-20, 2}, {-8, 2}, {-8, 0}, {12, 0}}, color = {0, 127, 0}));
  connect(constantForce2.flange, mass.flange_b) annotation(
    Line(points = {{-20, -36}, {-4, -36}, {-4, 0}, {12, 0}}, color = {0, 127, 0}));
  connect(constantForce.flange, mass.flange_a) annotation(
    Line(points = {{-50, 60}, {36, 60}, {36, 0}, {32, 0}}, color = {0, 127, 0}));
  connect(fixed.flange, mass.flange_b) annotation(
    Line(points = {{6, 28}, {6, 0}, {12, 0}}, color = {0, 127, 0}));
end ForceFlow1D;
