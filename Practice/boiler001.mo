within SystemModels.Practice;

model boiler001
  extends Modelica.Icons.Example;
  //----------
  replaceable package fluid1 = Modelica.Media.Water.StandardWater(onePhase=false);
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = fluid1, T = 99 + 273.15, nPorts = 1, p = 1.5 * 101.3 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = fluid1, T_start = 99 + 273.15, V = 0.001, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-10, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedHeatFlow1(Q_flow = 500 * 1000) annotation(
    Placement(visible = true, transformation(origin = {0, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = fluid1, T = 288.15, nPorts = 1, p = 0.9 * 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {110, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Fittings.SimpleGenericOrifice orifice(redeclare package Medium = fluid1, diameter = 0.05, zeta = 1) annotation(
    Placement(visible = true, transformation(origin = {80, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = fluid1, T_start = 99 + 273.15, V = 0.001, nPorts = 2, use_HeatTransfer = false, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Fittings.SimpleGenericOrifice orifice1(redeclare package Medium = fluid1, diameter = 0.05, zeta = 0.1) annotation(
    Placement(visible = true, transformation(origin = {20, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 5, height = -0.5 * 101.3 * 1000, offset = 2 * 101.3 * 1000, startTime = 5)  annotation(
    Placement(visible = true, transformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp1.y, boundary1.p_in) annotation(
    Line(points = {{-78, 30}, {-76, 30}, {-76, 38}, {-62, 38}, {-62, 38}}, color = {0, 0, 127}));
  connect(boundary1.ports[1], volume.ports[1]) annotation(
    Line(points = {{-40, 30}, {-14, 30}, {-14, 30}, {-10, 30}}, color = {0, 127, 255}, thickness = 0.5));
  connect(fixedHeatFlow1.port, volume.heatPort) annotation(
    Line(points = {{0, 0}, {0, 0}, {0, 20}, {0, 20}}, color = {191, 0, 0}));
  connect(volume.ports[2], orifice1.port_a) annotation(
    Line(points = {{-10, 30}, {10, 30}, {10, 30}, {10, 30}}, color = {0, 127, 255}));
  connect(orifice1.port_b, volume1.ports[1]) annotation(
    Line(points = {{30, 30}, {48, 30}, {48, 30}, {50, 30}}, color = {0, 127, 255}));
  connect(orifice.port_b, boundary.ports[1]) annotation(
    Line(points = {{90, 30}, {100, 30}, {100, 30}, {100, 30}}, color = {0, 127, 255}));
  connect(volume1.ports[2], orifice.port_a) annotation(
    Line(points = {{50, 30}, {70, 30}, {70, 30}, {70, 30}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-06, Interval = 0.04),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end boiler001;
