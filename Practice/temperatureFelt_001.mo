within SystemModels.Practice;

model temperatureFelt_001
  extends Modelica.Icons.Example;
  //----
  package moisitair1 = Modelica.Media.Air.MoistAir;
  package dryair1 = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = moistair1
  //redeclare package Medium = dryair1
  //----
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = dryair1, T = 5 + 273.15, m_flow = 0.01, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-60, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = dryair1, T_start = 34 + 273.15, V = 0.01, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {20, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = dryair1, T = 5 + 273.15, nPorts = 1, p = 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {110, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection1 annotation(
    Placement(visible = true, transformation(origin = {30, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor1(G = 100) annotation(
    Placement(visible = true, transformation(origin = {30, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature1(T = 310.15) annotation(
    Placement(visible = true, transformation(origin = {30, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 10, height = 0, offset = 1000 * 0.1, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-10, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = moisitair1, T_start = 34 + 273.15, V = 0.01, X_start = { 0.005,0.995}, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {60, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection2 annotation(
    Placement(visible = true, transformation(origin = {70, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor2(G = 100) annotation(
    Placement(visible = true, transformation(origin = {70, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary2(redeclare package Medium = moisitair1, T = 5 + 273.15, X = {0.01, 0.99}, m_flow = 0.01, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-60, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary3(redeclare package Medium = moisitair1, T = 5 + 273.15, X = { 0.005,0.995}, nPorts = 2, p = 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {110, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  FluidSystemComponents.Sensor.SpecificHeatCapacity specificHeatCapacity(redeclare package Medium = dryair1) annotation(
    Placement(visible = true, transformation(origin = {-10, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Sensor.SpecificHeatCapacity specificHeatCapacity1(redeclare package Medium = moisitair1) annotation(
    Placement(visible = true, transformation(origin = {-10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp1.y, convection2.Gc) annotation(
    Line(points = {{1, -70}, {51, -70}, {51, -50}, {59, -50}}, color = {0, 0, 127}));
  connect(specificHeatCapacity1.port, volume1.ports[1]) annotation(
    Line(points = {{-10, -10}, {58, -10}, {58, -10}, {60, -10}}, color = {0, 127, 255}));
  connect(boundary2.ports[1], specificHeatCapacity1.port) annotation(
    Line(points = {{-50, -10}, {-10, -10}, {-10, -10}, {-10, -10}}, color = {0, 127, 255}));
  connect(specificHeatCapacity.port, volume.ports[1]) annotation(
    Line(points = {{-10, 30}, {18, 30}, {18, 30}, {20, 30}}, color = {0, 127, 255}));
  connect(boundary.ports[1], specificHeatCapacity.port) annotation(
    Line(points = {{-50, 30}, {-10, 30}, {-10, 30}, {-10, 30}}, color = {0, 127, 255}));
  connect(volume.ports[2], boundary1.ports[1]) annotation(
    Line(points = {{20, 30}, {100, 30}}, color = {0, 127, 255}, thickness = 0.5));
  connect(fixedTemperature1.port, thermalConductor1.port_a) annotation(
    Line(points = {{30, -120}, {30, -100}}, color = {191, 0, 0}));
  connect(fixedTemperature1.port, thermalConductor2.port_a) annotation(
    Line(points = {{30, -120}, {30, -116}, {70, -116}, {70, -100}}, color = {191, 0, 0}));
  connect(volume1.ports[2], boundary3.ports[1]) annotation(
    Line(points = {{60, -10}, {100, -10}, {100, -10}, {100, -10}}, color = {0, 127, 255}, thickness = 0.5));
  connect(thermalConductor2.port_b, convection2.solid) annotation(
    Line(points = {{70, -80}, {70, -60}}, color = {191, 0, 0}));
  connect(convection2.fluid, volume1.heatPort) annotation(
    Line(points = {{70, -40}, {70, -20}}, color = {191, 0, 0}));
  connect(thermalConductor1.port_b, convection1.solid) annotation(
    Line(points = {{30, -80}, {30, -60}}, color = {191, 0, 0}));
  connect(convection1.fluid, volume.heatPort) annotation(
    Line(points = {{30, -40}, {30, 20}}, color = {191, 0, 0}));
  connect(ramp1.y, convection1.Gc) annotation(
    Line(points = {{1, -70}, {12, -70}, {12, -50}, {20, -50}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, -160}, {140, 100}})),
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.2),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end temperatureFelt_001;
