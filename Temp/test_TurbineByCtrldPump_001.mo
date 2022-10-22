within SystemModels.Temp;

model test_TurbineByCtrldPump_001
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {66, -42}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature T_upstream(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-68, -57}, extent = {{-8, -7}, {8, 7}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp_T_in(duration = 2, height = 300, offset = 800, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-150, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division PR annotation(
    Placement(visible = true, transformation(origin = {-60, -92}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T = 288.15, nPorts = 1, p = 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {120, -42}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p_downstream(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {44, -60}, extent = {{-6, -6}, {6, 6}}, rotation = 180)));
  Modelica.Fluid.Machines.ControlledPump TrbbyPump(redeclare package Medium = Modelica.Media.Air.DryAirNasa, N_nominal = -1000, V = 0.01, control_m_flow = true, m_flow_nominal = -5, p_a_nominal = 500 * 1000, p_b_nominal = 100 * 1000, use_m_flow_set = true) annotation(
    Placement(visible = true, transformation(origin = {-20, -42}, extent = {{20, 20}, {-20, -20}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature T_downstream(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {20, -57}, extent = {{-8, -7}, {8, 7}}, rotation = 180)));
  Modelica.Blocks.Sources.RealExpression calc_Wc_Trb(y = 6 * (1 - exp(-(PR.y - 1) / 0.11))) annotation(
    Placement(visible = true, transformation(origin = {-50, -118}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p_upstream(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-88, -63}, extent = {{7, -7}, {-7, 7}}, rotation = 180)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T = 1000, nPorts = 1, p = 10 * 101.325 * 1000, use_T_in = true, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-110, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression calc_m_flow_Trb(y = calc_Wc_Trb.y * (p_upstream.p / (101.325 * 1000)) / sqrt(T_upstream.T / 288.15)) annotation(
    Placement(visible = true, transformation(origin = {-30, -114}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = -1) annotation(
    Placement(visible = true, transformation(origin = {-5, -94}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_p_in(duration = 2, height = 5 * 100 * 1000, offset = 1.2 * 100 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-150, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(p_upstream.p, PR.u1) annotation(
    Line(points = {{-80.3, -63}, {-80.3, -80}, {-66.3, -80}}, color = {0, 0, 127}));
  connect(p_downstream.p, PR.u2) annotation(
    Line(points = {{37.4, -60}, {37.4, -80}, {-53.6, -80}}, color = {0, 0, 127}));
  connect(gain.y, TrbbyPump.m_flow_set) annotation(
    Line(points = {{-5, -87.4}, {-5, -68.4}, {-11, -68.4}, {-11, -57.4}}, color = {0, 0, 127}));
  connect(TrbbyPump.port_a, T_downstream.port) annotation(
    Line(points = {{0, -42}, {20, -42}, {20, -50}}, color = {0, 127, 255}));
  connect(TrbbyPump.port_b, T_upstream.port) annotation(
    Line(points = {{-40, -42}, {-68, -42}, {-68, -50}}, color = {0, 127, 255}));
  connect(calc_m_flow_Trb.y, gain.u) annotation(
    Line(points = {{-19, -114}, {-6, -114}, {-6, -101}}, color = {0, 0, 127}));
  connect(ramp_T_in.y, boundary.T_in) annotation(
    Line(points = {{-139, -52}, {-133, -52}, {-133, -38}, {-123, -38}, {-123, -38}}, color = {0, 0, 127}));
  connect(ramp_p_in.y, boundary.p_in) annotation(
    Line(points = {{-139, -22}, {-130, -22}, {-130, -34}, {-122, -34}}, color = {0, 0, 127}));
  connect(TrbbyPump.port_b, p_upstream.port) annotation(
    Line(points = {{-40, -42}, {-88, -42}, {-88, -56}}, color = {0, 127, 255}));
  connect(boundary1.ports[1], massFlowRate1.port_b) annotation(
    Line(points = {{110, -42}, {76, -42}}, color = {0, 127, 255}));
  connect(TrbbyPump.port_a, p_downstream.port) annotation(
    Line(points = {{0, -42}, {44, -42}, {44, -54}}, color = {0, 127, 255}));
  connect(TrbbyPump.port_a, massFlowRate1.port_a) annotation(
    Line(points = {{0, -42}, {56, -42}}, color = {0, 127, 255}));
  connect(TrbbyPump.port_b, boundary.ports[1]) annotation(
    Line(points = {{-40, -42}, {-100, -42}}, color = {0, 127, 255}));
  annotation(
    Diagram(coordinateSystem(extent = {{-160, -140}, {160, 140}})),
    experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-6, Interval = 0.04));
end test_TurbineByCtrldPump_001;
