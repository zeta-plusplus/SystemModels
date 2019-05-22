within SystemModels.Practice;

model fluidSupplySystem001
  extends Modelica.Icons.Example;
  //----------
  replaceable package liquid1 = Modelica.Media.Water.StandardWaterOnePhase;
  // redeclare package Medium = liquid1
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = liquid1, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-30, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.HydroThermal.Components.PumpConstQflow_ideal pumpConstQflow_ideal1(redeclare package Medium = liquid1) annotation(
    Placement(visible = true, transformation(origin = {-20, 10}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = liquid1, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {-30, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp1 annotation(
    Placement(visible = true, transformation(origin = {-90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = liquid1) annotation(
    Placement(visible = true, transformation(origin = {30, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = liquid1) annotation(
    Placement(visible = true, transformation(origin = {50, 40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe2(redeclare package Medium = liquid1) annotation(
    Placement(visible = true, transformation(origin = {120, 40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Valves.ValveLinear valveLinear1(redeclare package Medium = liquid1) annotation(
    Placement(visible = true, transformation(origin = {50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Valves.ValveLinear valveLinear2(redeclare package Medium = liquid1) annotation(
    Placement(visible = true, transformation(origin = {120, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = liquid1, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {40, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volume2(redeclare package Medium = liquid1, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {110, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Pipes.StaticPipe pipe3(redeclare package Medium = liquid1) annotation(
    Placement(visible = true, transformation(origin = {50, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe4(redeclare package Medium = liquid1) annotation(
    Placement(visible = true, transformation(origin = {120, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = liquid1, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {50, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp2 annotation(
    Placement(visible = true, transformation(origin = {80, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp3 annotation(
    Placement(visible = true, transformation(origin = {150, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(pipe2.port_b, valveLinear2.port_a) annotation(
    Line(points = {{120, 30}, {120, 30}, {120, 20}, {120, 20}}, color = {0, 127, 255}));
  connect(valveLinear2.opening, ramp3.y) annotation(
    Line(points = {{128, 10}, {140, 10}, {140, 10}, {140, 10}}, color = {0, 0, 127}));
  connect(valveLinear1.opening, ramp2.y) annotation(
    Line(points = {{58, 10}, {68, 10}, {68, 10}, {70, 10}}, color = {0, 0, 127}));
  connect(boundary1.ports[2], pipe4.port_b) annotation(
    Line(points = {{50, -70}, {50, -70}, {50, -64}, {120, -64}, {120, -60}, {120, -60}}, color = {0, 127, 255}));
  connect(pipe3.port_b, boundary1.ports[1]) annotation(
    Line(points = {{50, -60}, {50, -60}, {50, -70}, {50, -70}}, color = {0, 127, 255}));
  connect(pipe.port_b, pipe2.port_a) annotation(
    Line(points = {{40, 70}, {120, 70}, {120, 50}}, color = {0, 127, 255}));
  connect(valveLinear2.port_b, volume2.ports[1]) annotation(
    Line(points = {{120, 0}, {120, 0}, {120, -20}, {120, -20}}, color = {0, 127, 255}));
  connect(volume2.ports[2], pipe4.port_a) annotation(
    Line(points = {{120, -20}, {120, -20}, {120, -40}, {120, -40}}, color = {0, 127, 255}));
  connect(volume1.ports[2], pipe3.port_a) annotation(
    Line(points = {{50, -20}, {50, -20}, {50, -40}, {50, -40}}, color = {0, 127, 255}));
  connect(valveLinear1.port_b, volume1.ports[1]) annotation(
    Line(points = {{50, 0}, {50, 0}, {50, -16}, {50, -16}, {50, -20}}, color = {0, 127, 255}));
  connect(pipe1.port_b, valveLinear1.port_a) annotation(
    Line(points = {{50, 30}, {50, 30}, {50, 20}, {50, 20}}, color = {0, 127, 255}));
  connect(pipe.port_b, pipe1.port_a) annotation(
    Line(points = {{40, 70}, {50, 70}, {50, 52}, {50, 52}, {50, 50}}, color = {0, 127, 255}));
  connect(volume.ports[2], pipe.port_a) annotation(
    Line(points = {{-20, 40}, {-20, 70}, {20, 70}}, color = {0, 127, 255}));
  connect(pumpConstQflow_ideal1.port_2, volume.ports[1]) annotation(
    Line(points = {{-20, 20}, {-20, 20}, {-20, 40}, {-20, 40}}, color = {0, 127, 255}));
  connect(boundary.ports[1], pumpConstQflow_ideal1.port_1) annotation(
    Line(points = {{-20, -20}, {-20, -20}, {-20, 0}, {-20, 0}}, color = {0, 127, 255}));
  connect(speed1.flange, pumpConstQflow_ideal1.flange_1) annotation(
    Line(points = {{-40, 10}, {-30, 10}, {-30, 10}, {-30, 10}}));
  connect(ramp1.y, speed1.w_ref) annotation(
    Line(points = {{-78, 10}, {-62, 10}, {-62, 10}, {-62, 10}}, color = {0, 0, 127}));
end fluidSupplySystem001;
