within SystemModels.Practice;

model test_reactor_03
  extends Modelica.Icons.Example;
  //----------
  replaceable package liquid1 = Nuclear.FuelSaltLiFBeF2 
    (final singleState=true, final enthalpyOfT=true);
  // redeclare package Medium = liquid1
  replaceable package liquid2 = Modelica.Media.Water.StandardWaterOnePhase;
  // redeclare package Medium = liquid2
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 100, height = 2.2, offset = 0, startTime = 20) annotation(
    Placement(visible = true, transformation(origin = {-90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = liquid1, T_start = tank.T_start, V = 1e-3, nPorts = 3, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-10, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = liquid1, diameter = 0.1, length = 0.5) annotation(
    Placement(visible = true, transformation(origin = {60, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = liquid1) annotation(
    Placement(visible = true, transformation(origin = {20, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp Tfuel_ref(duration = 300, height = -11, offset = -890, startTime = 100)  annotation(
    Placement(visible = true, transformation(origin = {70, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Math.Gain Tfuel_rho_feedback(k = -9.5)  annotation(
    Placement(visible = true, transformation(origin = {20, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Math.Add3 add31 annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant rho0(k = -2)  annotation(
    Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Nuclear.PointKineticMoltenSaltReactor_P1 pointKineticMoltenSaltReactor_P11(NominalPower = 10 / 1000, alpha0 = 1e-6) annotation(
    Placement(visible = true, transformation(origin = {-40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Pulse pulse1(amplitude = 40, nperiod = 2, offset = 0, period = 100, startTime = 700, width = 50)  annotation(
    Placement(visible = true, transformation(origin = {-90, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.OpenTank tank(redeclare package Medium = liquid1, T_start = 600 + 273.15, crossArea = Modelica.Constants.pi / 4 * 0.5 ^ 2, height = 1, level(fixed = true, start = 0.5), nPorts = 2, s(fixed = false), use_portsData = false)  annotation(
    Placement(visible = true, transformation(origin = {-50, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Examples.HeatExchanger.BaseClasses.BasicHX basicHX1
  (redeclare package Medium_1 = liquid2, redeclare package Medium_2 = liquid1, Twall_start = Modelica.SIunits.Conversions.from_degC(625), area_h_1 = 0.628 * 11.0003, area_h_2 = 0.628 * 11.0003,
    c_wall=500, crossArea_1 = 3.14e-2, crossArea_2 = 3.14e-2, dT = 1, k_wall = 100, length = 11.0003, modelStructure_1 = Modelica.Fluid.Types.ModelStructure.av_b, modelStructure_2 = Modelica.Fluid.Types.ModelStructure.a_vb, nNodes = 2, perimeter_1 = 0.628, perimeter_2 = 0.628,
    rho_wall=900,
  s_wall=0.005, use_T_start = false,
  redeclare model HeatTransfer_1 =
        Modelica.Fluid.Pipes.BaseClasses.HeatTransfer.ConstantFlowHeatTransfer
        (alpha0=2000),
         redeclare model HeatTransfer_2 =
        Modelica.Fluid.Pipes.BaseClasses.HeatTransfer.ConstantFlowHeatTransfer
        (alpha0=2000)
    )
    annotation(
    Placement(visible = true, transformation(origin = {10, -160}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T begin_liquid2(redeclare package Medium = liquid2, T = 50 + 273.15, m_flow = 10, nPorts = 1)  annotation(
    Placement(visible = true, transformation(origin = {-30, -180}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT end_liquid2(redeclare package Medium = liquid2, nPorts = 1, p = 101.3 * 1000)  annotation(
    Placement(visible = true, transformation(origin = {40, -190}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp2(duration = 10, offset = 10000)  annotation(
    Placement(visible = true, transformation(origin = {-90, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.HydroThermal.Components.PumpConstQflow_ideal pumpConstQflow_ideal1(redeclare package Medium = liquid1, qFlowDes = 10 * 0.001) annotation(
    Placement(visible = true, transformation(origin = {-20, -90}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {-50, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(tank.ports[1], pumpConstQflow_ideal1.port_1) annotation(
    Line(points = {{-50, -140}, {-20, -140}, {-20, -100}, {-20, -100}}, color = {0, 127, 255}));
  connect(pumpConstQflow_ideal1.port_2, volume.ports[1]) annotation(
    Line(points = {{-20, -80}, {-20, -80}, {-20, -70}, {-10, -70}, {-10, -70}}, color = {0, 127, 255}));
  connect(ramp2.y, speed1.w_ref) annotation(
    Line(points = {{-78, -90}, {-62, -90}, {-62, -90}, {-62, -90}}, color = {0, 0, 127}));
  connect(speed1.flange, pumpConstQflow_ideal1.flange_1) annotation(
    Line(points = {{-40, -90}, {-30, -90}, {-30, -90}, {-30, -90}}));
  connect(begin_liquid2.ports[1], basicHX1.port_a1) annotation(
    Line(points = {{-20, -180}, {-12, -180}, {-12, -160}, {-2, -160}}, color = {0, 127, 255}));
  connect(basicHX1.port_b1, end_liquid2.ports[1]) annotation(
    Line(points = {{22, -160}, {40, -160}, {40, -180}, {40, -180}}, color = {0, 127, 255}));
  connect(pipe.port_b, basicHX1.port_a2) annotation(
    Line(points = {{70, -70}, {76, -70}, {76, -165}, {21, -165}}, color = {0, 127, 255}));
  connect(basicHX1.port_b2, tank.ports[2]) annotation(
    Line(points = {{-1, -155}, {-50, -155}, {-50, -140}}, color = {0, 127, 255}));
  connect(pulse1.y, pointKineticMoltenSaltReactor_P11.rho_control) annotation(
    Line(points = {{-78, -40}, {-66, -40}, {-66, -34}, {-50, -34}, {-50, -34}}, color = {0, 0, 127}));
  connect(pointKineticMoltenSaltReactor_P11.port_b, volume.heatPort) annotation(
    Line(points = {{-30, -22}, {-22, -22}, {-22, -60}, {-20, -60}, {-20, -60}}, color = {191, 0, 0}));
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
  connect(temperature.T, add1.u1) annotation(
    Line(points = {{27, -50}, {33, -50}, {33, -12}}, color = {0, 0, 127}));
  connect(volume.ports[3], temperature.port) annotation(
    Line(points = {{-10, -70}, {20, -70}, {20, -60}}, color = {0, 127, 255}));
  connect(volume.ports[2], pipe.port_a) annotation(
    Line(points = {{-10, -70}, {50, -70}}, color = {0, 127, 255}));
  connect(Tfuel_rho_feedback.u, add1.y) annotation(
    Line(points = {{32, 30}, {40, 30}, {40, 12}, {40, 12}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.01),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-100, -200}, {160, 100}})),
  __OpenModelica_commandLineOptions = "");
end test_reactor_03;
