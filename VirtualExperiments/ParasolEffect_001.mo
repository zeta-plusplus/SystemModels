within SystemModels.VirtualExperiments;

model ParasolEffect_001
  extends Modelica.Icons.Example;
  //----------
  import SI = Modelica.SIunits;
  //----------
  //redeclare package Medium = Modelica.Media.Air.DryAirNasa
  //----------
  parameter Real hcnv_skin = 30;
  parameter Real e_skin=0.2;
  parameter Real F12_source_skin=0.1;
  parameter SI.Area area_skin = 0.1*0.1;
  parameter SI.Length th_skin=10*10^(-3);
  parameter SI.ThermalConductivity rambda_skin = 0.01;
  //-----
  parameter Real e_parasol = 0.2;
  parameter Real F12_source_parasol = 0.1;
  parameter Real sigmaRad = 5.67 * 10 ^ (-8);
  parameter SI.Area area_parasol = 1.0;
  parameter SI.Length th_parasol = 1 * 10 ^ (-3);
  parameter SI.ThermalConductivity rambda_parasol = 0.01;
  parameter Real F12_parasol_skin = 0.2;
  parameter Real hcnv_parasol_outer = 30;
  parameter Real hcnv_parasol_inner = 20;
  //-----
  //----------
  Modelica.Thermal.HeatTransfer.Components.BodyRadiation rad_source_parasol_2(Gr = e_parasol * F12_source_parasol * area_parasol) annotation(
    Placement(visible = true, transformation(origin = {-130, 130}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.BodyRadiation rad_source_skin1(Gr = e_skin * F12_source_skin * area_skin) annotation(
    Placement(visible = true, transformation(origin = {-220, 130}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T(displayUnit = "K") = 400 + 273.15) annotation(
    Placement(visible = true, transformation(origin = {10, 190}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor cndc_skin_2(G = rambda_skin * area_skin / th_skin) annotation(
    Placement(visible = true, transformation(origin = {-130, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature BodyTemperature(T (displayUnit = "K") = 36 + 273.15) annotation(
    Placement(visible = true, transformation(origin = {-20, -230}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor cndc_skin_1(G = rambda_skin * area_skin / th_skin) annotation(
    Placement(visible = true, transformation(origin = {-220, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Cp_parasol_2(C = 1 * 10 ^ (-9) / 2, T(displayUnit = "K")) annotation(
    Placement(visible = true, transformation(origin = {-140, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Cp_skin_2(C = 1 * 10 ^ (-6), T(displayUnit = "K")) annotation(
    Placement(visible = true, transformation(origin = {-140, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor cndc_parasolFabric_2(G = area_parasol * rambda_parasol / th_parasol) annotation(
    Placement(visible = true, transformation(origin = {-130, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Cp_skin_1(C = 1 * 10 ^ (-6), T(displayUnit = "K")) annotation(
    Placement(visible = true, transformation(origin = {-230, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Cp_parasol_2_2(C = 1 * 10 ^ (-9) / 2, T(displayUnit = "K")) annotation(
    Placement(visible = true, transformation(origin = {-140, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.BodyRadiation rad_parasol_skin2(Gr = e_skin * F12_parasol_skin * area_skin) annotation(
    Placement(visible = true, transformation(origin = {-130, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.BodyRadiation rad_source_skin_3(Gr = e_skin * F12_source_skin * area_skin) annotation(
    Placement(visible = true, transformation(origin = {40, 130}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Cp_skin_3(C = 1 * 10 ^ (-6), T(displayUnit = "K")) annotation(
    Placement(visible = true, transformation(origin = {30, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor cndc_skin_3(G = rambda_skin * area_skin / th_skin) annotation(
    Placement(visible = true, transformation(origin = {40, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection cnvc_skin_3 annotation(
    Placement(visible = true, transformation(origin = {60, -90}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_h_skin(duration = 10, height = 0, offset = hcnv_skin * area_skin, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {150, -230}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.BodyRadiation rad_source_skin_4(Gr = e_parasol * F12_source_parasol * area_parasol) annotation(
    Placement(visible = true, transformation(origin = {150, 130}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.Convection cnvc_skin_4 annotation(
    Placement(visible = true, transformation(origin = {180, -90}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Cp_skin_4(C = 1 * 10 ^ (-6), T(displayUnit = "K")) annotation(
    Placement(visible = true, transformation(origin = {140, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor cndc_skin_4(G = rambda_skin * area_skin / th_skin) annotation(
    Placement(visible = true, transformation(origin = {150, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Cp_parasol_4_2(C = 1 * 10 ^ (-9) / 2, T(displayUnit = "K")) annotation(
    Placement(visible = true, transformation(origin = {140, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor cndc_parasolFabric_4(G = area_parasol * rambda_parasol / th_parasol) annotation(
    Placement(visible = true, transformation(origin = {150, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Cp_parasol_4(C = 1 * 10 ^ (-9) / 2, T(displayUnit = "K")) annotation(
    Placement(visible = true, transformation(origin = {140, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.BodyRadiation rad_parasol_skin_4(Gr = e_skin * F12_parasol_skin * area_skin) annotation(
    Placement(visible = true, transformation(origin = {150, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.Convection cnvc_parasol_inner_4 annotation(
    Placement(visible = true, transformation(origin = {180, -10}, extent = {{10, 10}, {-10, -10}}, rotation = 90)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 210}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature AmbientAirTemperature(T = 15 + 273.15) annotation(
    Placement(visible = true, transformation(origin = {290, -60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection annotation(
    Placement(visible = true, transformation(origin = {170, 90}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_h_parasol_outer(duration = 10, height = 0, offset = hcnv_parasol_outer * area_parasol, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {260, 170}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-65, -200}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-45, 170}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue2(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-195, -70}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue3(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-105, -70}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue4(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {4, -70}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue5(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {114, -70}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor1 annotation(
    Placement(visible = true, transformation(origin = {-220, -160}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue6(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-185, -160}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor2 annotation(
    Placement(visible = true, transformation(origin = {-130, -160}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue7(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-95, -160}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor3 annotation(
    Placement(visible = true, transformation(origin = {40, -160}, extent = {{10, 10}, {-10, -10}}, rotation = 90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue8(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {5, -160}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor4 annotation(
    Placement(visible = true, transformation(origin = {150, -160}, extent = {{10, 10}, {-10, -10}}, rotation = 90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue9(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {115, -160}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue10(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-75, 20}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue11(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-75, 60}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue12(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {225, 20}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue13(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {225, 60}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor2 annotation(
    Placement(visible = true, transformation(origin = {-210, -90}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor3 annotation(
    Placement(visible = true, transformation(origin = {-120, -90}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor4 annotation(
    Placement(visible = true, transformation(origin = {30, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor5 annotation(
    Placement(visible = true, transformation(origin = {140, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor annotation(
    Placement(visible = true, transformation(origin = {-30, -200}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor6 annotation(
    Placement(visible = true, transformation(origin = {-110, 20}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor7 annotation(
    Placement(visible = true, transformation(origin = {-110, 60}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor8 annotation(
    Placement(visible = true, transformation(origin = {190, 20}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor9 annotation(
    Placement(visible = true, transformation(origin = {190, 60}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor1 annotation(
    Placement(visible = true, transformation(origin = {-10, 170}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor10 annotation(
    Placement(visible = true, transformation(origin = {268, -88}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue14(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {285, -112}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue disp_Gr_rad_source_parasol_2(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-97, 128}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue disp_Gr_rad_source_skin1(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-187, 128}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue disp_Gr_rad_parasol_skin2(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-97, -30}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue disp_Gr_rad_source_skin_3(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {73, 128}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue disp_Gr_rad_source_skin_4(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {183, 130}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue disp_Gr_rad_parasol_skin_4(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {115, -30}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
equation
  disp_Gr_rad_parasol_skin2.numberPort = rad_parasol_skin2.Gr;
  disp_Gr_rad_source_parasol_2.numberPort = rad_source_parasol_2.Gr;
  disp_Gr_rad_source_skin1.numberPort = rad_source_skin1.Gr;
  disp_Gr_rad_parasol_skin_4.numberPort= rad_parasol_skin_4.Gr;
  disp_Gr_rad_source_skin_3.numberPort= rad_source_skin_3.Gr;
  disp_Gr_rad_source_skin_4.numberPort= rad_source_skin_4.Gr;
  //-----
  connect(Cp_parasol_2.port, cndc_parasolFabric_2.port_b) annotation(
    Line(points = {{-130, 60}, {-130, 50}}, color = {191, 0, 0}));
  connect(Cp_parasol_2.port, rad_source_parasol_2.port_b) annotation(
    Line(points = {{-130, 60}, {-130, 120}}, color = {191, 0, 0}));
  connect(Cp_skin_2.port, cndc_skin_2.port_b) annotation(
    Line(points = {{-130, -110}, {-130, -120}}, color = {191, 0, 0}));
  connect(rad_source_parasol_2.port_a, fixedTemperature.port) annotation(
    Line(points = {{-130, 140}, {-130, 150}, {10, 150}, {10, 180}}, color = {191, 0, 0}));
  connect(Cp_skin_1.port, cndc_skin_1.port_b) annotation(
    Line(points = {{-220, -110}, {-220, -120}}, color = {191, 0, 0}));
  connect(fixedTemperature.port, rad_source_skin1.port_a) annotation(
    Line(points = {{10, 180}, {10, 150}, {-220, 150}, {-220, 140}}, color = {191, 0, 0}));
  connect(cndc_parasolFabric_2.port_a, Cp_parasol_2_2.port) annotation(
    Line(points = {{-130, 30}, {-130, 20}}, color = {191, 0, 0}));
  connect(Cp_parasol_2_2.port, rad_parasol_skin2.port_a) annotation(
    Line(points = {{-130, 20}, {-130, -20}}, color = {191, 0, 0}));
  connect(rad_parasol_skin2.port_b, Cp_skin_2.port) annotation(
    Line(points = {{-130, -40}, {-130, -110}}, color = {191, 0, 0}));
  connect(fixedTemperature.port, rad_source_skin_3.port_a) annotation(
    Line(points = {{10, 180}, {10, 160}, {40, 160}, {40, 140}}, color = {191, 0, 0}));
  connect(Cp_skin_3.port, cndc_skin_3.port_b) annotation(
    Line(points = {{40, -110}, {40, -120}}, color = {191, 0, 0}));
  connect(Cp_skin_3.port, cnvc_skin_3.solid) annotation(
    Line(points = {{40, -110}, {40, -106}, {60, -106}, {60, -100}}, color = {191, 0, 0}));
  connect(rad_source_skin_3.port_b, Cp_skin_3.port) annotation(
    Line(points = {{40, 120}, {40, -110}}, color = {191, 0, 0}));
  connect(cnvc_skin_3.Gc, ramp_h_skin.y) annotation(
    Line(points = {{70, -90}, {70, -218.5}, {150, -218.5}, {150, -219}}, color = {0, 0, 127}));
  connect(cndc_skin_4.port_b, Cp_skin_4.port) annotation(
    Line(points = {{150, -120}, {150, -110}}, color = {191, 0, 0}));
  connect(rad_parasol_skin_4.port_b, Cp_skin_4.port) annotation(
    Line(points = {{150, -40}, {150, -110}}, color = {191, 0, 0}));
  connect(Cp_parasol_4.port, cndc_parasolFabric_4.port_b) annotation(
    Line(points = {{150, 60}, {150, 50}}, color = {191, 0, 0}));
  connect(cndc_parasolFabric_4.port_a, Cp_parasol_4_2.port) annotation(
    Line(points = {{150, 30}, {150, 20}}, color = {191, 0, 0}));
  connect(rad_source_skin_4.port_b, Cp_parasol_4.port) annotation(
    Line(points = {{150, 120}, {150, 60}}, color = {191, 0, 0}));
  connect(Cp_parasol_4_2.port, rad_parasol_skin_4.port_a) annotation(
    Line(points = {{150, 20}, {150, -20}}, color = {191, 0, 0}));
  connect(Cp_skin_4.port, cnvc_skin_4.solid) annotation(
    Line(points = {{150, -110}, {150, -106}, {180, -106}, {180, -100}}, color = {191, 0, 0}));
  connect(fixedTemperature.port, rad_source_skin_4.port_a) annotation(
    Line(points = {{10, 180}, {10, 154}, {150, 154}, {150, 140}}, color = {191, 0, 0}));
  connect(ramp_h_skin.y, cnvc_skin_4.Gc) annotation(
    Line(points = {{150, -219}, {190, -219}, {190, -90}}, color = {0, 0, 127}));
  connect(AmbientAirTemperature.port, cnvc_skin_4.fluid) annotation(
    Line(points = {{280, -60}, {180, -60}, {180, -80}}, color = {191, 0, 0}));
  connect(AmbientAirTemperature.port, convection.fluid) annotation(
    Line(points = {{280, -60}, {280, 100}, {170, 100}}, color = {191, 0, 0}));
  connect(ramp_h_parasol_outer.y, convection.Gc) annotation(
    Line(points = {{260, 159}, {260, 90}, {180, 90}}, color = {0, 0, 127}));
  connect(rad_source_skin1.port_b, Cp_skin_1.port) annotation(
    Line(points = {{-220, 120}, {-220, -110}}, color = {191, 0, 0}));
  connect(heatFlowSensor1.Q_flow, realValue6.numberPort) annotation(
    Line(points = {{-210, -160}, {-202, -160}}, color = {0, 0, 127}));
  connect(heatFlowSensor2.Q_flow, realValue7.numberPort) annotation(
    Line(points = {{-120, -160}, {-112, -160}}, color = {0, 0, 127}));
  connect(realValue8.numberPort, heatFlowSensor3.Q_flow) annotation(
    Line(points = {{22.25, -160}, {30, -160}}, color = {0, 0, 127}));
  connect(realValue9.numberPort, heatFlowSensor4.Q_flow) annotation(
    Line(points = {{132.25, -160}, {140, -160}}, color = {0, 0, 127}));
  connect(Cp_parasol_4.port, convection.solid) annotation(
    Line(points = {{150, 60}, {150, 66}, {170, 66}, {170, 80}}, color = {191, 0, 0}));
  connect(Cp_parasol_4_2.port, cnvc_parasol_inner_4.solid) annotation(
    Line(points = {{150, 20}, {150, 16}, {180, 16}, {180, 0}}, color = {191, 0, 0}));
  connect(Cp_skin_1.port, temperatureSensor2.port) annotation(
    Line(points = {{-220, -110}, {-210, -110}, {-210, -100}}, color = {191, 0, 0}));
  connect(temperatureSensor2.T, realValue2.numberPort) annotation(
    Line(points = {{-210, -80}, {-210, -75}, {-212, -75}, {-212, -70}}, color = {0, 0, 127}));
  connect(Cp_skin_2.port, temperatureSensor3.port) annotation(
    Line(points = {{-130, -110}, {-120, -110}, {-120, -100}}, color = {191, 0, 0}));
  connect(temperatureSensor3.T, realValue3.numberPort) annotation(
    Line(points = {{-120, -80}, {-122, -80}, {-122, -70}}, color = {0, 0, 127}));
  connect(temperatureSensor4.port, Cp_skin_3.port) annotation(
    Line(points = {{30, -90}, {40, -90}, {40, -110}}, color = {191, 0, 0}));
  connect(realValue4.numberPort, temperatureSensor4.T) annotation(
    Line(points = {{21.25, -70}, {29.25, -70}}, color = {0, 0, 127}));
  connect(realValue5.numberPort, temperatureSensor5.T) annotation(
    Line(points = {{131.25, -70}, {139.25, -70}}, color = {0, 0, 127}));
  connect(temperatureSensor5.port, Cp_skin_4.port) annotation(
    Line(points = {{140, -90}, {150, -90}, {150, -110}}, color = {191, 0, 0}));
  connect(realValue.numberPort, temperatureSensor.T) annotation(
    Line(points = {{-47.75, -200}, {-39.75, -200}}, color = {0, 0, 127}));
  connect(temperatureSensor.port, BodyTemperature.port) annotation(
    Line(points = {{-20, -200}, {-20, -220}}, color = {191, 0, 0}));
  connect(Cp_parasol_2_2.port, temperatureSensor6.port) annotation(
    Line(points = {{-130, 20}, {-120, 20}}, color = {191, 0, 0}));
  connect(temperatureSensor6.T, realValue10.numberPort) annotation(
    Line(points = {{-100, 20}, {-92, 20}}, color = {0, 0, 127}));
  connect(temperatureSensor7.T, realValue11.numberPort) annotation(
    Line(points = {{-100, 60}, {-92, 60}}, color = {0, 0, 127}));
  connect(Cp_parasol_2.port, temperatureSensor7.port) annotation(
    Line(points = {{-130, 60}, {-120, 60}}, color = {191, 0, 0}));
  connect(Cp_parasol_4_2.port, temperatureSensor8.port) annotation(
    Line(points = {{150, 20}, {180, 20}}, color = {191, 0, 0}));
  connect(temperatureSensor8.T, realValue12.numberPort) annotation(
    Line(points = {{200, 20}, {208, 20}}, color = {0, 0, 127}));
  connect(Cp_parasol_4.port, temperatureSensor9.port) annotation(
    Line(points = {{150, 60}, {180, 60}}, color = {191, 0, 0}));
  connect(temperatureSensor9.T, realValue13.numberPort) annotation(
    Line(points = {{200, 60}, {208, 60}}, color = {0, 0, 127}));
  connect(realValue1.numberPort, temperatureSensor1.T) annotation(
    Line(points = {{-27.75, 170}, {-19.75, 170}}, color = {0, 0, 127}));
  connect(temperatureSensor1.port, fixedTemperature.port) annotation(
    Line(points = {{0, 170}, {10, 170}, {10, 180}}, color = {191, 0, 0}));
  connect(AmbientAirTemperature.port, temperatureSensor10.port) annotation(
    Line(points = {{280, -60}, {268, -60}, {268, -78}}, color = {191, 0, 0}));
  connect(temperatureSensor10.T, realValue14.numberPort) annotation(
    Line(points = {{268, -98}, {268, -112}}, color = {0, 0, 127}));
  connect(AmbientAirTemperature.port, cnvc_skin_3.fluid) annotation(
    Line(points = {{280, -60}, {60, -60}, {60, -80}}, color = {191, 0, 0}));
  connect(AmbientAirTemperature.port, cnvc_parasol_inner_4.fluid) annotation(
    Line(points = {{280, -60}, {280, -20}, {180, -20}}, color = {191, 0, 0}));
  connect(ramp_h_parasol_outer.y, cnvc_parasol_inner_4.Gc) annotation(
    Line(points = {{260, 159}, {260, -10}, {190, -10}}, color = {0, 0, 127}));
  connect(cndc_skin_1.port_a, heatFlowSensor1.port_a) annotation(
    Line(points = {{-220, -140}, {-220, -150}}, color = {191, 0, 0}));
  connect(cndc_skin_2.port_a, heatFlowSensor2.port_a) annotation(
    Line(points = {{-130, -140}, {-130, -150}}, color = {191, 0, 0}));
  connect(cndc_skin_3.port_a, heatFlowSensor3.port_a) annotation(
    Line(points = {{40, -140}, {40, -150}}, color = {191, 0, 0}));
  connect(cndc_skin_4.port_a, heatFlowSensor4.port_a) annotation(
    Line(points = {{150, -140}, {150, -150}}, color = {191, 0, 0}));
  connect(heatFlowSensor1.port_b, temperatureSensor.port) annotation(
    Line(points = {{-220, -170}, {-220, -180}, {-20, -180}, {-20, -200}}, color = {191, 0, 0}));
  connect(heatFlowSensor2.port_b, temperatureSensor.port) annotation(
    Line(points = {{-130, -170}, {-130, -180}, {-20, -180}, {-20, -200}}, color = {191, 0, 0}));
  connect(heatFlowSensor3.port_b, temperatureSensor.port) annotation(
    Line(points = {{40, -170}, {40, -180}, {-20, -180}, {-20, -200}}, color = {191, 0, 0}));
  connect(heatFlowSensor4.port_b, temperatureSensor.port) annotation(
    Line(points = {{150, -170}, {150, -180}, {-20, -180}, {-20, -200}}, color = {191, 0, 0}));
  annotation(
    Diagram(graphics = {Text(origin = {-155, -228}, extent = {{103, -10}, {-9, 4}}, textString = "constant T (isothermal animal)"), Text(origin = {-270, -58}, extent = {{62, -8}, {-6, 4}}, textString = "skin (subcutaneous fat)")}, coordinateSystem(extent = {{-280, -260}, {300, 220}})),
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}})),
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1));
end ParasolEffect_001;
