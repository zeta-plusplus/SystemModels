within SystemModels.Practice;

model boiler001
  extends Modelica.Icons.Example;
  //----------
  replaceable package fluid1 = Modelica.Media.Water.StandardWater;
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = fluid1, m_flow = -10, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = fluid1, T = 80 + 273.15, nPorts = 1, p = 5 * 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium=fluid1, V = 1, nPorts = 2, use_portsData = false)  annotation(
    Placement(visible = true, transformation(origin = {-30, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium=fluid1, V = 1, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {10, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume volume2(redeclare package Medium=fluid1, V = 1, nPorts = 2, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = fluid1, diameter = 0.1, length = 0.2) annotation(
    Placement(visible = true, transformation(origin = {-10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = fluid1, diameter = 0.1, length = 0.2) annotation(
    Placement(visible = true, transformation(origin = {30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedHeatFlow1(Q_flow = -10 * 1000)  annotation(
    Placement(visible = true, transformation(origin = {20, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(volume1.heatPort, fixedHeatFlow1.port) annotation(
    Line(points = {{20, 20}, {20, 20}, {20, 0}, {20, 0}}, color = {191, 0, 0}));
  connect(volume2.ports[2], boundary.ports[1]) annotation(
    Line(points = {{50, 30}, {80, 30}, {80, 30}, {80, 30}}, color = {0, 127, 255}, thickness = 0.5));
  connect(pipe1.port_b, volume2.ports[1]) annotation(
    Line(points = {{40, 30}, {46, 30}, {46, 30}, {50, 30}}, color = {0, 127, 255}));
  connect(volume1.ports[2], pipe1.port_a) annotation(
    Line(points = {{10, 30}, {20, 30}, {20, 30}, {20, 30}}, color = {0, 127, 255}));
  connect(pipe.port_b, volume1.ports[1]) annotation(
    Line(points = {{0, 30}, {8, 30}, {8, 30}, {10, 30}}, color = {0, 127, 255}));
  connect(volume.ports[2], pipe.port_a) annotation(
    Line(points = {{-30, 30}, {-20, 30}, {-20, 30}, {-20, 30}}, color = {0, 127, 255}));
  connect(boundary1.ports[1], volume.ports[1]) annotation(
    Line(points = {{-60, 30}, {-34, 30}, {-34, 30}, {-30, 30}}, color = {0, 127, 255}, thickness = 0.5));
annotation(
    experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-6, Interval = 0.04),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));end boiler001;
