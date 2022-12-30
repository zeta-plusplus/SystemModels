within SystemModels.VirtualExperiments;

model CollidingPendulum_001
  extends Modelica.Icons.Example;
  //----------
  import units= Modelica.Units.SI;
  //-----
  units.Energy KE1;
  units.Energy KE2;
  //----------
  inner Modelica.Mechanics.MultiBody.World world(animateGravity = false)  annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape(angles_fixed = false,angles_start(displayUnit = "deg") = {0.5235987755982988, 0, 0}, color = {255, 0, 0},length = bodyShape.r[1], m = 4 *1, r = {0.5, 0, 0}, r_CM = bodyShape.r, sphereDiameter = 4 ^ (1 / 3) *0.02, width = 1 / 10 * bodyShape.sphereDiameter) annotation(
    Placement(visible = true, transformation(origin = {50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(phi(displayUnit = "deg", fixed = true, start = -1.221730476396031), useAxisFlange = true)  annotation(
    Placement(visible = true, transformation(origin = {50, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(phi(displayUnit = "deg", fixed = true, start = -1.570796326794897), useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {-30, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape1(angles_fixed = false, angles_start(displayUnit = "deg") = {0.5235987755982988, 0, 0}, length = bodyShape1.r[1], m = 1, r = {0.5, 0, 0}, r_CM = bodyShape1.r, sphereDiameter = 0.02, width = 1 / 10 * bodyShape1.sphereDiameter) annotation(
    Placement(visible = true, transformation(origin = {-30, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Sensors.Distance distance(animation = false)  annotation(
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.ElastoGap elastoGap(c = 1e15, d = 0, s_rel0 = 0 +bodyShape.sphereDiameter / 2 + bodyShape1.sphereDiameter / 2) annotation(
    Placement(visible = true, transformation(origin = {0, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Forces.LineForceWithMass lineForceWithMass(animateLine = false, animateMass = false, m = 1e-15, s_small = 1e-15)  annotation(
    Placement(visible = true, transformation(origin = {0, -20}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r = {bodyShape.sphereDiameter / 2 + bodyShape1.sphereDiameter / 2, 0, 0})  annotation(
    Placement(visible = true, transformation(origin = {10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Damper damper(d = 0, phi_nominal = 1e-9, phi_rel(displayUnit = "rad"))  annotation(
    Placement(visible = true, transformation(origin = {74, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Components.Damper damper1(d = 0, phi_nominal = 1e-9, phi_rel(displayUnit = "rad"))  annotation(
    Placement(visible = true, transformation(origin = {-2, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(revolute.frame_b, bodyShape.frame_a) annotation(
    Line(points = {{50, 60}, {50, 30}}));
  connect(revolute1.frame_b, bodyShape1.frame_a) annotation(
    Line(points = {{-30, 60}, {-30, 30}}));
  connect(world.frame_b, revolute1.frame_a) annotation(
    Line(points = {{-60, 90}, {-30, 90}, {-30, 80}}, color = {95, 95, 95}));
  connect(distance.frame_b, bodyShape.frame_b) annotation(
    Line(points = {{20, 10}, {50, 10}}, color = {95, 95, 95}));
  connect(bodyShape1.frame_b, distance.frame_a) annotation(
    Line(points = {{-30, 10}, {0, 10}}));
  connect(lineForceWithMass.frame_b, bodyShape.frame_b) annotation(
    Line(points = {{10, -20}, {50, -20}, {50, 10}}, color = {95, 95, 95}));
  connect(lineForceWithMass.frame_a, bodyShape1.frame_b) annotation(
    Line(points = {{-10, -20}, {-30, -20}, {-30, 10}}));
  connect(lineForceWithMass.flange_a, elastoGap.flange_a) annotation(
    Line(points = {{-6, -30}, {-10, -30}, {-10, -50}}, color = {0, 127, 0}));
  connect(lineForceWithMass.flange_b, elastoGap.flange_b) annotation(
    Line(points = {{6, -30}, {10, -30}, {10, -50}}, color = {0, 127, 0}));
  connect(world.frame_b, fixedTranslation.frame_a) annotation(
    Line(points = {{-60, 90}, {0, 90}}, color = {95, 95, 95}));
  connect(fixedTranslation.frame_b, revolute.frame_a) annotation(
    Line(points = {{20, 90}, {50, 90}, {50, 80}}, color = {95, 95, 95}));
  connect(revolute1.support, damper1.flange_a) annotation(
    Line(points = {{-20, 76}, {-16, 76}, {-16, 80}, {-2, 80}}));
  connect(revolute1.axis, damper1.flange_b) annotation(
    Line(points = {{-20, 70}, {-16, 70}, {-16, 60}, {-2, 60}}));
  connect(revolute.support, damper.flange_a) annotation(
    Line(points = {{60, 76}, {62, 76}, {62, 80}, {74, 80}}));
  connect(revolute.axis, damper.flange_b) annotation(
    Line(points = {{60, 70}, {64, 70}, {64, 60}, {74, 60}}));
//-----
  KE1=bodyShape.m*(sqrt(der(bodyShape.frame_b.r_0[1])^2.0+der(bodyShape.frame_b.r_0[2])^2.0+der(bodyShape.frame_b.r_0[3])^2.0))^2.0;
  KE2=bodyShape1.m*(sqrt(der(bodyShape1.frame_b.r_0[1])^2.0+der(bodyShape1.frame_b.r_0[2])^2.0+der(bodyShape1.frame_b.r_0[3])^2.0))^2.0;
//-----
  annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-09, Interval = 0.001),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", maxStepSize = "0.0001"),
  Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,nonewInst -d=initialization, --maxMixedDeterminedIndex=1000, --maxSizeLinearTearing=400, --maxSizeNonlinearTearing=600 ");
end CollidingPendulum_001;
