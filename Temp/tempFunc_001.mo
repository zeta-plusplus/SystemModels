within SystemModels.Temp;

function tempFunc_001
  input Real u;
  output Real y;
protected
  tempMdl_001 tempMdl_001_1 annotation(
    Placement(visible = true, transformation(origin = {-42, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
algorithm
  tempMdl_001_1.u:= u;
  y:= tempMdl_001_1.y;
end tempFunc_001;
