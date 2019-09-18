within SystemModels.Practice;

model test_reactor
  extends Modelica.Icons.Example;
  //----------
  replaceable package liquid1 = Modelica.Media.Water.StandardWaterOnePhase;
  // redeclare package Medium = liquid1
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = liquid1, nPorts = 1, p = 101.3 * 1000)  annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 5, height = 0, offset = 10, startTime = 5)  annotation(
    Placement(visible = true, transformation(origin = {-80, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = liquid1,V = 1e-3, nPorts = 2, use_HeatTransfer = true, use_portsData = false)  annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = liquid1, diameter = 0.1, length = 0.5) annotation(
    Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = liquid1,T = 600, nPorts = 1, p = 5 * 101.3 * 1000)  annotation(
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Nuclear.PointKineticMoltenSaltReactor pointKineticMoltenSaltReactor1(NominalPower = 10 / 1000, alpha0 = 1e-6)  annotation(
    Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(pointKineticMoltenSaltReactor1.port_b, volume.heatPort) annotation(
    Line(points = {{-40, 58}, {-30, 58}, {-30, 10}, {-20, 10}, {-20, 10}}, color = {191, 0, 0}));
  connect(ramp1.y, pointKineticMoltenSaltReactor1.rho) annotation(
    Line(points = {{-68, 58}, {-60, 58}, {-60, 58}, {-60, 58}}, color = {0, 0, 127}));
  connect(boundary1.ports[1], volume.ports[1]) annotation(
    Line(points = {{-40, 0}, {-12, 0}, {-12, 0}, {-10, 0}}, color = {0, 127, 255}, thickness = 0.5));
  connect(volume.ports[2], pipe.port_a) annotation(
    Line(points = {{-10, 0}, {10, 0}, {10, 0}, {10, 0}}, color = {0, 127, 255}));
  connect(pipe.port_b, boundary.ports[1]) annotation(
    Line(points = {{30, 0}, {40, 0}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-6, Interval = 0.04),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));end test_reactor;
