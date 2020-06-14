within SystemModels.Temp;

model AircraftLinDyn_longi_00_v03
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Ramp ramp_elev1(duration = 1, height = -1, offset = 0, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-50, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  package subcomponents
    model aircraft_longi
    Modelica.Blocks.Interfaces.RealInput u_elev annotation(
        Placement(visible = true, transformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.Der pitchRate2 annotation(
        Placement(visible = true, transformation(origin = {30, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.FirstOrder elevator2(T = 0.1) annotation(
        Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction pitchDyn2(a = {1, 0.65, 2.15, 0}, b = {-2, -0.6}) annotation(
        Placement(visible = true, transformation(origin = {-10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput y_theta "pitch" annotation(
        Placement(visible = true, transformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput y_q "pitch rate" annotation(
        Placement(visible = true, transformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(u_elev, elevator2.u) annotation(
        Line(points = {{-110, 0}, {-64, 0}, {-64, 0}, {-62, 0}}, color = {0, 0, 127}));
    connect(pitchRate2.y, y_q) annotation(
        Line(points = {{42, -40}, {102, -40}, {102, -40}, {110, -40}}, color = {0, 0, 127}));
    connect(pitchDyn2.y, pitchRate2.u) annotation(
        Line(points = {{2, 0}, {8, 0}, {8, -40}, {18, -40}, {18, -40}}, color = {0, 0, 127}));
    connect(elevator2.y, pitchDyn2.u) annotation(
        Line(points = {{-38, 0}, {-24, 0}, {-24, 0}, {-22, 0}}, color = {0, 0, 127}));
    connect(pitchDyn2.y, y_theta) annotation(
        Line(points = {{2, 0}, {30, 0}, {30, 40}, {110, 40}, {110, 40}}, color = {0, 0, 127}));
    annotation(
        Diagram,
        Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {5, 108}, extent = {{-105, 12}, {95, -8}}, textString = "%name"), Text(origin = {-6, 2}, extent = {{-94, 18}, {106, -22}}, textString = "Aircraft"), Text(origin = {81, 42}, extent = {{-15, 8}, {17, -12}}, textString = "theta"), Text(origin = {83, -38}, extent = {{-15, 8}, {15, -8}}, textString = "q")}, coordinateSystem(initialScale = 0.1)));
    
    end aircraft_longi;
    extends Modelica.Icons.Package;

    model ctrl_PID
      Modelica.Blocks.Math.Gain proportional(k = -7) annotation(
        Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Continuous.Derivative derivative(T = 0.001, k = -8) annotation(
        Placement(visible = true, transformation(origin = {-10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Continuous.Integrator integrator(k = -30) annotation(
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
  end subcomponents;

  SystemModels.Temp.AircraftLinDyn_longi_00_v03.subcomponents.aircraft_longi aircraft_longi annotation(
    Placement(visible = true, transformation(origin = {10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SystemModels.Temp.AircraftLinDyn_longi_00_v03.subcomponents.aircraft_longi aircraft_longi1 annotation(
    Placement(visible = true, transformation(origin = {-10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SystemModels.Temp.AircraftLinDyn_longi_00_v03.subcomponents.ctrl_PID ctrl_PID annotation(
    Placement(visible = true, transformation(origin = {-30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Trapezoid trapezoid_refPitchRate(amplitude = 2, falling = 1, nperiod = 1, offset = 0, period = 10, rising = 1, startTime = 10, width = 5)  annotation(
    Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_refPitchRate(duration = 1, height = 1, offset = 0, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SystemModels.Temp.AircraftLinDyn_longi_00_v03.subcomponents.ctrl_PID ctrl_PID1 annotation(
    Placement(visible = true, transformation(origin = {-30, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SystemModels.Temp.AircraftLinDyn_longi_00_v03.subcomponents.aircraft_longi aircraft_longi2 annotation(
    Placement(visible = true, transformation(origin = {10, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SystemModels.Temp.AircraftLinDyn_longi_00_v03.subcomponents.ctrl_PID ctrl_PID2 annotation(
    Placement(visible = true, transformation(origin = {50, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SystemModels.Temp.AircraftLinDyn_longi_00_v03.subcomponents.aircraft_longi aircraft_longi3 annotation(
    Placement(visible = true, transformation(origin = {90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_pitchIntend(duration = 1, height = 10, offset = 0, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-150, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain proportional(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-70, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Sum sum11(nin = 3) annotation(
    Placement(visible = true, transformation(origin = {-30, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(visible = true, transformation(origin = {-110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-70, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Derivative derivative1(T = 0.001, k = 0.2) annotation(
    Placement(visible = true, transformation(origin = {-70, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SystemModels.Temp.AircraftLinDyn_longi_00_v03.subcomponents.ctrl_PID ctrl_PID3 annotation(
    Placement(visible = true, transformation(origin = {70, -210}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SystemModels.Temp.AircraftLinDyn_longi_00_v03.subcomponents.aircraft_longi aircraft_longi4 annotation(
    Placement(visible = true, transformation(origin = {110, -210}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Sum sum1(nin = 3) annotation(
    Placement(visible = true, transformation(origin = {-30, -210}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-70, -210}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-70, -240}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Derivative derivative(T = 0.001, k = 0.2) annotation(
    Placement(visible = true, transformation(origin = {-70, -270}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(visible = true, transformation(origin = {-110, -210}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback2 annotation(
    Placement(visible = true, transformation(origin = {0, -210}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Derivative qdot_response(T = 0.0001, k = 1.5)  annotation(
    Placement(visible = true, transformation(origin = {30, -270}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(ramp_elev1.y, aircraft_longi1.u_elev) annotation(
    Line(points = {{-38, 70}, {-22, 70}, {-22, 70}, {-20, 70}}, color = {0, 0, 127}));
  connect(ctrl_PID.y, aircraft_longi.u_elev) annotation(
    Line(points = {{-19, 30}, {-1, 30}}, color = {0, 0, 127}));
  connect(aircraft_longi.y_q, ctrl_PID.u_feedback) annotation(
    Line(points = {{21, 26}, {28, 26}, {28, 10}, {-38, 10}, {-38, 19}}, color = {0, 0, 127}));
  connect(ramp_refPitchRate.y, ctrl_PID.u_ref) annotation(
    Line(points = {{-59, 30}, {-41, 30}}, color = {0, 0, 127}));
  connect(trapezoid_refPitchRate.y, ctrl_PID1.u_ref) annotation(
    Line(points = {{-59, -10}, {-41, -10}}, color = {0, 0, 127}));
  connect(ctrl_PID1.y, aircraft_longi2.u_elev) annotation(
    Line(points = {{-19, -10}, {-1, -10}}, color = {0, 0, 127}));
  connect(aircraft_longi2.y_q, ctrl_PID1.u_feedback) annotation(
    Line(points = {{21, -14}, {28, -14}, {28, -32}, {-38, -32}, {-38, -21}}, color = {0, 0, 127}));
  connect(ctrl_PID2.y, aircraft_longi3.u_elev) annotation(
    Line(points = {{61, -70}, {79, -70}}, color = {0, 0, 127}));
  connect(aircraft_longi3.y_q, ctrl_PID2.u_feedback) annotation(
    Line(points = {{101, -74}, {106, -74}, {106, -90}, {42, -90}, {42, -81}}, color = {0, 0, 127}));
  connect(proportional.y, sum11.u[1]) annotation(
    Line(points = {{-59, -70}, {-42, -70}}, color = {0, 0, 127}));
  connect(integrator.y, sum11.u[2]) annotation(
    Line(points = {{-59, -100}, {-52, -100}, {-52, -70}, {-42, -70}}, color = {0, 0, 127}));
  connect(ramp_pitchIntend.y, feedback1.u1) annotation(
    Line(points = {{-139, -70}, {-118, -70}}, color = {0, 0, 127}));
  connect(aircraft_longi3.y_theta, feedback1.u2) annotation(
    Line(points = {{101, -66}, {112, -66}, {112, -150}, {-110, -150}, {-110, -78}}, color = {0, 0, 127}));
  connect(feedback1.y, proportional.u) annotation(
    Line(points = {{-101, -70}, {-82, -70}}, color = {0, 0, 127}));
  connect(feedback1.y, integrator.u) annotation(
    Line(points = {{-101, -70}, {-90, -70}, {-90, -100}, {-82, -100}}, color = {0, 0, 127}));
  connect(derivative1.y, sum11.u[3]) annotation(
    Line(points = {{-59, -130}, {-50, -130}, {-50, -70}, {-42, -70}}, color = {0, 0, 127}));
  connect(feedback1.y, derivative1.u) annotation(
    Line(points = {{-101, -70}, {-92, -70}, {-92, -130}, {-82, -130}}, color = {0, 0, 127}));
  connect(sum11.y, ctrl_PID2.u_ref) annotation(
    Line(points = {{-19, -70}, {39, -70}}, color = {0, 0, 127}));
  connect(ramp_pitchIntend.y, feedback.u1) annotation(
    Line(points = {{-139, -70}, {-134, -70}, {-134, -210}, {-118, -210}}, color = {0, 0, 127}));
  connect(feedback.y, gain.u) annotation(
    Line(points = {{-101, -210}, {-82, -210}}, color = {0, 0, 127}));
  connect(ctrl_PID3.y, aircraft_longi4.u_elev) annotation(
    Line(points = {{81, -210}, {99, -210}}, color = {0, 0, 127}));
  connect(aircraft_longi4.y_q, ctrl_PID3.u_feedback) annotation(
    Line(points = {{121, -214}, {124, -214}, {124, -234}, {62, -234}, {62, -221}}, color = {0, 0, 127}));
  connect(gain.y, sum1.u[1]) annotation(
    Line(points = {{-59, -210}, {-42, -210}}, color = {0, 0, 127}));
  connect(integrator1.y, sum1.u[2]) annotation(
    Line(points = {{-59, -240}, {-50, -240}, {-50, -210}, {-42, -210}}, color = {0, 0, 127}));
  connect(derivative.y, sum1.u[3]) annotation(
    Line(points = {{-59, -270}, {-46, -270}, {-46, -210}, {-42, -210}}, color = {0, 0, 127}));
  connect(feedback.y, integrator1.u) annotation(
    Line(points = {{-101, -210}, {-88, -210}, {-88, -240}, {-82, -240}}, color = {0, 0, 127}));
  connect(feedback.y, derivative.u) annotation(
    Line(points = {{-101, -210}, {-94, -210}, {-94, -270}, {-82, -270}}, color = {0, 0, 127}));
  connect(aircraft_longi4.y_theta, feedback.u2) annotation(
    Line(points = {{121, -206}, {148, -206}, {148, -290}, {-110, -290}, {-110, -218}}, color = {0, 0, 127}));
  connect(sum1.y, feedback2.u1) annotation(
    Line(points = {{-19, -210}, {-8, -210}}, color = {0, 0, 127}));
  connect(aircraft_longi4.y_q, qdot_response.u) annotation(
    Line(points = {{121, -214}, {132, -214}, {132, -270}, {42, -270}}, color = {0, 0, 127}));
  connect(qdot_response.y, feedback2.u2) annotation(
    Line(points = {{19, -270}, {0, -270}, {0, -218}}, color = {0, 0, 127}));
  connect(feedback2.y, ctrl_PID3.u_ref) annotation(
    Line(points = {{9, -210}, {59, -210}}, color = {0, 0, 127}));
protected
  annotation(
    Diagram(coordinateSystem(extent = {{-180, -300}, {160, 100}}), graphics = {Rectangle(origin = {-50, -100}, pattern = LinePattern.Dash, extent = {{-76, 58}, {76, -58}}), Text(origin = {-79, -47}, extent = {{-43, 3}, {43, -3}}, textString = "aviator response&behavior"), Text(origin = {-77, -185}, extent = {{-43, 3}, {43, -3}}, textString = "aviator response&behavior"), Rectangle(origin = {-48, -238}, pattern = LinePattern.Dash, extent = {{-76, 58}, {102, -58}})}),
    Icon,
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst +d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end AircraftLinDyn_longi_00_v03;
