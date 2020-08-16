within SystemModels.Temp;

model StirlingEngine02_test02
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = 1, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, momentumDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial) annotation(
    Placement(visible = true, transformation(origin = {-230, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.SweptVolume sweptVolume1(redeclare package Medium = engineAir, clearance = 0.05 * Modelica.Constants.pi / 4 * 0.1 ^ 2, nPorts = 1, pistonCrossArea = Modelica.Constants.pi / 4 * 0.2 ^ 2, s(fixed = false), use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-90, 10}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Fluid.Machines.SweptVolume sweptVolume2(redeclare package Medium = engineAir, clearance = 0.05 * Modelica.Constants.pi / 4 * 0.1 ^ 2, nPorts = 2, pistonCrossArea = Modelica.Constants.pi / 4 * 0.2 ^ 2, s(fixed = false), use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {90, 10}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = engineAir, V = 0.1 * Modelica.Constants.pi / 4 * 0.1 ^ 2, nPorts = 2, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature2(T(displayUnit = "K") = 288.15) annotation(
    Placement(visible = true, transformation(origin = {190, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor1(G = 200) annotation(
    Placement(visible = true, transformation(origin = {-120, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor2(G = 200) annotation(
    Placement(visible = true, transformation(origin = {160, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature1 annotation(
    Placement(visible = true, transformation(origin = {-150, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 10, height = 500, offset = 288.15, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-190, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1(n = {0, -1, 0}, useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {-50, -150}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic2(n = {0, -1, 0}, useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {50, -150}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder1(diameter = 0.05, r = {0, 0.02, 0}) annotation(
    Placement(visible = true, transformation(origin = {-50, -180}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder2(diameter = 0.05, r = {0, 0.02, 0}) annotation(
    Placement(visible = true, transformation(origin = {50, -180}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.BodyBox bodyBox1(r = {0, 0.4, 0}) annotation(
    Placement(visible = true, transformation(origin = {-50, -210}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.BodyBox bodyBox2(r = {0, 0.4, 0}) annotation(
    Placement(visible = true, transformation(origin = {50, -210}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Forces.SpringDamperParallel springDamperParallel1(animation = true,c = 10000, d = 2, s_unstretched = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-50, -240}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Forces.SpringDamperParallel springDamperParallel2(animation = true,c = 10000, d = 2, s_unstretched = 0.1) annotation(
    Placement(visible = true, transformation(origin = {50, -240}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(visible = true, transformation(origin = {-170, -290}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(r = {0, 0.05, 0}) annotation(
    Placement(visible = true, transformation(origin = {-50, -270}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation2(animation = false, r = {0, 0.5 + 0.5, 0}) annotation(
    Placement(visible = true, transformation(origin = {-130, -250}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Translational.Components.Mass mass1(L = 0.1,m = 1, s(fixed = true, start = 0.2)) annotation(
    Placement(visible = true, transformation(origin = {90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.Translational.Components.Mass mass2(L = 0.1,m = 1, s(fixed = true, start = 0.1)) annotation(
    Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation3(animation = false, r = {0.1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {-10, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation4(animation = false, r = {0.1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {-10, -260}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sensors.RelPositionSensor relPositionSensor1 annotation(
    Placement(visible = true, transformation(origin = {-10, -28}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sources.Position position1 annotation(
    Placement(visible = true, transformation(origin = {20, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor1 annotation(
    Placement(visible = true, transformation(origin = {50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Fixed fixed1 annotation(
    Placement(visible = true, transformation(origin = {-50, -70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.Translational.Components.Rod rod1(L = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {-30, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sources.Force force1 annotation(
    Placement(visible = true, transformation(origin = {20, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.SweptVolume sweptVolume3(redeclare package Medium = engineAir, clearance = 0.05 * Modelica.Constants.pi / 4 * 0.1 ^ 2, nPorts = 1, pistonCrossArea = Modelica.Constants.pi / 4 * 0.2 ^ 2, s(fixed = false), use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {110, -30}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
equation
  connect(sweptVolume2.ports[2], sweptVolume3.ports[1]) annotation(
    Line(points = {{90, 20}, {110, 20}, {110, -20}, {110, -20}}, color = {0, 127, 255}, thickness = 0.5));
  connect(mass1.flange_a, sweptVolume3.flange) annotation(
    Line(points = {{90, -60}, {110, -60}, {110, -40}, {110, -40}}, color = {0, 127, 0}));
  connect(forceSensor1.flange_b, sweptVolume2.flange) annotation(
    Line(points = {{60, -10}, {90, -10}, {90, 0}, {90, 0}}, color = {0, 127, 0}));
  connect(volume.ports[2], sweptVolume2.ports[1]) annotation(
    Line(points = {{10, 40}, {90, 40}, {90, 20}, {90, 20}}, color = {0, 127, 255}, thickness = 0.5));
  connect(mass1.flange_b, prismatic2.axis) annotation(
    Line(points = {{90, -80}, {90, -158}, {56, -158}}, color = {0, 127, 0}));
  connect(force1.flange, mass2.flange_b) annotation(
    Line(points = {{10, -50}, {-70, -50}, {-70, -40}, {-70, -40}}, color = {0, 127, 0}));
  connect(forceSensor1.f, force1.f) annotation(
    Line(points = {{42, -22}, {42, -22}, {42, -50}, {32, -50}, {32, -50}}, color = {0, 0, 127}));
  connect(relPositionSensor1.flange_b, rod1.flange_b) annotation(
    Line(points = {{0, -28}, {6, -28}, {6, -70}, {-20, -70}, {-20, -70}}, color = {0, 127, 0}));
  connect(position1.flange, forceSensor1.flange_a) annotation(
    Line(points = {{30, -10}, {40, -10}}, color = {0, 127, 0}));
  connect(relPositionSensor1.s_rel, position1.s_ref) annotation(
    Line(points = {{-10, -17}, {-10, -10}, {8, -10}}, color = {0, 0, 127}));
  connect(mass2.flange_b, relPositionSensor1.flange_a) annotation(
    Line(points = {{-70, -40}, {-44, -40}, {-44, -28}, {-20, -28}, {-20, -28}}, color = {0, 127, 0}));
  connect(fixed1.flange, rod1.flange_a) annotation(
    Line(points = {{-50, -70}, {-40, -70}, {-40, -70}, {-40, -70}}, color = {0, 127, 0}));
  connect(world.frame_b, fixedTranslation2.frame_a) annotation(
    Line(points = {{-160, -290}, {-130, -290}, {-130, -260}}, color = {95, 95, 95}));
  connect(world.frame_b, fixedTranslation1.frame_a) annotation(
    Line(points = {{-160, -290}, {-50, -290}, {-50, -280}}, color = {95, 95, 95}));
  connect(fixedTranslation2.frame_b, fixedTranslation3.frame_a) annotation(
    Line(points = {{-130, -240}, {-130, -240}, {-130, -130}, {-20, -130}, {-20, -130}}, color = {95, 95, 95}));
  connect(fixedTranslation3.frame_b, prismatic2.frame_a) annotation(
    Line(points = {{0, -130}, {50, -130}, {50, -140}, {50, -140}}, color = {95, 95, 95}));
  connect(prismatic1.frame_a, fixedTranslation2.frame_b) annotation(
    Line(points = {{-50, -140}, {-130, -140}, {-130, -240}}, color = {95, 95, 95}));
  connect(prismatic1.frame_b, bodyCylinder1.frame_b) annotation(
    Line(points = {{-50, -160}, {-50, -170}}, color = {95, 95, 95}));
  connect(mass2.flange_b, prismatic1.axis) annotation(
    Line(points = {{-70, -40}, {-70, -158}, {-56, -158}}, color = {0, 127, 0}));
  connect(bodyCylinder2.frame_b, prismatic2.frame_b) annotation(
    Line(points = {{50, -170}, {50, -170}, {50, -160}, {50, -160}}, color = {95, 95, 95}));
  connect(bodyBox1.frame_b, bodyCylinder1.frame_a) annotation(
    Line(points = {{-50, -200}, {-50, -200}, {-50, -190}, {-50, -190}}, color = {95, 95, 95}));
  connect(bodyBox2.frame_b, bodyCylinder2.frame_a) annotation(
    Line(points = {{50, -200}, {50, -200}, {50, -190}, {50, -190}}, color = {95, 95, 95}));
  connect(bodyBox1.frame_a, springDamperParallel1.frame_b) annotation(
    Line(points = {{-50, -220}, {-50, -220}, {-50, -230}, {-50, -230}}, color = {95, 95, 95}));
  connect(bodyBox2.frame_a, springDamperParallel2.frame_b) annotation(
    Line(points = {{50, -220}, {50, -220}, {50, -230}, {50, -230}}, color = {95, 95, 95}));
  connect(fixedTranslation1.frame_b, springDamperParallel1.frame_a) annotation(
    Line(points = {{-50, -260}, {-50, -260}, {-50, -250}, {-50, -250}}, color = {95, 95, 95}));
  connect(fixedTranslation1.frame_b, fixedTranslation4.frame_a) annotation(
    Line(points = {{-50, -260}, {-20, -260}, {-20, -260}, {-20, -260}}, color = {95, 95, 95}));
  connect(fixedTranslation4.frame_b, springDamperParallel2.frame_a) annotation(
    Line(points = {{0, -260}, {50, -260}, {50, -250}, {50, -250}}, color = {95, 95, 95}));
  connect(sweptVolume2.heatPort, thermalConductor2.port_b) annotation(
    Line(points = {{100, 10}, {100, -10}, {150, -10}}, color = {191, 0, 0}));
  connect(thermalConductor2.port_a, fixedTemperature2.port) annotation(
    Line(points = {{170, -10}, {180, -10}, {180, -10}, {180, -10}}, color = {191, 0, 0}));
  connect(sweptVolume1.ports[1], volume.ports[1]) annotation(
    Line(points = {{-100, 10}, {-100, 10}, {-100, 40}, {10, 40}, {10, 40}}, color = {0, 127, 255}, thickness = 0.5));
  connect(sweptVolume1.flange, mass2.flange_a) annotation(
    Line(points = {{-80, 10}, {-70, 10}, {-70, -20}}, color = {0, 127, 0}));
  connect(thermalConductor1.port_b, sweptVolume1.heatPort) annotation(
    Line(points = {{-110, -10}, {-90, -10}, {-90, 0}}, color = {191, 0, 0}));
  connect(ramp1.y, prescribedTemperature1.T) annotation(
    Line(points = {{-178, -10}, {-164, -10}, {-164, -10}, {-162, -10}}, color = {0, 0, 127}));
  connect(prescribedTemperature1.port, thermalConductor1.port_a) annotation(
    Line(points = {{-140, -10}, {-130, -10}, {-130, -10}, {-130, -10}}, color = {191, 0, 0}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -300}, {200, 100}})),
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.12),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "plt", s = "dassl"));
end StirlingEngine02_test02;
