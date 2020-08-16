within SystemModels.Temp;

model boiler_test01
  extends Modelica.Icons.Example;
  //----------
  replaceable package liquid1 = Modelica.Media.Water.StandardWater;
  // redeclare package Medium = liquid1
  //----------
  
  Modelica.Fluid.Examples.DrumBoiler.BaseClasses.EquilibriumDrumBoiler equilibriumDrumBoiler1(
    redeclare package Medium = liquid1, V_l(fixed = true, start = 0.001),
    V_t= 0.001,
    cp_D=500,
    m_D= 10
  ) annotation(
    Placement(visible = true, transformation(origin = {-30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = liquid1, m_flow = -10.0, nPorts = 1)  annotation(
    Placement(visible = true, transformation(origin = {70, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = liquid1, T = 90 + 273.15, nPorts = 1, p = 10 * 101.325 * 1000)  annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedHeatFlow1(Q_flow = 1.0 * 1000)  annotation(
    Placement(visible = true, transformation(origin = {-30, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-90, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(fixedHeatFlow1.port, equilibriumDrumBoiler1.heatPort) annotation(
    Line(points = {{-30, 0}, {-30, 0}, {-30, 20}, {-30, 20}}, color = {191, 0, 0}));
  connect(boundary1.ports[1], equilibriumDrumBoiler1.port_a) annotation(
    Line(points = {{-60, 30}, {-40, 30}}, color = {0, 127, 255}));
  connect(equilibriumDrumBoiler1.port_b, boundary.ports[1]) annotation(
    Line(points = {{-20, 30}, {60, 30}}, color = {0, 127, 255}));
end boiler_test01;
