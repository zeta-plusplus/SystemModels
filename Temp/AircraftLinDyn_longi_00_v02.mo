within SystemModels.Temp;

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
  Modelica.Blocks.Continuous.TransferFunction pitchDyn2(a = {1, 0.65, 2.15, 0}, b = {-2, -0.6}) annotation(
    Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder elevator2(T = 0.1) annotation(
    Placement(visible = true, transformation(origin = {50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_CmdPitchRate(duration = 1, height = 5, offset = 0, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-150, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(visible = true, transformation(origin = {-110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain proportional(k = -3) annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Der pitchRate2 annotation(
    Placement(visible = true, transformation(origin = {130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator(k = -30) annotation(
    Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Sum sum11(nin = 3) annotation(
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Derivative derivative(T = 0.001, k = -6)  annotation(
    Placement(visible = true, transformation(origin = {-50, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_elev1.y, elevator1.u) annotation(
    Line(points = {{-39, 70}, {-22, 70}}, color = {0, 0, 127}));
  connect(elevator1.y, pitchDyn1.u) annotation(
    Line(points = {{1, 70}, {8, 70}}, color = {0, 0, 127}));
  connect(pitchDyn1.y, pitchRate1.u) annotation(
    Line(points = {{31, 70}, {48, 70}}, color = {0, 0, 127}));
  connect(elevator2.y, pitchDyn2.u) annotation(
    Line(points = {{61, 10}, {78, 10}}, color = {0, 0, 127}));
  connect(feedback1.y, proportional.u) annotation(
    Line(points = {{-101, 10}, {-62, 10}}, color = {0, 0, 127}));
  connect(ramp_CmdPitchRate.y, feedback1.u1) annotation(
    Line(points = {{-139, 10}, {-118, 10}}, color = {0, 0, 127}));
  connect(pitchDyn2.y, pitchRate2.u) annotation(
    Line(points = {{101, 10}, {118, 10}}, color = {0, 0, 127}));
  connect(pitchRate2.y, feedback1.u2) annotation(
    Line(points = {{141, 10}, {168, 10}, {168, -126}, {-110, -126}, {-110, 2}}, color = {0, 0, 127}));
  connect(feedback1.y, integrator.u) annotation(
    Line(points = {{-101, 10}, {-74, 10}, {-74, -30}, {-62, -30}}, color = {0, 0, 127}));
  connect(proportional.y, sum11.u[1]) annotation(
    Line(points = {{-39, 10}, {-2, 10}}, color = {0, 0, 127}));
  connect(integrator.y, sum11.u[2]) annotation(
    Line(points = {{-39, -30}, {-28, -30}, {-28, 10}, {-2, 10}}, color = {0, 0, 127}));
  connect(sum11.y, elevator2.u) annotation(
    Line(points = {{21, 10}, {38, 10}}, color = {0, 0, 127}));
  connect(derivative.y, sum11.u[3]) annotation(
    Line(points = {{-39, -70}, {-20, -70}, {-20, 10}, {-2, 10}}, color = {0, 0, 127}));
  connect(feedback1.y, derivative.u) annotation(
    Line(points = {{-101, 10}, {-88, 10}, {-88, -70}, {-62, -70}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-240, -340}, {240, 100}})),
    Icon,
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end AircraftLinDyn_longi_00_v02;
