within SystemModels.VirtualExperiments;

model AircraftLinDyn_longi_00_v02
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Ramp ramp_elev1(duration = 1, height = -1, offset = 0, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-50, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction pitchDyn1(a = {1, 0.65, 2.15, 0}, b = {-2, -0.6})  annotation(
    Placement(visible = true, transformation(origin = {20, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder elevator1(T = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {-10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Der pitchRate1 annotation(
    Placement(visible = true, transformation(origin = {60, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Der pitchRate2 annotation(
    Placement(visible = true, transformation(origin = {150, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder elevator2(T = 0.1) annotation(
    Placement(visible = true, transformation(origin = {80, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction pitchDyn2(a = {1, 0.65, 2.15, 0}, b = {-2, -0.6}) annotation(
    Placement(visible = true, transformation(origin = {110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_cmd_pitch2(duration = 1, height = 1, offset = 0, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-140, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(visible = true, transformation(origin = {-110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain_P_2(k = -7)  annotation(
    Placement(visible = true, transformation(origin = { -40, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator_2(k = -9)  annotation(
    Placement(visible = true, transformation(origin = {-40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Sum sum1(nin = 3)  annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Der der1 annotation(
    Placement(visible = true, transformation(origin = {-50, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain_D_2(k = -5) annotation(
    Placement(visible = true, transformation(origin = {-20, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction pitchDyn3(a = {1, 0.65, 2.15}, b = {-2, -0.6}) annotation(
    Placement(visible = true, transformation(origin = {110, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Sum sum(nin = 3) annotation(
    Placement(visible = true, transformation(origin = {30, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder elevator3(T = 0.1) annotation(
    Placement(visible = true, transformation(origin = {80, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(visible = true, transformation(origin = {-110, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = -0.01) annotation(
    Placement(visible = true, transformation(origin = {-50, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator(k = -0.01) annotation(
    Placement(visible = true, transformation(origin = {-50, -190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Der der11 annotation(
    Placement(visible = true, transformation(origin = {-70, -230}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = -0.01) annotation(
    Placement(visible = true, transformation(origin = {-40, -230}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Trapezoid trapezoid(amplitude = 1, falling = 1, nperiod = 1, offset = 0, period = 10, rising = 1, startTime = 10, width = 5)  annotation(
    Placement(visible = true, transformation(origin = {-150, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_elev1.y, elevator1.u) annotation(
    Line(points = {{-39, 70}, {-22, 70}}, color = {0, 0, 127}));
  connect(elevator1.y, pitchDyn1.u) annotation(
    Line(points = {{1, 70}, {8, 70}}, color = {0, 0, 127}));
  connect(pitchDyn1.y, pitchRate1.u) annotation(
    Line(points = {{31, 70}, {48, 70}}, color = {0, 0, 127}));
  connect(pitchDyn2.y, pitchRate2.u) annotation(
    Line(points = {{121, 10}, {138, 10}}, color = {0, 0, 127}));
  connect(elevator2.y, pitchDyn2.u) annotation(
    Line(points = {{91, 10}, {98, 10}}, color = {0, 0, 127}));
  connect(ramp_cmd_pitch2.y, feedback.u1) annotation(
    Line(points = {{-129, 10}, {-118, 10}}, color = {0, 0, 127}));
  connect(feedback.y, gain_P_2.u) annotation(
    Line(points = {{-101, 10}, {-52, 10}}, color = {0, 0, 127}));
  connect(pitchDyn2.y, feedback.u2) annotation(
    Line(points = {{121, 10}, {126.5, 10}, {126.5, -96}, {-110, -96}, {-110, 2}}, color = {0, 0, 127}));
  connect(gain_P_2.y, sum1.u[1]) annotation(
    Line(points = {{-28, 10}, {18, 10}}, color = {0, 0, 127}));
  connect(sum1.y, elevator2.u) annotation(
    Line(points = {{41, 10}, {68, 10}}, color = {0, 0, 127}));
  connect(feedback.y, integrator_2.u) annotation(
    Line(points = {{-101, 10}, {-81.5, 10}, {-81.5, -30}, {-52, -30}}, color = {0, 0, 127}));
  connect(integrator_2.y, sum1.u[2]) annotation(
    Line(points = {{-29, -30}, {3, -30}, {3, 10}, {18, 10}}, color = {0, 0, 127}));
  connect(gain_D_2.y, sum1.u[3]) annotation(
    Line(points = {{-9, -70}, {8, -70}, {8, 10}, {18, 10}}, color = {0, 0, 127}));
  connect(der1.y, gain_D_2.u) annotation(
    Line(points = {{-39, -70}, {-32, -70}}, color = {0, 0, 127}));
  connect(feedback.y, der1.u) annotation(
    Line(points = {{-101, 10}, {-87.5, 10}, {-87.5, -70}, {-62, -70}}, color = {0, 0, 127}));
  connect(elevator3.y, pitchDyn3.u) annotation(
    Line(points = {{91, -150}, {98, -150}}, color = {0, 0, 127}));
  connect(sum.y, elevator3.u) annotation(
    Line(points = {{41, -150}, {68, -150}}, color = {0, 0, 127}));
  connect(feedback1.y, gain.u) annotation(
    Line(points = {{-100, -150}, {-64, -150}, {-64, -150}, {-62, -150}}, color = {0, 0, 127}));
  connect(gain.y, sum.u[1]) annotation(
    Line(points = {{-38, -150}, {18, -150}, {18, -150}, {18, -150}}, color = {0, 0, 127}));
  connect(der11.y, gain1.u) annotation(
    Line(points = {{-58, -230}, {-52, -230}, {-52, -230}, {-52, -230}}, color = {0, 0, 127}));
  connect(feedback1.y, integrator.u) annotation(
    Line(points = {{-100, -150}, {-84, -150}, {-84, -190}, {-62, -190}, {-62, -190}}, color = {0, 0, 127}));
  connect(feedback1.y, der11.u) annotation(
    Line(points = {{-100, -150}, {-96, -150}, {-96, -230}, {-82, -230}, {-82, -230}}, color = {0, 0, 127}));
  connect(integrator.y, sum.u[2]) annotation(
    Line(points = {{-38, -190}, {-24, -190}, {-24, -150}, {18, -150}, {18, -150}}, color = {0, 0, 127}));
  connect(gain1.y, sum.u[3]) annotation(
    Line(points = {{-28, -230}, {-12, -230}, {-12, -150}, {18, -150}, {18, -150}}, color = {0, 0, 127}));
  connect(pitchDyn3.y, feedback1.u2) annotation(
    Line(points = {{122, -150}, {130, -150}, {130, -268}, {-110, -268}, {-110, -158}, {-110, -158}}, color = {0, 0, 127}));
  connect(trapezoid.y, feedback1.u1) annotation(
    Line(points = {{-138, -150}, {-118, -150}, {-118, -150}, {-118, -150}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-240, -340}, {240, 100}})),
    Icon,
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end AircraftLinDyn_longi_00_v02;
