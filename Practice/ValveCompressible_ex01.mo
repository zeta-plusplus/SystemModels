within SystemModels.Practice;

model ValveCompressible_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT source(redeclare package Medium = engineAir, T = 273.15, nPorts = 1, p = 3 *101.325 * 1000.0, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveCompressible valveCompressible(redeclare package Medium = engineAir, dp_nominal = 1 * 100 * 1000, m_flow_nominal = 2, p_nominal = 2 * 100 * 1000)  annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT sink(redeclare package Medium = engineAir, T = 273.15, nPorts = 1, p = 1 * 101.325 * 1000.0, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 1)  annotation(
    Placement(visible = true, transformation(origin = {-10, 35}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_source_p(duration = 10, height = 1 * 101.325 * 1000.0, offset = 2 * 101.325 * 1000.0, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-90, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_sink_p(duration = 10, height = -0.5 * 101.325 * 1000.0, offset = 1 * 101.325 * 1000.0, startTime = 30)  annotation(
    Placement(visible = true, transformation(origin = {70, 18}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(source.ports[1], valveCompressible.port_a) annotation(
    Line(points = {{-40, 10}, {-20, 10}}, color = {0, 127, 255}, thickness = 1));
  connect(valveCompressible.port_b, sink.ports[1]) annotation(
    Line(points = {{0, 10}, {20, 10}}, color = {0, 127, 255}, thickness = 1));
  connect(const.y, valveCompressible.opening) annotation(
    Line(points = {{-10, 30}, {-10, 18}}, color = {0, 0, 127}));
  connect(ramp_source_p.y, source.p_in) annotation(
    Line(points = {{-79, 18}, {-62, 18}}, color = {0, 0, 127}));
  connect(sink.p_in, ramp_sink_p.y) annotation(
    Line(points = {{42, 18}, {60, 18}}, color = {0, 0, 127}));
annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-6, Interval = 0.08));
end ValveCompressible_ex01;
