within SystemModels.Temp;

model test_CompressorByCtrldPump_001
  //----------
  //replaceable package fluid1 = Modelica.Media.Water.StandardWaterOnePhase;
  //replaceable package fluid1 = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = fluid1
  //----------
  parameter Real kFlowCmp=5;
  parameter Real kHeadCmp=1;
  //parameter Real arrFlowCmp[3]={kFlowCmp*0.2, kFlowCmp*0.4, kFlowCmp*0.8};
  //parameter Real arrHeadCmp[3]={kHeadCmp*40000, kHeadCmp*20000, kHeadCmp*0};
  parameter Real arrFlowCmp[2]={kFlowCmp*0.0, kFlowCmp*0.1};
  parameter Real arrHeadCmp[2]={kHeadCmp*10000, kHeadCmp*0};
  //---
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-290, 190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T = 1000, nPorts = 3, p =  101.325 * 1000, use_T_in = true, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-250, 106}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_N(duration = 5, height = 0, offset = 10000, startTime = 20) annotation(
    Placement(visible = true, transformation(origin = {-28, 42}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {-90, 42}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {190, 106}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_in(duration = 10, height = 0 * 101.325 * 1000, offset =  101.325 * 1000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-290, 126}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T_in(duration = 10, height = 0, offset = 288.15, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-290, 96}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {-60, 42}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.Pump CmpByPump(redeclare package Medium = Modelica.Media.Air.DryAirNasa, redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.linearFlow(V_flow_nominal = arrFlowCmp, head_nominal = arrHeadCmp), redeclare function efficiencyCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.constantEfficiency(eta_nominal = 0.9),N_nominal = 10000, T_start = 500, V(displayUnit = "l") = 0.001, allowFlowReversal = true, checkValve = false, energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = 2, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, nParallel = 1, p_b_start = 2 * system.p_start) annotation(
    Placement(visible = true, transformation(origin = {-160, 106}, extent = {{-20, 20}, {20, -20}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor pwrSh annotation(
    Placement(visible = true, transformation(origin = {-130, 42}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  Modelica.Fluid.Sensors.MassFlowRate m_flow_1(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-205, 106}, extent = {{-5, 5}, {5, -5}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p3(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-129, 106}, extent = {{-6, -6}, {6, 6}}, rotation = 270)));
  Modelica.Fluid.Sensors.Pressure p1(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-226, 106}, extent = {{-6, -6}, {6, 6}}, rotation = 270)));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 6)  annotation(
    Placement(visible = true, transformation(origin = {-151, 18}, extent = {{17, -10}, {-17, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue2(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {-227, 82}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue3(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {-109, 64}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature T3(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-106, 101}, extent = {{-6, -5}, {6, 5}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue11(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {-94, 74}, extent = {{-16, -10}, {16, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature T1(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-235, 125}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Wc1(y = m_flow_1.m_flow * sqrt(T1.T / 288.15) / (p1.p / (101.325 * 1000)))  annotation(
    Placement(visible = true, transformation(origin = {-220, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression PR3q1(y = p3.p / p1.p)  annotation(
    Placement(visible = true, transformation(origin = {-220, 146}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.SpecificEnthalpy h1(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-215, 119}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sensors.SpecificEnthalpy h3(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-115, 117}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valveLinear(redeclare package Medium = Modelica.Media.Air.DryAirNasa, dp_nominal = 10 * 100 * 1000, m_flow_nominal = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {-30, 106}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 10, height = -0.9, offset = 1, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-30, 150}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(ramp_p_in.y, boundary.p_in) annotation(
    Line(points = {{-279, 126}, {-270, 126}, {-270, 114}, {-262, 114}}, color = {0, 0, 127}));
  connect(ramp_T_in.y, boundary.T_in) annotation(
    Line(points = {{-279, 96}, {-273, 96}, {-273, 110}, {-262, 110}}, color = {0, 0, 127}));
  connect(CmpByPump.port_b, p3.port) annotation(
    Line(points = {{-140, 106}, {-135, 106}}, color = {0, 127, 255}));
  connect(p1.port, boundary.ports[1]) annotation(
    Line(points = {{-232, 106}, {-240, 106}}, color = {0, 127, 255}));
  connect(p1.port, m_flow_1.port_a) annotation(
    Line(points = {{-232, 106}, {-210, 106}}, color = {0, 127, 255}));
  connect(m_flow_1.port_b, CmpByPump.port_a) annotation(
    Line(points = {{-200, 106}, {-180, 106}}, color = {0, 127, 255}));
  connect(CmpByPump.shaft, pwrSh.flange_b) annotation(
    Line(points = {{-160, 86}, {-160, 42}, {-140, 42}}));
  connect(from_rpm1.y, speed1.w_ref) annotation(
    Line(points = {{-71, 42}, {-79, 42}}, color = {0, 0, 127}));
  connect(ramp_N.y, from_rpm1.u) annotation(
    Line(points = {{-39, 42}, {-49, 42}}, color = {0, 0, 127}));
  connect(realValue.numberPort, pwrSh.power) annotation(
    Line(points = {{-131.45, 18}, {-122.45, 18}, {-122.45, 32}}, color = {0, 0, 127}));
  connect(realValue2.numberPort, m_flow_1.m_flow) annotation(
    Line(points = {{-209.75, 82}, {-204.75, 82}, {-204.75, 100.5}}, color = {0, 0, 127}));
  connect(realValue3.numberPort, p3.p) annotation(
    Line(points = {{-126.25, 64}, {-129, 64}, {-129, 99}}, color = {0, 0, 127}));
  connect(p3.port, T3.port) annotation(
    Line(points = {{-135, 106}, {-106, 106}}, color = {0, 127, 255}));
  connect(T3.T, realValue11.numberPort) annotation(
    Line(points = {{-110.2, 101}, {-117.2, 101}, {-117.2, 74}, {-112.2, 74}}, color = {0, 0, 127}));
  connect(boundary.ports[2], T1.port) annotation(
    Line(points = {{-240, 106}, {-235, 106}, {-235, 120}}, color = {0, 127, 255}));
  connect(boundary.ports[3], h1.port) annotation(
    Line(points = {{-240, 106}, {-215, 106}, {-215, 114}}, color = {0, 127, 255}));
  connect(CmpByPump.port_b, h3.port) annotation(
    Line(points = {{-140, 106}, {-115, 106}, {-115, 112}}, color = {0, 127, 255}));
  connect(pwrSh.flange_a, speed1.flange) annotation(
    Line(points = {{-120, 42}, {-100, 42}}));
  connect(CmpByPump.port_b, valveLinear.port_a) annotation(
    Line(points = {{-140, 106}, {-40, 106}}, color = {0, 127, 255}));
  connect(boundary1.ports[1], valveLinear.port_b) annotation(
    Line(points = {{180, 106}, {-20, 106}}, color = {0, 127, 255}));
  connect(ramp.y, valveLinear.opening) annotation(
    Line(points = {{-30, 139}, {-30, 113}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-300, -200}, {200, 200}}, initialScale = 0.1)),
    __OpenModelica_commandLineOptions = "");
end test_CompressorByCtrldPump_001;
