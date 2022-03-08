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
    Placement(visible = true, transformation(origin = {-180, 180}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.BodyRadiation rad_source_body1(Gr = e_body * F12_source_body * area_body) annotation(
    Placement(visible = true, transformation(origin = {-300, -20}, extent = {{-19, -19}, {19, 19}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T(displayUnit = "K") = 400 + 273.15) annotation(
    Placement(visible = true, transformation(origin = {10, 290}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor cndc_body_2(G = rambda_body * area_body / th_body) annotation(
    Placement(visible = true, transformation(origin = {-180, -260}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature BodyTemperature(T(displayUnit = "K") = 36 + 273.15) annotation(
    Placement(visible = true, transformation(origin = {10, -370}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor cndc_body_1(G = rambda_body * area_body / th_body) annotation(
    Placement(visible = true, transformation(origin = {-300, -258}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Cp_parasol_2(C = 1 * 10 ^ (-9) / 2, T(displayUnit = "K")) annotation(
    Placement(visible = true, transformation(origin = {-190, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Cp_body_2(C = 1 * 10 ^ (-6), T(displayUnit = "K")) annotation(
    Placement(visible = true, transformation(origin = {-190, -218}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor cndc_parasolFabric_2(G = area_parasol * rambda_parasol / th_parasol) annotation(
    Placement(visible = true, transformation(origin = {-180, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Cp_body_1(C = 1 * 10 ^ (-6), T(displayUnit = "K")) annotation(
    Placement(visible = true, transformation(origin = {-310, -218}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Cp_parasol_2_2(C = 1 * 10 ^ (-9) / 2, T(displayUnit = "K")) annotation(
    Placement(visible = true, transformation(origin = {-190, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.BodyRadiation rad_parasol_body2(Gr = e_body * F_body_parasol * area_body) annotation(
    Placement(visible = true, transformation(origin = {-180, -20}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.BodyRadiation rad_source_body_3(Gr = e_body * F12_source_body * area_body) annotation(
    Placement(visible = true, transformation(origin = {10, 80}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Cp_body_3(C = 1 * 10 ^ (-6), T(displayUnit = "K")) annotation(
    Placement(visible = true, transformation(origin = {0, -228}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor cndc_body_3(G = rambda_body * area_body / th_body) annotation(
    Placement(visible = true, transformation(origin = {10, -258}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection cnvc_body_3 annotation(
    Placement(visible = true, transformation(origin = {40, -198}, extent = {{-20, 20}, {20, -20}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_h_body(duration = 10, height = 0, offset = hcnv_body * area_body, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {90, -360}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.BodyRadiation rad_source_body_4(Gr = e_parasol * F12_source_parasol * area_parasol) annotation(
    Placement(visible = true, transformation(origin = {210, 220}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.Convection cnvc_body_4 annotation(
    Placement(visible = true, transformation(origin = {240, -198}, extent = {{-20, 20}, {20, -20}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Cp_body_4(C = 1 * 10 ^ (-6), T(displayUnit = "K")) annotation(
    Placement(visible = true, transformation(origin = {200, -228}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor cndc_body_4(G = rambda_body * area_body / th_body) annotation(
    Placement(visible = true, transformation(origin = {210, -258}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Cp_parasol_4_2(C = 1 * 10 ^ (-9) / 2, T(displayUnit = "K")) annotation(
    Placement(visible = true, transformation(origin = {200, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor cndc_parasolFabric_4(G = area_parasol * rambda_parasol / th_parasol) annotation(
    Placement(visible = true, transformation(origin = {210, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Cp_parasol_4(C = 1 * 10 ^ (-9) / 2, T(displayUnit = "K")) annotation(
    Placement(visible = true, transformation(origin = {200, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.BodyRadiation rad_parasol_body_4(Gr = e_body * F_body_parasol * area_body) annotation(
    Placement(visible = true, transformation(origin = {210, -72}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.Convection cnvc_parasol_inner_4 annotation(
    Placement(visible = true, transformation(origin = {240, 0}, extent = {{20, 20}, {-20, -20}}, rotation = 90)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-90, 290}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature AmbientAirTemperature(T = 15 + 273.15) annotation(
    Placement(visible = true, transformation(origin = {430, -128}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection annotation(
    Placement(visible = true, transformation(origin = {240, 120}, extent = {{-20, 20}, {20, -20}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_h_parasol_outer(duration = 10, height = 0, offset = hcnv_parasol_outer * area_parasol, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {310, 210}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-35, -340}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-35, 260}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue2(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-273, -190}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue3(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-153, -190}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue4(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-26, -188}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue5(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {174, -188}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor1 annotation(
    Placement(visible = true, transformation(origin = {-300, -300}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue6(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-259, -300}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor2 annotation(
    Placement(visible = true, transformation(origin = {-180, -300}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue7(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-145, -300}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor3 annotation(
    Placement(visible = true, transformation(origin = {10, -300}, extent = {{10, 10}, {-10, -10}}, rotation = 90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue8(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-25, -300}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor4 annotation(
    Placement(visible = true, transformation(origin = {210, -300}, extent = {{10, 10}, {-10, -10}}, rotation = 90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue9(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {175, -300}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue10(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-125, 28}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue11(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-125, 90}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue12(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {135, 20}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue13(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {135, 100}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor2 annotation(
    Placement(visible = true, transformation(origin = {-290, -208}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor3 annotation(
    Placement(visible = true, transformation(origin = {-170, -208}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor4 annotation(
    Placement(visible = true, transformation(origin = {0, -198}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor5 annotation(
    Placement(visible = true, transformation(origin = {200, -198}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor annotation(
    Placement(visible = true, transformation(origin = {0, -340}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor6 annotation(
    Placement(visible = true, transformation(origin = {-160, 28}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor7 annotation(
    Placement(visible = true, transformation(origin = {-160, 90}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor8 annotation(
    Placement(visible = true, transformation(origin = {170, 20}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor9 annotation(
    Placement(visible = true, transformation(origin = {170, 100}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor1 annotation(
    Placement(visible = true, transformation(origin = {0, 260}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor10 annotation(
    Placement(visible = true, transformation(origin = {410, -156}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue14(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {427, -180}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue disp_Gr_rad_source_parasol_2(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-147, 188}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue disp_Gr_rad_source_body1(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-267, -22}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue disp_Gr_rad_parasol_body2(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-147, -30}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue disp_Gr_rad_source_body_3(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {45, 80}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue disp_Gr_rad_source_body_4(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {253, 220}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue disp_Gr_rad_parasol_body_4(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {255, -82}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor annotation(
    Placement(visible = true, transformation(origin = {40, -148}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor5 annotation(
    Placement(visible = true, transformation(origin = {240, -148}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor6 annotation(
    Placement(visible = true, transformation(origin = {252, -30}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor7 annotation(
    Placement(visible = true, transformation(origin = {250, 182}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue19(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {295, -42}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue20(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {276, 158}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue21(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {274, -148}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue22(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {73, -148}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  HeatTransferComponents.Utilities.MeasureThermalConductance thermalConductance annotation(
    Placement(visible = true, transformation(origin = {-340, -288}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  HeatTransferComponents.Utilities.MeasureThermalResistance thermalResistance annotation(
    Placement(visible = true, transformation(origin = {-370, -120}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  HeatTransferComponents.Utilities.MeasureThermalConductance thermalConductance1 annotation(
    Placement(visible = true, transformation(origin = {-210, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor8 annotation(
    Placement(visible = true, transformation(origin = {-180, -60}, extent = {{10, 10}, {-10, -10}}, rotation = 90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue26(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-345, -340}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor11 annotation(
    Placement(visible = true, transformation(origin = {-310, -340}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature1(T(displayUnit = "K") = 36 + 273.15) annotation(
    Placement(visible = true, transformation(origin = {-300, -370}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature2(T(displayUnit = "K") = 36 + 273.15) annotation(
    Placement(visible = true, transformation(origin = {-180, -370}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor12 annotation(
    Placement(visible = true, transformation(origin = {-190, -340}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue27(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-225, -340}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature3(T(displayUnit = "K") = 36 + 273.15) annotation(
    Placement(visible = true, transformation(origin = {210, -370}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor13 annotation(
    Placement(visible = true, transformation(origin = {200, -340}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue28(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {165, -340}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor14 annotation(
    Placement(visible = true, transformation(origin = {-310, 260}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue29(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-345, 260}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature4(T(displayUnit = "K") = 400 + 273.15) annotation(
    Placement(visible = true, transformation(origin = {-300, 290}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue30(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-225, 260}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor15 annotation(
    Placement(visible = true, transformation(origin = {-190, 260}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature5(T(displayUnit = "K") = 400 + 273.15) annotation(
    Placement(visible = true, transformation(origin = {-180, 290}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor16 annotation(
    Placement(visible = true, transformation(origin = {200, 260}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue31(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {165, 260}, extent = {{15, -10}, {-15, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature6(T(displayUnit = "K") = 400 + 273.15) annotation(
    Placement(visible = true, transformation(origin = {210, 290}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HeatTransferComponents.Utilities.MeasureThermalConductance thermalConductance2 annotation(
    Placement(visible = true, transformation(origin = {-230, 170}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor9 annotation(
    Placement(visible = true, transformation(origin = {-180, 140}, extent = {{10, 10}, {-10, -10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor10 annotation(
    Placement(visible = true, transformation(origin = {10, 40}, extent = {{10, 10}, {-10, -10}}, rotation = 90)));
  HeatTransferComponents.Utilities.MeasureThermalConductance thermalConductance3 annotation(
    Placement(visible = true, transformation(origin = {-20, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  HeatTransferComponents.Utilities.MeasureThermalConductance thermalConductance4 annotation(
    Placement(visible = true, transformation(origin = {100, -170}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HeatTransferComponents.Utilities.MeasureThermalConductance thermalConductance5 annotation(
    Placement(visible = true, transformation(origin = {148, -88}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor11 annotation(
    Placement(visible = true, transformation(origin = {210, -110}, extent = {{10, 10}, {-10, -10}}, rotation = 90)));
  HeatTransferComponents.Utilities.MeasureThermalConductance thermalConductance6 annotation(
    Placement(visible = true, transformation(origin = {170, 190}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor12 annotation(
    Placement(visible = true, transformation(origin = {210, 180}, extent = {{10, 10}, {-10, -10}}, rotation = 90)));
  HeatTransferComponents.Utilities.MeasureThermalConductance thermalConductance7 annotation(
    Placement(visible = true, transformation(origin = {300, -168}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HeatTransferComponents.Utilities.MeasureThermalConductance thermalConductance8 annotation(
    Placement(visible = true, transformation(origin = {330, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HeatTransferComponents.Utilities.MeasureThermalConductance thermalConductance9 annotation(
    Placement(visible = true, transformation(origin = {342, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  disp_Gr_rad_parasol_body2.numberPort = rad_parasol_body2.Gr;
  disp_Gr_rad_source_parasol_2.numberPort = rad_source_parasol_2.Gr;
  disp_Gr_rad_source_body1.numberPort = rad_source_body1.Gr;
  disp_Gr_rad_parasol_body_4.numberPort = rad_parasol_body_4.Gr;
  disp_Gr_rad_source_body_3.numberPort = rad_source_body_3.Gr;
  disp_Gr_rad_source_body_4.numberPort = rad_source_body_4.Gr;
//-----
  connect(Cp_parasol_2.port, cndc_parasolFabric_2.port_b) annotation(
    Line(points = {{-180, 90}, {-180, 80}}, color = {191, 0, 0}));
  connect(Cp_body_2.port, cndc_body_2.port_b) annotation(
    Line(points = {{-180, -218}, {-180, -240}}, color = {191, 0, 0}));
  connect(Cp_body_1.port, cndc_body_1.port_b) annotation(
    Line(points = {{-300, -218}, {-300, -238}}, color = {191, 0, 0}));
  connect(cndc_parasolFabric_2.port_a, Cp_parasol_2_2.port) annotation(
    Line(points = {{-180, 40}, {-180, 28}}, color = {191, 0, 0}));
  connect(Cp_parasol_2_2.port, rad_parasol_body2.port_a) annotation(
    Line(points = {{-180, 28}, {-180, 0}}, color = {191, 0, 0}));
  connect(Cp_body_3.port, cndc_body_3.port_b) annotation(
    Line(points = {{10, -228}, {10, -238}}, color = {191, 0, 0}));
  connect(Cp_body_3.port, cnvc_body_3.solid) annotation(
    Line(points = {{10, -228}, {41, -228}, {41, -218}, {40, -218}}, color = {191, 0, 0}));
  connect(cndc_body_4.port_b, Cp_body_4.port) annotation(
    Line(points = {{210, -238}, {210, -228}}, color = {191, 0, 0}));
  connect(Cp_parasol_4.port, cndc_parasolFabric_4.port_b) annotation(
    Line(points = {{210, 100}, {210, 80}}, color = {191, 0, 0}));
  connect(cndc_parasolFabric_4.port_a, Cp_parasol_4_2.port) annotation(
    Line(points = {{210, 40}, {210, 20}}, color = {191, 0, 0}));
  connect(Cp_parasol_4_2.port, rad_parasol_body_4.port_a) annotation(
    Line(points = {{210, 20}, {210, -52}}, color = {191, 0, 0}));
  connect(Cp_body_4.port, cnvc_body_4.solid) annotation(
    Line(points = {{210, -228}, {210, -218}, {240, -218}}, color = {191, 0, 0}));
  connect(ramp_h_parasol_outer.y, convection.Gc) annotation(
    Line(points = {{310, 199}, {310, 120}, {260, 120}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(rad_source_body1.port_b, Cp_body_1.port) annotation(
    Line(points = {{-300, -39}, {-300, -218}}, color = {191, 0, 0}));
  connect(heatFlowSensor1.Q_flow, realValue6.numberPort) annotation(
    Line(points = {{-290, -300}, {-276, -300}}, color = {0, 0, 127}));
  connect(heatFlowSensor2.Q_flow, realValue7.numberPort) annotation(
    Line(points = {{-170, -300}, {-162, -300}}, color = {0, 0, 127}));
  connect(realValue8.numberPort, heatFlowSensor3.Q_flow) annotation(
    Line(points = {{-7.75, -300}, {0, -300}}, color = {0, 0, 127}));
  connect(realValue9.numberPort, heatFlowSensor4.Q_flow) annotation(
    Line(points = {{192.25, -300}, {200, -300}}, color = {0, 0, 127}));
  connect(Cp_parasol_4.port, convection.solid) annotation(
    Line(points = {{210, 100}, {240, 100}}, color = {191, 0, 0}));
  connect(Cp_parasol_4_2.port, cnvc_parasol_inner_4.solid) annotation(
    Line(points = {{210, 20}, {240, 20}}, color = {191, 0, 0}));
  connect(Cp_body_1.port, temperatureSensor2.port) annotation(
    Line(points = {{-300, -218}, {-290, -218}}, color = {191, 0, 0}, pattern = LinePattern.DashDot));
  connect(temperatureSensor2.T, realValue2.numberPort) annotation(
    Line(points = {{-290, -198}, {-290, -190}}, color = {0, 0, 127}));
  connect(Cp_body_2.port, temperatureSensor3.port) annotation(
    Line(points = {{-180, -218}, {-170, -218}}, color = {191, 0, 0}, pattern = LinePattern.DashDot));
  connect(temperatureSensor3.T, realValue3.numberPort) annotation(
    Line(points = {{-170, -198}, {-170, -190}}, color = {0, 0, 127}));
  connect(temperatureSensor4.port, Cp_body_3.port) annotation(
    Line(points = {{0, -208}, {10, -208}, {10, -228}}, color = {191, 0, 0}, pattern = LinePattern.DashDot));
  connect(realValue4.numberPort, temperatureSensor4.T) annotation(
    Line(points = {{-8.75, -188}, {0, -188}}, color = {0, 0, 127}));
  connect(realValue5.numberPort, temperatureSensor5.T) annotation(
    Line(points = {{191.25, -188}, {200.25, -188}}, color = {0, 0, 127}));
  connect(temperatureSensor5.port, Cp_body_4.port) annotation(
    Line(points = {{200, -208}, {210, -208}, {210, -228}}, color = {191, 0, 0}, pattern = LinePattern.DashDot));
  connect(realValue.numberPort, temperatureSensor.T) annotation(
    Line(points = {{-18, -340}, {-10, -340}}, color = {0, 0, 127}));
  connect(temperatureSensor.port, BodyTemperature.port) annotation(
    Line(points = {{10, -340}, {10, -360}}, color = {191, 0, 0}));
  connect(Cp_parasol_2_2.port, temperatureSensor6.port) annotation(
    Line(points = {{-180, 28}, {-170, 28}}, color = {191, 0, 0}, pattern = LinePattern.DashDot));
  connect(temperatureSensor6.T, realValue10.numberPort) annotation(
    Line(points = {{-150, 28}, {-142, 28}}, color = {0, 0, 127}));
  connect(temperatureSensor7.T, realValue11.numberPort) annotation(
    Line(points = {{-150, 90}, {-142, 90}}, color = {0, 0, 127}));
  connect(Cp_parasol_2.port, temperatureSensor7.port) annotation(
    Line(points = {{-180, 90}, {-170, 90}}, color = {191, 0, 0}, pattern = LinePattern.DashDot));
  connect(realValue1.numberPort, temperatureSensor1.T) annotation(
    Line(points = {{-17.75, 260}, {-9.75, 260}}, color = {0, 0, 127}));
  connect(temperatureSensor1.port, fixedTemperature.port) annotation(
    Line(points = {{10, 260}, {10, 280}}, color = {191, 0, 0}, pattern = LinePattern.DashDot));
  connect(AmbientAirTemperature.port, temperatureSensor10.port) annotation(
    Line(points = {{420, -128}, {410, -128}, {410, -146}}, color = {191, 0, 0}, pattern = LinePattern.DashDot));
  connect(temperatureSensor10.T, realValue14.numberPort) annotation(
    Line(points = {{410, -166}, {410, -180}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(ramp_h_parasol_outer.y, cnvc_parasol_inner_4.Gc) annotation(
    Line(points = {{310, 199}, {310, 0}, {260, 0}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(cndc_body_1.port_a, heatFlowSensor1.port_a) annotation(
    Line(points = {{-300, -278}, {-300, -290}}, color = {191, 0, 0}));
  connect(cndc_body_2.port_a, heatFlowSensor2.port_a) annotation(
    Line(points = {{-180, -280}, {-180, -290}}, color = {191, 0, 0}));
  connect(cndc_body_3.port_a, heatFlowSensor3.port_a) annotation(
    Line(points = {{10, -278}, {10, -290}}, color = {191, 0, 0}));
  connect(cndc_body_4.port_a, heatFlowSensor4.port_a) annotation(
    Line(points = {{210, -278}, {210, -290}}, color = {191, 0, 0}));
  connect(heatFlowSensor3.port_b, temperatureSensor.port) annotation(
    Line(points = {{10, -310}, {10, -340}}, color = {191, 0, 0}));
  connect(heatFlowSensor.port_a, cnvc_body_3.fluid) annotation(
    Line(points = {{40, -158}, {40, -178}}, color = {191, 0, 0}));
  connect(heatFlowSensor5.port_a, cnvc_body_4.fluid) annotation(
    Line(points = {{240, -158}, {240, -178}}, color = {191, 0, 0}));
  connect(heatFlowSensor5.port_b, AmbientAirTemperature.port) annotation(
    Line(points = {{240, -138}, {240, -128}, {420, -128}}, color = {191, 0, 0}));
  connect(cnvc_parasol_inner_4.fluid, heatFlowSensor6.port_a) annotation(
    Line(points = {{240, -20}, {240, -25}, {242, -25}, {242, -30}}, color = {191, 0, 0}));
  connect(heatFlowSensor6.port_b, AmbientAirTemperature.port) annotation(
    Line(points = {{262, -30}, {420, -30}, {420, -128}}, color = {191, 0, 0}));
  connect(heatFlowSensor7.port_b, AmbientAirTemperature.port) annotation(
    Line(points = {{260, 182}, {420, 182}, {420, -128}}, color = {191, 0, 0}));
  connect(heatFlowSensor6.Q_flow, realValue19.numberPort) annotation(
    Line(points = {{252, -40}, {252, -42}, {278, -42}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(heatFlowSensor5.Q_flow, realValue21.numberPort) annotation(
    Line(points = {{250, -148}, {257, -148}}, color = {0, 0, 127}));
  connect(heatFlowSensor.Q_flow, realValue22.numberPort) annotation(
    Line(points = {{50, -148}, {56, -148}}, color = {0, 0, 127}));
  connect(thermalConductance.u_Q_flow, heatFlowSensor1.Q_flow) annotation(
    Line(points = {{-329, -288}, {-284, -288}, {-284, -300}, {-290, -300}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(thermalConductance.port_a, rad_source_body1.port_a) annotation(
    Line(points = {{-340, -278}, {-340, 13.8}, {-300, 13.8}, {-300, -1}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(thermalConductance.port_b, heatFlowSensor1.port_b) annotation(
    Line(points = {{-340, -298}, {-340, -310}, {-300, -310}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(thermalResistance.port_a, rad_source_body1.port_a) annotation(
    Line(points = {{-370, -110}, {-370, 14}, {-300, 14}, {-300, -1}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(thermalResistance.port_b, heatFlowSensor1.port_b) annotation(
    Line(points = {{-370, -130}, {-370, -310}, {-300, -310}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(heatFlowSensor1.Q_flow, thermalResistance.u_Q_flow) annotation(
    Line(points = {{-290, -300}, {-280, -300}, {-280, -120}, {-359, -120}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(rad_parasol_body2.port_b, heatFlowSensor8.port_a) annotation(
    Line(points = {{-180, -40}, {-180, -50}}, color = {191, 0, 0}));
  connect(heatFlowSensor8.port_b, Cp_body_2.port) annotation(
    Line(points = {{-180, -70}, {-180, -218}}, color = {191, 0, 0}));
  connect(thermalConductance1.u_Q_flow, heatFlowSensor8.Q_flow) annotation(
    Line(points = {{-199, -50}, {-194.5, -50}, {-194.5, -60}, {-190, -60}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(thermalConductance1.port_b, heatFlowSensor8.port_b) annotation(
    Line(points = {{-210, -60}, {-210, -70}, {-180, -70}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(realValue26.numberPort, temperatureSensor11.T) annotation(
    Line(points = {{-327.75, -340}, {-319.75, -340}}, color = {0, 0, 127}));
  connect(temperatureSensor11.port, heatFlowSensor1.port_b) annotation(
    Line(points = {{-300, -340}, {-300, -310}}, color = {191, 0, 0}));
  connect(fixedTemperature1.port, temperatureSensor11.port) annotation(
    Line(points = {{-300, -360}, {-300, -340}}, color = {191, 0, 0}));
  connect(fixedTemperature3.port, temperatureSensor13.port) annotation(
    Line(points = {{210, -360}, {210, -340}}, color = {191, 0, 0}));
  connect(heatFlowSensor4.port_b, temperatureSensor13.port) annotation(
    Line(points = {{210, -310}, {210, -340}}, color = {191, 0, 0}));
  connect(realValue28.numberPort, temperatureSensor13.T) annotation(
    Line(points = {{182.25, -340}, {190.25, -340}}, color = {0, 0, 127}));
  connect(heatFlowSensor2.port_b, temperatureSensor12.port) annotation(
    Line(points = {{-180, -310}, {-180, -340}}, color = {191, 0, 0}));
  connect(fixedTemperature2.port, temperatureSensor12.port) annotation(
    Line(points = {{-180, -360}, {-180, -340}}, color = {191, 0, 0}));
  connect(temperatureSensor12.T, realValue27.numberPort) annotation(
    Line(points = {{-200, -340}, {-208, -340}}, color = {0, 0, 127}));
  connect(fixedTemperature.port, rad_source_body_3.port_a) annotation(
    Line(points = {{10, 280}, {10, 100}}, color = {191, 0, 0}));
  connect(fixedTemperature5.port, temperatureSensor15.port) annotation(
    Line(points = {{-180, 280}, {-180, 260}}, color = {191, 0, 0}));
  connect(fixedTemperature5.port, rad_source_parasol_2.port_a) annotation(
    Line(points = {{-180, 280}, {-180, 200}}, color = {191, 0, 0}));
  connect(fixedTemperature6.port, temperatureSensor16.port) annotation(
    Line(points = {{210, 280}, {210, 260}}, color = {191, 0, 0}));
  connect(fixedTemperature6.port, rad_source_body_4.port_a) annotation(
    Line(points = {{210, 280}, {210, 240}}, color = {191, 0, 0}));
  connect(realValue31.numberPort, temperatureSensor16.T) annotation(
    Line(points = {{182.25, 260}, {190.25, 260}}, color = {0, 0, 127}));
  connect(realValue30.numberPort, temperatureSensor15.T) annotation(
    Line(points = {{-207.75, 260}, {-199.75, 260}}, color = {0, 0, 127}));
  connect(realValue29.numberPort, temperatureSensor14.T) annotation(
    Line(points = {{-327.75, 260}, {-319.75, 260}}, color = {0, 0, 127}));
  connect(fixedTemperature4.port, temperatureSensor14.port) annotation(
    Line(points = {{-300, 280}, {-300, 260}}, color = {191, 0, 0}));
  connect(fixedTemperature4.port, rad_source_body1.port_a) annotation(
    Line(points = {{-300, 280}, {-300, -1}}, color = {191, 0, 0}));
  connect(rad_source_parasol_2.port_b, heatFlowSensor9.port_a) annotation(
    Line(points = {{-180, 160}, {-180, 150}}, color = {191, 0, 0}));
  connect(heatFlowSensor9.port_b, Cp_parasol_2.port) annotation(
    Line(points = {{-180, 130}, {-180, 90}}, color = {191, 0, 0}));
  connect(heatFlowSensor9.Q_flow, thermalConductance2.u_Q_flow) annotation(
    Line(points = {{-190, 140}, {-214, 140}, {-214, 170}, {-219, 170}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(thermalConductance2.port_a, rad_source_parasol_2.port_a) annotation(
    Line(points = {{-230, 179.8}, {-230, 199.8}, {-180, 199.8}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(thermalConductance2.port_b, heatFlowSensor9.port_b) annotation(
    Line(points = {{-230, 160}, {-230, 130}, {-180, 130}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(rad_source_body_3.port_b, heatFlowSensor10.port_a) annotation(
    Line(points = {{10, 60}, {10, 50}}, color = {191, 0, 0}));
  connect(heatFlowSensor10.port_b, cndc_body_3.port_b) annotation(
    Line(points = {{10, 30}, {10, -238}}, color = {191, 0, 0}));
  connect(thermalConductance3.u_Q_flow, heatFlowSensor10.Q_flow) annotation(
    Line(points = {{-9, 50}, {-5, 50}, {-5, 40}, {-1, 40}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(thermalConductance3.port_a, rad_source_body_3.port_a) annotation(
    Line(points = {{-20, 59.8}, {-20, 99.8}, {10, 99.8}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(thermalConductance3.port_b, heatFlowSensor10.port_b) annotation(
    Line(points = {{-20, 40}, {-20, 30}, {10, 30}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(heatFlowSensor.port_b, thermalConductance4.port_a) annotation(
    Line(points = {{40, -138}, {100, -138}, {100, -160}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(Cp_body_3.port, thermalConductance4.port_b) annotation(
    Line(points = {{10, -228}, {100, -228}, {100, -180}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(heatFlowSensor.Q_flow, thermalConductance4.u_Q_flow) annotation(
    Line(points = {{50, -148}, {50, -170}, {89, -170}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(rad_parasol_body_4.port_b, heatFlowSensor11.port_a) annotation(
    Line(points = {{210, -92}, {210, -100}}, color = {191, 0, 0}));
  connect(heatFlowSensor11.port_b, Cp_body_4.port) annotation(
    Line(points = {{210, -120}, {210, -228}}, color = {191, 0, 0}));
  connect(thermalConductance5.u_Q_flow, heatFlowSensor11.Q_flow) annotation(
    Line(points = {{159, -88}, {179.5, -88}, {179.5, -110}, {200, -110}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(rad_source_body_4.port_b, heatFlowSensor12.port_a) annotation(
    Line(points = {{210, 200}, {210, 190}}, color = {191, 0, 0}));
  connect(heatFlowSensor12.port_b, Cp_parasol_4.port) annotation(
    Line(points = {{210, 170}, {210, 100}}, color = {191, 0, 0}));
  connect(thermalConductance6.u_Q_flow, heatFlowSensor12.Q_flow) annotation(
    Line(points = {{181, 190}, {190.5, 190}, {190.5, 180}, {200, 180}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(thermalConductance6.port_a, rad_source_body_4.port_a) annotation(
    Line(points = {{170, 200}, {170, 240}, {210, 240}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(thermalConductance6.port_b, heatFlowSensor12.port_b) annotation(
    Line(points = {{170, 180}, {170, 170}, {210, 170}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(heatFlowSensor5.Q_flow, thermalConductance7.u_Q_flow) annotation(
    Line(points = {{250, -148}, {254, -148}, {254, -168}, {289, -168}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(heatFlowSensor5.port_b, thermalConductance7.port_a) annotation(
    Line(points = {{240, -138}, {300, -138}, {300, -158}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(Cp_body_4.port, thermalConductance7.port_b) annotation(
    Line(points = {{210, -228}, {300, -228}, {300, -178}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(cnvc_parasol_inner_4.solid, thermalConductance8.port_a) annotation(
    Line(points = {{240, 20}, {330, 20}, {330, 0}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(heatFlowSensor6.port_b, thermalConductance8.port_b) annotation(
    Line(points = {{262, -30}, {330, -30}, {330, -20}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(heatFlowSensor6.Q_flow, thermalConductance8.u_Q_flow) annotation(
    Line(points = {{252, -40}, {272, -40}, {272, -10}, {319, -10}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(convection.solid, thermalConductance9.port_b) annotation(
    Line(points = {{240, 100}, {342, 100}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(heatFlowSensor7.port_b, thermalConductance9.port_a) annotation(
    Line(points = {{260, 182}, {342, 182}, {342, 120}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(rad_parasol_body2.port_a, thermalConductance1.port_a) annotation(
    Line(points = {{-180, 0}, {-210, 0}, {-210, -40}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(cnvc_body_3.Gc, ramp_h_body.y) annotation(
    Line(points = {{60, -198}, {80, -198}, {80, -282}, {90, -282}, {90, -349}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(realValue13.numberPort, temperatureSensor9.T) annotation(
    Line(points = {{152, 100}, {160, 100}}, color = {0, 0, 127}));
  connect(temperatureSensor9.port, Cp_parasol_4.port) annotation(
    Line(points = {{180, 100}, {210, 100}}, color = {191, 0, 0}));
  connect(realValue12.numberPort, temperatureSensor8.T) annotation(
    Line(points = {{152, 20}, {160, 20}}, color = {0, 0, 127}));
  connect(temperatureSensor8.port, Cp_parasol_4_2.port) annotation(
    Line(points = {{180, 20}, {210, 20}}, color = {191, 0, 0}));
  connect(cnvc_body_4.Gc, ramp_h_body.y) annotation(
    Line(points = {{260, -198}, {278, -198}, {278, -314}, {90, -314}, {90, -348}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(thermalConductance5.port_b, heatFlowSensor11.port_b) annotation(
    Line(points = {{148, -98}, {148, -120}, {210, -120}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(rad_parasol_body_4.port_a, thermalConductance5.port_a) annotation(
    Line(points = {{210, -52}, {148, -52}, {148, -78}}, color = {191, 0, 0}, pattern = LinePattern.Dash));
  connect(AmbientAirTemperature.port, heatFlowSensor.port_b) annotation(
    Line(points = {{420, -128}, {40, -128}, {40, -138}}, color = {191, 0, 0}));
  connect(heatFlowSensor7.port_a, convection.fluid) annotation(
    Line(points = {{240, 182}, {240, 140}}, color = {191, 0, 0}));
  connect(heatFlowSensor7.Q_flow, realValue20.numberPort) annotation(
    Line(points = {{250, 172}, {250, 158}, {259, 158}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(heatFlowSensor7.Q_flow, thermalConductance9.u_Q_flow) annotation(
    Line(points = {{250, 172}, {324, 172}, {324, 110}, {332, 110}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  annotation(
    Diagram(graphics = {Text(origin = {-131, -324}, extent = {{103, -10}, {-9, 4}}, textString = "constant T (isothermal animal)"), Text(origin = {-131, -253}, extent = {{91, -17}, {-9, 9}}, textString = "skin
 (subcutaneous fat)")}, coordinateSystem(extent = {{-400, -380}, {440, 300}})),
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}})),
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1));
end ParasolEffect_001;
