within SystemModels.Practice;

model multiLayerSys003
  extends Modelica.Icons.Example;

  package subSysLayer001
    extends Modelica.Icons.Package;

    model subSys001
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
    end subSys001;
  end subSysLayer001;

  inner SystemModels.Practice.multiLayerSys003.subSysLayer001.subSys001 subSys0011 annotation(
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation

end multiLayerSys003;