within SystemModels.VirtualExperiments;

model AircraftLinDyn_longi_01_v01
  extends Modelica.Icons.Example;
  Modelica.Blocks.Continuous.StateSpace aircraftDyn annotation(
    Placement(visible = true, transformation(origin = {30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder actElev(T = 0.1, k = 1)  annotation(
    Placement(visible = true, transformation(origin = {-10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.PID pitchCtrl_PID annotation(
    Placement(visible = true, transformation(origin = {-46, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(visible = true, transformation(origin = {-80, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const annotation(
    Placement(visible = true, transformation(origin = {-108, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(feedback1.u2, aircraftDyn.y[4]) annotation(
    Line(points = {{-80, 22}, {-80, 22}, {-80, -10}, {50, -10}, {50, 30}, {42, 30}, {42, 30}}, color = {0, 0, 127}));
  connect(feedback1.y, pitchCtrl_PID.u) annotation(
    Line(points = {{-70, 30}, {-58, 30}, {-58, 30}, {-58, 30}}, color = {0, 0, 127}));
  connect(pitchCtrl_PID.y, actElev.u) annotation(
    Line(points = {{-34, 30}, {-22, 30}, {-22, 30}, {-22, 30}}, color = {0, 0, 127}));
  connect(actElev.y, aircraftDyn.u[2]) annotation(
    Line(points = {{1, 30}, {18, 30}}, color = {0, 0, 127}));
end AircraftLinDyn_longi_01_v01;
