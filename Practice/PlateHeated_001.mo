within SystemModels.Practice;

model PlateHeated_001
  extends Modelica.Icons.Example;
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T(displayUnit = "K") = 1800)  annotation(
    Placement(visible = true, transformation(origin = {-190, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature1(T(displayUnit = "K") = 1700)  annotation(
    Placement(visible = true, transformation(origin = {-120, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor(C = 0.001)  annotation(
    Placement(visible = true, transformation(origin = {-190, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor(G = 0.1 * 10 / 0.01)  annotation(
    Placement(visible = true, transformation(origin = {-190, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor1(G = 0.1 * 10 / 0.01) annotation(
    Placement(visible = true, transformation(origin = {-120, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor2(G = 0.1 * 10 / 0.01) annotation(
    Placement(visible = true, transformation(origin = {-50, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor1(C = 0.001) annotation(
    Placement(visible = true, transformation(origin = {-120, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor2(C = 0.001) annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor3(C = 0.001) annotation(
    Placement(visible = true, transformation(origin = {20, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor4(C = 0.001) annotation(
    Placement(visible = true, transformation(origin = {90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor5(C = 0.001) annotation(
    Placement(visible = true, transformation(origin = {150, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor6(C = 0.001) annotation(
    Placement(visible = true, transformation(origin = {90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor7(C = 0.001) annotation(
    Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor8(C = 0.001) annotation(
    Placement(visible = true, transformation(origin = {150, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor9(C = 0.001) annotation(
    Placement(visible = true, transformation(origin = {-190, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor10(C = 0.001) annotation(
    Placement(visible = true, transformation(origin = {20, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor11(C = 0.001) annotation(
    Placement(visible = true, transformation(origin = {-120, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor3(G = 0.1 * 10 / 0.01) annotation(
    Placement(visible = true, transformation(origin = {20, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor4(G = 0.1 * 10 / 0.01) annotation(
    Placement(visible = true, transformation(origin = {90, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor5(G = 0.1 * 10 / 0.01) annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor6(G = 0.1 * 10 / 0.01) annotation(
    Placement(visible = true, transformation(origin = {-190, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor7(G = 0.1 * 10 / 0.01) annotation(
    Placement(visible = true, transformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor8(G = 0.1 * 10 / 0.01) annotation(
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor9(G = 0.1 * 10 / 0.01) annotation(
    Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor10(G = 0.1 * 10 / 0.01) annotation(
    Placement(visible = true, transformation(origin = {90, -60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor11(G = 0.1 * 10 / 0.01) annotation(
    Placement(visible = true, transformation(origin = {-120, -60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor12(G = 0.1 * 10 / 0.01) annotation(
    Placement(visible = true, transformation(origin = {-190, -60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor13(G = 0.1 * 10 / 0.01) annotation(
    Placement(visible = true, transformation(origin = {-50, -60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor14(G = 0.1 * 10 / 0.01) annotation(
    Placement(visible = true, transformation(origin = {20, -60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor15(G =  0.01 * 10 /0.1) annotation(
    Placement(visible = true, transformation(origin = {-160, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor16(G = 0.01 * 10 / 0.1) annotation(
    Placement(visible = true, transformation(origin = {-90, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor17(G = 0.01 * 10 / 0.1) annotation(
    Placement(visible = true, transformation(origin = {-20, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor18(G = 0.01 * 10 / 0.1) annotation(
    Placement(visible = true, transformation(origin = {50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor19(G = 0.01 * 10 / 0.1) annotation(
    Placement(visible = true, transformation(origin = {120, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedHeatFlow(Q_flow = -300)  annotation(
    Placement(visible = true, transformation(origin = {190, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedHeatFlow1(Q_flow = 300)  annotation(
    Placement(visible = true, transformation(origin = {190, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature2(T(displayUnit = "K") = 1600)  annotation(
    Placement(visible = true, transformation(origin = {-50, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature3(T(displayUnit = "K") = 1500)  annotation(
    Placement(visible = true, transformation(origin = {20, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature4(T(displayUnit = "K") = 1400)  annotation(
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature5(T(displayUnit = "K") = 300)  annotation(
    Placement(visible = true, transformation(origin = {-190, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature6(T(displayUnit = "K") = 300)  annotation(
    Placement(visible = true, transformation(origin = {-120, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature7(T(displayUnit = "K") = 600)  annotation(
    Placement(visible = true, transformation(origin = {-50, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature8(T(displayUnit = "K") = 300)  annotation(
    Placement(visible = true, transformation(origin = {20, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature9(T(displayUnit = "K") = 300)  annotation(
    Placement(visible = true, transformation(origin = {90, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor20(G = 0.01 * 10 / 0.1) annotation(
    Placement(visible = true, transformation(origin = {120, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor21(G = 0.01 * 10 / 0.1) annotation(
    Placement(visible = true, transformation(origin = {-20, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor22(G = 0.01 * 10 / 0.1) annotation(
    Placement(visible = true, transformation(origin = {50, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor23(G = 0.01 * 10 / 0.1) annotation(
    Placement(visible = true, transformation(origin = {-90, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor24(G = 0.01 * 10 / 0.1) annotation(
    Placement(visible = true, transformation(origin = {-160, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor annotation(
    Placement(visible = true, transformation(origin = {-179, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 5)  annotation(
    Placement(visible = true, transformation(origin = {-150, 40}, extent = {{-16, -10}, {16, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor1 annotation(
    Placement(visible = true, transformation(origin = {-179, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 5) annotation(
    Placement(visible = true, transformation(origin = {-150, -20}, extent = {{-16, -10}, {16, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor2 annotation(
    Placement(visible = true, transformation(origin = {-110, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor3 annotation(
    Placement(visible = true, transformation(origin = {-110, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue2(significantDigits = 5) annotation(
    Placement(visible = true, transformation(origin = {-81, 40}, extent = {{-16, -10}, {16, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue3(significantDigits = 5) annotation(
    Placement(visible = true, transformation(origin = {-81, -20}, extent = {{-16, -10}, {16, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue4(significantDigits = 5) annotation(
    Placement(visible = true, transformation(origin = {-13, 40}, extent = {{-16, -10}, {16, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor4 annotation(
    Placement(visible = true, transformation(origin = {-42, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue5(significantDigits = 5) annotation(
    Placement(visible = true, transformation(origin = {-13, -20}, extent = {{-16, -10}, {16, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor5 annotation(
    Placement(visible = true, transformation(origin = {-42, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue6(significantDigits = 5) annotation(
    Placement(visible = true, transformation(origin = {57, 40}, extent = {{-16, -10}, {16, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor6 annotation(
    Placement(visible = true, transformation(origin = {28, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor7 annotation(
    Placement(visible = true, transformation(origin = {28, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue7(significantDigits = 5) annotation(
    Placement(visible = true, transformation(origin = {57, -20}, extent = {{-16, -10}, {16, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor8 annotation(
    Placement(visible = true, transformation(origin = {98, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue8(significantDigits = 5) annotation(
    Placement(visible = true, transformation(origin = {127, -20}, extent = {{-16, -10}, {16, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue9(significantDigits = 5) annotation(
    Placement(visible = true, transformation(origin = {127, 40}, extent = {{-16, -10}, {16, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor9 annotation(
    Placement(visible = true, transformation(origin = {98, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue10(significantDigits = 5) annotation(
    Placement(visible = true, transformation(origin = {184, 40}, extent = {{-16, -10}, {16, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor10 annotation(
    Placement(visible = true, transformation(origin = {155, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor11 annotation(
    Placement(visible = true, transformation(origin = {155, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue11(significantDigits = 5) annotation(
    Placement(visible = true, transformation(origin = {184, -20}, extent = {{-16, -10}, {16, 10}}, rotation = 0)));
equation
  connect(fixedTemperature.port, thermalConductor.port_a) annotation(
    Line(points = {{-190, 80}, {-190, 70}}, color = {191, 0, 0}));
  connect(fixedTemperature1.port, thermalConductor1.port_a) annotation(
    Line(points = {{-120, 80}, {-120, 70}}, color = {191, 0, 0}));
  connect(fixedTemperature2.port, thermalConductor2.port_a) annotation(
    Line(points = {{-50, 80}, {-50, 70}}, color = {191, 0, 0}));
  connect(fixedTemperature3.port, thermalConductor3.port_a) annotation(
    Line(points = {{20, 80}, {20, 70}}, color = {191, 0, 0}));
  connect(fixedTemperature4.port, thermalConductor4.port_a) annotation(
    Line(points = {{90, 80}, {90, 70}}, color = {191, 0, 0}));
  connect(thermalConductor.port_b, heatCapacitor.port) annotation(
    Line(points = {{-190, 50}, {-190, 20}}, color = {191, 0, 0}));
  connect(thermalConductor1.port_b, heatCapacitor1.port) annotation(
    Line(points = {{-120, 50}, {-120, 20}}, color = {191, 0, 0}));
  connect(thermalConductor2.port_b, heatCapacitor2.port) annotation(
    Line(points = {{-50, 50}, {-50, 20}}, color = {191, 0, 0}));
  connect(thermalConductor3.port_b, heatCapacitor3.port) annotation(
    Line(points = {{20, 50}, {20, 20}}, color = {191, 0, 0}));
  connect(thermalConductor4.port_b, heatCapacitor4.port) annotation(
    Line(points = {{90, 50}, {90, 20}}, color = {191, 0, 0}));
  connect(heatCapacitor.port, thermalConductor6.port_a) annotation(
    Line(points = {{-190, 20}, {-190, 10}}, color = {191, 0, 0}));
  connect(thermalConductor6.port_b, heatCapacitor9.port) annotation(
    Line(points = {{-190, -10}, {-190, -40}}, color = {191, 0, 0}));
  connect(heatCapacitor9.port, thermalConductor12.port_a) annotation(
    Line(points = {{-190, -40}, {-190, -50}}, color = {191, 0, 0}));
  connect(thermalConductor12.port_b, fixedTemperature5.port) annotation(
    Line(points = {{-190, -70}, {-190, -80}}, color = {191, 0, 0}));
  connect(heatCapacitor.port, thermalConductor15.port_b) annotation(
    Line(points = {{-190, 20}, {-170, 20}}, color = {191, 0, 0}));
  connect(thermalConductor15.port_a, heatCapacitor1.port) annotation(
    Line(points = {{-150, 20}, {-120, 20}}, color = {191, 0, 0}));
  connect(heatCapacitor1.port, thermalConductor16.port_b) annotation(
    Line(points = {{-120, 20}, {-100, 20}}, color = {191, 0, 0}));
  connect(thermalConductor16.port_a, heatCapacitor2.port) annotation(
    Line(points = {{-80, 20}, {-50, 20}}, color = {191, 0, 0}));
  connect(heatCapacitor2.port, thermalConductor17.port_b) annotation(
    Line(points = {{-50, 20}, {-30, 20}}, color = {191, 0, 0}));
  connect(thermalConductor17.port_a, heatCapacitor3.port) annotation(
    Line(points = {{-10, 20}, {20, 20}}, color = {191, 0, 0}));
  connect(heatCapacitor3.port, thermalConductor18.port_b) annotation(
    Line(points = {{20, 20}, {40, 20}}, color = {191, 0, 0}));
  connect(thermalConductor18.port_a, heatCapacitor4.port) annotation(
    Line(points = {{60, 20}, {90, 20}}, color = {191, 0, 0}));
  connect(heatCapacitor4.port, thermalConductor19.port_b) annotation(
    Line(points = {{90, 20}, {110, 20}}, color = {191, 0, 0}));
  connect(thermalConductor19.port_a, heatCapacitor5.port) annotation(
    Line(points = {{130, 20}, {150, 20}}, color = {191, 0, 0}));
  connect(heatCapacitor5.port, fixedHeatFlow.port) annotation(
    Line(points = {{150, 20}, {180, 20}}, color = {191, 0, 0}));
  connect(heatCapacitor1.port, thermalConductor5.port_a) annotation(
    Line(points = {{-120, 20}, {-120, 10}}, color = {191, 0, 0}));
  connect(heatCapacitor2.port, thermalConductor8.port_a) annotation(
    Line(points = {{-50, 20}, {-50, 10}}, color = {191, 0, 0}));
  connect(heatCapacitor3.port, thermalConductor9.port_a) annotation(
    Line(points = {{20, 20}, {20, 10}}, color = {191, 0, 0}));
  connect(heatCapacitor4.port, thermalConductor7.port_a) annotation(
    Line(points = {{90, 20}, {90, 10}}, color = {191, 0, 0}));
  connect(thermalConductor5.port_b, heatCapacitor11.port) annotation(
    Line(points = {{-120, -10}, {-120, -40}}, color = {191, 0, 0}));
  connect(thermalConductor8.port_b, heatCapacitor7.port) annotation(
    Line(points = {{-50, -10}, {-50, -40}}, color = {191, 0, 0}));
  connect(thermalConductor9.port_b, heatCapacitor10.port) annotation(
    Line(points = {{20, -10}, {20, -40}}, color = {191, 0, 0}));
  connect(thermalConductor7.port_b, heatCapacitor6.port) annotation(
    Line(points = {{90, -10}, {90, -40}}, color = {191, 0, 0}));
  connect(heatCapacitor8.port, fixedHeatFlow1.port) annotation(
    Line(points = {{150, -40}, {180, -40}}, color = {191, 0, 0}));
  connect(thermalConductor20.port_a, heatCapacitor8.port) annotation(
    Line(points = {{130, -40}, {150, -40}}, color = {191, 0, 0}));
  connect(heatCapacitor6.port, thermalConductor20.port_b) annotation(
    Line(points = {{90, -40}, {110, -40}}, color = {191, 0, 0}));
  connect(heatCapacitor6.port, thermalConductor10.port_a) annotation(
    Line(points = {{90, -40}, {90, -50}}, color = {191, 0, 0}));
  connect(thermalConductor22.port_a, heatCapacitor6.port) annotation(
    Line(points = {{60, -40}, {90, -40}}, color = {191, 0, 0}));
  connect(heatCapacitor10.port, thermalConductor22.port_b) annotation(
    Line(points = {{20, -40}, {40, -40}}, color = {191, 0, 0}));
  connect(thermalConductor21.port_a, heatCapacitor10.port) annotation(
    Line(points = {{-10, -40}, {20, -40}}, color = {191, 0, 0}));
  connect(heatCapacitor10.port, thermalConductor14.port_a) annotation(
    Line(points = {{20, -40}, {20, -50}}, color = {191, 0, 0}));
  connect(heatCapacitor9.port, thermalConductor24.port_b) annotation(
    Line(points = {{-190, -40}, {-170, -40}}, color = {191, 0, 0}));
  connect(thermalConductor24.port_a, heatCapacitor11.port) annotation(
    Line(points = {{-150, -40}, {-120, -40}}, color = {191, 0, 0}));
  connect(heatCapacitor11.port, thermalConductor23.port_b) annotation(
    Line(points = {{-120, -40}, {-100, -40}}, color = {191, 0, 0}));
  connect(thermalConductor23.port_a, heatCapacitor7.port) annotation(
    Line(points = {{-80, -40}, {-50, -40}}, color = {191, 0, 0}));
  connect(heatCapacitor7.port, thermalConductor21.port_b) annotation(
    Line(points = {{-50, -40}, {-30, -40}}, color = {191, 0, 0}));
  connect(heatCapacitor7.port, thermalConductor13.port_a) annotation(
    Line(points = {{-50, -40}, {-50, -50}}, color = {191, 0, 0}));
  connect(heatCapacitor11.port, thermalConductor11.port_a) annotation(
    Line(points = {{-120, -40}, {-120, -50}}, color = {191, 0, 0}));
  connect(thermalConductor11.port_b, fixedTemperature6.port) annotation(
    Line(points = {{-120, -70}, {-120, -80}}, color = {191, 0, 0}));
  connect(thermalConductor13.port_b, fixedTemperature7.port) annotation(
    Line(points = {{-50, -70}, {-50, -80}}, color = {191, 0, 0}));
  connect(thermalConductor14.port_b, fixedTemperature8.port) annotation(
    Line(points = {{20, -70}, {20, -80}}, color = {191, 0, 0}));
  connect(thermalConductor10.port_b, fixedTemperature9.port) annotation(
    Line(points = {{90, -70}, {90, -80}}, color = {191, 0, 0}));
  connect(heatCapacitor.port, temperatureSensor.port) annotation(
    Line(points = {{-190, 20}, {-190, 40}, {-184, 40}}, color = {191, 0, 0}));
  connect(temperatureSensor.T, realValue.numberPort) annotation(
    Line(points = {{-174, 40}, {-168, 40}}, color = {0, 0, 127}));
  connect(heatCapacitor9.port, temperatureSensor1.port) annotation(
    Line(points = {{-190, -40}, {-190, -20}, {-184, -20}}, color = {191, 0, 0}));
  connect(temperatureSensor2.T, realValue2.numberPort) annotation(
    Line(points = {{-105, 40}, {-101, 40}}, color = {0, 0, 127}));
  connect(temperatureSensor3.T, realValue3.numberPort) annotation(
    Line(points = {{-105, -20}, {-101, -20}}, color = {0, 0, 127}));
  connect(heatCapacitor1.port, temperatureSensor2.port) annotation(
    Line(points = {{-120, 20}, {-120, 40}, {-114, 40}}, color = {191, 0, 0}));
  connect(heatCapacitor11.port, temperatureSensor3.port) annotation(
    Line(points = {{-120, -40}, {-120, -20}, {-114, -20}}, color = {191, 0, 0}));
  connect(heatCapacitor7.port, temperatureSensor5.port) annotation(
    Line(points = {{-50, -40}, {-50, -20}, {-46, -20}}, color = {191, 0, 0}));
  connect(temperatureSensor5.T, realValue5.numberPort) annotation(
    Line(points = {{-36, -20}, {-32, -20}}, color = {0, 0, 127}));
  connect(heatCapacitor2.port, temperatureSensor4.port) annotation(
    Line(points = {{-50, 20}, {-50, 40}, {-46, 40}}, color = {191, 0, 0}));
  connect(temperatureSensor4.T, realValue4.numberPort) annotation(
    Line(points = {{-36, 40}, {-32, 40}}, color = {0, 0, 127}));
  connect(heatCapacitor10.port, temperatureSensor7.port) annotation(
    Line(points = {{20, -40}, {20, -20}, {24, -20}}, color = {191, 0, 0}));
  connect(temperatureSensor7.T, realValue7.numberPort) annotation(
    Line(points = {{34, -20}, {38, -20}}, color = {0, 0, 127}));
  connect(heatCapacitor3.port, temperatureSensor6.port) annotation(
    Line(points = {{20, 20}, {20, 40}, {24, 40}}, color = {191, 0, 0}));
  connect(temperatureSensor6.T, realValue6.numberPort) annotation(
    Line(points = {{34, 40}, {38, 40}}, color = {0, 0, 127}));
  connect(heatCapacitor4.port, temperatureSensor9.port) annotation(
    Line(points = {{90, 20}, {90, 40}, {94, 40}}, color = {191, 0, 0}));
  connect(temperatureSensor9.T, realValue9.numberPort) annotation(
    Line(points = {{104, 40}, {108, 40}}, color = {0, 0, 127}));
  connect(heatCapacitor6.port, temperatureSensor8.port) annotation(
    Line(points = {{90, -40}, {90, -20}, {94, -20}}, color = {191, 0, 0}));
  connect(temperatureSensor8.T, realValue8.numberPort) annotation(
    Line(points = {{104, -20}, {108, -20}}, color = {0, 0, 127}));
  connect(heatCapacitor5.port, temperatureSensor10.port) annotation(
    Line(points = {{150, 20}, {150, 40}}, color = {191, 0, 0}));
  connect(temperatureSensor10.T, realValue10.numberPort) annotation(
    Line(points = {{160, 40}, {166, 40}}, color = {0, 0, 127}));
  connect(heatCapacitor8.port, temperatureSensor11.port) annotation(
    Line(points = {{150, -40}, {150, -20}}, color = {191, 0, 0}));
  connect(temperatureSensor11.T, realValue11.numberPort) annotation(
    Line(points = {{160, -20}, {166, -20}}, color = {0, 0, 127}));
  connect(temperatureSensor1.T, realValue1.numberPort) annotation(
    Line(points = {{-174, -20}, {-168, -20}}, color = {0, 0, 127}));

annotation(
    Diagram(coordinateSystem(extent = {{-200, -140}, {200, 140}})),
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-6, Interval = 0.2),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end PlateHeated_001;
