within SystemModels.Practice;

model pistonCylinder001
  extends Modelica.Icons.Example;
  //-----
  Modelica.Mechanics.MultiBody.Examples.Loops.Utilities.Cylinder cylinder1 annotation(
    Placement(visible = true, transformation(origin = {-54, 8}, extent = {{-10, -15}, {10, 15}}, rotation = 0)));
  annotation(
    uses(Modelica(version = "3.2.2")));

end pistonCylinder001;
