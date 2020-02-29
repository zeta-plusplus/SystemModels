within SystemModels.Practice;

model temperatureFelt_001
  extends Modelica.Icons.Example;
  //----
  package atmAir = Modelica.Media.Air.MoistAir;
  //redeclare package Medium = atmAir
  //----
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-50, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = atmAir, T = 5 + 273.15, X = {0.999, 0.001}, m_flow = 0.01, nPorts = 1)  annotation(
    Placement(visible = true, transformation(origin = {-60, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = atmAir, T_start = 34 + 273.15,V = 0.01, X_start = {0.999, 0.001}, nPorts = 2, use_HeatTransfer = true, use_portsData = false)  annotation(
    Placement(visible = true, transformation(origin = {-20, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = atmAir, T = 5 + 273.15, X = {0.995, 0.005}, nPorts = 1, p = 101.3 * 1000)  annotation(
    Placement(visible = true, transformation(origin = {70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection1 annotation(
    Placement(visible = true, transformation(origin = {-10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor1(G = 100)  annotation(
    Placement(visible = true, transformation(origin = {-10, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature1(T = 310.15)  annotation(
    Placement(visible = true, transformation(origin = {-10, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 10, height = 0, offset = 1000 * 0.1, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-50, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = atmAir, T_start = 34 + 273.15, V = 0.01, X_start = {0.999, 0.001}, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection2 annotation(
    Placement(visible = true, transformation(origin = {30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor2(G = 100)  annotation(
    Placement(visible = true, transformation(origin = {30, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary2(redeclare package Medium = atmAir, T = 5 + 273.15, X = {0.95, 0.05}, m_flow = 0.01, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-60, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary3(redeclare package Medium = atmAir,T = 5 + 273.15, X = {0.995, 0.005}, nPorts = 2, p = 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
equation
  connect(volume1.ports[2], boundary3.ports[1]) annotation(
    Line(points = {{20, 10}, {60, 10}, {60, 10}, {60, 10}}, color = {0, 127, 255}, thickness = 0.5));
  connect(boundary2.ports[1], volume1.ports[1]) annotation(
    Line(points = {{-50, 10}, {18, 10}, {18, 10}, {20, 10}}, color = {0, 127, 255}, thickness = 0.5));
  connect(convection2.fluid, volume1.heatPort) annotation(
    Line(points = {{30, -20}, {30, 0}}, color = {191, 0, 0}));
  connect(fixedTemperature1.port, thermalConductor2.port_a) annotation(
    Line(points = {{-10, -100}, {-10, -96}, {30, -96}, {30, -80}}, color = {191, 0, 0}));
  connect(thermalConductor2.port_b, convection2.solid) annotation(
    Line(points = {{30, -60}, {30, -40}}, color = {191, 0, 0}));
  connect(thermalConductor1.port_b, convection1.solid) annotation(
    Line(points = {{-10, -60}, {-10, -40}}, color = {191, 0, 0}));
  connect(fixedTemperature1.port, thermalConductor1.port_a) annotation(
    Line(points = {{-10, -100}, {-10, -80}}, color = {191, 0, 0}));
  connect(ramp1.y, convection2.Gc) annotation(
    Line(points = {{-38, -50}, {10, -50}, {10, -30}, {20, -30}, {20, -30}}, color = {0, 0, 127}));
  connect(ramp1.y, convection1.Gc) annotation(
    Line(points = {{-39, -50}, {-30, -50}, {-30, -30}, {-21, -30}}, color = {0, 0, 127}));
  connect(boundary.ports[1], volume.ports[1]) annotation(
    Line(points = {{-50, 50}, {-20, 50}}, color = {0, 127, 255}, thickness = 0.5));
  connect(volume.ports[2], boundary1.ports[1]) annotation(
    Line(points = {{-20, 50}, {60, 50}}, color = {0, 127, 255}, thickness = 0.5));
  connect(convection1.fluid, volume.heatPort) annotation(
    Line(points = {{-10, -20}, {-10, 40}}, color = {191, 0, 0}));
annotation(
    Diagram(coordinateSystem(extent = {{-100, -120}, {100, 100}})),
    __OpenModelica_commandLineOptions = "",
  experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-6, Interval = 0.2),
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));end temperatureFelt_001;
