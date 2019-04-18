within SystemModels.Practice;

model ptMassDynamics002
  extends Modelica.Icons.Example;
  inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Forces.WorldForce force(resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameB.world)  annotation(
    Placement(visible = true, transformation(origin = {-40, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const[3](k = {10, 0, 0})  annotation(
    Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.PointMass pointMass1(m = 1, r_0(fixed = true, start = {0, 10000, 0}))  annotation(
    Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(force.frame_b, pointMass1.frame_a) annotation(
    Line(points = {{-30, 50}, {-10, 50}, {-10, 50}, {-10, 50}}, color = {95, 95, 95}));
  connect(const.y, force.force) annotation(
    Line(points = {{-58, 50}, {-52, 50}, {-52, 50}, {-52, 50}}, color = {0, 0, 127}));
end ptMassDynamics002;
