within SystemModels.Practice;

model ptMassDynamics001
  extends Modelica.Icons.Example;
  inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Forces.WorldForce force(resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameB.world)  annotation(
    Placement(visible = true, transformation(origin = {-40, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const[3](k = {-0.1, 0, 0})  annotation(
    Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Body body1(I_11 = 1, I_22 = 1, I_33 = 1, angles_fixed = false, m = 1, r_0(fixed = true, start = {0, 0, 0}), r_CM = {0, 0, 0}, v_0(fixed = true, start = {100, 100, 0}))  annotation(
    Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Forces.WorldForce force1(resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameB.world) annotation(
    Placement(visible = true, transformation(origin = {-40, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1[3](k = {0, 0.1, 0}) annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(const1.y, force1.force) annotation(
    Line(points = {{-59, 10}, {-55, 10}, {-55, 10}, {-53, 10}}, color = {0, 0, 127}));
  connect(force1.frame_b, body1.frame_a) annotation(
    Line(points = {{-30, 10}, {-24, 10}, {-24, 50}, {-20, 50}}, color = {95, 95, 95}));
  connect(force.frame_b, body1.frame_a) annotation(
    Line(points = {{-30, 50}, {-20, 50}, {-20, 50}, {-20, 50}}, color = {95, 95, 95}));
  connect(const.y, force.force) annotation(
    Line(points = {{-58, 50}, {-52, 50}, {-52, 50}, {-52, 50}}, color = {0, 0, 127}));
end ptMassDynamics001;
