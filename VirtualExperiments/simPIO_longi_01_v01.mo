within SystemModels.VirtualExperiments;

model simPIO_longi_01_v01
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Ramp ramp_elev1(duration = 1, height = -25, offset = 0, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-70, 170}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Blocks.Sources.Ramp ramp_pitchIntend(duration = 0.1, height = 10, offset = 0, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-170, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(visible = true, transformation(origin = {-130, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Sum sum1(nin = 3) annotation(
    Placement(visible = true, transformation(origin = {10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain proportional2(k = -2) annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator2(k = -1) annotation(
    Placement(visible = true, transformation(origin = {-50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Derivative derivative2(T = 0.01, k = -2) annotation(
    Placement(visible = true, transformation(origin = {-50, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Trapezoid trapez_elev(amplitude = -5, falling = 0.1, nperiod = 1, offset = 0, period = 30, rising = 0.1, startTime = 10, width = 12) annotation(
    Placement(visible = true, transformation(origin = {-70, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Sum sum11(nin = 3) annotation(
    Placement(visible = true, transformation(origin = {0, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain proportional3(k = -2.0) annotation(
    Placement(visible = true, transformation(origin = {-50, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator3(k = 0.0) annotation(
    Placement(visible = true, transformation(origin = {-50, -190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Derivative derivative3(T = 0.01, k = 0.0) annotation(
    Placement(visible = true, transformation(origin = {-50, -230}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(visible = true, transformation(origin = {-130, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain_q3(k = 1) annotation(
    Placement(visible = true, transformation(origin = {58, -220}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain_dq3(k = 1) annotation(
    Placement(visible = true, transformation(origin = {80, -190}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));

  model aircraft_longi
  Modelica.Blocks.Interfaces.RealInput u_elev annotation(
      Placement(visible = true, transformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder elevatorDyn(T = 0.1) annotation(
      Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction pitchDyn(a = {1, 0.65, 2.15, 0}, b = {-2, -0.6}) annotation(
      Placement(visible = true, transformation(origin = {30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_theta "pitch" annotation(
      Placement(visible = true, transformation(origin = {150, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_q "pitch rate" annotation(
      Placement(visible = true, transformation(origin = {150, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Der pitchRate annotation(
      Placement(visible = true, transformation(origin = {70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter lim_elev(limitsAtInit = true, uMax = 30, uMin = -30) annotation(
      Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_dq annotation(
      Placement(visible = true, transformation(origin = {150, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Der d_pitchRate annotation(
      Placement(visible = true, transformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
  connect(pitchDyn.y, y_theta) annotation(
      Line(points = {{41, 0}, {50, 0}, {50, 40}, {150, 40}}, color = {0, 0, 127}));
  connect(pitchRate.y, y_q) annotation(
      Line(points = {{81, 0}, {150, 0}}, color = {0, 0, 127}));
  connect(pitchDyn.y, pitchRate.u) annotation(
      Line(points = {{41, 0}, {58, 0}}, color = {0, 0, 127}));
  connect(pitchRate.y, d_pitchRate.u) annotation(
      Line(points = {{81, 0}, {86, 0}, {86, -40}, {98, -40}}, color = {0, 0, 127}));
  connect(d_pitchRate.y, y_dq) annotation(
      Line(points = {{121, -40}, {150, -40}}, color = {0, 0, 127}));
  connect(u_elev, elevatorDyn.u) annotation(
      Line(points = {{-110, 0}, {-82, 0}}, color = {0, 0, 127}));
  connect(elevatorDyn.y, lim_elev.u) annotation(
      Line(points = {{-58, 0}, {-34, 0}, {-34, 0}, {-32, 0}}, color = {0, 0, 127}));
  connect(lim_elev.y, pitchDyn.u) annotation(
      Line(points = {{-8, 0}, {16, 0}, {16, 0}, {18, 0}}, color = {0, 0, 127}));
    annotation(
      defaultComponentName = "aircraft",
      Diagram(coordinateSystem(extent = {{-100, -90}, {140, 80}})),
      Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {5, 108}, extent = {{-105, 12}, {95, -8}}, textString = "%name"), Text(origin = {-6, 2}, extent = {{-94, 18}, {74, -24}}, textString = "Aircraft"), Text(origin = {79, 64}, extent = {{-15, 8}, {17, -12}}, textString = "theta"), Text(origin = {87, 2}, extent = {{-15, 8}, {15, -8}}, textString = "q"), Text(origin = {85, -54}, extent = {{-15, 4}, {17, -12}}, textString = "dq")}, coordinateSystem(initialScale = 0.1)));
  

  end aircraft_longi;

  SystemModels.VirtualExperiments.simPIO_longi_01_v01.aircraft_longi aircraft annotation(
    Placement(visible = true, transformation(origin = {10, 170}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  model rateLimitter
  Modelica.Blocks.Continuous.Derivative derivative(T = 0.001, k = 1)  annotation(
      Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator annotation(
      Placement(visible = true, transformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u annotation(
      Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(
      Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter(limitsAtInit = true, uMax = 30, uMin = -30)  annotation(
      Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(u, derivative.u) annotation(
      Line(points = {{-120, 0}, {-82, 0}, {-82, 0}, {-82, 0}}, color = {0, 0, 127}));
    connect(integrator.y, y) annotation(
      Line(points = {{22, 0}, {102, 0}, {102, 0}, {110, 0}}, color = {0, 0, 127}));
  connect(derivative.y, limiter.u) annotation(
      Line(points = {{-58, 0}, {-42, 0}, {-42, 0}, {-42, 0}}, color = {0, 0, 127}));
  connect(limiter.y, integrator.u) annotation(
      Line(points = {{-18, 0}, {-2, 0}, {-2, 0}, {-2, 0}}, color = {0, 0, 127}));
    annotation(
      defaultComponentName = "lim",
      Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {3, 0}, extent = {{-81, 18}, {81, -18}}, textString = "elev. rate limit"), Text(origin = {0, 110}, extent = {{-100, 10}, {100, -10}}, textString = "%name")}),
      experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst");

  end rateLimitter;

  model ctrl_PID
  Modelica.Blocks.Math.Gain proportional(k = -20) annotation(
    Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Derivative derivative(T = 0.001, k = -1) annotation(
    Placement(visible = true, transformation(origin = {-10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator(k = -50) annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Sum sum11(nin = 3) annotation(
    Placement(visible = true, transformation(origin = {50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_ref annotation(
      Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(
      Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_feedback annotation(
      Placement(visible = true, transformation(origin = {-80, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {-80, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
      Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
  connect(sum11.y, y) annotation(
      Line(points = {{61, 50}, {66, 50}, {66, 0}, {110, 0}}, color = {0, 0, 127}));
  connect(u_ref, feedback1.u1) annotation(
      Line(points = {{-120, 0}, {-88, 0}, {-88, 0}, {-88, 0}}, color = {0, 0, 127}));
  connect(u_feedback, feedback1.u2) annotation(
      Line(points = {{-80, -120}, {-80, -120}, {-80, -8}, {-80, -8}}, color = {0, 0, 127}));
  connect(feedback1.y, proportional.u) annotation(
      Line(points = {{-70, 0}, {-46, 0}, {-46, 50}, {-22, 50}, {-22, 50}}, color = {0, 0, 127}));
  connect(feedback1.y, integrator.u) annotation(
      Line(points = {{-70, 0}, {-40, 0}, {-40, 10}, {-22, 10}, {-22, 10}}, color = {0, 0, 127}));
  connect(feedback1.y, derivative.u) annotation(
      Line(points = {{-70, 0}, {-36, 0}, {-36, -30}, {-22, -30}, {-22, -30}}, color = {0, 0, 127}));
  connect(proportional.y, sum11.u[1]) annotation(
      Line(points = {{2, 50}, {36, 50}, {36, 50}, {38, 50}}, color = {0, 0, 127}));
  connect(integrator.y, sum11.u[2]) annotation(
      Line(points = {{2, 10}, {10, 10}, {10, 50}, {38, 50}, {38, 50}}, color = {0, 0, 127}));
  connect(derivative.y, sum11.u[3]) annotation(
      Line(points = {{2, -30}, {16, -30}, {16, 50}, {38, 50}, {38, 50}}, color = {0, 0, 127}));
    annotation(
      defaultComponentName = "ctrl",
      Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {-12, -8}, extent = {{-88, 28}, {112, -12}}, textString = "Ctrl")}, coordinateSystem(initialScale = 0.1)));

  end ctrl_PID;

  SystemModels.VirtualExperiments.simPIO_longi_01_v01.rateLimitter limElevRate annotation(
    Placement(visible = true, transformation(origin = {-30, 170}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SystemModels.VirtualExperiments.simPIO_longi_01_v01.rateLimitter limElevRate1 annotation(
    Placement(visible = true, transformation(origin = {-30, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SystemModels.VirtualExperiments.simPIO_longi_01_v01.aircraft_longi aircraft1 annotation(
    Placement(visible = true, transformation(origin = {10, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SystemModels.VirtualExperiments.simPIO_longi_01_v01.rateLimitter limElevRate2 annotation(
    Placement(visible = true, transformation(origin = {50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SystemModels.VirtualExperiments.simPIO_longi_01_v01.aircraft_longi aircraft2 annotation(
    Placement(visible = true, transformation(origin = {90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SystemModels.VirtualExperiments.simPIO_longi_01_v01.rateLimitter limElevRate3 annotation(
    Placement(visible = true, transformation(origin = {120, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SystemModels.VirtualExperiments.simPIO_longi_01_v01.aircraft_longi aircraft3 annotation(
    Placement(visible = true, transformation(origin = {150, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.DeadZone dead_dq3(deadZoneAtInit = true, uMax = 5, uMin = -1.0 * dead_dq3.uMax)  annotation(
    Placement(visible = true, transformation(origin = {110, -190}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.DeadZone dead_q3(deadZoneAtInit = true, uMax = 5, uMin = -1.0 * dead_q3.uMax)  annotation(
    Placement(visible = true, transformation(origin = {90, -220}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder aviatorDelay2(T = 0.25, k = 1)  annotation(
    Placement(visible = true, transformation(origin = {-100, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder aviatorDelay3(T = 0.25, k = 1) annotation(
    Placement(visible = true, transformation(origin = {-100, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder aviatorDelay3_1(T = 0.25, k = 1) annotation(
    Placement(visible = true, transformation(origin = {140, -190}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder aviatorDelay3_2(T = 0.25, k = 1) annotation(
    Placement(visible = true, transformation(origin = {120, -220}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add annotation(
    Placement(visible = true, transformation(origin = {40, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {80, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_pitchIntend.y, feedback.u1) annotation(
    Line(points = {{-159, 30}, {-138, 30}}, color = {0, 0, 127}));
  connect(proportional2.y, sum1.u[1]) annotation(
    Line(points = {{-39, 30}, {-2, 30}}, color = {0, 0, 127}));
  connect(integrator2.y, sum1.u[2]) annotation(
    Line(points = {{-39, -10}, {-24, -10}, {-24, 30}, {-2, 30}}, color = {0, 0, 127}));
  connect(derivative2.y, sum1.u[3]) annotation(
    Line(points = {{-39, -50}, {-18, -50}, {-18, 30}, {-2, 30}}, color = {0, 0, 127}));
  connect(ramp_pitchIntend.y, feedback1.u1) annotation(
    Line(points = {{-159, 30}, {-148.5, 30}, {-148.5, -150}, {-138, -150}}, color = {0, 0, 127}));
  connect(proportional3.y, sum11.u[1]) annotation(
    Line(points = {{-39, -150}, {-12, -150}}, color = {0, 0, 127}));
  connect(integrator3.y, sum11.u[2]) annotation(
    Line(points = {{-39, -190}, {-26, -190}, {-26, -150}, {-12, -150}}, color = {0, 0, 127}));
  connect(derivative3.y, sum11.u[3]) annotation(
    Line(points = {{-39, -230}, {-22, -230}, {-22, -150}, {-12, -150}}, color = {0, 0, 127}));
  connect(ramp_elev1.y, limElevRate.u) annotation(
    Line(points = {{-58, 170}, {-42, 170}, {-42, 170}, {-42, 170}}, color = {0, 0, 127}));
  connect(limElevRate.y, aircraft.u_elev) annotation(
    Line(points = {{-18, 170}, {-2, 170}, {-2, 170}, {-2, 170}}, color = {0, 0, 127}));
  connect(trapez_elev.y, limElevRate1.u) annotation(
    Line(points = {{-58, 110}, {-42, 110}, {-42, 110}, {-42, 110}}, color = {0, 0, 127}));
  connect(limElevRate1.y, aircraft1.u_elev) annotation(
    Line(points = {{-18, 110}, {-2, 110}, {-2, 110}, {-2, 110}}, color = {0, 0, 127}));
  connect(sum1.y, limElevRate2.u) annotation(
    Line(points = {{22, 30}, {36, 30}, {36, 30}, {38, 30}}, color = {0, 0, 127}));
  connect(limElevRate2.y, aircraft2.u_elev) annotation(
    Line(points = {{62, 30}, {78, 30}, {78, 30}, {78, 30}}, color = {0, 0, 127}));
  connect(aircraft2.y_theta, feedback.u2) annotation(
    Line(points = {{102, 36}, {114, 36}, {114, -70}, {-130, -70}, {-130, 22}}, color = {0, 0, 127}));
  connect(limElevRate3.y, aircraft3.u_elev) annotation(
    Line(points = {{131, -150}, {139, -150}}, color = {0, 0, 127}));
  connect(aircraft3.y_theta, feedback1.u2) annotation(
    Line(points = {{161, -144}, {178, -144}, {178, -254}, {-130, -254}, {-130, -158}}, color = {0, 0, 127}));
  connect(gain_dq3.u, dead_dq3.y) annotation(
    Line(points = {{92, -190}, {98, -190}}, color = {0, 0, 127}));
  connect(gain_q3.u, dead_q3.y) annotation(
    Line(points = {{70, -220}, {79, -220}}, color = {0, 0, 127}));
  connect(feedback.y, aviatorDelay2.u) annotation(
    Line(points = {{-120, 30}, {-114, 30}, {-114, 30}, {-112, 30}}, color = {0, 0, 127}));
  connect(aviatorDelay2.y, proportional2.u) annotation(
    Line(points = {{-88, 30}, {-64, 30}, {-64, 30}, {-62, 30}}, color = {0, 0, 127}));
  connect(aviatorDelay2.y, integrator2.u) annotation(
    Line(points = {{-88, 30}, {-72, 30}, {-72, -10}, {-62, -10}, {-62, -10}}, color = {0, 0, 127}));
  connect(aviatorDelay2.y, derivative2.u) annotation(
    Line(points = {{-88, 30}, {-78, 30}, {-78, -50}, {-62, -50}, {-62, -50}}, color = {0, 0, 127}));
  connect(feedback1.y, aviatorDelay3.u) annotation(
    Line(points = {{-120, -150}, {-112, -150}, {-112, -150}, {-112, -150}}, color = {0, 0, 127}));
  connect(aviatorDelay3.y, proportional3.u) annotation(
    Line(points = {{-88, -150}, {-64, -150}, {-64, -150}, {-62, -150}}, color = {0, 0, 127}));
  connect(aviatorDelay3.y, integrator3.u) annotation(
    Line(points = {{-88, -150}, {-70, -150}, {-70, -190}, {-62, -190}, {-62, -190}}, color = {0, 0, 127}));
  connect(aviatorDelay3.y, derivative3.u) annotation(
    Line(points = {{-88, -150}, {-74, -150}, {-74, -230}, {-62, -230}, {-62, -230}}, color = {0, 0, 127}));
  connect(aircraft3.y_dq, aviatorDelay3_1.u) annotation(
    Line(points = {{161, -156}, {168, -156}, {168, -190}, {152, -190}}, color = {0, 0, 127}));
  connect(aviatorDelay3_1.y, dead_dq3.u) annotation(
    Line(points = {{129, -190}, {122, -190}}, color = {0, 0, 127}));
  connect(dead_q3.u, aviatorDelay3_2.y) annotation(
    Line(points = {{102, -220}, {110, -220}, {110, -220}, {110, -220}}, color = {0, 0, 127}));
  connect(aircraft3.y_q, aviatorDelay3_2.u) annotation(
    Line(points = {{161, -150}, {172, -150}, {172, -220}, {132, -220}}, color = {0, 0, 127}));
  connect(sum11.y, add.u1) annotation(
    Line(points = {{12, -150}, {16, -150}, {16, -144}, {28, -144}}, color = {0, 0, 127}));
  connect(gain_q3.y, add.u2) annotation(
    Line(points = {{48, -220}, {20, -220}, {20, -156}, {28, -156}, {28, -156}}, color = {0, 0, 127}));
  connect(add.y, add1.u1) annotation(
    Line(points = {{52, -150}, {58, -150}, {58, -144}, {68, -144}, {68, -144}}, color = {0, 0, 127}));
  connect(gain_dq3.y, add1.u2) annotation(
    Line(points = {{70, -190}, {60, -190}, {60, -156}, {68, -156}, {68, -156}}, color = {0, 0, 127}));
  connect(add1.y, limElevRate3.u) annotation(
    Line(points = {{92, -150}, {106, -150}, {106, -150}, {108, -150}}, color = {0, 0, 127}));
protected
  annotation(
    Diagram(coordinateSystem(extent = {{-180, -300}, {180, 200}})),
    Icon,
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end simPIO_longi_01_v01;
