within SystemModels.Temp;

model StirlingEngine01_test02
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = 1, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, momentumDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial)  annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.SweptVolume sweptVolume1(redeclare package Medium = engineAir, clearance = 0.05 * Modelica.Constants.pi / 4 * 0.1 ^ 2, nPorts = 1, pistonCrossArea = Modelica.Constants.pi / 4 * 0.1 ^ 2, s(fixed = false), use_HeatTransfer = true, use_portsData = false)  annotation(
    Placement(visible = true, transformation(origin = {-90, 10}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Fluid.Machines.SweptVolume sweptVolume2(redeclare package Medium = engineAir, clearance = 0.05 * Modelica.Constants.pi / 4 * 0.1 ^ 2, nPorts = 1, pistonCrossArea = Modelica.Constants.pi / 4 * 0.1 ^ 2, s(fixed = false), use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {90, 10}, extent = {{10, 10}, {-10, -10}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = engineAir, V = 0.1 * Modelica.Constants.pi / 4 * 0.1 ^ 2, nPorts = 2, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature2(T(displayUnit = "K") = 288.15) annotation(
    Placement(visible = true, transformation(origin = {150, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor1(G = 200)  annotation(
    Placement(visible = true, transformation(origin = {-120, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor2(G = 200)  annotation(
    Placement(visible = true, transformation(origin = {120, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor1 annotation(
    Placement(visible = true, transformation(origin = {50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sources.Position position1 annotation(
    Placement(visible = true, transformation(origin = {20, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sensors.RelPositionSensor relPositionSensor1 annotation(
    Placement(visible = true, transformation(origin = {-10, -50}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Fixed fixed1 annotation(
    Placement(visible = true, transformation(origin = {-90, -100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.Translational.Components.Rod rod1(L = 0.2)  annotation(
    Placement(visible = true, transformation(origin = {-30, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sources.Force force1 annotation(
    Placement(visible = true, transformation(origin = {-30, -70}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = engineAir, diameter = 0.05, length = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {-50, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = engineAir, diameter = 0.05, length = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {50, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature1 annotation(
    Placement(visible = true, transformation(origin = {-150, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 10, height = 800, offset = 288.15, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-190, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Mass mass1(L = 0.01, m = 1, s(fixed = true, start = 0.1))  annotation(
    Placement(visible = true, transformation(origin = {-60, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.SweptVolume sweptVolume3(redeclare package Medium = engineAir, clearance = 0.05 * Modelica.Constants.pi / 4 * 0.1 ^ 2, nPorts = 1, pistonCrossArea = Modelica.Constants.pi / 4 * 0.1 ^ 2, s(fixed = false), use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {120, -50}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Mechanics.Translational.Components.Mass mass2(L = 0.01, m = 1, s(fixed = true, start = 0.1)) annotation(
    Placement(visible = true, transformation(origin = {150,-50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(sweptVolume3.flange, mass2.flange_a) annotation(
    Line(points = {{130, -50}, {140, -50}, {140, -50}, {140, -50}}, color = {0, 127, 0}));
  connect(pipe1.port_b, sweptVolume3.ports[1]) annotation(
    Line(points = {{60, 40}, {110, 40}, {110, -50}, {110, -50}}, color = {0, 127, 255}));
  connect(mass1.flange_b, force1.flange) annotation(
    Line(points = {{-50, 10}, {-44, 10}, {-44, -70}, {-40, -70}, {-40, -70}}, color = {0, 127, 0}));
  connect(mass1.flange_b, relPositionSensor1.flange_a) annotation(
    Line(points = {{-50, 10}, {-32, 10}, {-32, -50}, {-20, -50}, {-20, -50}}, color = {0, 127, 0}));
  connect(sweptVolume1.flange, mass1.flange_a) annotation(
    Line(points = {{-80, 10}, {-70, 10}, {-70, 10}, {-70, 10}}, color = {0, 127, 0}));
  connect(volume.ports[2], pipe1.port_a) annotation(
    Line(points = {{10, 40}, {40, 40}, {40, 40}, {40, 40}}, color = {0, 127, 255}));
  connect(pipe1.port_b, sweptVolume2.ports[1]) annotation(
    Line(points = {{60, 40}, {100, 40}, {100, 10}}, color = {0, 127, 255}));
  connect(pipe.port_b, volume.ports[1]) annotation(
    Line(points = {{-40, 40}, {8, 40}, {8, 40}, {10, 40}}, color = {0, 127, 255}));
  connect(sweptVolume1.ports[1], pipe.port_a) annotation(
    Line(points = {{-100, 10}, {-100, 40}, {-60, 40}}, color = {0, 127, 255}));
  connect(ramp1.y, prescribedTemperature1.T) annotation(
    Line(points = {{-178, -10}, {-164, -10}, {-164, -10}, {-162, -10}}, color = {0, 0, 127}));
  connect(prescribedTemperature1.port, thermalConductor1.port_a) annotation(
    Line(points = {{-140, -10}, {-130, -10}, {-130, -10}, {-130, -10}}, color = {191, 0, 0}));
  connect(fixed1.flange, rod1.flange_a) annotation(
    Line(points = {{-90, -100}, {-40, -100}}, color = {0, 127, 0}));
  connect(relPositionSensor1.flange_b, rod1.flange_b) annotation(
    Line(points = {{0, -50}, {16, -50}, {16, -100}, {-20, -100}}, color = {0, 127, 0}));
  connect(thermalConductor2.port_a, fixedTemperature2.port) annotation(
    Line(points = {{130, -10}, {140, -10}, {140, -10}, {140, -10}}, color = {191, 0, 0}));
  connect(sweptVolume2.heatPort, thermalConductor2.port_b) annotation(
    Line(points = {{90, 0}, {90, -10}, {110, -10}}, color = {191, 0, 0}));
  connect(forceSensor1.flange_b, sweptVolume2.flange) annotation(
    Line(points = {{60, -30}, {80, -30}, {80, 10}}, color = {0, 127, 0}));
  connect(position1.flange, forceSensor1.flange_a) annotation(
    Line(points = {{30, -30}, {40, -30}, {40, -30}, {40, -30}}, color = {0, 127, 0}));
  connect(force1.f, forceSensor1.f) annotation(
    Line(points = {{-18, -70}, {42, -70}, {42, -42}}, color = {0, 0, 127}));
  connect(relPositionSensor1.s_rel, position1.s_ref) annotation(
    Line(points = {{-10, -39}, {-10, -39}, {-10, -31}, {8, -31}, {8, -31}}, color = {0, 0, 127}));
  connect(thermalConductor1.port_b, sweptVolume1.heatPort) annotation(
    Line(points = {{-110, -10}, {-90, -10}, {-90, 0}}, color = {191, 0, 0}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -140}, {200, 100}})),
    __OpenModelica_commandLineOptions = "",
  experiment(StartTime = 0, StopTime = 500, Tolerance = 1e-6, Interval = 1),
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "plt", s = "dassl"));end StirlingEngine01_test02;
