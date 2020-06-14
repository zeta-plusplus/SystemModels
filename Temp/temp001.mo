within SystemModels.Temp;

model temp001
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Sine sine(amplitude = 1, freqHz = 0.1, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Derivative derivative(T = 0.001, k = 1)  annotation(
    Placement(visible = true, transformation(origin = {-30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Der der1 annotation(
    Placement(visible = true, transformation(origin = {-30, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator annotation(
    Placement(visible = true, transformation(origin = {10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1 annotation(
    Placement(visible = true, transformation(origin = {10, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(sine.y, derivative.u) annotation(
    Line(points = {{-59, 30}, {-42, 30}}, color = {0, 0, 127}));
  connect(sine.y, der1.u) annotation(
    Line(points = {{-59, 30}, {-48, 30}, {-48, -10}, {-42, -10}}, color = {0, 0, 127}));
  connect(derivative.y, integrator.u) annotation(
    Line(points = {{-18, 30}, {-2, 30}, {-2, 30}, {-2, 30}}, color = {0, 0, 127}));
  connect(der1.y, integrator1.u) annotation(
    Line(points = {{-19, -10}, {-2, -10}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-6, Interval = 0.1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end temp001;
