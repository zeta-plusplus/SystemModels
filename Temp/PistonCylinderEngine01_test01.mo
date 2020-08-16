within SystemModels.Temp;

model PistonCylinderEngine01_test01
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //----------
  
  Modelica.Fluid.Machines.SweptVolume sweptVolume1(redeclare package Medium = engineAir, nPorts = 0, pistonCrossArea = Modelica.Constants.pi / 4.0 * 0.2 ^ 2, s(fixed = true, start = 0.1), use_portsData = false)  annotation(
    Placement(visible = true, transformation(origin = {30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1 annotation(
    Placement(visible = true, transformation(origin = {0, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.KinematicPTP kinematicPTP1 annotation(
    Placement(visible = true, transformation(origin = {-30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-90, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(kinematicPTP1.y[1], prescribedHeatFlow1.Q_flow) annotation(
    Line(points = {{-18, 30}, {-12, 30}, {-12, 30}, {-10, 30}}, color = {0, 0, 127}));
  connect(prescribedHeatFlow1.port, sweptVolume1.heatPort) annotation(
    Line(points = {{10, 30}, {15, 30}, {15, 30}, {20, 30}, {20, 30}, {20, 30}}, color = {191, 0, 0}));
end PistonCylinderEngine01_test01;
