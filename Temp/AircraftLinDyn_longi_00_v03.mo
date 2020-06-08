within SystemModels.Temp;

model AircraftLinDyn_longi_00_v03
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Ramp ramp_elev1(duration = 1, height = -1, offset = 0, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-50, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_CmdPitchRate(duration = 1, height = 5, offset = 0, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-150, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(visible = true, transformation(origin = {-110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain proportional(k = -7) annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator(k = -30) annotation(
    Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Sum sum11(nin = 3) annotation(
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Derivative derivative(T = 0.001, k = -8)  annotation(
    Placement(visible = true, transformation(origin = {-50, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

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
        Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {5, 108}, extent = {{-105, 12}, {95, -8}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));
    
    end aircraft_longi;
    extends Modelica.Icons.Package;
  end subcomponents;

  SystemModels.Temp.AircraftLinDyn_longi_00_v03.subcomponents.aircraft_longi aircraft_longi annotation(
    Placement(visible = true, transformation(origin = {50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SystemModels.Temp.AircraftLinDyn_longi_00_v03.subcomponents.aircraft_longi aircraft_longi1 annotation(
    Placement(visible = true, transformation(origin = {-10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(feedback1.y, proportional.u) annotation(
    Line(points = {{-101, 10}, {-62, 10}}, color = {0, 0, 127}));
  connect(ramp_CmdPitchRate.y, feedback1.u1) annotation(
    Line(points = {{-139, 10}, {-118, 10}}, color = {0, 0, 127}));
  connect(feedback1.y, integrator.u) annotation(
    Line(points = {{-101, 10}, {-74, 10}, {-74, -30}, {-62, -30}}, color = {0, 0, 127}));
  connect(proportional.y, sum11.u[1]) annotation(
    Line(points = {{-39, 10}, {-2, 10}}, color = {0, 0, 127}));
  connect(integrator.y, sum11.u[2]) annotation(
    Line(points = {{-39, -30}, {-28, -30}, {-28, 10}, {-2, 10}}, color = {0, 0, 127}));
  connect(derivative.y, sum11.u[3]) annotation(
    Line(points = {{-39, -70}, {-20, -70}, {-20, 10}, {-2, 10}}, color = {0, 0, 127}));
  connect(feedback1.y, derivative.u) annotation(
    Line(points = {{-101, 10}, {-88, 10}, {-88, -70}, {-62, -70}}, color = {0, 0, 127}));
  connect(sum11.y, aircraft_longi.u_elev) annotation(
    Line(points = {{22, 10}, {38, 10}, {38, 10}, {38, 10}}, color = {0, 0, 127}));
  connect(aircraft_longi.y_q, feedback1.u2) annotation(
    Line(points = {{62, 6}, {70, 6}, {70, -110}, {-110, -110}, {-110, 2}, {-110, 2}}, color = {0, 0, 127}));
  connect(ramp_elev1.y, aircraft_longi1.u_elev) annotation(
    Line(points = {{-38, 70}, {-22, 70}, {-22, 70}, {-20, 70}}, color = {0, 0, 127}));
protected
  annotation(
    Diagram(coordinateSystem(extent = {{-240, -340}, {240, 100}})),
    Icon,
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end AircraftLinDyn_longi_00_v03;
