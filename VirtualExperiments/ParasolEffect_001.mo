within SystemModels.VirtualExperiments;

model ParasolEffect_001
  extends Modelica.Icons.Example;
  //----------
  import SI = Modelica.SIunits;
  //----------
  //redeclare package Medium = Modelica.Media.Air.DryAirNasa
  //----------
  parameter SI.Length r_body = 0.15;
  parameter SI.Length r_parasol = 0.9;
  parameter SI.Length L_parasol_body = 0.25;
  parameter Real Rbody = r_body / L_parasol_body;
  parameter Real Rparasol = r_parasol / L_parasol_body;
  parameter Real S4Fview = 1 + (1 + Rparasol ^ 2) / Rbody ^ 2;
  parameter Real F_body_parasol = 1 / 2 * (S4Fview - (S4Fview ^ 2 - 4 * (r_parasol / r_body) ^ 2) ^ (1 / 2));
  parameter Real hcnv_body = 5;
  parameter Real e_body = 0.2;
  parameter Real F12_source_body = 0.1;
  parameter SI.Area area_body = Modelica.Constants.pi * r_body ^ 2;
  parameter SI.Length th_body = 10 * 10 ^ (-3);
  parameter SI.ThermalConductivity rambda_body = 0.01;
  //-----
  parameter Real e_parasol = 0.4;
  parameter Real F12_source_parasol = 0.1;
  parameter Real sigmaRad = 5.67 * 10 ^ (-8);
  parameter SI.Area area_parasol = Modelica.Constants.pi * r_parasol ^ 2;
  parameter SI.Length th_parasol = 1 * 10 ^ (-3);
  parameter SI.ThermalConductivity rambda_parasol = 0.01;
  parameter Real F12_parasol_body = 0.2;
  parameter Real hcnv_parasol_outer = 5;
  parameter Real hcnv_parasol_inner = 5;
  //-----
  //----------
  Modelica.Thermal.HeatTransfer.Components.BodyRadiation rad_source_parasol_2(Gr = e_parasol * F12_source_parasol * area_parasol) annotation(
    Placement(visible = true, transformation(origin = {-180, 140}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.BodyRadiation rad_source_body1(Gr = e_body * F12_source_body * area_body) annotation(
    Placement(visible = true, transformation(origin = {-300, -78}, extent = {{-19, -19}, {19, 19}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T(displayUnit = "K") = 400 + 273.15) annotation(
    Placement(visible = true, transformation(origin = {10, 210}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor cndc_body_2(G = rambda_body * area_body / th_body) annotation(
    Placement(visible = true, transformation(origin = {-180, -250}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature BodyTemperature(T(displayUnit = "K") = 36 + 273.15) annotation(
    Placement(visible = true, transformation(origin = {10, -350}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor cndc_body_1(G = rambda_body * area_body / th_body) annotation(
    Placement(visible = true, transformation(origin = {-300, -249}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Cp_parasol_2(C = 1 * 10 ^ (-9) / 2, T(displayUnit = "K")) annotation(
    Placement(visible = true, transformation(origin = {-190, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Cp_body_2(C = 1 * 10 ^ (-6), T(displayUnit = "K")) annotation(
    Placement(visible = true, transformation(origin = {-190, -218}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor cndc_parasolFabric_2(G = area_parasol * rambda_parasol / th_parasol) annotation(
    Placement(visible = true, transformation(origin = {-180, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Cp_body_1(C = 1 * 10 ^ (-6), T(displayUnit = "K")) annotation(
    Placement(visible = true, transformation(origin = {-310, -218}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Cp_parasol_2_2(C = 1 * 10 ^ (-9) / 2, T(displayUnit = "K")) annotation(
    Placement(visible = true, transformation(origin = {-190, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.BodyRadiation rad_parasol_body2(Gr = e_body * F_body_parasol * area_body) annotation(
    Placement(visible = true, transformation(origin = {-180, -80}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.BodyRadiation rad_source_body_3(Gr = e_body * F12_source_body * area_body) annotation(
    Placement(visible = true, transformation(origin = {10, -80}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Cp_body_3(C = 1 * 10 ^ (-6), T(displayUnit = "K")) annotation(
    Placement(visible = true, transformation(origin = {0, -218}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor cndc_body_3(G = rambda_body * area_body / th_body) annotation(
    Placement(visible = true, transformation(origin = {10, -249}, extent = {{-11, -11}, {11, 11}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection cnvc_body_3 annotation(
    Placement(visible = true, transformation(origin = {40, -198}, extent = {{-20, 20}, {20, -20}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_h_body(duration = 10, height = 0, offset = hcnv_body * area_body, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {80, -312}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.BodyRadiation rad_source_body_4(Gr = e_parasol * F12_source_parasol * area_parasol) annotation(
    Placement(visible = true, transformation(origin = {210, 140}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.Convection cnvc_body_4 annotation(
    Placement(visible = true, transformation(origin = {240, -198}, extent = {{-20, 20}, {20, -20}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Cp_body_4(C = 1 * 10 ^ (-6), T(displayUnit = "K")) annotation(
    Placement(visible = true, transformation(origin = {200, -222}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor cndc_body_4(G = rambda_body * area_body / th_body) annotation(
    Placement(visible = true, transformation(origin = {210, -249}, extent = {{-11, -11}, {11, 11}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Cp_parasol_4_2(C = 1 * 10 ^ (-9) / 2, T(displayUnit = "K")) annotation(
    Placement(visible = true, transformation(origin = {200, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor cndc_parasolFabric_4(G = area_parasol * rambda_parasol / th_parasol) annotation(
    Placement(visible = true, transformation(origin = {210, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Cp_parasol_4(C = 1 * 10 ^ (-9) / 2, T(displayUnit = "K")) annotation(
    Placement(visible = true, transformation(origin = {200, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.BodyRadiation rad_parasol_body_4(Gr = e_body * F_body_parasol * area_body) annotation(
    Placement(visible = true, transformation(origin = {210, -82}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.Convection cnvc_parasol_inner_4 annotation(
    Placement(visible = true, transformation(origin = {240, -20}, extent = {{20, 20}, {-20, -20}}, rotation = 90)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-90, 210}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature AmbientAirTemperature(T = 15 + 273.15) annotation(
    Placement(visible = true, transformation(origin = {390, -140}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection annotation(
    Placement(visible = true, transformation(origin = {240, 60}, extent = {{-20, 20}, {20, -20}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_h_parasol_outer(duration = 10, height = 0, offset = hcnv_parasol_outer * area_parasol, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {310, 210}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-35, -320}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-35, 180}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue2(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-273, -190}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue3(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-153, -190}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue4(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-26, -180}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue5(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {174, -188}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor1 annotation(
    Placement(visible = true, transformation(origin = {-300, -282}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue6(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-259, -282}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor2 annotation(
    Placement(visible = true, transformation(origin = {-180, -280}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue7(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-145, -280}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor3 annotation(
    Placement(visible = true, transformation(origin = {10, -281}, extent = {{10, 10}, {-10, -10}}, rotation = 90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue8(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-25, -281}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor4 annotation(
    Placement(visible = true, transformation(origin = {210, -280}, extent = {{10, 10}, {-10, -10}}, rotation = 90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue9(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {175, -280}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue10(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-125, 0}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue11(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-125, 40}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue12(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {135, 0}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue13(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {135, 40}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor2 annotation(
    Placement(visible = true, transformation(origin = {-290, -208}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor3 annotation(
    Placement(visible = true, transformation(origin = {-170, -208}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor4 annotation(
    Placement(visible = true, transformation(origin = {0, -190}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor5 annotation(
    Placement(visible = true, transformation(origin = {200, -198}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor annotation(
    Placement(visible = true, transformation(origin = {0, -320}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor6 annotation(
    Placement(visible = true, transformation(origin = {-160, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor7 annotation(
    Placement(visible = true, transformation(origin = {-160, 40}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor8 annotation(
    Placement(visible = true, transformation(origin = {170, 0}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor9 annotation(
    Placement(visible = true, transformation(origin = {170, 40}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor1 annotation(
    Placement(visible = true, transformation(origin = {0, 180}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor10 annotation(
    Placement(visible = true, transformation(origin = {370, -168}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue14(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {385, -192}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue disp_Gr_rad_source_parasol_2(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-147, 148}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue disp_Gr_rad_source_body1(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-267, -80}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue disp_Gr_rad_parasol_body2(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-147, -90}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue disp_Gr_rad_source_body_3(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {45, -80}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue disp_Gr_rad_source_body_4(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {253, 140}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue disp_Gr_rad_parasol_body_4(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {255, -92}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor annotation(
    Placement(visible = true, transformation(origin = {40, -162}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor5 annotation(
    Placement(visible = true, transformation(origin = {240, -160}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor6 annotation(
    Placement(visible = true, transformation(origin = {250, -54}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor7 annotation(
    Placement(visible = true, transformation(origin = {250, 96}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue19(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {289, -54}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue20(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {276, 96}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue21(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {274, -160}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue22(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {73, -162}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  HeatTransferComponents.Utilities.MeasureThermalConductance thermalConductance annotation(
    Placement(visible = true, transformation(origin = {-340, -114}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  HeatTransferComponents.Utilities.MeasureThermalConductance thermalConductance1 annotation(
    Placement(visible = true, transformation(origin = {-220, -110}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor8 annotation(
    Placement(visible = true, transformation(origin = {-180, -120}, extent = {{10, 10}, {-10, -10}}, rotation = 90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue26(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-345, -320}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor11 annotation(
    Placement(visible = true, transformation(origin = {-310, -320}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature1(T(displayUnit = "K") = 36 + 273.15) annotation(
    Placement(visible = true, transformation(origin = {-300, -350}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature2(T(displayUnit = "K") = 36 + 273.15) annotation(
    Placement(visible = true, transformation(origin = {-180, -350}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor12 annotation(
    Placement(visible = true, transformation(origin = {-190, -320}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue27(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-225, -320}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature3(T(displayUnit = "K") = 36 + 273.15) annotation(
    Placement(visible = true, transformation(origin = {210, -350}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor13 annotation(
    Placement(visible = true, transformation(origin = {200, -320}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue28(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {165, -320}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor14 annotation(
    Placement(visible = true, transformation(origin = {-310, 180}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue29(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-345, 180}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature4(T(displayUnit = "K") = 400 + 273.15) annotation(
    Placement(visible = true, transformation(origin = {-300, 210}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue30(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-225, 180}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor15 annotation(
    Placement(visible = true, transformation(origin = {-190, 180}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature5(T(displayUnit = "K") = 400 + 273.15) annotation(
    Placement(visible = true, transformation(origin = {-180, 210}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor16 annotation(
    Placement(visible = true, transformation(origin = {200, 180}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue31(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {165, 180}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature6(T(displayUnit = "K") = 400 + 273.15) annotation(
    Placement(visible = true, transformation(origin = {210, 210}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HeatTransferComponents.Utilities.MeasureThermalConductance thermalConductance2 annotation(
    Placement(visible = true, transformation(origin = {-230, 130}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor9 annotation(
    Placement(visible = true, transformation(origin = {-180, 100}, extent = {{10, 10}, {-10, -10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor10 annotation(
    Placement(visible = true, transformation(origin = {10, -120}, extent = {{10, 10}, {-10, -10}}, rotation = 90)));
  HeatTransferComponents.Utilities.MeasureThermalConductance thermalConductance3 annotation(
    Placement(visible = true, transformation(origin = {-30, -110}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  HeatTransferComponents.Utilities.MeasureThermalConductance thermalConductance4 annotation(
    Placement(visible = true, transformation(origin = {100, -190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HeatTransferComponents.Utilities.MeasureThermalConductance thermalConductance5 annotation(
    Placement(visible = true, transformation(origin = {148, -98}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor11 annotation(
    Placement(visible = true, transformation(origin = {210, -120}, extent = {{10, 10}, {-10, -10}}, rotation = 90)));
  HeatTransferComponents.Utilities.MeasureThermalConductance thermalConductance6 annotation(
    Placement(visible = true, transformation(origin = {170, 110}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor12 annotation(
    Placement(visible = true, transformation(origin = {210, 100}, extent = {{10, 10}, {-10, -10}}, rotation = 90)));
  HeatTransferComponents.Utilities.MeasureThermalConductance thermalConductance7 annotation(
    Placement(visible = true, transformation(origin = {300, -180}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HeatTransferComponents.Utilities.MeasureThermalConductance thermalConductance8 annotation(
    Placement(visible = true, transformation(origin = {340, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HeatTransferComponents.Utilities.MeasureThermalConductance thermalConductance9 annotation(
    Placement(visible = true, transformation(origin = {342, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  disp_Gr_rad_parasol_body2.numberPort = rad_parasol_body2.Gr;
  disp_Gr_rad_source_parasol_2.numberPort = rad_source_parasol_2.Gr;
  disp_Gr_rad_source_body1.numberPort = rad_source_body1.Gr;
  disp_Gr_rad_parasol_body_4.numberPort = rad_parasol_body_4.Gr;
  disp_Gr_rad_source_body_3.numberPort = rad_source_body_3.Gr;
  disp_Gr_rad_source_body_4.numberPort = rad_source_body_4.Gr;
//-----
  connect(Cp_parasol_2.port, cndc_parasolFabric_2.port_b) annotation(
    Line(points = {{-180, 40}, {-180, 30}}, color = {191, 0, 0}));
  connect(Cp_body_2.port, cndc_body_2.port_b) annotation(
    Line(points = {{-180, -218}, {-180, -240}}, color = {191, 0, 0}));
  connect(Cp_body_1.port, cndc_body_1.port_b) annotation(
    Line(points = {{-300, -218}, {-300, -239}}, color = {191, 0, 0}));
  connect(cndc_parasolFabric_2.port_a, Cp_parasol_2_2.port) annotation(
    Line(points = {{-180, 10}, {-180, 0}}, color = {191, 0, 0}));
  connect(Cp_parasol_2_2.port, rad_parasol_body2.port_a) annotation(
    Line(points = {{-180, 0}, {-180, -60}}, color = {191, 0, 0}));
  connect(Cp_body_3.port, cndc_body_3.port_b) annotation(
    Line(points = {{10, -218}, {10, -238}}, color = {191, 0, 0}));
  connect(Cp_body_3.port, cnvc_body_3.solid) annotation(
    Line(points = {{10, -218}, {40, -218}}, color = {191, 0, 0}));
  connect(cndc_body_4.port_b, Cp_body_4.port) annotation(
    Line(points = {{210, -238}, {210, -222}}, color = {191, 0, 0}));
  connect(Cp_parasol_4.port, cndc_parasolFabric_4.port_b) annotation(
    Line(points = {{210, 40}, {210, 30}}, color = {191, 0, 0}));
  connect(cndc_parasolFabric_4.port_a, Cp_parasol_4_2.port) annotation(
    Line(points = {{210, 10}, {210, 0}}, color = {191, 0, 0}));
  connect(Cp_parasol_4_2.port, rad_parasol_body_4.port_a) annotation(
    Line(points = {{210, 0}, {210, -62}}, color = {191, 0, 0}));
  connect(Cp_body_4.port, cnvc_body_4.solid) annotation(
    Line(points = {{210, -222}, {210, -218}, {240, -218}}, color = {191, 0, 0}));
  connect(ramp_h_parasol_outer.y, convection.Gc) annotation(
    Line(points = {{310, 199}, {310, 60}, {260, 60}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(rad_source_body1.port_b, Cp_body_1.port) annotation(
    Line(points = {{-300, -97}, {-300, -218}}, color = {191, 0, 0}));
  connect(heatFlowSensor1.Q_flow, realValue6.numberPort) annotation(
    Line(points = {{-290, -282}, {-276, -282}}, color = {0, 0, 127}));
  connect(heatFlowSensor2.Q_flow, realValue7.numberPort) annotation(
    Line(points = {{-170, -280}, {-162, -280}}, color = {0, 0, 127}));
  connect(realValue8.numberPort, heatFlowSensor3.Q_flow) annotation(
    Line(points = {{-7.75, -281}, {0, -281}}, color = {0, 0, 127}));
  connect(realValue9.numberPort, heatFlowSensor4.Q_flow) annotation(
    Line(points = {{192.25, -280}, {200, -280}}, color = {0, 0, 127}));
  connect(Cp_parasol_4.port, convection.solid) annotation(
    Line(points = {{210, 40}, {240, 40}}, color = {191, 0, 0}));
  connect(Cp_parasol_4_2.port, cnvc_parasol_inner_4.solid) annotation(
    Line(points = {{210, 0}, {240, 0}}, color = {191, 0, 0}));
  connect(Cp_body_1.port, temperatureSensor2.port) annotation(
    Line(points = {{-300, -218}, {-290, -218}}, color = {191, 0, 0}, pattern = LinePattern.DashDot));
  connect(temperatureSensor2.T, realValue2.numberPort) annotation(
    Line(points = {{-290, -198}, {-290, -190}}, color = {0, 0, 127}));
  connect(Cp_body_2.port, temperatureSensor3.port) annotation(
    Line(points = {{-180, -218}, {-170, -218}}, color = {191, 0, 0}, pattern = LinePattern.DashDot));
  connect(temperatureSensor3.T, realValue3.numberPort) annotation(
    Line(points = {{-170, -198}, {-170, -190}}, color = {0, 0, 127}));
  connect(temperatureSensor4.port, Cp_body_3.port) annotation(
    Line(points = {{0, -200}, {10, -200}, {10, -218}}, color = {191, 0, 0}, pattern = LinePattern.DashDot));
  connect(realValue4.numberPort, temperatureSensor4.T) annotation(
    Line(points = {{-8.75, -180}, {0, -180}}, color = {0, 0, 127}));
  connect(realValue5.numberPort, temperatureSensor5.T) annotation(
    Line(points = {{191.25, -188}, {200.25, -188}}, color = {0, 0, 127}));
  connect(temperatureSensor5.port, Cp_body_4.port) annotation(
    Line(points = {{200, -208}, {210, -208}, {210, -222}}, color = {191, 0, 0}, pattern = LinePattern.DashDot));
  connect(realValue.numberPort, temperatureSensor.T) annotation(
    Line(points = {{-17.75, -320}, {-9.75, -320}}, color = {0, 0, 127}));
  connect(temperatureSensor.port, BodyTemperature.port) annotation(
    Line(points = {{10, -320}, {10, -340}}, color = {191, 0, 0}));
  connect(Cp_parasol_2_2.port, temperatureSensor6.port) annotation(
    Line(points = {{-180, 0}, {-170, 0}}, color = {191, 0, 0}, pattern = LinePattern.DashDot));
  connect(temperatureSensor6.T, realValue10.numberPort) annotation(
    Line(points = {{-150, 0}, {-142, 0}}, color = {0, 0, 127}));
  connect(temperatureSensor7.T, realValue11.numberPort) annotation(
    Line(points = {{-150, 40}, {-142, 40}}, color = {0, 0, 127}));
  connect(Cp_parasol_2.port, temperatureSensor7.port) annotation(
    Line(points = {{-180, 40}, {-170, 40}}, color = {191, 0, 0}, pattern = LinePattern.DashDot));
  connect(realValue1.numberPort, temperatureSensor1.T) annotation(
    Line(points = {{-17.75, 180}, {-9.75, 180}}, color = {0, 0, 127}));
  connect(temperatureSensor1.port, fixedTemperature.port) annotation(
    Line(points = {{10, 180}, {10, 200}}, color = {191, 0, 0}, pattern = LinePattern.DashDot));
  connect(AmbientAirTemperature.port, temperatureSensor10.port) annotation(
    Line(points = {{380, -140}, {370, -140}, {370, -158}}, color = {191, 0, 0}, pattern = LinePattern.DashDot));
  connect(temperatureSensor10.T, realValue14.numberPort) annotation(
    Line(points = {{370, -178}, {370, -185}, {368, -185}, {368, -192}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(ramp_h_parasol_outer.y, cnvc_parasol_inner_4.Gc) annotation(
    Line(points = {{310, 199}, {310, -20}, {260, -20}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(cndc_body_1.port_a, heatFlowSensor1.port_a) annotation(
    Line(points = {{-300, -259}, {-300, -272}}, color = {191, 0, 0}));
  connect(cndc_body_2.port_a, heatFlowSensor2.port_a) annotation(
    Line(points = {{-180, -260}, {-180, -270}}, color = {191, 0, 0}));
  connect(cndc_body_3.port_a, heatFlowSensor3.port_a) annotation(
    Line(points = {{10, -260}, {10, -271}}, color = {191, 0, 0}));
  connect(cndc_body_4.port_a, heatFlowSensor4.port_a) annotation(
    Line(points = {{210, -260}, {210, -270}}, color = {191, 0, 0}));
  connect(heatFlowSensor3.port_b, temperatureSensor.port) annotation(
    Line(points = {{10, -291}, {10, -320}}, color = {191, 0, 0}));
  connect(heatFlowSensor.port_a, cnvc_body_3.fluid) annotation(
    Line(points = {{40, -172}, {40, -178}}, color = {191, 0, 0}));
  connect(heatFlowSensor5.port_a, cnvc_body_4.fluid) annotation(
    Line(points = {{240, -170}, {240, -178}}, color = {191, 0, 0}));
  connect(heatFlowSensor5.port_b, AmbientAirTemperature.port) annotation(
    Line(points = {{240, -150}, {240, -140}, {380, -140}}, color = {191, 0, 0}));
  connect(cnvc_parasol_inner_4.fluid, heatFlowSensor6.port_a) annotation(
    Line(points = {{240, -40}, {240, -54}}, color = {191, 0, 0}));
  connect(heatFlowSensor6.port_b, AmbientAirTemperature.port) annotation(
    Line(points = {{260, -54}, {380, -54}, {380, -140}}, color = {191, 0, 0}));
  connect(heatFlowSensor7.port_b, AmbientAirTemperature.port) annotation(
    Line(points = {{260, 96}, {380, 96}, {380, -140}}, color = {191, 0, 0}));
  connect(heatFlowSensor6.Q_flow, realValue19.numberPort) annotation(
    Line(points = {{250, -64}, {261, -64}, {261, -54}, {272, -54}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(heatFlowSensor5.Q_flow, realValue21.numberPort) annotation(
    Line(points = {{250, -160}, {257, -160}}, color = {0, 0, 127}));
  connect(heatFlowSensor.Q_flow, realValue22.numberPort) annotation(
    Line(points = {{50, -162}, {56, -162}}, color = {0, 0, 127}));
  connect(thermalConductance.u_Q_flow, heatFlowSensor1.Q_flow) annotation(
    Line(points = {{-329, -114}, {-284, -114}, {-284, -282}, {-290, -282}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(thermalConductance.port_a, rad_source_body1.port_a) annotation(
    Line(points = {{-340, -104.2}, {-340, -44.4}, {-300, -44.4}, {-300, -59.2}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(rad_parasol_body2.port_b, heatFlowSensor8.port_a) annotation(
    Line(points = {{-180, -100}, {-180, -110}}, color = {191, 0, 0}));
  connect(heatFlowSensor8.port_b, Cp_body_2.port) annotation(
    Line(points = {{-180, -130}, {-180, -218}}, color = {191, 0, 0}));
  connect(thermalConductance1.u_Q_flow, heatFlowSensor8.Q_flow) annotation(
    Line(points = {{-209, -110}, {-194.5, -110}, {-194.5, -120}, {-190, -120}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(thermalConductance1.port_b, heatFlowSensor8.port_b) annotation(
    Line(points = {{-220, -120}, {-220, -130}, {-180, -130}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(realValue26.numberPort, temperatureSensor11.T) annotation(
    Line(points = {{-327.75, -320}, {-319.75, -320}}, color = {0, 0, 127}));
  connect(temperatureSensor11.port, heatFlowSensor1.port_b) annotation(
    Line(points = {{-300, -320}, {-300, -292}}, color = {191, 0, 0}));
  connect(fixedTemperature1.port, temperatureSensor11.port) annotation(
    Line(points = {{-300, -340}, {-300, -320}}, color = {191, 0, 0}));
  connect(fixedTemperature3.port, temperatureSensor13.port) annotation(
    Line(points = {{210, -340}, {210, -320}}, color = {191, 0, 0}));
  connect(heatFlowSensor4.port_b, temperatureSensor13.port) annotation(
    Line(points = {{210, -290}, {210, -320}}, color = {191, 0, 0}));
  connect(realValue28.numberPort, temperatureSensor13.T) annotation(
    Line(points = {{182.25, -320}, {190.25, -320}}, color = {0, 0, 127}));
  connect(heatFlowSensor2.port_b, temperatureSensor12.port) annotation(
    Line(points = {{-180, -290}, {-180, -320}}, color = {191, 0, 0}));
  connect(fixedTemperature2.port, temperatureSensor12.port) annotation(
    Line(points = {{-180, -340}, {-180, -320}}, color = {191, 0, 0}));
  connect(temperatureSensor12.T, realValue27.numberPort) annotation(
    Line(points = {{-200, -320}, {-208, -320}}, color = {0, 0, 127}));
  connect(fixedTemperature.port, rad_source_body_3.port_a) annotation(
    Line(points = {{10, 200}, {10, -60}}, color = {191, 0, 0}));
  connect(fixedTemperature5.port, temperatureSensor15.port) annotation(
    Line(points = {{-180, 200}, {-180, 180}}, color = {191, 0, 0}));
  connect(fixedTemperature5.port, rad_source_parasol_2.port_a) annotation(
    Line(points = {{-180, 200}, {-180, 160}}, color = {191, 0, 0}));
  connect(fixedTemperature6.port, temperatureSensor16.port) annotation(
    Line(points = {{210, 200}, {210, 180}}, color = {191, 0, 0}));
  connect(fixedTemperature6.port, rad_source_body_4.port_a) annotation(
    Line(points = {{210, 200}, {210, 160}}, color = {191, 0, 0}));
  connect(realValue31.numberPort, temperatureSensor16.T) annotation(
    Line(points = {{182.25, 180}, {190.25, 180}}, color = {0, 0, 127}));
  connect(realValue30.numberPort, temperatureSensor15.T) annotation(
    Line(points = {{-207.75, 180}, {-199.75, 180}}, color = {0, 0, 127}));
  connect(realValue29.numberPort, temperatureSensor14.T) annotation(
    Line(points = {{-327.75, 180}, {-319.75, 180}}, color = {0, 0, 127}));
  connect(fixedTemperature4.port, temperatureSensor14.port) annotation(
    Line(points = {{-300, 200}, {-300, 180}}, color = {191, 0, 0}));
  connect(fixedTemperature4.port, rad_source_body1.port_a) annotation(
    Line(points = {{-300, 200}, {-300, -59}}, color = {191, 0, 0}));
  connect(rad_source_parasol_2.port_b, heatFlowSensor9.port_a) annotation(
    Line(points = {{-180, 120}, {-180, 110}}, color = {191, 0, 0}));
  connect(heatFlowSensor9.port_b, Cp_parasol_2.port) annotation(
    Line(points = {{-180, 90}, {-180, 40}}, color = {191, 0, 0}));
  connect(heatFlowSensor9.Q_flow, thermalConductance2.u_Q_flow) annotation(
    Line(points = {{-190, 100}, {-214, 100}, {-214, 130}, {-219, 130}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(thermalConductance2.port_a, rad_source_parasol_2.port_a) annotation(
    Line(points = {{-230, 139.8}, {-230, 159.8}, {-180, 159.8}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(thermalConductance2.port_b, heatFlowSensor9.port_b) annotation(
    Line(points = {{-230, 120}, {-230, 90}, {-180, 90}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(rad_source_body_3.port_b, heatFlowSensor10.port_a) annotation(
    Line(points = {{10, -100}, {10, -110}}, color = {191, 0, 0}));
  connect(heatFlowSensor10.port_b, cndc_body_3.port_b) annotation(
    Line(points = {{10, -130}, {10, -238}}, color = {191, 0, 0}));
  connect(thermalConductance3.u_Q_flow, heatFlowSensor10.Q_flow) annotation(
    Line(points = {{-19, -110}, {-5, -110}, {-5, -120}, {-1, -120}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(thermalConductance3.port_a, rad_source_body_3.port_a) annotation(
    Line(points = {{-30, -100.2}, {-30, -60.4}, {10, -60.4}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(thermalConductance3.port_b, heatFlowSensor10.port_b) annotation(
    Line(points = {{-30, -120}, {-30, -130}, {10, -130}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(Cp_body_3.port, thermalConductance4.port_b) annotation(
    Line(points = {{10, -218}, {100, -218}, {100, -200}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(heatFlowSensor.Q_flow, thermalConductance4.u_Q_flow) annotation(
    Line(points = {{50, -162}, {50, -190}, {89, -190}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(rad_parasol_body_4.port_b, heatFlowSensor11.port_a) annotation(
    Line(points = {{210, -102}, {210, -110}}, color = {191, 0, 0}));
  connect(heatFlowSensor11.port_b, Cp_body_4.port) annotation(
    Line(points = {{210, -130}, {210, -222}}, color = {191, 0, 0}));
  connect(thermalConductance5.u_Q_flow, heatFlowSensor11.Q_flow) annotation(
    Line(points = {{159, -98}, {179.5, -98}, {179.5, -120}, {200, -120}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(rad_source_body_4.port_b, heatFlowSensor12.port_a) annotation(
    Line(points = {{210, 120}, {210, 110}}, color = {191, 0, 0}));
  connect(heatFlowSensor12.port_b, Cp_parasol_4.port) annotation(
    Line(points = {{210, 90}, {210, 40}}, color = {191, 0, 0}));
  connect(thermalConductance6.u_Q_flow, heatFlowSensor12.Q_flow) annotation(
    Line(points = {{181, 110}, {190.5, 110}, {190.5, 100}, {200, 100}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(thermalConductance6.port_a, rad_source_body_4.port_a) annotation(
    Line(points = {{170, 119.8}, {170, 159.8}, {210, 159.8}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(thermalConductance6.port_b, heatFlowSensor12.port_b) annotation(
    Line(points = {{170, 100}, {170, 90}, {210, 90}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(heatFlowSensor5.Q_flow, thermalConductance7.u_Q_flow) annotation(
    Line(points = {{250, -160}, {254, -160}, {254, -180}, {289, -180}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(heatFlowSensor5.port_b, thermalConductance7.port_a) annotation(
    Line(points = {{240, -150}, {300, -150}, {300, -170}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(Cp_body_4.port, thermalConductance7.port_b) annotation(
    Line(points = {{210, -222}, {300, -222}, {300, -190}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(cnvc_parasol_inner_4.solid, thermalConductance8.port_a) annotation(
    Line(points = {{240, 0}, {340, 0}, {340, -20}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(heatFlowSensor6.Q_flow, thermalConductance8.u_Q_flow) annotation(
    Line(points = {{250, -64}, {272, -64}, {272, -30}, {329, -30}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(convection.solid, thermalConductance9.port_b) annotation(
    Line(points = {{240, 40}, {342, 40}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(rad_parasol_body2.port_a, thermalConductance1.port_a) annotation(
    Line(points = {{-180, -60}, {-220, -60}, {-220, -100}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(cnvc_body_3.Gc, ramp_h_body.y) annotation(
    Line(points = {{60, -198}, {80, -198}, {80, -301}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(realValue13.numberPort, temperatureSensor9.T) annotation(
    Line(points = {{152.25, 40}, {160.25, 40}}, color = {0, 0, 127}));
  connect(temperatureSensor9.port, Cp_parasol_4.port) annotation(
    Line(points = {{180, 40}, {210, 40}}, color = {191, 0, 0}));
  connect(realValue12.numberPort, temperatureSensor8.T) annotation(
    Line(points = {{152.25, 0}, {160.25, 0}}, color = {0, 0, 127}));
  connect(temperatureSensor8.port, Cp_parasol_4_2.port) annotation(
    Line(points = {{180, 0}, {210, 0}}, color = {191, 0, 0}));
  connect(thermalConductance5.port_b, heatFlowSensor11.port_b) annotation(
    Line(points = {{148, -108}, {148, -130}, {210, -130}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(rad_parasol_body_4.port_a, thermalConductance5.port_a) annotation(
    Line(points = {{210, -62}, {148, -62}, {148, -88}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(AmbientAirTemperature.port, heatFlowSensor.port_b) annotation(
    Line(points = {{380, -140}, {40, -140}, {40, -152}}, color = {191, 0, 0}));
  connect(heatFlowSensor7.port_a, convection.fluid) annotation(
    Line(points = {{240, 96}, {240, 80}}, color = {191, 0, 0}));
  connect(heatFlowSensor7.Q_flow, realValue20.numberPort) annotation(
    Line(points = {{250, 86}, {254.5, 86}, {254.5, 96}, {259, 96}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(heatFlowSensor7.Q_flow, thermalConductance9.u_Q_flow) annotation(
    Line(points = {{250, 86}, {324, 86}, {324, 50}, {331, 50}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(thermalConductance.port_b, rad_source_body1.port_b) annotation(
    Line(points = {{-340, -124}, {-300, -124}, {-300, -96}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(cnvc_parasol_inner_4.fluid, thermalConductance8.port_b) annotation(
    Line(points = {{240, -40}, {340, -40}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(convection.fluid, thermalConductance9.port_a) annotation(
    Line(points = {{240, 80}, {342, 80}, {342, 60}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(heatFlowSensor.port_b, thermalConductance4.port_a) annotation(
    Line(points = {{40, -152}, {100, -152}, {100, -180}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(ramp_h_body.y, cnvc_body_4.Gc) annotation(
    Line(points = {{80, -301}, {260, -301}, {260, -198}}, color = {0, 0, 127}, pattern = LinePattern.Dash));  protected
  annotation(
    Diagram(graphics = {Text(origin = {-115, -366}, extent = {{103, -10}, {-9, 4}}, textString = "constant T (isothermal animal)"), Text(origin = {-107, -235}, extent = {{91, -17}, {-9, 9}}, textString = "skin
 (subcutaneous fat)")}, coordinateSystem(extent = {{-400, -380}, {400, 300}})),
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}})),
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1));
end ParasolEffect_001;
