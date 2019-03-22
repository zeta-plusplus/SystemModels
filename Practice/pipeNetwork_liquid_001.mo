within SystemModels.Practice;

model pipeNetwork_liquid_001
  extends Modelica.Icons.Example;
  //----------
  replaceable package liquid1 = Modelica.Media.Water.StandardWaterOnePhase;
  //----------
  inner Modelica.Fluid.System system(massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial)  annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //----------
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium=liquid1,diameter = 0.005, length = 0.2)  annotation(
    Placement(visible = true, transformation(origin = {-10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium=liquid1,T = 288.15, nPorts = 2, p = 101.3 * 1000)  annotation(
    Placement(visible = true, transformation(origin = {-10, -270}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium=liquid1,T = 288.15, m_flow = 1, nPorts = 1)  annotation(
    Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium=liquid1,T_start = 288.15, V = 0.001, nPorts = 2, p_start = 101.3 * 1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {0, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium=liquid1,diameter = 0.005, length = 0.2) annotation(
    Placement(visible = true, transformation(origin = {-10, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe10(redeclare package Medium=liquid1,diameter = 0.005, length = 0.2) annotation(
    Placement(visible = true, transformation(origin = {70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volume11(redeclare package Medium=liquid1,T_start = 288.15, V = 0.001, nPorts = 2, p_start = 101.3 * 1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {80, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe11(redeclare package Medium=liquid1,diameter = 0.005, length = 0.2) annotation(
    Placement(visible = true, transformation(origin = {70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volume6(redeclare package Medium=liquid1,T_start = 288.15, V = 0.001, nPorts = 3, p_start = 101.3 * 1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe2(redeclare package Medium=liquid1,diameter = 0.05, length = 0.2) annotation(
    Placement(visible = true, transformation(origin = {-14, -46}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium=liquid1,T_start = 288.15, V = 0.01, nPorts = 2, p_start = 101.3 * 1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe3(redeclare package Medium=liquid1,diameter = 0.005, length = 0.2) annotation(
    Placement(visible = true, transformation(origin = {-10, -230}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volume2(redeclare package Medium=liquid1,T_start = 288.15, V = 0.001, nPorts = 2, p_start = 101.3 * 1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {0, -210}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe4(redeclare package Medium=liquid1,diameter = 0.05, length = 0.2) annotation(
    Placement(visible = true, transformation(origin = {-10, -90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volume3(redeclare package Medium=liquid1,T_start = 288.15, V = 0.001, nPorts = 2, p_start = 101.3 * 1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {0, -70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe5(redeclare package Medium=liquid1,diameter = 0.005, length = 0.2) annotation(
    Placement(visible = true, transformation(origin = {70, -230}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volume4(redeclare package Medium=liquid1,T_start = 288.15, V = 0.001, nPorts = 2, p_start = 101.3 * 1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {80, -210}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe6(redeclare package Medium=liquid1,diameter = 0.05, length = 0.2) annotation(
    Placement(visible = true, transformation(origin = {-10, -130}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volume5(redeclare package Medium=liquid1,T_start = 288.15, V = 0.001, nPorts = 2, p_start = 101.3 * 1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {0, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe7(redeclare package Medium=liquid1,diameter = 0.005, length = 0.2) annotation(
    Placement(visible = true, transformation(origin = {70, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volume7(redeclare package Medium=liquid1,T_start = 288.15, V = 0.001, nPorts = 2, p_start = 101.3 * 1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {80, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Valves.ValveLinear valveLinear1(redeclare package Medium = liquid1, dp_nominal(displayUnit = "Pa") = 10000, m_flow_nominal = 0.4718) annotation(
    Placement(visible = true, transformation(origin = {-10, -180}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 10, height = 0, offset = 0, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-62, -180}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp1.y, valveLinear1.opening) annotation(
    Line(points = {{-50, -180}, {-18, -180}, {-18, -180}, {-18, -180}}, color = {0, 0, 127}));
  connect(valveLinear1.port_b, volume2.ports[1]) annotation(
    Line(points = {{-10, -190}, {-10, -190}, {-10, -210}, {-10, -210}}, color = {0, 127, 255}));
  connect(pipe6.port_b, valveLinear1.port_a) annotation(
    Line(points = {{-10, -140}, {-10, -140}, {-10, -170}, {-10, -170}}, color = {0, 127, 255}));
  connect(boundary1.ports[2], pipe5.port_b) annotation(
    Line(points = {{-10, -260}, {-10, -250}, {70, -250}, {70, -240}}, color = {0, 127, 255}));
  connect(volume4.ports[2], pipe5.port_a) annotation(
    Line(points = {{70, -210}, {70, -210}, {70, -220}, {70, -220}}, color = {0, 127, 255}));
  connect(pipe7.port_b, volume4.ports[1]) annotation(
    Line(points = {{70, -60}, {70, -210}}, color = {0, 127, 255}));
  connect(pipe3.port_b, boundary1.ports[1]) annotation(
    Line(points = {{-10, -240}, {-10, -240}, {-10, -260}, {-10, -260}}, color = {0, 127, 255}));
  connect(volume2.ports[2], pipe3.port_a) annotation(
    Line(points = {{-10, -210}, {-10, -210}, {-10, -220}, {-10, -220}}, color = {0, 127, 255}));
  connect(volume7.ports[2], pipe7.port_a) annotation(
    Line(points = {{70, -30}, {70, -30}, {70, -40}, {70, -40}}, color = {0, 127, 255}));
  connect(pipe11.port_b, volume7.ports[1]) annotation(
    Line(points = {{70, -20}, {70, -20}, {70, -30}, {70, -30}}, color = {0, 127, 255}));
  connect(volume5.ports[2], pipe6.port_a) annotation(
    Line(points = {{-10, -110}, {-10, -110}, {-10, -120}, {-10, -120}}, color = {0, 127, 255}));
  connect(pipe4.port_b, volume5.ports[1]) annotation(
    Line(points = {{-10, -100}, {-10, -100}, {-10, -110}, {-10, -110}}, color = {0, 127, 255}));
  connect(pipe2.port_b, volume3.ports[1]) annotation(
    Line(points = {{-14, -52}, {-14, -65}, {-10, -65}, {-10, -70}}, color = {0, 127, 255}));
  connect(volume.ports[2], pipe2.port_a) annotation(
    Line(points = {{-10, -30}, {-10, -35}, {-14, -35}, {-14, -40}}, color = {0, 127, 255}));
  connect(volume3.ports[2], pipe4.port_a) annotation(
    Line(points = {{-10, -70}, {-10, -70}, {-10, -80}, {-10, -80}}, color = {0, 127, 255}));
  connect(pipe.port_b, volume1.ports[1]) annotation(
    Line(points = {{-10, 20}, {-10, 20}, {-10, 10}, {-10, 10}}, color = {0, 127, 255}));
  connect(volume6.ports[2], pipe.port_a) annotation(
    Line(points = {{-40, 50}, {-10, 50}, {-10, 40}}, color = {0, 127, 255}));
  connect(pipe10.port_b, volume11.ports[1]) annotation(
    Line(points = {{70, 20}, {70, 20}, {70, 10}, {70, 10}}, color = {0, 127, 255}));
  connect(volume6.ports[3], pipe10.port_a) annotation(
    Line(points = {{-40, 50}, {70, 50}, {70, 40}}, color = {0, 127, 255}));
  connect(volume1.ports[2], pipe1.port_a) annotation(
    Line(points = {{-10, 10}, {-10, 10}, {-10, 0}, {-10, 0}}, color = {0, 127, 255}));
  connect(pipe1.port_b, volume.ports[1]) annotation(
    Line(points = {{-10, -20}, {-10, -20}, {-10, -30}, {-10, -30}}, color = {0, 127, 255}));
  connect(volume11.ports[2], pipe11.port_a) annotation(
    Line(points = {{70, 10}, {70, 10}, {70, 0}, {70, 0}}, color = {0, 127, 255}));
  connect(boundary.ports[1], volume6.ports[1]) annotation(
    Line(points = {{-60, 50}, {-42, 50}, {-42, 50}, {-40, 50}}, color = {0, 127, 255}, thickness = 0.5));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, -500}, {200, 100}})),
    Icon(coordinateSystem(extent = {{-100, -500}, {200, 100}})),
    __OpenModelica_commandLineOptions = "",
  experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-6, Interval = 0.12),
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));end pipeNetwork_liquid_001;
