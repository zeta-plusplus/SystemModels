within SystemModels.Temp;

model tempMdl_002
  parameter Real u=1;
  Real y;
equation
  y= SystemModels.Temp.tempFunc_001(u=u);
end tempMdl_002;
