within SystemModels.Practice.multiLayerSys002;

model subSys001
  Modelica.Mechanics.Rotational.Components.SpringDamper springDamper1 annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1 annotation(
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(springDamper1.flange_b, flange_b) annotation(
    Line(points = {{10, 0}, {102, 0}, {102, 0}, {100, 0}}));
  connect(inertia1.flange_b, springDamper1.flange_a) annotation(
    Line(points = {{-40, 0}, {-10, 0}, {-10, 0}, {-10, 0}}));
  connect(flange_a, inertia1.flange_a) annotation(
    Line(points = {{-100, 0}, {-60, 0}, {-60, 0}, {-60, 0}}));
end subSys001;