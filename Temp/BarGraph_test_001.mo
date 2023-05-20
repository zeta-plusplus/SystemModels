within SystemModels.Temp;

model BarGraph_test_001

SystemModels.Temp.BarGraph_v001 barGraph_v001 annotation(
    Placement(visible = true, transformation(origin = {22, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Sources.Sine sine(f = 4)  annotation(
    Placement(visible = true, transformation(origin = {-54, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Math.Gain gain(k = 25)  annotation(
    Placement(visible = true, transformation(origin = {-14, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Interaction.Show.RealValue realValue annotation(
    Placement(visible = true, transformation(origin = {28, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Interaction.Show.BooleanValue booleanValue annotation(
    Placement(visible = true, transformation(origin = {56, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Logical.GreaterThreshold greaterThreshold annotation(
    Placement(visible = true, transformation(origin = {18, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(gain.y, barGraph_v001.u) annotation(
    Line(points = {{-2, 0}, {16, 0}}, color = {0, 0, 127}));
connect(sine.y, gain.u) annotation(
    Line(points = {{-42, 0}, {-26, 0}}, color = {0, 0, 127}));
connect(realValue.numberPort, gain.y) annotation(
    Line(points = {{16, 24}, {8, 24}, {8, 0}, {-2, 0}}, color = {0, 0, 127}));
connect(greaterThreshold.y, booleanValue.activePort) annotation(
    Line(points = {{30, -36}, {44, -36}}, color = {255, 0, 255}));
connect(greaterThreshold.u, gain.y) annotation(
    Line(points = {{6, -36}, {-2, -36}, {-2, -12}, {10, -12}, {10, 0}, {-2, 0}}, color = {0, 0, 127}));


end BarGraph_test_001;
