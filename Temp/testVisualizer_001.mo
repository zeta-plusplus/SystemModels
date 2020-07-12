within SystemModels.Temp;

model testVisualizer_001
  inner Modelica.Mechanics.MultiBody.World world(g = 9.8 * Modelica.Math.Vectors.length({0, -1, 0}), n = {0, -1, 0}, animateWorld =true, animateGravity = false) annotation(
    Placement(transformation(extent = {{40, -170}, {20, -150}})));
  Modelica.Mechanics.MultiBody.Parts.BodyShape b0(r = {0, 0.351, 0}, shapeType = "modelica://SystemModels/stlData/TIE_fighter_001.stl", r_shape = {0, 0, 0}, lengthDirection = {1, 0, 0}, widthDirection = {0, 1, 0}, length = 0.225, width = 0.3, height = 0.3, color = {0, 0, 255}, r_CM = {0, 0, 0}, m = 1);
  //    shapeType="modelica://Modelica/Resources/Data/Shapes/RobotR3/b0.dxf",
equation
  connect(world.frame_b, b0.frame_a);
  annotation(
    uses(Modelica(version = "3.2.3")),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end testVisualizer_001;
