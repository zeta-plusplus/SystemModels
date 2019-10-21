within SystemModels.Practice;

model test_reactor_02
  extends Modelica.Icons.Example;
  //----------
  replaceable package liquid1 = Nuclear.FuelSaltLiFBeF2 
    (final singleState=true, final enthalpyOfT=true);
  // redeclare package Medium = liquid1
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = liquid1, nPorts = 1, p = 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 100, height = 0, offset = 0, startTime = 20) annotation(
    Placement(visible = true, transformation(origin = {-90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = liquid1, T_start = boundary1.T, V = 1e-3, nPorts = 3, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-10, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = liquid1, diameter = 0.1, length = 0.5) annotation(
    Placement(visible = true, transformation(origin = {60, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = liquid1, T = 273.15 + 600, nPorts = 1, p = 5 * 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-50, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = liquid1) annotation(
    Placement(visible = true, transformation(origin = {20, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp Tfuel_ref(duration = 300, height = 0, offset = -890, startTime = 100)  annotation(
    Placement(visible = true, transformation(origin = {70, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Math.Gain Tfuel_rho_feedback(k = -9.5)  annotation(
    Placement(visible = true, transformation(origin = {20, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Math.Add3 add31 annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant rho0(k = -2)  annotation(
    Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Nuclear.PointKineticMoltenSaltReactor_P1 pointKineticMoltenSaltReactor_P11(NominalPower = 10 / 1000, alpha0 = 1e-6) annotation(
    Placement(visible = true, transformation(origin = {-40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Pulse pulse1(amplitude = 0, nperiod = 2, offset = 0, period = 100, startTime = 700, width = 50)  annotation(
    Placement(visible = true, transformation(origin = {-90, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
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
  connect(boundary1.ports[1], volume.ports[1]) annotation(
    Line(points = {{-40, -70}, {-12, -70}, {-12, -70}, {-10, -70}}, color = {0, 127, 255}, thickness = 0.5));
  connect(pipe.port_b, boundary.ports[1]) annotation(
    Line(points = {{70, -70}, {80, -70}}, color = {0, 127, 255}));
  connect(Tfuel_rho_feedback.u, add1.y) annotation(
    Line(points = {{32, 30}, {40, 30}, {40, 12}, {40, 12}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 1000, Tolerance = 1e-06, Interval = 0.01),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end test_reactor_02;
