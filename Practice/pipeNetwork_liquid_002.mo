within SystemModels.Practice;

model pipeNetwork_liquid_002
  extends Modelica.Icons.Example;
  //----------
  replaceable package liquid1 = Modelica.Media.Water.StandardWaterOnePhase;
  //----------
  inner Modelica.Fluid.System system(T_ambient(displayUnit = "K") = 288.15, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial) annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //----------
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = liquid1, T = 288.15, m_flow = 1, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-70, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = liquid1, V = 0.01, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-80, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = liquid1, diameter = 0.01, length = 1) annotation(
    Placement(visible = true, transformation(origin = {50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = liquid1, V = 0.01, nPorts = 2, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {80, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = liquid1, T = 288.15, nPorts = 1, p = 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {100, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Fittings.SimpleGenericOrifice orifice(redeclare package Medium = liquid1, diameter = 0.001, dp_nominal(displayUnit = "Pa") = 1500 * 1000, m_flow_nominal = 1, use_zeta = false) annotation(
    Placement(visible = true, transformation(origin = {100, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sources.Boundary_pT boundary2(redeclare package Medium = liquid1, T = 288.15, nPorts = 1, p = 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-10, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Valves.ValveLinear valveLinear1(redeclare package Medium = liquid1, dp_nominal(displayUnit = "Pa") = 2000 * 1000, m_flow_nominal = 0.5) annotation(
    Placement(visible = true, transformation(origin = {-10, -40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 10, height = -1, offset = 1, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {22, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Fittings.SimpleGenericOrifice orifice1(redeclare package Medium = liquid1, diameter = 0.02, dp_nominal(displayUnit = "Pa") = 10 * 1000, m_flow_nominal = 0.5, use_zeta = false) annotation(
    Placement(visible = true, transformation(origin = {-10, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volume2(redeclare package Medium = liquid1, V = 0.01, nPorts = 2, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {0, -12}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(volume.ports[3], orifice1.port_a) annotation(
    Line(points = {{-70, 40}, {-70, 40}, {-70, 46}, {-10, 46}, {-10, 30}, {-10, 30}}, color = {0, 127, 255}));
  connect(volume2.ports[1], orifice1.port_b) annotation(
    Line(points = {{-10, -12}, {-10, 10}}, color = {0, 127, 255}));
  connect(valveLinear1.opening, ramp1.y) annotation(
    Line(points = {{-2, -40}, {12, -40}, {12, -40}, {12, -40}}, color = {0, 0, 127}));
  connect(volume2.ports[2], valveLinear1.port_a) annotation(
    Line(points = {{-10, -12}, {-10, -30}}, color = {0, 127, 255}));
  connect(valveLinear1.port_b, boundary2.ports[1]) annotation(
    Line(points = {{-10, -50}, {-10, -60}}, color = {0, 127, 255}));
  connect(volume.ports[2], pipe.port_a) annotation(
    Line(points = {{-70, 40}, {-70, 40}, {-70, 50}, {40, 50}, {40, 50}}, color = {0, 127, 255}));
  connect(boundary.ports[1], volume.ports[1]) annotation(
    Line(points = {{-70, 14}, {-70, 40}}, color = {0, 127, 255}, thickness = 0.5));
  connect(pipe.port_b, volume1.ports[1]) annotation(
    Line(points = {{60, 50}, {76, 50}, {76, 50}, {80, 50}}, color = {0, 127, 255}));
  connect(volume1.ports[2], orifice.port_a) annotation(
    Line(points = {{80, 50}, {100, 50}, {100, 40}}, color = {0, 127, 255}));
  connect(orifice.port_b, boundary1.ports[1]) annotation(
    Line(points = {{100, 20}, {100, 20}, {100, 0}, {100, 0}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.01),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end pipeNetwork_liquid_002;
