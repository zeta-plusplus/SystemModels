within SystemModels.Temp;

model AircraftLinDyn_longi_01_v01
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Ramp ramp_elev1(duration = 1, height = -25, offset = 0, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  package subcomponents
    model aircraft_longi
    Modelica.Blocks.Interfaces.RealInput u_elev annotation(
        Placement(visible = true, transformation(origin = {-150, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
        Line(points = {{-150, 0}, {-84, 0}, {-84, 0}, {-82, 0}}, color = {0, 0, 127}));
  connect(elevatorDyn.y, lim_elev.u) annotation(
        Line(points = {{-58, 0}, {-34, 0}, {-34, 0}, {-32, 0}}, color = {0, 0, 127}));
  connect(lim_elev.y, pitchDyn.u) annotation(
        Line(points = {{-8, 0}, {16, 0}, {16, 0}, {18, 0}}, color = {0, 0, 127}));
      annotation(
        Diagram(coordinateSystem(extent = {{-140, -100}, {140, 100}})),
        Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {5, 108}, extent = {{-105, 12}, {95, -8}}, textString = "%name"), Text(origin = {-6, 2}, extent = {{-94, 18}, {74, -24}}, textString = "Aircraft"), Text(origin = {79, 64}, extent = {{-15, 8}, {17, -12}}, textString = "theta"), Text(origin = {87, 2}, extent = {{-15, 8}, {15, -8}}, textString = "q"), Text(origin = {85, -54}, extent = {{-15, 4}, {17, -12}}, textString = "dq")}, coordinateSystem(initialScale = 0.1)));
    
    end aircraft_longi;
    extends Modelica.Icons.Package;

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
        Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {-12, -8}, extent = {{-88, 28}, {112, -12}}, textString = "Ctrl")}, coordinateSystem(initialScale = 0.1)));end ctrl_PID;

    model elevRateLimitter
    Modelica.Blocks.Continuous.Derivative derivative(T = 0.001, k = 1)  annotation(
        Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator annotation(
        Placement(visible = true, transformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u annotation(
        Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(
        Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter(limitsAtInit = true, uMax = 30000, uMin = -30000)  annotation(
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
        Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {3, 0}, extent = {{-81, 18}, {81, -18}}, textString = "elev. rate limit"), Text(origin = {0, 110}, extent = {{-100, 10}, {100, -10}}, textString = "%name")}),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));end elevRateLimitter;
  end subcomponents;
  Modelica.Blocks.Sources.Trapezoid trapez_refPitchRate(amplitude = 5, falling = 0.2, nperiod = 1, offset = 0, period = 10, rising = 0.2, startTime = 10, width = 5)  annotation(
    Placement(visible = true, transformation(origin = {-70, -250}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_refPitchRate(duration = 0.1, height = 5, offset = 0, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-70, -210}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_pitchIntend(duration = 0.1, height = 10, offset = 0, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-150, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SystemModels.Temp.AircraftLinDyn_longi_01_v01.subcomponents.aircraft_longi aircraft_longi annotation(
    Placement(visible = true, transformation(origin = {-10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SystemModels.Temp.AircraftLinDyn_longi_01_v01.subcomponents.aircraft_longi aircraft_longi2 annotation(
    Placement(visible = true, transformation(origin = {10, -210}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SystemModels.Temp.AircraftLinDyn_longi_01_v01.subcomponents.ctrl_PID ctrl_PID1 annotation(
    Placement(visible = true, transformation(origin = {-30, -210}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SystemModels.Temp.AircraftLinDyn_longi_01_v01.subcomponents.ctrl_PID ctrl_PID2 annotation(
    Placement(visible = true, transformation(origin = {-30, -250}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SystemModels.Temp.AircraftLinDyn_longi_01_v01.subcomponents.aircraft_longi aircraft_longi3 annotation(
    Placement(visible = true, transformation(origin = {10, -250}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SystemModels.Temp.AircraftLinDyn_longi_01_v01.subcomponents.aircraft_longi aircraft_longi1 annotation(
    Placement(visible = true, transformation(origin = {120, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(visible = true, transformation(origin = {-108, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Sum sum1(nin = 3)  annotation(
    Placement(visible = true, transformation(origin = {12, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain proportional(k = -30)  annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator(k = -5)  annotation(
    Placement(visible = true, transformation(origin = {-50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Derivative derivative(T = 0.01, k = -30)  annotation(
    Placement(visible = true, transformation(origin = {-50, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SystemModels.Temp.AircraftLinDyn_longi_01_v01.subcomponents.elevRateLimitter elevRateLimitter annotation(
    Placement(visible = true, transformation(origin = {-40, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AircraftLinDyn_longi_01_v01.subcomponents.elevRateLimitter elevRateLimitter1 annotation(
    Placement(visible = true, transformation(origin = {90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_refPitchRate.y, ctrl_PID1.u_ref) annotation(
    Line(points = {{-59, -210}, {-41, -210}}, color = {0, 0, 127}));
  connect(ctrl_PID1.y, aircraft_longi2.u_elev) annotation(
    Line(points = {{-19, -210}, {-1, -210}}, color = {0, 0, 127}));
  connect(aircraft_longi2.y_q, ctrl_PID1.u_feedback) annotation(
    Line(points = {{21, -210}, {32, -210}, {32, -232}, {-38, -232}, {-38, -221}}, color = {0, 0, 127}));
  connect(trapez_refPitchRate.y, ctrl_PID2.u_ref) annotation(
    Line(points = {{-59, -250}, {-41, -250}}, color = {0, 0, 127}));
  connect(ctrl_PID2.y, aircraft_longi3.u_elev) annotation(
    Line(points = {{-19, -250}, {-1, -250}}, color = {0, 0, 127}));
  connect(aircraft_longi3.y_q, ctrl_PID2.u_feedback) annotation(
    Line(points = {{21, -250}, {32, -250}, {32, -272}, {-38, -272}, {-38, -261}}, color = {0, 0, 127}));
  connect(ramp_pitchIntend.y, feedback.u1) annotation(
    Line(points = {{-139, 30}, {-116, 30}}, color = {0, 0, 127}));
  connect(feedback.y, proportional.u) annotation(
    Line(points = {{-99, 30}, {-62, 30}}, color = {0, 0, 127}));
  connect(proportional.y, sum1.u[1]) annotation(
    Line(points = {{-39, 30}, {0, 30}}, color = {0, 0, 127}));
  connect(integrator.y, sum1.u[2]) annotation(
    Line(points = {{-39, -10}, {-24, -10}, {-24, 30}, {0, 30}}, color = {0, 0, 127}));
  connect(derivative.y, sum1.u[3]) annotation(
    Line(points = {{-39, -50}, {-18, -50}, {-18, 30}, {0, 30}}, color = {0, 0, 127}));
  connect(feedback.y, integrator.u) annotation(
    Line(points = {{-99, 30}, {-74, 30}, {-74, -10}, {-62, -10}}, color = {0, 0, 127}));
  connect(feedback.y, derivative.u) annotation(
    Line(points = {{-99, 30}, {-80, 30}, {-80, -50}, {-62, -50}}, color = {0, 0, 127}));
  connect(aircraft_longi1.y_theta, feedback.u2) annotation(
    Line(points = {{131, 36}, {152, 36}, {152, -76}, {-108, -76}, {-108, 22}}, color = {0, 0, 127}));
  connect(elevRateLimitter.y, aircraft_longi.u_elev) annotation(
    Line(points = {{-28, 70}, {-22, 70}, {-22, 70}, {-20, 70}}, color = {0, 0, 127}));
  connect(ramp_elev1.y, elevRateLimitter.u) annotation(
    Line(points = {{-58, 70}, {-54, 70}, {-54, 70}, {-52, 70}}, color = {0, 0, 127}));
  connect(sum1.y, elevRateLimitter1.u) annotation(
    Line(points = {{24, 30}, {76, 30}, {76, 30}, {78, 30}}, color = {0, 0, 127}));
  connect(elevRateLimitter1.y, aircraft_longi1.u_elev) annotation(
    Line(points = {{102, 30}, {110, 30}, {110, 30}, {110, 30}}, color = {0, 0, 127}));
protected
  annotation(
    Diagram(coordinateSystem(extent = {{-180, -300}, {160, 100}}, initialScale = 0.1)),
    Icon,
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end AircraftLinDyn_longi_01_v01;
