within SystemModels.VirtualExperiments;

model Ballistics_001
  extends Modelica.Icons.Example;
  //----------
  import units = Modelica.Units.SI;
  //----------
  parameter units.Acceleration g = 9.81;
  parameter units.Velocity Vinit = 5430;
  parameter units.Angle angleLaunch = 45 * Modelica.Constants.pi / 180.0;
  //----------
  units.Position x;
  units.Position y;
  units.Velocity Vx;
  units.Velocity Vy;
  units.Acceleration ax;
  units.Acceleration ay;
  discrete units.Length range;
  discrete units.Time elapTime;
initial equation
  Vx = Vinit * cos(angleLaunch);
  Vy = Vinit * sin(angleLaunch);
equation
  der(x) = Vx;
  der(y) = Vy;
  der(Vx) = ax;
  der(Vy) = ay;
  ax = 0.0;
  ay = -1.0 * g;
  when (y <= 0.0) then
    range = x;
    elapTime=time;
  end when;
  annotation(
    experiment(StartTime = 0, StopTime = 800, Tolerance = 1e-06, Interval = 0.01));
end Ballistics_001;
