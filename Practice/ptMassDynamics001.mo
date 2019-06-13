within SystemModels.Practice;

model ptMassDynamics001
  "Two point masses in a point gravity field (rotation of bodies is neglected)"
  extends Modelica.Icons.Example;
  inner Modelica.Mechanics.MultiBody.World world(
    
    gravitySphereDiameter=0.1,
    gravityType=Modelica.Mechanics.MultiBody.Types.GravityTypes.UniformGravity,mue=1)
                               annotation (Placement(visible = true, transformation(extent = {{-100, 80}, {-80, 100}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.PointMass body1(
    m=1,
    r_0(fixed = false),
    sphereDiameter=0.1,
    v_0(fixed = false))
    annotation (Placement(visible = true, transformation(extent = {{50, -30}, {70, -10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Body body2(angles_start = {0, 0, -0.523599},m = 1, r_0(start = {0, 10, 0}), r_CM = {0, 0, 0}, v_0(start = {0, 0.0, 0}), w_0_start = {0, 0, 0})  annotation(
    Placement(visible = true, transformation(origin = {44, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Forces.WorldForce force(resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameB.frame_b)  annotation(
    Placement(visible = true, transformation(origin = {10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 0)  annotation(
    Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = 0) annotation(
    Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 0, height = -50, offset = 50, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-70, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp1.y, force.force[2]) annotation(
    Line(points = {{-59, 20}, {-55.5, 20}, {-55.5, 20}, {-52, 20}, {-52, 50}, {-2, 50}}, color = {0, 0, 127}));
  connect(const1.y, force.force[3]) annotation(
    Line(points = {{-59, -10}, {-53.5, -10}, {-53.5, -10}, {-48, -10}, {-48, 50}, {-25, 50}, {-25, 50}, {-2, 50}}, color = {0, 0, 127}));
  connect(const.y, force.force[1]) annotation(
    Line(points = {{-59, 50}, {-1, 50}, {-1, 50}, {-3, 50}, {-3, 50}, {-3, 50}}, color = {0, 0, 127}));
  connect(force.frame_b, body2.frame_a) annotation(
    Line(points = {{20, 50}, {34, 50}}, color = {95, 95, 95}));
  annotation (
    experiment(StopTime = 100, StartTime = 0, Tolerance = 1e-06, Interval = 0.2),
    Documentation(info="<html>
<p>
This model demonstrates the usage of model Parts.PointMass in a
point gravity field. The PointMass model has the feature that
that rotation is not taken into account and can therefore also not be
calculated. This example demonstrates two cases where this does not matter:
If a PointMass is not connected (body1, body2), the orientation object in
these point masses is set to a unit rotation.
If a PointMass is connected by a line force element, such as
the used Forces.LineForceWithMass component, then the orientation object
is set to a unit rotation within the line force element.
These are the two cases where the rotation is automatically set to
a default value, when the physical system does not provide the equations.
</p>

<IMG src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Elementary/PointGravityWithPointMasses.png\">
</html>"),
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end ptMassDynamics001;
