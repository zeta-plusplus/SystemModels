within SystemModels.Practice;

model multiLayerSys001
  extends Modelica.Icons.Example;

  model subSys001
  outer replaceable Modelica.Mechanics.Rotational.Components.Inertia inertia1 annotation(
      Placement(visible = true, transformation(origin = {-10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  outer replaceable Modelica.Mechanics.Rotational.Components.Spring spring1 annotation(
      Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  outer replaceable Modelica.Mechanics.Rotational.Components.Damper damper1 annotation(
      Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(
      Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation(
      Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(inertia1.flange_b, flange_b) annotation(
      Line(points = {{0, 30}, {34, 30}, {34, 0}, {100, 0}, {100, 0}}));
    connect(flange_a, spring1.flange_a) annotation(
      Line(points = {{-100, 0}, {-74, 0}, {-74, 50}, {-60, 50}, {-60, 50}}));
    connect(flange_a, damper1.flange_a) annotation(
      Line(points = {{-100, 0}, {-76, 0}, {-76, 10}, {-60, 10}, {-60, 10}}));
    connect(damper1.flange_b, inertia1.flange_a) annotation(
      Line(points = {{-40, 10}, {-32, 10}, {-32, 30}, {-20, 30}, {-20, 30}}));
    connect(spring1.flange_b, inertia1.flange_a) annotation(
      Line(points = {{-40, 50}, {-34, 50}, {-34, 30}, {-20, 30}, {-20, 30}}));
  end subSys001;

  SystemModels.Practice.multiLayerSys001.subSys001 subSys0011 annotation(
    Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  encapsulated model subSys002
    Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(
      Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation(
      Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  outer Modelica.Mechanics.Rotational.Components.SpringDamper springDamper1 annotation(
      Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  outer Modelica.Mechanics.Rotational.Components.Inertia inertia1 annotation(
      Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(springDamper1.flange_b, flange_b) annotation(
      Line(points = {{-20, 0}, {100, 0}, {100, 0}, {100, 0}}));
    connect(inertia1.flange_b, springDamper1.flange_a) annotation(
      Line(points = {{-60, 0}, {-40, 0}, {-40, 0}, {-40, 0}}));
    connect(flange_a, inertia1.flange_a) annotation(
      Line(points = {{-100, 0}, {-80, 0}, {-80, 0}, {-80, 0}}));
  
  end subSys002;

  inner multiLayerSys001.subSys002 subSys0021 annotation(
    Placement(visible = true, transformation(origin = {-30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation

end multiLayerSys001;