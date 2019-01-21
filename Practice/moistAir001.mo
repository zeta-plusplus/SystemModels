within SystemModels.Practice;

model moistAir001
  extends Modelica.Icons.Example;
  package Air01 = Modelica.Media.Air.MoistAir;
  //-----
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = Air01,nPorts = 1, use_T_in = true, use_p_in = true)  annotation(
    Placement(visible = true, transformation(origin = {-30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(m_flow = -10,nPorts = 1, use_m_flow_in = false)  annotation(
    Placement(visible = true, transformation(origin = {60, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume volume(V = 1, nPorts = 2, use_portsData = false)  annotation(
    Placement(visible = true, transformation(origin = {0, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Pipes.StaticPipe pipe(diameter = 0.05, length = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 5, height = 101.3 * 1000, offset = 1 / 2 * 101.3 * 1000, startTime = 5)  annotation(
    Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp2(duration = 5, height = 288.15, offset = 288.15, startTime = 5)  annotation(
    Placement(visible = true, transformation(origin = {-70, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp2.y, boundary.T_in) annotation(
    Line(points = {{-58, 20}, {-54, 20}, {-54, 34}, {-42, 34}, {-42, 34}}, color = {0, 0, 127}));
  connect(ramp1.y, boundary.p_in) annotation(
    Line(points = {{-59, 50}, {-50, 50}, {-50, 38}, {-42, 38}}, color = {0, 0, 127}));
  connect(pipe.port_b, boundary1.ports[1]) annotation(
    Line(points = {{40, 30}, {50, 30}, {50, 30}, {50, 30}}, color = {0, 127, 255}));
  connect(volume.ports[2], pipe.port_a) annotation(
    Line(points = {{0, 40}, {16, 40}, {16, 30}, {20, 30}, {20, 30}}, color = {0, 127, 255}, thickness = 0.5));
  connect(boundary.ports[1], volume.ports[1]) annotation(
    Line(points = {{-20, 30}, {-16, 30}, {-16, 40}, {1.93714e-06, 40}}, color = {0, 127, 255}, thickness = 0.5));
end moistAir001;
