within SystemModels.VirtualExperiments;

model rateLimitter_01_v00
  extends Modelica.Icons.Example;
  Modelica.Blocks.Nonlinear.Limiter limiter(limitsAtInit = true, uMax = 30, uMin = -30) annotation(
    Placement(visible = true, transformation(origin = { 0, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator annotation(
    Placement(visible = true, transformation(origin = {40, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Derivative derivative(T = 0.001, k = 1) annotation(
    Placement(visible = true, transformation(origin = {-40, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine(amplitude = 2, freqHz = 1)  annotation(
    Placement(visible = true, transformation(origin = {-80, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(limiter.y, integrator.u) annotation(
    Line(points = {{11, 30}, {28, 30}}, color = {0, 0, 127}));
  connect(derivative.y, limiter.u) annotation(
    Line(points = {{-29, 30}, {-12, 30}}, color = {0, 0, 127}));
  connect(sine.y, derivative.u) annotation(
    Line(points = {{-68, 30}, {-52, 30}, {-52, 30}, {-52, 30}}, color = {0, 0, 127}));
annotation(
    experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-6, Interval = 0.04),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end rateLimitter_01_v00;
