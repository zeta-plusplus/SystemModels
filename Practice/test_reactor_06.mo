within SystemModels.Practice;

model test_reactor_06
  extends Modelica.Icons.Example;
  //----------
  package reactorFuel = Nuclear.FuelSaltLiFBeF2 
    (final singleState=true, final enthalpyOfT=true);
  // redeclare package Medium = reactorFuel
  package liquid2 = Modelica.Media.Water.StandardWaterOnePhase;
  package engineAir = Modelica.Media.Air.DryAirNasa;
  // redeclare package Medium = engineAir
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 100, height = 0, offset = 0, startTime = 20) annotation(
    Placement(visible = true, transformation(origin = {-90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = reactorFuel, T_start = 400 + 273.15, V = 1e-3, nPorts = 3, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {10, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = reactorFuel, diameter = 0.1, length = 0.5) annotation(
    Placement(visible = true, transformation(origin = {120, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = reactorFuel) annotation(
    Placement(visible = true, transformation(origin = {40, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp Tfuel_ref(duration = 300, height = 0, offset = -1200, startTime = 100)  annotation(
    Placement(visible = true, transformation(origin = {70, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Math.Gain Tfuel_rho_feedback(k = -9.5)  annotation(
    Placement(visible = true, transformation(origin = {20, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Math.Add3 add31 annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant rho0(k = -2)  annotation(
    Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Nuclear.PointKineticMoltenSaltReactor_P1 pointKineticMoltenSaltReactor_P11(NominalPower = 1e7 / 1e6, ReactorFuelTemperature = 2000) annotation(
    Placement(visible = true, transformation(origin = {-40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T begin_liquid2(redeclare package Medium = engineAir, T = 700, m_flow = 10, nPorts = 1)  annotation(
    Placement(visible = true, transformation(origin = {-30, -280}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT end_liquid2(redeclare package Medium = engineAir, nPorts = 1, p = 101.3 * 1000)  annotation(
    Placement(visible = true, transformation(origin = {130, -280}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Sources.Boundary_pT tank(redeclare package Medium = reactorFuel,nPorts = 1, p = 101.3 * 1000)  annotation(
    Placement(visible = true, transformation(origin = {-50, -170}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature1(redeclare package Medium = reactorFuel) annotation(
    Placement(visible = true, transformation(origin = {10, -160}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = reactorFuel, nPorts = 1, use_T_in = true, use_m_flow_in = true)  annotation(
    Placement(visible = true, transformation(origin = {-10, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = reactorFuel, T_start = 400 + 273.15, V = 1e-3, nPorts = 3, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-20, -170}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature2(redeclare package Medium = reactorFuel) annotation(
    Placement(visible = true, transformation(origin = {40, -170}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Fittings.SimpleGenericOrifice orifice(redeclare package Medium = engineAir, diameter = 0.1, zeta = 1)  annotation(
    Placement(visible = true, transformation(origin = {80, -280}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature3(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {50, -290}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume volume2(redeclare package Medium = reactorFuel,T_start = 1000, V = 1e-3, nPorts = 3, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {10, -200}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume volume3(redeclare package Medium = engineAir, T_start = 700, V = 1e-3, nPorts = 3, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {10, -260}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection1 annotation(
    Placement(visible = true, transformation(origin = {20, -230}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant const(k = 1e9)  annotation(
    Placement(visible = true, transformation(origin = {50, -230}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp2(duration = 10, height = 0, offset = 10, startTime = 20) annotation(
    Placement(visible = true, transformation(origin = {-62, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp3(duration = 10, height = 500, offset = 0, startTime = 20) annotation(
    Placement(visible = true, transformation(origin = {-90, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp3.y, pointKineticMoltenSaltReactor_P11.rho_control) annotation(
    Line(points = {{-79, -34}, {-48, -34}}, color = {0, 0, 127}));
  connect(ramp2.y, boundary.m_flow_in) annotation(
    Line(points = {{-50, -140}, {-18, -140}, {-18, -130}, {-18, -130}}, color = {0, 0, 127}));
  connect(volume3.ports[3], temperature3.port) annotation(
    Line(points = {{10, -270}, {10, -270}, {10, -276}, {50, -276}, {50, -280}, {50, -280}}, color = {0, 127, 255}));
  connect(volume3.ports[1], orifice.port_a) annotation(
    Line(points = {{10, -270}, {64, -270}, {64, -280}, {70, -280}, {70, -280}}, color = {0, 127, 255}));
  connect(begin_liquid2.ports[1], volume3.ports[2]) annotation(
    Line(points = {{-20, -280}, {-4, -280}, {-4, -270}, {10, -270}, {10, -270}}, color = {0, 127, 255}, thickness = 0.5));
  connect(convection1.Gc, const.y) annotation(
    Line(points = {{30, -230}, {40, -230}, {40, -230}, {38, -230}}, color = {0, 0, 127}));
  connect(convection1.fluid, volume3.heatPort) annotation(
    Line(points = {{20, -240}, {20, -240}, {20, -260}, {20, -260}}, color = {191, 0, 0}));
  connect(volume2.heatPort, convection1.solid) annotation(
    Line(points = {{20, -200}, {20, -200}, {20, -220}, {20, -220}}, color = {191, 0, 0}));
  connect(orifice.port_b, end_liquid2.ports[1]) annotation(
    Line(points = {{90, -280}, {120, -280}, {120, -280}, {120, -280}}, color = {0, 127, 255}));
  connect(volume2.ports[3], temperature2.port) annotation(
    Line(points = {{10, -190}, {10, -190}, {10, -184}, {40, -184}, {40, -180}, {40, -180}}, color = {0, 127, 255}));
  connect(volume2.ports[2], pipe.port_b) annotation(
    Line(points = {{10, -190}, {136, -190}, {136, -70}, {130, -70}, {130, -70}}, color = {0, 127, 255}));
  connect(volume1.ports[2], volume2.ports[1]) annotation(
    Line(points = {{-20, -180}, {-20, -180}, {-20, -190}, {10, -190}, {10, -190}}, color = {0, 127, 255}, thickness = 0.5));
  connect(boundary.ports[1], volume.ports[1]) annotation(
    Line(points = {{-10, -110}, {-10, -70}, {10, -70}}, color = {0, 127, 255}, thickness = 0.5));
  connect(temperature1.T, boundary.T_in) annotation(
    Line(points = {{17, -160}, {27, -160}, {27, -142}, {-15, -142}, {-15, -132}, {-15, -132}}, color = {0, 0, 127}));
  connect(tank.ports[1], volume1.ports[1]) annotation(
    Line(points = {{-40, -170}, {-40, -180}, {-20, -180}}, color = {0, 127, 255}, thickness = 0.5));
  connect(volume1.ports[3], temperature1.port) annotation(
    Line(points = {{-20, -180}, {10, -180}, {10, -170}, {10, -170}}, color = {0, 127, 255}));
  connect(volume.ports[2], pipe.port_a) annotation(
    Line(points = {{10, -70}, {110, -70}}, color = {0, 127, 255}));
  connect(temperature.T, add1.u1) annotation(
    Line(points = {{47, -50}, {47, -52.5}, {55, -52.5}, {55, -31}, {33, -31}, {33, -12}}, color = {0, 0, 127}));
  connect(volume.ports[3], temperature.port) annotation(
    Line(points = {{10, -70}, {40, -70}, {40, -60}}, color = {0, 127, 255}));
  connect(pointKineticMoltenSaltReactor_P11.port_b, volume.heatPort) annotation(
    Line(points = {{-30, -22}, {-22, -22}, {-22, -60}, {0, -60}}, color = {191, 0, 0}));
  connect(add31.y, pointKineticMoltenSaltReactor_P11.rho) annotation(
    Line(points = {{-70, 0}, {-70, 0}, {-70, -22}, {-50, -22}, {-50, -22}}, color = {0, 0, 127}));
  connect(Tfuel_rho_feedback.y, add31.u1) annotation(
    Line(points = {{8, 30}, {-62, 30}, {-62, 22}}, color = {0, 0, 127}));
  connect(ramp1.y, add31.u3) annotation(
    Line(points = {{-90, 40}, {-90, 28}, {-78, 28}, {-78, 22}}, color = {0, 0, 127}));
  connect(add31.u2, rho0.y) annotation(
    Line(points = {{-70, 22}, {-70, 34}, {-50, 34}, {-50, 38}}, color = {0, 0, 127}));
  connect(add1.u2, Tfuel_ref.y) annotation(
    Line(points = {{46, -12}, {46, -20}, {59, -20}}, color = {0, 0, 127}));
  connect(Tfuel_rho_feedback.u, add1.y) annotation(
    Line(points = {{32, 30}, {40, 30}, {40, 12}, {40, 12}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 400, Tolerance = 1e-06, Interval = 0.0666778),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-100, -320}, {160, 100}}), graphics = {Rectangle(origin = {-84, 53}, pattern = LinePattern.Dash, extent = {{-28, 17}, {174, -139}}), Text(origin = {37, 61}, fillPattern = FillPattern.Solid, extent = {{-23, 5}, {23, -5}}, textString = "reactor core")}),
  __OpenModelica_commandLineOptions = "",
  Icon(coordinateSystem(extent = {{-100, -240}, {160, 100}})));
end test_reactor_06;
