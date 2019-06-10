within SystemModels.Practice;

model ptMassDynamics003
  extends Modelica.Icons.Example;
  inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Body body1(I_11 = 1, I_22 = 1, I_33 = 1, angles_fixed = false, m = 1, r_0(fixed = true, start = {0, 10.0, 0}), r_CM = {0, 0, 0}, v_0(fixed = true, start = {0, 0, 0}), w_0_start = {0, 0.0, 0})  annotation(
    Placement(visible = true, transformation(origin = {50, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp2(duration = 0,height = 0, offset = 20)  annotation(
    Placement(visible = true, transformation(origin = {-30, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Forces.Force force1(resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_b)  annotation(
    Placement(visible = true, transformation(origin = {10, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 0, height = 0, offset = 0, startTime = 0)  annotation(
    Placement(visible = true, transformation(origin = {-30, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp3(duration = 0, height = 0, offset = 0) annotation(
    Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp3.y, force1.force[3]) annotation(
    Line(points = {{-19, 10}, {4, 10}, {4, -8}}, color = {0, 0, 127}));
  connect(ramp1.y, force1.force[1]) annotation(
    Line(points = {{-19, 70}, {4, 70}, {4, -8}}, color = {0, 0, 127}));
  connect(ramp2.y, force1.force[2]) annotation(
    Line(points = {{-19, 40}, {4, 40}, {4, -8}}, color = {0, 0, 127}));
  connect(force1.frame_b, body1.frame_a) annotation(
    Line(points = {{20, -20}, {30, -20}, {30, -20}, {40, -20}, {40, -20}, {40, -20}}, color = {95, 95, 95}));
  annotation(
    experiment(StartTime = 0, StopTime = 200, Tolerance = 1e-6, Interval = 0.2),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));end ptMassDynamics003;
