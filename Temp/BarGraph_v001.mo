within SystemModels.Temp;

model BarGraph_v001

Modelica.Blocks.Interfaces.RealInput u annotation(
      Placement(visible = true, transformation(origin = {-104, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-62, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  equation

  
  annotation(
      Icon(graphics = {
      Rectangle(lineThickness = 2, extent = DynamicSelect({{-40, 100}, {40, -100}},{{-40, 100}, {u, -100}})), 
      Rectangle(visible=true, origin = DynamicSelect({0, 27},{0,u}), fillColor=DynamicSelect({192,192,192}, {125+u*5,125-u*5,125+u*5}), fillPattern = FillPattern.Solid, extent = {{-40, 13}, {40, -13}})}));
      
end BarGraph_v001;
