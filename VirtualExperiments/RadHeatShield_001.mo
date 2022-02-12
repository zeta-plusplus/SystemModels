within SystemModels.VirtualExperiments;

model RadHeatShield_001
  extends Modelica.Icons.Example;
  //----------
  import SI = Modelica.SIunits;
  //----------
  //redeclare package Medium = Modelica.Media.Air.DryAirNasa
  //----------
  parameter Real e_receptor=0.2;
  parameter Real F12_source_receptor=0.1;
  parameter SI.Area area_receptor = 0.1*0.1;
  parameter SI.Length th_receptor=10*10^(-3);
  parameter SI.ThermalConductivity rambda_receptor = 0.01;
  //-----
  parameter Real e_source_shield = 0.2;
  parameter Real F12_source_shield =0.1;
  parameter SI.Area area_shield = 1.0;
  parameter SI.Length th_shield = 1 * 10 ^ (-3);
  parameter SI.ThermalConductivity rambda_shield = 100.0;
  parameter Real e_shields_receptor=0.2;
  parameter Real F12_shield_receptor = 0.1;
  //----------
  Modelica.Thermal.HeatTransfer.Components.BodyRadiation rad_source_shield_2(Gr = e_source_shield * F12_source_shield * area_shield) annotation(
    Placement(visible = true, transformation(origin = {50, 120}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.BodyRadiation rad_source_receptor1(Gr = e_receptor * F12_source_receptor * area_receptor) annotation(
    Placement(visible = true, transformation(origin = {-130, 120}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T(displayUnit = "K") = 800 + 273.15) annotation(
    Placement(visible = true, transformation(origin = {10, 180}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor cndc_receptor_2(G = rambda_receptor * area_receptor / th_receptor) annotation(
    Placement(visible = true, transformation(origin = {50, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature ReceptorTemperature(T (displayUnit = "K") = 36 + 273.15) annotation(
    Placement(visible = true, transformation(origin = {-20, -230}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor cndc_receptor_1(G = rambda_receptor * area_receptor / th_receptor) annotation(
    Placement(visible = true, transformation(origin = {-130, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Cp_shield_2(C = 1 * 10 ^ (-9) / 2, T(displayUnit = "K")) annotation(
    Placement(visible = true, transformation(origin = {40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Cp_receptor_2(C = 1 * 10 ^ (-6), T(displayUnit = "K")) annotation(
    Placement(visible = true, transformation(origin = {40, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor cndc_shield_2(G = area_shield * rambda_shield / th_shield) annotation(
    Placement(visible = true, transformation(origin = {50, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Cp_receptor_1(C = 1 * 10 ^ (-6), T(displayUnit = "K")) annotation(
    Placement(visible = true, transformation(origin = {-140, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Cp_shield_2_2(C = 1 * 10 ^ (-9) / 2, T(displayUnit = "K")) annotation(
    Placement(visible = true, transformation(origin = {40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.BodyRadiation rad_shield_receptor_2(Gr = e_receptor * F12_shield_receptor * area_receptor) annotation(
    Placement(visible = true, transformation(origin = {50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-75, -210}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-45, 160}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue2(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-105, -70}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue3(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {75, -70}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor1 annotation(
    Placement(visible = true, transformation(origin = {-130, -160}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue6(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-95, -160}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor2 annotation(
    Placement(visible = true, transformation(origin = {50, -160}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue7(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {85, -160}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue10(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {105, 20}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue11(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {105, 60}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor2 annotation(
    Placement(visible = true, transformation(origin = {-120, -90}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor3 annotation(
    Placement(visible = true, transformation(origin = {60, -90}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor annotation(
    Placement(visible = true, transformation(origin = {-40, -210}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor6 annotation(
    Placement(visible = true, transformation(origin = {70, 20}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor7 annotation(
    Placement(visible = true, transformation(origin = {70, 60}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor1 annotation(
    Placement(visible = true, transformation(origin = {-10, 160}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue disp_Gr_rad_source_shield_2(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {83, 118}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue disp_Gr_rad_source_receptor_1(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-97, 118}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue disp_Gr_rad_shield_receptor_2(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {83, -30}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.RelTemperatureSensor relTemperatureSensor annotation(
    Placement(visible = true, transformation(origin = {-100, -8}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue4(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-67, -8}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue5(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {173, 2}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.RelTemperatureSensor relTemperatureSensor1 annotation(
    Placement(visible = true, transformation(origin = {140, 2}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
equation
  disp_Gr_rad_shield_receptor_2.numberPort = rad_shield_receptor_2.Gr;
  disp_Gr_rad_source_shield_2.numberPort = rad_source_shield_2.Gr;
  disp_Gr_rad_source_receptor_1.numberPort = rad_source_receptor1.Gr;
  connect(Cp_shield_2.port, cndc_shield_2.port_b) annotation(
    Line(points = {{50, 60}, {50, 50}}, color = {191, 0, 0}));
  connect(Cp_shield_2.port, rad_source_shield_2.port_b) annotation(
    Line(points = {{50, 60}, {50, 110}}, color = {191, 0, 0}));
  connect(Cp_receptor_2.port, cndc_receptor_2.port_b) annotation(
    Line(points = {{50, -110}, {50, -120}}, color = {191, 0, 0}));
  connect(rad_source_shield_2.port_a, fixedTemperature.port) annotation(
    Line(points = {{50, 130}, {50, 150}, {10, 150}, {10, 170}}, color = {191, 0, 0}));
  connect(Cp_receptor_1.port, cndc_receptor_1.port_b) annotation(
    Line(points = {{-130, -110}, {-130, -120}}, color = {191, 0, 0}));
  connect(fixedTemperature.port, rad_source_receptor1.port_a) annotation(
    Line(points = {{10, 170}, {10, 140}, {-130, 140}, {-130, 130}}, color = {191, 0, 0}));
  connect(cndc_shield_2.port_a, Cp_shield_2_2.port) annotation(
    Line(points = {{50, 30}, {50, 20}}, color = {191, 0, 0}));
  connect(Cp_shield_2_2.port, rad_shield_receptor_2.port_a) annotation(
    Line(points = {{50, 20}, {50, -20}}, color = {191, 0, 0}));
  connect(rad_shield_receptor_2.port_b, Cp_receptor_2.port) annotation(
    Line(points = {{50, -40}, {50, -110}}, color = {191, 0, 0}));
  connect(rad_source_receptor1.port_b, Cp_receptor_1.port) annotation(
    Line(points = {{-130, 110}, {-130, -110}}, color = {191, 0, 0}));
  connect(cndc_receptor_1.port_a, heatFlowSensor1.port_b) annotation(
    Line(points = {{-130, -140}, {-130, -150}}, color = {191, 0, 0}));
  connect(heatFlowSensor1.port_a, ReceptorTemperature.port) annotation(
    Line(points = {{-130, -170}, {-130, -192}, {-20, -192}, {-20, -220}}, color = {191, 0, 0}));
  connect(heatFlowSensor1.Q_flow, realValue6.numberPort) annotation(
    Line(points = {{-120, -160}, {-112, -160}}, color = {0, 0, 127}));
  connect(heatFlowSensor2.port_b, cndc_receptor_2.port_a) annotation(
    Line(points = {{50, -150}, {50, -140}}, color = {191, 0, 0}));
  connect(heatFlowSensor2.port_a, ReceptorTemperature.port) annotation(
    Line(points = {{50, -170}, {50, -195}, {-20, -195}, {-20, -220}}, color = {191, 0, 0}));
  connect(heatFlowSensor2.Q_flow, realValue7.numberPort) annotation(
    Line(points = {{60, -160}, {68, -160}}, color = {0, 0, 127}));
  connect(Cp_receptor_1.port, temperatureSensor2.port) annotation(
    Line(points = {{-130, -110}, {-120, -110}, {-120, -100}}, color = {191, 0, 0}));
  connect(temperatureSensor2.T, realValue2.numberPort) annotation(
    Line(points = {{-120, -80}, {-120, -75}, {-122, -75}, {-122, -70}}, color = {0, 0, 127}));
  connect(Cp_receptor_2.port, temperatureSensor3.port) annotation(
    Line(points = {{50, -110}, {60, -110}, {60, -100}}, color = {191, 0, 0}));
  connect(temperatureSensor3.T, realValue3.numberPort) annotation(
    Line(points = {{60, -80}, {58, -80}, {58, -70}}, color = {0, 0, 127}));
  connect(realValue.numberPort, temperatureSensor.T) annotation(
    Line(points = {{-58, -210}, {-50, -210}}, color = {0, 0, 127}));
  connect(temperatureSensor.port, ReceptorTemperature.port) annotation(
    Line(points = {{-30, -210}, {-20, -210}, {-20, -220}}, color = {191, 0, 0}));
  connect(Cp_shield_2_2.port, temperatureSensor6.port) annotation(
    Line(points = {{50, 20}, {60, 20}}, color = {191, 0, 0}));
  connect(temperatureSensor6.T, realValue10.numberPort) annotation(
    Line(points = {{80, 20}, {88, 20}}, color = {0, 0, 127}));
  connect(temperatureSensor7.T, realValue11.numberPort) annotation(
    Line(points = {{80, 60}, {88, 60}}, color = {0, 0, 127}));
  connect(Cp_shield_2.port, temperatureSensor7.port) annotation(
    Line(points = {{50, 60}, {60, 60}}, color = {191, 0, 0}));
  connect(realValue1.numberPort, temperatureSensor1.T) annotation(
    Line(points = {{-28, 160}, {-20, 160}}, color = {0, 0, 127}));
  connect(temperatureSensor1.port, fixedTemperature.port) annotation(
    Line(points = {{0, 160}, {10, 160}, {10, 170}}, color = {191, 0, 0}));
  connect(rad_source_receptor1.port_a, relTemperatureSensor.port_a) annotation(
    Line(points = {{-130, 130}, {-100, 130}, {-100, 2}}, color = {191, 0, 0}));
  connect(relTemperatureSensor.T_rel, realValue4.numberPort) annotation(
    Line(points = {{-91, -8}, {-85, -8}}, color = {0, 0, 127}));
  connect(rad_source_shield_2.port_a, relTemperatureSensor1.port_a) annotation(
    Line(points = {{50, 130}, {140, 130}, {140, 12}}, color = {191, 0, 0}));
  connect(Cp_receptor_2.port, relTemperatureSensor1.port_b) annotation(
    Line(points = {{50, -110}, {140, -110}, {140, -8}}, color = {191, 0, 0}));
  connect(relTemperatureSensor1.T_rel, realValue5.numberPort) annotation(
    Line(points = {{150, 2}, {156, 2}}, color = {0, 0, 127}));
  connect(Cp_receptor_1.port, relTemperatureSensor.port_b) annotation(
    Line(points = {{-130, -110}, {-100, -110}, {-100, -18}}, color = {191, 0, 0}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -260}, {200, 220}}), graphics = {Text(origin = {-4, 39}, extent = {{-20, 9}, {20, -9}}, textString = "heat shield"), Text(origin = {-140, 65}, extent = {{-48, 15}, {48, -15}}, textString = "radiation heat directory
goes into object")}),
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}})),
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1));
end RadHeatShield_001;
