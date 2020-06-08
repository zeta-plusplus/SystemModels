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
    Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_refPitchRate(duration = 1, height = 1, offset = 0, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SystemModels.Temp.AircraftLinDyn_longi_00_v03.subcomponents.ctrl_PID ctrl_PID1 annotation(
    Placement(visible = true, transformation(origin = {-30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SystemModels.Temp.AircraftLinDyn_longi_00_v03.subcomponents.aircraft_longi aircraft_longi2 annotation(
    Placement(visible = true, transformation(origin = {10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
    Line(points = {{-58, -30}, {-42, -30}, {-42, -30}, {-40, -30}}, color = {0, 0, 127}));
  connect(ctrl_PID1.y, aircraft_longi2.u_elev) annotation(
    Line(points = {{-18, -30}, {-2, -30}, {-2, -30}, {0, -30}}, color = {0, 0, 127}));
  connect(aircraft_longi2.y_q, ctrl_PID1.u_feedback) annotation(
    Line(points = {{22, -34}, {28, -34}, {28, -52}, {-38, -52}, {-38, -40}, {-38, -40}}, color = {0, 0, 127}));
protected
  annotation(
    Diagram(coordinateSystem(extent = {{-240, -120}, {240, 100}})),
    Icon,
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end AircraftLinDyn_longi_00_v03;
