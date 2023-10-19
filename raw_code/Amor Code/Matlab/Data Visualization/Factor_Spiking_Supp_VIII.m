
function Factor_Spiking_Supp_VIII


clear all;
close all;
clc;

figure(1)
clf

options = optimset('MaxFunEvals',1e6,'MaxIter',1e6,'TolFun',1e-6,'TolX',1e-6);

DelFactorVIII14488 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','I23:I29');
a0DelFactorVIII14488 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','B23:B29');
a1DelFactorVIII14488 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','C23:C29');
a2DelFactorVIII14488 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','D23:D29');
bDelFactorVIII14488 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','E23:E29');
KDelFactorVIII14488 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','G23:G29');
pDelFactorVIII14488 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','K23:K29');
omeganDelFactorVIII14488 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','L23:L29');
TDelFactorVIII14488 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','F23:F29');

[fita0DelFactorVIII14488factors,resfita0DelFactorVIII14488norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14488,a0DelFactorVIII14488,[],[],options)
[fita1DelFactorVIII14488factors,resfita1DelFactorVIII14488norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14488,a1DelFactorVIII14488,[],[],options)
[fita2DelFactorVIII14488factors,resfita2DelFactorVIII14488norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14488,a2DelFactorVIII14488,[],[],options)
[fitbDelFactorVIII14488factors,resfitbDelFactorVIII14488norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14488,bDelFactorVIII14488,[],[],options)
[fitKDelFactorVIII14488factors,resfitkDelFactorVIII14488norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14488,KDelFactorVIII14488,[],[],options)
[fitpDelFactorVIII14488factors,resfitpDelFactorVIII14488norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14488,pDelFactorVIII14488,[],[],options)
[fitomeganDelFactorVIII14488factors,resfitomeganDelFactorVIII14488norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14488,omeganDelFactorVIII14488,[],[],options)
[fitTDelFactorVIII14488factors,resfitTDelFactorVIII14488norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14488,TDelFactorVIII14488,[],[],options)


DelFactorVIII14489 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','I31:I38');
a0DelFactorVIII14489 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','B31:B38');
a1DelFactorVIII14489 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','C31:C38');
a2DelFactorVIII14489 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','D31:D38');
bDelFactorVIII14489 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','E31:E38');
KDelFactorVIII14489 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','G31:G38');
pDelFactorVIII14489 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','K31:K38');
omeganDelFactorVIII14489 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','L31:L38');
TDelFactorVIII14489 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','F31:F38');

[fita0DelFactorVIII14489factors,resfita0DelFactorVIII14489norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14489,a0DelFactorVIII14489,[],[],options)
[fita1DelFactorVIII14489factors,resfita1DelFactorVIII14489norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14489,a1DelFactorVIII14489,[],[],options)
[fita2DelFactorVIII14489factors,resfita2DelFactorVIII14489norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14489,a2DelFactorVIII14489,[],[],options)
[fitbDelFactorVIII14489factors,resfitbDelFactorVIII14489norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14489,bDelFactorVIII14489,[],[],options)
[fitKDelFactorVIII14489factors,resfitkDelFactorVIII14489norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14489,KDelFactorVIII14489,[],[],options)
[fitpDelFactorVIII14489factors,resfitpDelFactorVIII14489norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14489,pDelFactorVIII14489,[],[],options)
[fitomeganDelFactorVIII14489factors,resfitomeganDelFactorVIII14489norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14489,omeganDelFactorVIII14489,[],[],options)
[fitTDelFactorVIII14489factors,resfitTDelFactorVIII14489norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14489,TDelFactorVIII14489,[],[],options)


DelFactorVIII14490 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','I40:I45');
a0DelFactorVIII14490 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','B40:B45');
a1DelFactorVIII14490 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','C40:C45');
a2DelFactorVIII14490 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','D40:D45');
bDelFactorVIII14490 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','E40:E45');
KDelFactorVIII14490 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','G40:G45');
pDelFactorVIII14490 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','K40:K45');
omeganDelFactorVIII14490 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','L40:L45');
TDelFactorVIII14490 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','F40:F45');

[fita0DelFactorVIII14490factors,resfita0DelFactorVIII14490norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14490,a0DelFactorVIII14490,[],[],options)
[fita1DelFactorVIII14490factors,resfita1DelFactorVIII14490norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14490,a1DelFactorVIII14490,[],[],options)
[fita2DelFactorVIII14490factors,resfita2DelFactorVIII14490norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14490,a2DelFactorVIII14490,[],[],options)
[fitbDelFactorVIII14490factors,resfitbDelFactorVIII14490norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14490,bDelFactorVIII14490,[],[],options)
[fitKDelFactorVIII14490factors,resfitkDelFactorVIII14490norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14490,KDelFactorVIII14490,[],[],options)
[fitpDelFactorVIII14490factors,resfitpDelFactorVIII14490norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14490,pDelFactorVIII14490,[],[],options)
[fitomeganDelFactorVIII14490factors,resfitomeganDelFactorVIII14490norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14490,omeganDelFactorVIII14490,[],[],options)
[fitTDelFactorVIII14490factors,resfitTDelFactorVIII14490norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14490,TDelFactorVIII14490,[],[],options)


DelFactorVIII14492 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','I48:I54');
a0DelFactorVIII14492 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','B48:B54');
a1DelFactorVIII14492 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','C48:C54');
a2DelFactorVIII14492 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','D48:D54');
bDelFactorVIII14492 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','E48:E54');
KDelFactorVIII14492 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','G48:G54');
pDelFactorVIII14492 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','K48:K54');
omeganDelFactorVIII14492 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','L48:L54');
TDelFactorVIII14492 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','F48:F54');

[fita0DelFactorVIII14492factors,resfita0DelFactorVIII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14492,a0DelFactorVIII14492,[],[],options)
[fita1DelFactorVIII14492factors,resfita1DelFactorVIII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14492,a1DelFactorVIII14492,[],[],options)
[fita2DelFactorVIII14492factors,resfita2DelFactorVIII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14492,a2DelFactorVIII14492,[],[],options)
[fitbDelFactorVIII14492factors,resfitbDelFactorVIII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14492,bDelFactorVIII14492,[],[],options)
[fitKDelFactorVIII14492factors,resfitkDelFactorVIII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14492,KDelFactorVIII14492,[],[],options)
[fitpDelFactorVIII14492factors,resfitpDelFactorVIII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14492,pDelFactorVIII14492,[],[],options)
[fitomeganDelFactorVIII14492factors,resfitomeganDelFactorVIII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14492,omeganDelFactorVIII14492,[],[],options)
[fitTDelFactorVIII14492factors,resfitTDelFactorVIII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14492,TDelFactorVIII14492,[],[],options)


DelFactorVIII14494 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','I57:I63');
a0DelFactorVIII14494 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','B57:B63');
a1DelFactorVIII14494 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','C57:C63');
a2DelFactorVIII14494 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','D57:D63');
bDelFactorVIII14494 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','E57:E63');
KDelFactorVIII14494 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','G57:G63');
pDelFactorVIII14494 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','K57:K63');
omeganDelFactorVIII14494 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','L57:L63');
TDelFactorVIII14494 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','F57:F63');

[fita0DelFactorVIII14494factors,resfita0DelFactorVIII14494norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14494,a0DelFactorVIII14494,[],[],options)
[fita1DelFactorVIII14494factors,resfita1DelFactorVIII14494norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14494,a1DelFactorVIII14494,[],[],options)
[fita2DelFactorVIII14494factors,resfita2DelFactorVIII14494norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14494,a2DelFactorVIII14494,[],[],options)
[fitbDelFactorVIII14494factors,resfitbDelFactorVIII14494norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14494,bDelFactorVIII14494,[],[],options)
[fitKDelFactorVIII14494factors,resfitkDelFactorVIII14494norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14494,KDelFactorVIII14494,[],[],options)
[fitpDelFactorVIII14494factors,resfitpDelFactorVIII14494norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14494,pDelFactorVIII14494,[],[],options)
[fitomeganDelFactorVIII14494factors,resfitomeganDelFactorVIII14494norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14494,omeganDelFactorVIII14494,[],[],options)
[fitTDelFactorVIII14494factors,resfitTDelFactorVIII14494norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14494,TDelFactorVIII14494,[],[],options)


DelFactorVIII14500 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','I65:I69');
a0DelFactorVIII14500 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','B65:B69');
a1DelFactorVIII14500 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','C65:C69');
a2DelFactorVIII14500 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','D65:D69');
bDelFactorVIII14500 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','E65:E69');
KDelFactorVIII14500 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','G65:G69');
pDelFactorVIII14500 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','K65:K69');
omeganDelFactorVIII14500 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','L65:L69');
TDelFactorVIII14500 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','F65:F69');

[fita0DelFactorVIII14500factors,resfita0DelFactorVIII14500norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14500,a0DelFactorVIII14500,[],[],options)
[fita1DelFactorVIII14500factors,resfita1DelFactorVIII14500norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14500,a1DelFactorVIII14500,[],[],options)
[fita2DelFactorVIII14500factors,resfita2DelFactorVIII14500norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14500,a2DelFactorVIII14500,[],[],options)
[fitbDelFactorVIII14500factors,resfitbDelFactorVIII14500norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14500,bDelFactorVIII14500,[],[],options)
[fitKDelFactorVIII14500factors,resfitkDelFactorVIII14500norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14500,KDelFactorVIII14500,[],[],options)
[fitpDelFactorVIII14500factors,resfitpDelFactorVIII14500norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14500,pDelFactorVIII14500,[],[],options)
[fitomeganDelFactorVIII14500factors,resfitomeganDelFactorVIII14500norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14500,omeganDelFactorVIII14500,[],[],options)
[fitTDelFactorVIII14500factors,resfitTDelFactorVIII14500norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14500,TDelFactorVIII14500,[],[],options)


DelFactorVIII14501 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','I71:I75');
a0DelFactorVIII14501 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','B71:B75');
a1DelFactorVIII14501 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','C71:C75');
a2DelFactorVIII14501 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','D71:D75');
bDelFactorVIII14501 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','E71:E75');
KDelFactorVIII14501 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','G71:G75');
pDelFactorVIII14501 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','K71:K75');
omeganDelFactorVIII14501 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','L71:L75');
TDelFactorVIII14501 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','F71:F75');

[fita0DelFactorVIII14501factors,resfita0DelFactorVIII14501norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14501,a0DelFactorVIII14501,[],[],options)
[fita1DelFactorVIII14501factors,resfita1DelFactorVIII14501norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14501,a1DelFactorVIII14501,[],[],options)
[fita2DelFactorVIII14501factors,resfita2DelFactorVIII14501norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14501,a2DelFactorVIII14501,[],[],options)
[fitbDelFactorVIII14501factors,resfitbDelFactorVIII14501norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14501,bDelFactorVIII14501,[],[],options)
[fitKDelFactorVIII14501factors,resfitkDelFactorVIII14501norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14501,KDelFactorVIII14501,[],[],options)
[fitpDelFactorVIII14501factors,resfitpDelFactorVIII14501norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14501,pDelFactorVIII14501,[],[],options)
[fitomeganDelFactorVIII14501factors,resfitomeganDelFactorVIII14501norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14501,omeganDelFactorVIII14501,[],[],options)
[fitTDelFactorVIII14501factors,resfitTDelFactorVIII14501norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14501,TDelFactorVIII14501,[],[],options)


DelFactorVIII14504 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','I77:I80');
a0DelFactorVIII14504 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','B77:B80');
a1DelFactorVIII14504 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','C77:C80');
a2DelFactorVIII14504 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','D77:D80');
bDelFactorVIII14504 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','E77:E80');
KDelFactorVIII14504 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','G77:G80');
pDelFactorVIII14504 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','K77:K80');
omeganDelFactorVIII14504 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','L77:L80');
TDelFactorVIII14504 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','F77:F80');

[fita0DelFactorVIII14504factors,resfita0DelFactorVIII14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14504,a0DelFactorVIII14504,[],[],options)
[fita1DelFactorVIII14504factors,resfita1DelFactorVIII14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14504,a1DelFactorVIII14504,[],[],options)
[fita2DelFactorVIII14504factors,resfita2DelFactorVIII14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14504,a2DelFactorVIII14504,[],[],options)
[fitbDelFactorVIII14504factors,resfitbDelFactorVIII14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14504,bDelFactorVIII14504,[],[],options)
[fitKDelFactorVIII14504factors,resfitkDelFactorVIII14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14504,KDelFactorVIII14504,[],[],options)
[fitpDelFactorVIII14504factors,resfitpDelFactorVIII14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14504,pDelFactorVIII14504,[],[],options)
[fitomeganDelFactorVIII14504factors,resfitomeganDelFactorVIII14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14504,omeganDelFactorVIII14504,[],[],options)
[fitTDelFactorVIII14504factors,resfitTDelFactorVIII14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14504,TDelFactorVIII14504,[],[],options)


DelFactorVIII14506 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','I82:I88');
a0DelFactorVIII14506 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','B82:B88');
a1DelFactorVIII14506 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','C82:C88');
a2DelFactorVIII14506 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','D82:D88');
bDelFactorVIII14506 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','E82:E88');
KDelFactorVIII14506 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','G82:G88');
pDelFactorVIII14506 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','K82:K88');
omeganDelFactorVIII14506 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','L82:L88');
TDelFactorVIII14506 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','F82:F88');

[fita0DelFactorVIII14506factors,resfita0DelFactorVIII14506norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14506,a0DelFactorVIII14506,[],[],options)
[fita1DelFactorVIII14506factors,resfita1DelFactorVIII14506norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14506,a1DelFactorVIII14506,[],[],options)
[fita2DelFactorVIII14506factors,resfita2DelFactorVIII14506norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14506,a2DelFactorVIII14506,[],[],options)
[fitbDelFactorVIII14506factors,resfitbDelFactorVIII14506norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14506,bDelFactorVIII14506,[],[],options)
[fitKDelFactorVIII14506factors,resfitkDelFactorVIII14506norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14506,KDelFactorVIII14506,[],[],options)
[fitpDelFactorVIII14506factors,resfitpDelFactorVIII14506norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14506,pDelFactorVIII14506,[],[],options)
[fitomeganDelFactorVIII14506factors,resfitomeganDelFactorVIII14506norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14506,omeganDelFactorVIII14506,[],[],options)
[fitTDelFactorVIII14506factors,resfitTDelFactorVIII14506norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14506,TDelFactorVIII14506,[],[],options)


DelFactorVIII14507 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','I90:I96');
a0DelFactorVIII14507 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','B90:B96');
a1DelFactorVIII14507 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','C90:C96');
a2DelFactorVIII14507 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','D90:D96');
bDelFactorVIII14507 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','E90:E96');
KDelFactorVIII14507 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','G90:G96');
pDelFactorVIII14507 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','K90:K96');
omeganDelFactorVIII14507 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','L90:L96');
TDelFactorVIII14507 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','F90:F96');

[fita0DelFactorVIII14507factors,resfita0DelFactorVIII14507norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14507,a0DelFactorVIII14507,[],[],options)
[fita1DelFactorVIII14507factors,resfita1DelFactorVIII14507norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14507,a1DelFactorVIII14507,[],[],options)
[fita2DelFactorVIII14507factors,resfita2DelFactorVIII14507norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14507,a2DelFactorVIII14507,[],[],options)
[fitbDelFactorVIII14507factors,resfitbDelFactorVIII14507norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14507,bDelFactorVIII14507,[],[],options)
[fitKDelFactorVIII14507factors,resfitkDelFactorVIII14507norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14507,KDelFactorVIII14507,[],[],options)
[fitpDelFactorVIII14507factors,resfitpDelFactorVIII14507norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14507,pDelFactorVIII14507,[],[],options)
[fitomeganDelFactorVIII14507factors,resfitomeganDelFactorVIII14507norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14507,omeganDelFactorVIII14507,[],[],options)
[fitTDelFactorVIII14507factors,resfitTDelFactorVIII14507norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14507,TDelFactorVIII14507,[],[],options)

%%

subplot(2,2,3)

h(1) = plot([0:100:1000],fita0DelFactorVIII14488factors(1)*[0:100:1000]+fita0DelFactorVIII14488factors(2),'r-.','LineWidth',6)
hold on
plot(DelFactorVIII14488,a0DelFactorVIII14488,'ro','LineWidth',6,'MarkerSize',12);
grid on
box on
h(2) = plot([0:100:1000],fita0DelFactorVIII14489factors(1)*[0:100:1000]+fita0DelFactorVIII14489factors(2),'g--','LineWidth',6)
plot(DelFactorVIII14489,a0DelFactorVIII14489,'gd','LineWidth',6,'MarkerSize',12);
h(3) = plot([0:100:1000],fita0DelFactorVIII14490factors(1)*[0:100:1000]+fita0DelFactorVIII14490factors(2),'b-','LineWidth',6)
plot(DelFactorVIII14490,a0DelFactorVIII14490,'bs','LineWidth',6,'MarkerSize',12);
h(4) = plot([0:100:1000],fita0DelFactorVIII14492factors(1)*[0:100:1000]+fita0DelFactorVIII14492factors(2),'m:','LineWidth',6)
plot(DelFactorVIII14492,a0DelFactorVIII14492,'m^','LineWidth',6,'MarkerSize',12);
h(5) = plot([0:100:1000],fita0DelFactorVIII14494factors(1)*[0:100:1000]+fita0DelFactorVIII14494factors(2),'-.','LineWidth',6,'Color',[1 0.5 0])
plot(DelFactorVIII14494,a0DelFactorVIII14494,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)
h(6) = plot([0:100:1000],fita0DelFactorVIII14500factors(1)*[0:100:1000]+fita0DelFactorVIII14500factors(2),'c--','LineWidth',6)
plot(DelFactorVIII14500,a0DelFactorVIII14500,'c*','LineWidth',6,'MarkerSize',12)
h(7) = plot([0:100:1100],fita0DelFactorVIII14501factors(1)*[0:100:1100]+fita0DelFactorVIII14501factors(2),':','LineWidth',6,'Color',[0.5 0.5 0.5])
plot(DelFactorVIII14501,a0DelFactorVIII14501,'x','MarkerEdgeColor',[0.5 0.5 0.5],'LineWidth',6,'MarkerSize',12)
h(8) = plot([0:100:1100],fita0DelFactorVIII14504factors(1)*[0:100:1100]+fita0DelFactorVIII14504factors(2),'-.','LineWidth',6,'Color',[0 0.5 1])
plot(DelFactorVIII14504,a0DelFactorVIII14504,'v','MarkerEdgeColor',[0 0.5 1],'LineWidth',6,'MarkerSize',12)
h(9) = plot([0:100:1100],fita0DelFactorVIII14506factors(1)*[0:100:1100]+fita0DelFactorVIII14506factors(2),'--','LineWidth',6,'Color',[0.75 0.75 0])
plot(DelFactorVIII14506,a0DelFactorVIII14506,'<','MarkerEdgeColor',[0.75 0.75 0],'LineWidth',6,'MarkerSize',12)
h(10) = plot([0:100:1100],fita0DelFactorVIII14507factors(1)*[0:100:1100]+fita0DelFactorVIII14507factors(2),'-','LineWidth',6,'Color',[0.75 0 0.75])
plot(DelFactorVIII14507,a0DelFactorVIII14507,'>','MarkerEdgeColor',[0.75 0 0.75],'LineWidth',6,'MarkerSize',12)

xlabel('VIII Concentration Increase [%-activity]')
ylabel('a_0')
tG = title('G');
axis([0 900 0 1.05])
lG = legend([h(1) h(2) h(3) h(4) h(5) h(6) h(7) h(8) h(9) h(10)],{'#14488','#14489','#14490','#14492','#14494','#14500','#14501','#14504','#14506','#14507'})

figureHandle = gcf;
%# make all text in the figure to size 20 %and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)



subplot(2,2,2)

h(1) = plot([0:100:1000],fita1DelFactorVIII14488factors(1)*[0:100:1000]+fita1DelFactorVIII14488factors(2),'r-.','LineWidth',6)
hold on
plot(DelFactorVIII14488,a1DelFactorVIII14488,'ro','LineWidth',6,'MarkerSize',12);
grid on
box on
h(2) = plot([0:100:1000],fita1DelFactorVIII14489factors(1)*[0:100:1000]+fita1DelFactorVIII14489factors(2),'g--','LineWidth',6)
plot(DelFactorVIII14489,a1DelFactorVIII14489,'gd','LineWidth',6,'MarkerSize',12);
h(3) = plot([0:100:1000],fita1DelFactorVIII14490factors(1)*[0:100:1000]+fita1DelFactorVIII14490factors(2),'b-','LineWidth',6)
plot(DelFactorVIII14490,a1DelFactorVIII14490,'bs','LineWidth',6,'MarkerSize',12);
h(4) = plot([0:100:1000],fita1DelFactorVIII14492factors(1)*[0:100:1000]+fita1DelFactorVIII14492factors(2),'m:','LineWidth',6)
plot(DelFactorVIII14492,a1DelFactorVIII14492,'m^','LineWidth',6,'MarkerSize',12);
h(5) = plot([0:100:1000],fita1DelFactorVIII14494factors(1)*[0:100:1000]+fita1DelFactorVIII14494factors(2),'-.','LineWidth',6,'Color',[1 0.5 0])
plot(DelFactorVIII14494,a1DelFactorVIII14494,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)
h(6) = plot([0:100:1000],fita1DelFactorVIII14500factors(1)*[0:100:1000]+fita1DelFactorVIII14500factors(2),'c--','LineWidth',6)
plot(DelFactorVIII14500,a1DelFactorVIII14500,'c*','LineWidth',6,'MarkerSize',12)
h(7) = plot([0:100:1100],fita1DelFactorVIII14501factors(1)*[0:100:1100]+fita1DelFactorVIII14501factors(2),':','LineWidth',6,'Color',[0.5 0.5 0.5])
plot(DelFactorVIII14501,a1DelFactorVIII14501,'x','MarkerEdgeColor',[0.5 0.5 0.5],'LineWidth',6,'MarkerSize',12)
h(8) = plot([0:100:1100],fita1DelFactorVIII14504factors(1)*[0:100:1100]+fita1DelFactorVIII14504factors(2),'-.','LineWidth',6,'Color',[0 0.5 1])
plot(DelFactorVIII14504,a1DelFactorVIII14504,'v','MarkerEdgeColor',[0 0.5 1],'LineWidth',6,'MarkerSize',12)
h(9) = plot([0:100:1100],fita1DelFactorVIII14506factors(1)*[0:100:1100]+fita1DelFactorVIII14506factors(2),'--','LineWidth',6,'Color',[0.75 0.75 0])
plot(DelFactorVIII14506,a1DelFactorVIII14506,'<','MarkerEdgeColor',[0.75 0.75 0],'LineWidth',6,'MarkerSize',12)
h(10) = plot([0:100:1100],fita1DelFactorVIII14507factors(1)*[0:100:1100]+fita1DelFactorVIII14507factors(2),'-','LineWidth',6,'Color',[0.75 0 0.75])
plot(DelFactorVIII14507,a1DelFactorVIII14507,'>','MarkerEdgeColor',[0.75 0 0.75],'LineWidth',6,'MarkerSize',12)

xlabel('VIII Concentration Increase [%-activity]')
ylabel('a_1')
tF = title('F');
axis([0 900 0 3.5])
lF = legend([h(1) h(2) h(3) h(4) h(5) h(6) h(7) h(8) h(9) h(10)],{'#14488','#14489','#14490','#14492','#14494','#14500','#14501','#14504','#14506','#14507'})

figureHandle = gcf;
%# make all text in the figure to size 20 %and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)



subplot(2,2,1)

h(1) = plot([0:100:1000],fita2DelFactorVIII14488factors(1)*[0:100:1000]+fita2DelFactorVIII14488factors(2),'r-.','LineWidth',6)
hold on
plot(DelFactorVIII14488,a2DelFactorVIII14488,'ro','LineWidth',6,'MarkerSize',12);
grid on
box on
h(2) = plot([0:100:1000],fita2DelFactorVIII14489factors(1)*[0:100:1000]+fita2DelFactorVIII14489factors(2),'g--','LineWidth',6)
plot(DelFactorVIII14489,a2DelFactorVIII14489,'gd','LineWidth',6,'MarkerSize',12);
h(3) = plot([0:100:1000],fita2DelFactorVIII14490factors(1)*[0:100:1000]+fita2DelFactorVIII14490factors(2),'b-','LineWidth',6)
plot(DelFactorVIII14490,a2DelFactorVIII14490,'bs','LineWidth',6,'MarkerSize',12);
h(4) = plot([0:100:1000],fita2DelFactorVIII14492factors(1)*[0:100:1000]+fita2DelFactorVIII14492factors(2),'m:','LineWidth',6)
plot(DelFactorVIII14492,a2DelFactorVIII14492,'m^','LineWidth',6,'MarkerSize',12);
h(5) = plot([0:100:1000],fita2DelFactorVIII14494factors(1)*[0:100:1000]+fita2DelFactorVIII14494factors(2),'-.','LineWidth',6,'Color',[1 0.5 0])
plot(DelFactorVIII14494,a2DelFactorVIII14494,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)
h(6) = plot([0:100:1000],fita2DelFactorVIII14500factors(1)*[0:100:1000]+fita2DelFactorVIII14500factors(2),'c--','LineWidth',6)
plot(DelFactorVIII14500,a2DelFactorVIII14500,'c*','LineWidth',6,'MarkerSize',12)
h(7) = plot([0:100:1100],fita2DelFactorVIII14501factors(1)*[0:100:1100]+fita2DelFactorVIII14501factors(2),':','LineWidth',6,'Color',[0.5 0.5 0.5])
plot(DelFactorVIII14501,a2DelFactorVIII14501,'x','MarkerEdgeColor',[0.5 0.5 0.5],'LineWidth',6,'MarkerSize',12)
h(8) = plot([0:100:1100],fita2DelFactorVIII14504factors(1)*[0:100:1100]+fita2DelFactorVIII14504factors(2),'-.','LineWidth',6,'Color',[0 0.5 1])
plot(DelFactorVIII14504,a2DelFactorVIII14504,'v','MarkerEdgeColor',[0 0.5 1],'LineWidth',6,'MarkerSize',12)
h(9) = plot([0:100:1100],fita2DelFactorVIII14506factors(1)*[0:100:1100]+fita2DelFactorVIII14506factors(2),'--','LineWidth',6,'Color',[0.75 0.75 0])
plot(DelFactorVIII14506,a2DelFactorVIII14506,'<','MarkerEdgeColor',[0.75 0.75 0],'LineWidth',6,'MarkerSize',12)
h(10) = plot([0:100:1100],fita2DelFactorVIII14507factors(1)*[0:100:1100]+fita2DelFactorVIII14507factors(2),'-','LineWidth',6,'Color',[0.75 0 0.75])
plot(DelFactorVIII14507,a2DelFactorVIII14507,'>','MarkerEdgeColor',[0.75 0 0.75],'LineWidth',6,'MarkerSize',12)

xlabel('VIII Concentration Increase [%-activity]')
ylabel('a_2')
tE = title('E');
axis([0 900 0.9 3])
lE = legend([h(1) h(2) h(3) h(4) h(5) h(6) h(7) h(8) h(9) h(10)],{'#14488','#14489','#14490','#14492','#14494','#14500','#14501','#14504','#14506','#14507'})

figureHandle = gcf;
%# make all text in the figure to size 20 %and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)



subplot(2,2,4)

h(1) = plot([0:100:1000],fitbDelFactorVIII14488factors(1)*[0:100:1000]+fitbDelFactorVIII14488factors(2),'r-.','LineWidth',6)
hold on
plot(DelFactorVIII14488,bDelFactorVIII14488,'ro','LineWidth',6,'MarkerSize',12);
grid on
box on
h(2) = plot([0:100:1000],fitbDelFactorVIII14489factors(1)*[0:100:1000]+fitbDelFactorVIII14489factors(2),'g--','LineWidth',6)
plot(DelFactorVIII14489,bDelFactorVIII14489,'gd','LineWidth',6,'MarkerSize',12);
h(3) = plot([0:100:1000],fitbDelFactorVIII14490factors(1)*[0:100:1000]+fitbDelFactorVIII14490factors(2),'b-','LineWidth',6)
plot(DelFactorVIII14490,bDelFactorVIII14490,'bs','LineWidth',6,'MarkerSize',12);
h(4) = plot([0:100:1000],fitbDelFactorVIII14492factors(1)*[0:100:1000]+fitbDelFactorVIII14492factors(2),'m:','LineWidth',6)
plot(DelFactorVIII14492,bDelFactorVIII14492,'m^','LineWidth',6,'MarkerSize',12);
h(5) = plot([0:100:1000],fitbDelFactorVIII14494factors(1)*[0:100:1000]+fitbDelFactorVIII14494factors(2),'-.','LineWidth',6,'Color',[1 0.5 0])
plot(DelFactorVIII14494,bDelFactorVIII14494,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)
h(6) = plot([0:100:1000],fitbDelFactorVIII14500factors(1)*[0:100:1000]+fitbDelFactorVIII14500factors(2),'c--','LineWidth',6)
plot(DelFactorVIII14500,bDelFactorVIII14500,'c*','LineWidth',6,'MarkerSize',12)
h(7) = plot([0:100:1100],fitbDelFactorVIII14501factors(1)*[0:100:1100]+fitbDelFactorVIII14501factors(2),':','LineWidth',6,'Color',[0.5 0.5 0.5])
plot(DelFactorVIII14501,bDelFactorVIII14501,'x','MarkerEdgeColor',[0.5 0.5 0.5],'LineWidth',6,'MarkerSize',12)
h(8) = plot([0:100:1100],fitbDelFactorVIII14504factors(1)*[0:100:1100]+fitbDelFactorVIII14504factors(2),'-.','LineWidth',6,'Color',[0 0.5 1])
plot(DelFactorVIII14504,bDelFactorVIII14504,'v','MarkerEdgeColor',[0 0.5 1],'LineWidth',6,'MarkerSize',12)
h(9) = plot([0:100:1100],fitbDelFactorVIII14506factors(1)*[0:100:1100]+fitbDelFactorVIII14506factors(2),'--','LineWidth',6,'Color',[0.75 0.75 0])
plot(DelFactorVIII14506,bDelFactorVIII14506,'<','MarkerEdgeColor',[0.75 0.75 0],'LineWidth',6,'MarkerSize',12)
h(10) = plot([0:100:1100],fitbDelFactorVIII14507factors(1)*[0:100:1100]+fitbDelFactorVIII14507factors(2),'-','LineWidth',6,'Color',[0.75 0 0.75])
plot(DelFactorVIII14507,bDelFactorVIII14507,'>','MarkerEdgeColor',[0.75 0 0.75],'LineWidth',6,'MarkerSize',12)

xlabel('VIII Concentration Increase [%-activity]')
ylabel('b')
tH = title('H');
axis([0 900 0 25.5])
lH = legend([h(1) h(2) h(3) h(4) h(5) h(6) h(7) h(8) h(9) h(10)],{'#14488','#14489','#14490','#14492','#14494','#14500','#14501','#14504','#14506','#14507'})

figureHandle = gcf;
%# make all text in the figure to size 20 %and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)

set(tE, 'FontSize',31, 'FontWeight', 'bold')
set(tF, 'FontSize',31, 'FontWeight', 'bold')
set(tG, 'FontSize',31, 'FontWeight', 'bold')
set(tH, 'FontSize',31, 'FontWeight', 'bold')

set(lE, 'FontSize',20)
set(lF, 'FontSize',20)
set(lG, 'FontSize',20)
set(lH, 'FontSize',20)
%%

figure(2)
clf


subplot(2,2,3)

h(1) = plot([0:100:1000],fitomeganDelFactorVIII14488factors(1)*[0:100:1000]+fitomeganDelFactorVIII14488factors(2),'r-.','LineWidth',6)
hold on
plot(DelFactorVIII14488,omeganDelFactorVIII14488,'ro','LineWidth',6,'MarkerSize',12);
grid on
box on
h(2) = plot([0:100:1000],fitomeganDelFactorVIII14489factors(1)*[0:100:1000]+fitomeganDelFactorVIII14489factors(2),'g--','LineWidth',6)
plot(DelFactorVIII14489,omeganDelFactorVIII14489,'gd','LineWidth',6,'MarkerSize',12);
h(3) = plot([0:100:1000],fitomeganDelFactorVIII14490factors(1)*[0:100:1000]+fitomeganDelFactorVIII14490factors(2),'b-','LineWidth',6)
plot(DelFactorVIII14490,omeganDelFactorVIII14490,'bs','LineWidth',6,'MarkerSize',12);
h(4) = plot([0:100:1000],fitomeganDelFactorVIII14492factors(1)*[0:100:1000]+fitomeganDelFactorVIII14492factors(2),'m:','LineWidth',6)
plot(DelFactorVIII14492,omeganDelFactorVIII14492,'m^','LineWidth',6,'MarkerSize',12);
h(5) = plot([0:100:1000],fitomeganDelFactorVIII14494factors(1)*[0:100:1000]+fitomeganDelFactorVIII14494factors(2),'-.','LineWidth',6,'Color',[1 0.5 0])
plot(DelFactorVIII14494,omeganDelFactorVIII14494,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)
h(6) = plot([0:100:1000],fitomeganDelFactorVIII14500factors(1)*[0:100:1000]+fitomeganDelFactorVIII14500factors(2),'c--','LineWidth',6)
plot(DelFactorVIII14500,omeganDelFactorVIII14500,'c*','LineWidth',6,'MarkerSize',12)
h(7) = plot([0:100:1100],fitomeganDelFactorVIII14501factors(1)*[0:100:1100]+fitomeganDelFactorVIII14501factors(2),':','LineWidth',6,'Color',[0.5 0.5 0.5])
plot(DelFactorVIII14501,omeganDelFactorVIII14501,'x','MarkerEdgeColor',[0.5 0.5 0.5],'LineWidth',6,'MarkerSize',12)
h(8) = plot([0:100:1100],fitomeganDelFactorVIII14504factors(1)*[0:100:1100]+fitomeganDelFactorVIII14504factors(2),'-.','LineWidth',6,'Color',[0 0.5 1])
plot(DelFactorVIII14504,omeganDelFactorVIII14504,'v','MarkerEdgeColor',[0 0.5 1],'LineWidth',6,'MarkerSize',12)
h(9) = plot([0:100:1100],fitomeganDelFactorVIII14506factors(1)*[0:100:1100]+fitomeganDelFactorVIII14506factors(2),'--','LineWidth',6,'Color',[0.75 0.75 0])
plot(DelFactorVIII14506,omeganDelFactorVIII14506,'<','MarkerEdgeColor',[0.75 0.75 0],'LineWidth',6,'MarkerSize',12)
h(10) = plot([0:100:1100],fitomeganDelFactorVIII14507factors(1)*[0:100:1100]+fitomeganDelFactorVIII14507factors(2),'-','LineWidth',6,'Color',[0.75 0 0.75])
plot(DelFactorVIII14507,omeganDelFactorVIII14507,'>','MarkerEdgeColor',[0.75 0 0.75],'LineWidth',6,'MarkerSize',12)

xlabel('VIII Concentration Increase [%-activity]')
ylabel('\omega_n')
tK = title('K');
axis([0 900 0.4 1.65])
lK = legend([h(1) h(2) h(3) h(4) h(5) h(6) h(7) h(8) h(9) h(10)],{'#14488','#14489','#14490','#14492','#14494','#14500','#14501','#14504','#14506','#14507'})

figureHandle = gcf;
%# make all text in the figure to size 20 %and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)



subplot(2,2,2)

h(1) = plot([0:100:1000],fitpDelFactorVIII14488factors(1)*[0:100:1000]+fitpDelFactorVIII14488factors(2),'r-.','LineWidth',6)
hold on
plot(DelFactorVIII14488,pDelFactorVIII14488,'ro','LineWidth',6,'MarkerSize',12);
grid on
box on
h(2) = plot([0:100:1000],fitpDelFactorVIII14489factors(1)*[0:100:1000]+fitpDelFactorVIII14489factors(2),'g--','LineWidth',6)
plot(DelFactorVIII14489,pDelFactorVIII14489,'gd','LineWidth',6,'MarkerSize',12);
h(3) = plot([0:100:1000],fitpDelFactorVIII14490factors(1)*[0:100:1000]+fitpDelFactorVIII14490factors(2),'b-','LineWidth',6)
plot(DelFactorVIII14490,pDelFactorVIII14490,'bs','LineWidth',6,'MarkerSize',12);
h(4) = plot([0:100:1000],fitpDelFactorVIII14492factors(1)*[0:100:1000]+fitpDelFactorVIII14492factors(2),'m:','LineWidth',6)
plot(DelFactorVIII14492,pDelFactorVIII14492,'m^','LineWidth',6,'MarkerSize',12);
h(5) = plot([0:100:1000],fitpDelFactorVIII14494factors(1)*[0:100:1000]+fitpDelFactorVIII14494factors(2),'-.','LineWidth',6,'Color',[1 0.5 0])
plot(DelFactorVIII14494,pDelFactorVIII14494,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)
h(6) = plot([0:100:1000],fitpDelFactorVIII14500factors(1)*[0:100:1000]+fitpDelFactorVIII14500factors(2),'c--','LineWidth',6)
plot(DelFactorVIII14500,pDelFactorVIII14500,'c*','LineWidth',6,'MarkerSize',12)
h(7) = plot([0:100:1100],fitpDelFactorVIII14501factors(1)*[0:100:1100]+fitpDelFactorVIII14501factors(2),':','LineWidth',6,'Color',[0.5 0.5 0.5])
plot(DelFactorVIII14501,pDelFactorVIII14501,'x','MarkerEdgeColor',[0.5 0.5 0.5],'LineWidth',6,'MarkerSize',12)
h(8) = plot([0:100:1100],fitpDelFactorVIII14504factors(1)*[0:100:1100]+fitpDelFactorVIII14504factors(2),'-.','LineWidth',6,'Color',[0 0.5 1])
plot(DelFactorVIII14504,pDelFactorVIII14504,'v','MarkerEdgeColor',[0 0.5 1],'LineWidth',6,'MarkerSize',12)
h(9) = plot([0:100:1100],fitpDelFactorVIII14506factors(1)*[0:100:1100]+fitpDelFactorVIII14506factors(2),'--','LineWidth',6,'Color',[0.75 0.75 0])
plot(DelFactorVIII14506,pDelFactorVIII14506,'<','MarkerEdgeColor',[0.75 0.75 0],'LineWidth',6,'MarkerSize',12)
h(10) = plot([0:100:1100],fitpDelFactorVIII14507factors(1)*[0:100:1100]+fitpDelFactorVIII14507factors(2),'-','LineWidth',6,'Color',[0.75 0 0.75])
plot(DelFactorVIII14507,pDelFactorVIII14507,'>','MarkerEdgeColor',[0.75 0 0.75],'LineWidth',6,'MarkerSize',12)

xlabel('VIII Concentration Increase [%-activity]')
ylabel('p')
tJ = title('J');
axis([0 900 0.2 0.42])
lJ = legend([h(1) h(2) h(3) h(4) h(5) h(6) h(7) h(8) h(9) h(10)],{'#14488','#14489','#14490','#14492','#14494','#14500','#14501','#14504','#14506','#14507'})

figureHandle = gcf;
%# make all text in the figure to size 20 %and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)



subplot(2,2,1)

h(1) = plot([0:100:1000],fitKDelFactorVIII14488factors(1)*[0:100:1000]+fitKDelFactorVIII14488factors(2),'r-.','LineWidth',6)
hold on
plot(DelFactorVIII14488,KDelFactorVIII14488,'ro','LineWidth',6,'MarkerSize',12);
grid on
box on
h(2) = plot([0:100:1000],fitKDelFactorVIII14489factors(1)*[0:100:1000]+fitKDelFactorVIII14489factors(2),'g--','LineWidth',6)
plot(DelFactorVIII14489,KDelFactorVIII14489,'gd','LineWidth',6,'MarkerSize',12);
h(3) = plot([0:100:1000],fitKDelFactorVIII14490factors(1)*[0:100:1000]+fitKDelFactorVIII14490factors(2),'b-','LineWidth',6)
plot(DelFactorVIII14490,KDelFactorVIII14490,'bs','LineWidth',6,'MarkerSize',12);
h(4) = plot([0:100:1000],fitKDelFactorVIII14492factors(1)*[0:100:1000]+fitKDelFactorVIII14492factors(2),'m:','LineWidth',6)
plot(DelFactorVIII14492,KDelFactorVIII14492,'m^','LineWidth',6,'MarkerSize',12);
h(5) = plot([0:100:1000],fitKDelFactorVIII14494factors(1)*[0:100:1000]+fitKDelFactorVIII14494factors(2),'-.','LineWidth',6,'Color',[1 0.5 0])
plot(DelFactorVIII14494,KDelFactorVIII14494,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)
h(6) = plot([0:100:1000],fitKDelFactorVIII14500factors(1)*[0:100:1000]+fitKDelFactorVIII14500factors(2),'c--','LineWidth',6)
plot(DelFactorVIII14500,KDelFactorVIII14500,'c*','LineWidth',6,'MarkerSize',12)
h(7) = plot([0:100:1100],fitKDelFactorVIII14501factors(1)*[0:100:1100]+fitKDelFactorVIII14501factors(2),':','LineWidth',6,'Color',[0.5 0.5 0.5])
plot(DelFactorVIII14501,KDelFactorVIII14501,'x','MarkerEdgeColor',[0.5 0.5 0.5],'LineWidth',6,'MarkerSize',12)
h(8) = plot([0:100:1100],fitKDelFactorVIII14504factors(1)*[0:100:1100]+fitKDelFactorVIII14504factors(2),'-.','LineWidth',6,'Color',[0 0.5 1])
plot(DelFactorVIII14504,KDelFactorVIII14504,'v','MarkerEdgeColor',[0 0.5 1],'LineWidth',6,'MarkerSize',12)
h(9) = plot([0:100:1100],fitKDelFactorVIII14506factors(1)*[0:100:1100]+fitKDelFactorVIII14506factors(2),'--','LineWidth',6,'Color',[0.75 0.75 0])
plot(DelFactorVIII14506,KDelFactorVIII14506,'<','MarkerEdgeColor',[0.75 0.75 0],'LineWidth',6,'MarkerSize',12)
h(10) = plot([0:100:1100],fitKDelFactorVIII14507factors(1)*[0:100:1100]+fitKDelFactorVIII14507factors(2),'-','LineWidth',6,'Color',[0.75 0 0.75])
plot(DelFactorVIII14507,KDelFactorVIII14507,'>','MarkerEdgeColor',[0.75 0 0.75],'LineWidth',6,'MarkerSize',12)

xlabel('VIII Concentration Increase [%-activity]')
ylabel('K')
tI = title('I');
axis([0 900 0.08 0.42])
lI = legend([h(1) h(2) h(3) h(4) h(5) h(6) h(7) h(8) h(9) h(10)],{'#14488','#14489','#14490','#14492','#14494','#14500','#14501','#14504','#14506','#14507'})

figureHandle = gcf;
%# make all text in the figure to size 20 %and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)



subplot(2,2,4)

h(1) = plot([0:100:1000],fitTDelFactorVIII14488factors(1)*[0:100:1000]+fitTDelFactorVIII14488factors(2),'r-.','LineWidth',6)
hold on
plot(DelFactorVIII14488,TDelFactorVIII14488,'ro','LineWidth',6,'MarkerSize',12);
grid on
box on
h(2) = plot([0:100:1000],fitTDelFactorVIII14489factors(1)*[0:100:1000]+fitTDelFactorVIII14489factors(2),'g--','LineWidth',6)
plot(DelFactorVIII14489,TDelFactorVIII14489,'gd','LineWidth',6,'MarkerSize',12);
h(3) = plot([0:100:1000],fitTDelFactorVIII14490factors(1)*[0:100:1000]+fitTDelFactorVIII14490factors(2),'b-','LineWidth',6)
plot(DelFactorVIII14490,TDelFactorVIII14490,'bs','LineWidth',6,'MarkerSize',12);
h(4) = plot([0:100:1000],fitTDelFactorVIII14492factors(1)*[0:100:1000]+fitTDelFactorVIII14492factors(2),'m:','LineWidth',6)
plot(DelFactorVIII14492,TDelFactorVIII14492,'m^','LineWidth',6,'MarkerSize',12);
h(5) = plot([0:100:1000],fitTDelFactorVIII14494factors(1)*[0:100:1000]+fitTDelFactorVIII14494factors(2),'-.','LineWidth',6,'Color',[1 0.5 0])
plot(DelFactorVIII14494,TDelFactorVIII14494,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)
h(6) = plot([0:100:1000],fitTDelFactorVIII14500factors(1)*[0:100:1000]+fitTDelFactorVIII14500factors(2),'c--','LineWidth',6)
plot(DelFactorVIII14500,TDelFactorVIII14500,'c*','LineWidth',6,'MarkerSize',12)
h(7) = plot([0:100:1100],fitTDelFactorVIII14501factors(1)*[0:100:1100]+fitTDelFactorVIII14501factors(2),':','LineWidth',6,'Color',[0.5 0.5 0.5])
plot(DelFactorVIII14501,TDelFactorVIII14501,'x','MarkerEdgeColor',[0.5 0.5 0.5],'LineWidth',6,'MarkerSize',12)
h(8) = plot([0:100:1100],fitTDelFactorVIII14504factors(1)*[0:100:1100]+fitTDelFactorVIII14504factors(2),'-.','LineWidth',6,'Color',[0 0.5 1])
plot(DelFactorVIII14504,TDelFactorVIII14504,'v','MarkerEdgeColor',[0 0.5 1],'LineWidth',6,'MarkerSize',12)
h(9) = plot([0:100:1100],fitTDelFactorVIII14506factors(1)*[0:100:1100]+fitTDelFactorVIII14506factors(2),'--','LineWidth',6,'Color',[0.75 0.75 0])
plot(DelFactorVIII14506,TDelFactorVIII14506,'<','MarkerEdgeColor',[0.75 0.75 0],'LineWidth',6,'MarkerSize',12)
h(10) = plot([0:100:1100],fitTDelFactorVIII14507factors(1)*[0:100:1100]+fitTDelFactorVIII14507factors(2),'-','LineWidth',6,'Color',[0.75 0 0.75])
plot(DelFactorVIII14507,TDelFactorVIII14507,'>','MarkerEdgeColor',[0.75 0 0.75],'LineWidth',6,'MarkerSize',12)

xlabel('VIII Concentration Increase [%-activity]')
ylabel('T')
tL = title('L');
axis([0 900 1.9 3.5])
lL = legend([h(1) h(2) h(3) h(4) h(5) h(6) h(7) h(8) h(9) h(10)],{'#14488','#14489','#14490','#14492','#14494','#14500','#14501','#14504','#14506','#14507'})

figureHandle = gcf;
%# make all text in the figure to size 20 %and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)

set(tI, 'FontSize',31, 'FontWeight', 'bold')
set(tJ, 'FontSize',31, 'FontWeight', 'bold')
set(tK, 'FontSize',31, 'FontWeight', 'bold')
set(tL, 'FontSize',31, 'FontWeight', 'bold')

set(lI, 'FontSize',20)
set(lJ, 'FontSize',20)
set(lK, 'FontSize',20)
set(lL, 'FontSize',20)
%%

figure(3)
clf

% 14488
CATDataFactorVIII14488 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Dynamic','DR2:DX121')/1000;
CATTimeFactorVIII14488 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Dynamic','DQ2:DQ121');
[PeakDelFactorVIII14488,PeakIndexDelFactorVIII14488] = max(CATDataFactorVIII14488);
PeakTimeDelFactorVIII14488 = CATTimeFactorVIII14488(PeakIndexDelFactorVIII14488);
ETPDelFactorVIII14488 = trapz(CATTimeFactorVIII14488,CATDataFactorVIII14488);
for counter = 1:length(CATDataFactorVIII14488(1,:))
    DelayDelFactorVIII14488(1,counter) = DetermineDelay(CATTimeFactorVIII14488,CATDataFactorVIII14488(:,counter));
end
RiseTimeDelFactorVIII14488 = PeakTimeDelFactorVIII14488'-DelayDelFactorVIII14488;

[fitPeakDelFactorVIII14488factors,resfitPeakDelFactorVIII14488norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14488,PeakDelFactorVIII14488',[],[],options)
R2fitPeakDelFactorVIII14488 = DetermineLinearModelR2(DelFactorVIII14488,PeakDelFactorVIII14488',fitPeakDelFactorVIII14488factors)
[fitRiseTimeDelFactorVIII14488factors,resfitRiseTimeDelFactorVIII14488norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14488,RiseTimeDelFactorVIII14488',[],[],options)
R2fitRiseTimeDelFactorVIII14488 = DetermineLinearModelR2(DelFactorVIII14488,RiseTimeDelFactorVIII14488',fitRiseTimeDelFactorVIII14488factors)
[fitDelayDelFactorVIII14488factors,resfitDelayDelFactorVIII14488norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14488,DelayDelFactorVIII14488',[],[],options)
R2fitDelayDelFactorVIII14488 = DetermineLinearModelR2(DelFactorVIII14488,DelayDelFactorVIII14488',fitDelayDelFactorVIII14488factors)
[fitETPDelFactorVIII14488factors,resfitETPDelFactorVIII14488norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14488,ETPDelFactorVIII14488',[],[],options)
R2fitETPDelFactorVIII14488 = DetermineLinearModelR2(DelFactorVIII14488,ETPDelFactorVIII14488',fitETPDelFactorVIII14488factors)


% 14489
CATDataFactorVIII14489 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Dynamic','EA2:EH121')/1000;
CATTimeFactorVIII14489 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Dynamic','DZ2:DZ121');
[PeakDelFactorVIII14489,PeakIndexDelFactorVIII14489] = max(CATDataFactorVIII14489);
PeakTimeDelFactorVIII14489 = CATTimeFactorVIII14489(PeakIndexDelFactorVIII14489);
ETPDelFactorVIII14489 = trapz(CATTimeFactorVIII14489,CATDataFactorVIII14489);
for counter = 1:length(CATDataFactorVIII14489(1,:))
    DelayDelFactorVIII14489(1,counter) = DetermineDelay(CATTimeFactorVIII14489,CATDataFactorVIII14489(:,counter));
end
RiseTimeDelFactorVIII14489 = PeakTimeDelFactorVIII14489'-DelayDelFactorVIII14489;

[fitPeakDelFactorVIII14489factors,resfitPeakDelFactorVIII14489norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14489,PeakDelFactorVIII14489',[],[],options)
R2fitPeakDelFactorVIII14489 = DetermineLinearModelR2(DelFactorVIII14489,PeakDelFactorVIII14489',fitPeakDelFactorVIII14489factors)
[fitRiseTimeDelFactorVIII14489factors,resfitRiseTimeDelFactorVIII14489norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14489,RiseTimeDelFactorVIII14489',[],[],options)
R2fitRiseTimeDelFactorVIII14489 = DetermineLinearModelR2(DelFactorVIII14489,RiseTimeDelFactorVIII14489',fitRiseTimeDelFactorVIII14489factors)
[fitDelayDelFactorVIII14489factors,resfitDelayDelFactorVIII14489norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14489,DelayDelFactorVIII14489',[],[],options)
R2fitDelayDelFactorVIII14489 = DetermineLinearModelR2(DelFactorVIII14489,DelayDelFactorVIII14489',fitDelayDelFactorVIII14489factors)
[fitETPDelFactorVIII14489factors,resfitETPDelFactorVIII14489norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14489,ETPDelFactorVIII14489',[],[],options)
R2fitETPDelFactorVIII14489 = DetermineLinearModelR2(DelFactorVIII14489,ETPDelFactorVIII14489',fitETPDelFactorVIII14489factors)



% 14490
CATDataFactorVIII14490 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Dynamic','EL2:EQ121')/1000;
CATTimeFactorVIII14490 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Dynamic','EJ2:EJ121');
[PeakDelFactorVIII14490,PeakIndexDelFactorVIII14490] = max(CATDataFactorVIII14490);
PeakTimeDelFactorVIII14490 = CATTimeFactorVIII14490(PeakIndexDelFactorVIII14490);
ETPDelFactorVIII14490 = trapz(CATTimeFactorVIII14490,CATDataFactorVIII14490);
for counter = 1:length(CATDataFactorVIII14490(1,:))
    DelayDelFactorVIII14490(1,counter) = DetermineDelay(CATTimeFactorVIII14490,CATDataFactorVIII14490(:,counter));
end
RiseTimeDelFactorVIII14490 = PeakTimeDelFactorVIII14490'-DelayDelFactorVIII14490;

[fitPeakDelFactorVIII14490factors,resfitPeakDelFactorVIII14490norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14490,PeakDelFactorVIII14490',[],[],options)
R2fitPeakDelFactorVIII14490 = DetermineLinearModelR2(DelFactorVIII14490,PeakDelFactorVIII14490',fitPeakDelFactorVIII14490factors)
[fitRiseTimeDelFactorVIII14490factors,resfitRiseTimeDelFactorVIII14490norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14490,RiseTimeDelFactorVIII14490',[],[],options)
R2fitRiseTimeDelFactorVIII14490 = DetermineLinearModelR2(DelFactorVIII14490,RiseTimeDelFactorVIII14490',fitRiseTimeDelFactorVIII14490factors)
[fitDelayDelFactorVIII14490factors,resfitDelayDelFactorVIII14490norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14490,DelayDelFactorVIII14490',[],[],options)
R2fitDelayDelFactorVIII14490 = DetermineLinearModelR2(DelFactorVIII14490,DelayDelFactorVIII14490',fitDelayDelFactorVIII14490factors)
[fitETPDelFactorVIII14490factors,resfitETPDelFactorVIII14490norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14490,ETPDelFactorVIII14490',[],[],options)
R2fitETPDelFactorVIII14490 = DetermineLinearModelR2(DelFactorVIII14490,ETPDelFactorVIII14490',fitETPDelFactorVIII14490factors)


% 14492
CATDataFactorVIII14492 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Dynamic','R2:X121')/1000;
CATTimeFactorVIII14492 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Dynamic','P2:P121');
[PeakDelFactorVIII14492,PeakIndexDelFactorVIII14492] = max(CATDataFactorVIII14492);
PeakTimeDelFactorVIII14492 = CATTimeFactorVIII14492(PeakIndexDelFactorVIII14492);
ETPDelFactorVIII14492 = trapz(CATTimeFactorVIII14492,CATDataFactorVIII14492);
for counter = 1:length(CATDataFactorVIII14492(1,:))
    DelayDelFactorVIII14492(1,counter) = DetermineDelay(CATTimeFactorVIII14492,CATDataFactorVIII14492(:,counter));
end
RiseTimeDelFactorVIII14492 = PeakTimeDelFactorVIII14492'-DelayDelFactorVIII14492;

[fitPeakDelFactorVIII14492factors,resfitPeakDelFactorVIII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14492,PeakDelFactorVIII14492',[],[],options)
R2fitPeakDelFactorVIII14492 = DetermineLinearModelR2(DelFactorVIII14492,PeakDelFactorVIII14492',fitPeakDelFactorVIII14492factors)
[fitRiseTimeDelFactorVIII14492factors,resfitRiseTimeDelFactorVIII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14492,RiseTimeDelFactorVIII14492',[],[],options)
R2fitRiseTimeDelFactorVIII14492 = DetermineLinearModelR2(DelFactorVIII14492,RiseTimeDelFactorVIII14492',fitRiseTimeDelFactorVIII14492factors)
[fitDelayDelFactorVIII14492factors,resfitDelayDelFactorVIII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14492,DelayDelFactorVIII14492',[],[],options)
R2fitDelayDelFactorVIII14492 = DetermineLinearModelR2(DelFactorVIII14492,DelayDelFactorVIII14492',fitDelayDelFactorVIII14492factors)
[fitETPDelFactorVIII14492factors,resfitETPDelFactorVIII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14492,ETPDelFactorVIII14492',[],[],options)
R2fitETPDelFactorVIII14492 = DetermineLinearModelR2(DelFactorVIII14492,ETPDelFactorVIII14492',fitETPDelFactorVIII14492factors)



% 14494
CATDataFactorVIII14494 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Dynamic','EU2:FA121')/1000;
CATTimeFactorVIII14494 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Dynamic','ET2:ET121');
[PeakDelFactorVIII14494,PeakIndexDelFactorVIII14494] = max(CATDataFactorVIII14494);
PeakTimeDelFactorVIII14494 = CATTimeFactorVIII14494(PeakIndexDelFactorVIII14494);
ETPDelFactorVIII14494 = trapz(CATTimeFactorVIII14494,CATDataFactorVIII14494);
for counter = 1:length(CATDataFactorVIII14494(1,:))
    DelayDelFactorVIII14494(1,counter) = DetermineDelay(CATTimeFactorVIII14494,CATDataFactorVIII14494(:,counter));
end
RiseTimeDelFactorVIII14494 = PeakTimeDelFactorVIII14494'-DelayDelFactorVIII14494;

[fitPeakDelFactorVIII14494factors,resfitPeakDelFactorVIII14494norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14494,PeakDelFactorVIII14494',[],[],options)
R2fitPeakDelFactorVIII14494 = DetermineLinearModelR2(DelFactorVIII14494,PeakDelFactorVIII14494',fitPeakDelFactorVIII14494factors)
[fitRiseTimeDelFactorVIII14494factors,resfitRiseTimeDelFactorVIII14494norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14494,RiseTimeDelFactorVIII14494',[],[],options)
R2fitRiseTimeDelFactorVIII14494 = DetermineLinearModelR2(DelFactorVIII14494,RiseTimeDelFactorVIII14494',fitRiseTimeDelFactorVIII14494factors)
[fitDelayDelFactorVIII14494factors,resfitDelayDelFactorVIII14494norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14494,DelayDelFactorVIII14494',[],[],options)
R2fitDelayDelFactorVIII14494 = DetermineLinearModelR2(DelFactorVIII14494,DelayDelFactorVIII14494',fitDelayDelFactorVIII14494factors)
[fitETPDelFactorVIII14494factors,resfitETPDelFactorVIII14494norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14494,ETPDelFactorVIII14494',[],[],options)
R2fitETPDelFactorVIII14494 = DetermineLinearModelR2(DelFactorVIII14494,ETPDelFactorVIII14494',fitETPDelFactorVIII14494factors)


% 14500
CATDataFactorVIII14500 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Dynamic','FD2:FH121')/1000;
CATTimeFactorVIII14500 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Dynamic','FC2:FC121');
[PeakDelFactorVIII14500,PeakIndexDelFactorVIII14500] = max(CATDataFactorVIII14500);
PeakTimeDelFactorVIII14500 = CATTimeFactorVIII14500(PeakIndexDelFactorVIII14500);
ETPDelFactorVIII14500 = trapz(CATTimeFactorVIII14500,CATDataFactorVIII14500);
for counter = 1:length(CATDataFactorVIII14500(1,:))
    DelayDelFactorVIII14500(1,counter) = DetermineDelay(CATTimeFactorVIII14500,CATDataFactorVIII14500(:,counter));
end
RiseTimeDelFactorVIII14500 = PeakTimeDelFactorVIII14500'-DelayDelFactorVIII14500;

[fitPeakDelFactorVIII14500factors,resfitPeakDelFactorVIII14500norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14500,PeakDelFactorVIII14500',[],[],options)
R2fitPeakDelFactorVIII14500 = DetermineLinearModelR2(DelFactorVIII14500,PeakDelFactorVIII14500',fitPeakDelFactorVIII14500factors)
[fitRiseTimeDelFactorVIII14500factors,resfitRiseTimeDelFactorVIII14500norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14500,RiseTimeDelFactorVIII14500',[],[],options)
R2fitRiseTimeDelFactorVIII14500 = DetermineLinearModelR2(DelFactorVIII14500,RiseTimeDelFactorVIII14500',fitRiseTimeDelFactorVIII14500factors)
[fitDelayDelFactorVIII14500factors,resfitDelayDelFactorVIII14500norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14500,DelayDelFactorVIII14500',[],[],options)
R2fitDelayDelFactorVIII14500 = DetermineLinearModelR2(DelFactorVIII14500,DelayDelFactorVIII14500',fitDelayDelFactorVIII14500factors)
[fitETPDelFactorVIII14500factors,resfitETPDelFactorVIII14500norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14500,ETPDelFactorVIII14500',[],[],options)
R2fitETPDelFactorVIII14500 = DetermineLinearModelR2(DelFactorVIII14500,ETPDelFactorVIII14500',fitETPDelFactorVIII14500factors)



% 14501
CATDataFactorVIII14501 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Dynamic','FK2:FO121')/1000;
CATTimeFactorVIII14501 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Dynamic','FJ2:FJ121');
[PeakDelFactorVIII14501,PeakIndexDelFactorVIII14501] = max(CATDataFactorVIII14501);
PeakTimeDelFactorVIII14501 = CATTimeFactorVIII14501(PeakIndexDelFactorVIII14501);
ETPDelFactorVIII14501 = trapz(CATTimeFactorVIII14501,CATDataFactorVIII14501);
for counter = 1:length(CATDataFactorVIII14501(1,:))
    DelayDelFactorVIII14501(1,counter) = DetermineDelay(CATTimeFactorVIII14501,CATDataFactorVIII14501(:,counter));
end
RiseTimeDelFactorVIII14501 = PeakTimeDelFactorVIII14501'-DelayDelFactorVIII14501;

[fitPeakDelFactorVIII14501factors,resfitPeakDelFactorVIII14501norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14501,PeakDelFactorVIII14501',[],[],options)
R2fitPeakDelFactorVIII14501 = DetermineLinearModelR2(DelFactorVIII14501,PeakDelFactorVIII14501',fitPeakDelFactorVIII14501factors)
[fitRiseTimeDelFactorVIII14501factors,resfitRiseTimeDelFactorVIII14501norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14501,RiseTimeDelFactorVIII14501',[],[],options)
R2fitRiseTimeDelFactorVIII14501 = DetermineLinearModelR2(DelFactorVIII14501,RiseTimeDelFactorVIII14501',fitRiseTimeDelFactorVIII14501factors)
[fitDelayDelFactorVIII14501factors,resfitDelayDelFactorVIII14501norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14501,DelayDelFactorVIII14501',[],[],options)
R2fitDelayDelFactorVIII14501 = DetermineLinearModelR2(DelFactorVIII14501,DelayDelFactorVIII14501',fitDelayDelFactorVIII14501factors)
[fitETPDelFactorVIII14501factors,resfitETPDelFactorVIII14501norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14501,ETPDelFactorVIII14501',[],[],options)
R2fitETPDelFactorVIII14501 = DetermineLinearModelR2(DelFactorVIII14501,ETPDelFactorVIII14501',fitETPDelFactorVIII14501factors)


% 14504
CATDataFactorVIII14504 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Dynamic','FR2:FU121')/1000;
CATTimeFactorVIII14504 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Dynamic','FQ2:FQ121');
[PeakDelFactorVIII14504,PeakIndexDelFactorVIII14504] = max(CATDataFactorVIII14504);
PeakTimeDelFactorVIII14504 = CATTimeFactorVIII14504(PeakIndexDelFactorVIII14504);
ETPDelFactorVIII14504 = trapz(CATTimeFactorVIII14504,CATDataFactorVIII14504);
for counter = 1:length(CATDataFactorVIII14504(1,:))
    DelayDelFactorVIII14504(1,counter) = DetermineDelay(CATTimeFactorVIII14504,CATDataFactorVIII14504(:,counter));
end
RiseTimeDelFactorVIII14504 = PeakTimeDelFactorVIII14504'-DelayDelFactorVIII14504;

[fitPeakDelFactorVIII14504factors,resfitPeakDelFactorVIII14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14504,PeakDelFactorVIII14504',[],[],options)
R2fitPeakDelFactorVIII14504 = DetermineLinearModelR2(DelFactorVIII14504,PeakDelFactorVIII14504',fitPeakDelFactorVIII14504factors)
[fitRiseTimeDelFactorVIII14504factors,resfitRiseTimeDelFactorVIII14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14504,RiseTimeDelFactorVIII14504',[],[],options)
R2fitRiseTimeDelFactorVIII14504 = DetermineLinearModelR2(DelFactorVIII14504,RiseTimeDelFactorVIII14504',fitRiseTimeDelFactorVIII14504factors)
[fitDelayDelFactorVIII14504factors,resfitDelayDelFactorVIII14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14504,DelayDelFactorVIII14504',[],[],options)
R2fitDelayDelFactorVIII14504 = DetermineLinearModelR2(DelFactorVIII14504,DelayDelFactorVIII14504',fitDelayDelFactorVIII14504factors)
[fitETPDelFactorVIII14504factors,resfitETPDelFactorVIII14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14504,ETPDelFactorVIII14504',[],[],options)
R2fitETPDelFactorVIII14504 = DetermineLinearModelR2(DelFactorVIII14504,ETPDelFactorVIII14504',fitETPDelFactorVIII14504factors)



% 14506
CATDataFactorVIII14506 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Dynamic','FX2:GD121')/1000;
CATTimeFactorVIII14506 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Dynamic','FW2:FW121');
[PeakDelFactorVIII14506,PeakIndexDelFactorVIII14506] = max(CATDataFactorVIII14506);
PeakTimeDelFactorVIII14506 = CATTimeFactorVIII14506(PeakIndexDelFactorVIII14506);
ETPDelFactorVIII14506 = trapz(CATTimeFactorVIII14506,CATDataFactorVIII14506);
for counter = 1:length(CATDataFactorVIII14506(1,:))
    DelayDelFactorVIII14506(1,counter) = DetermineDelay(CATTimeFactorVIII14506,CATDataFactorVIII14506(:,counter));
end
RiseTimeDelFactorVIII14506 = PeakTimeDelFactorVIII14506'-DelayDelFactorVIII14506;

[fitPeakDelFactorVIII14506factors,resfitPeakDelFactorVIII14506norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14506,PeakDelFactorVIII14506',[],[],options)
R2fitPeakDelFactorVIII14506 = DetermineLinearModelR2(DelFactorVIII14506,PeakDelFactorVIII14506',fitPeakDelFactorVIII14506factors)
[fitRiseTimeDelFactorVIII14506factors,resfitRiseTimeDelFactorVIII14506norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14506,RiseTimeDelFactorVIII14506',[],[],options)
R2fitRiseTimeDelFactorVIII14506 = DetermineLinearModelR2(DelFactorVIII14506,RiseTimeDelFactorVIII14506',fitRiseTimeDelFactorVIII14506factors)
[fitDelayDelFactorVIII14506factors,resfitDelayDelFactorVIII14506norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14506,DelayDelFactorVIII14506',[],[],options)
R2fitDelayDelFactorVIII14506 = DetermineLinearModelR2(DelFactorVIII14506,DelayDelFactorVIII14506',fitDelayDelFactorVIII14506factors)
[fitETPDelFactorVIII14506factors,resfitETPDelFactorVIII14506norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14506,ETPDelFactorVIII14506',[],[],options)
R2fitETPDelFactorVIII14506 = DetermineLinearModelR2(DelFactorVIII14506,ETPDelFactorVIII14506',fitETPDelFactorVIII14506factors)


% 14507
CATDataFactorVIII14507 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Dynamic','GG2:GM121')/1000;
CATTimeFactorVIII14507 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Dynamic','GF2:GF121');
[PeakDelFactorVIII14507,PeakIndexDelFactorVIII14507] = max(CATDataFactorVIII14507);
PeakTimeDelFactorVIII14507 = CATTimeFactorVIII14507(PeakIndexDelFactorVIII14507);
ETPDelFactorVIII14507 = trapz(CATTimeFactorVIII14507,CATDataFactorVIII14507);
for counter = 1:length(CATDataFactorVIII14507(1,:))
    DelayDelFactorVIII14507(1,counter) = DetermineDelay(CATTimeFactorVIII14507,CATDataFactorVIII14507(:,counter));
end
RiseTimeDelFactorVIII14507 = PeakTimeDelFactorVIII14507'-DelayDelFactorVIII14507;

[fitPeakDelFactorVIII14507factors,resfitPeakDelFactorVIII14507norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14507,PeakDelFactorVIII14507',[],[],options)
R2fitPeakDelFactorVIII14507 = DetermineLinearModelR2(DelFactorVIII14507,PeakDelFactorVIII14507',fitPeakDelFactorVIII14507factors)
[fitRiseTimeDelFactorVIII14507factors,resfitRiseTimeDelFactorVIII14507norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14507,RiseTimeDelFactorVIII14507',[],[],options)
R2fitRiseTimeDelFactorVIII14507 = DetermineLinearModelR2(DelFactorVIII14507,RiseTimeDelFactorVIII14507',fitRiseTimeDelFactorVIII14507factors)
[fitDelayDelFactorVIII14507factors,resfitDelayDelFactorVIII14507norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14507,DelayDelFactorVIII14507',[],[],options)
R2fitDelayDelFactorVIII14507 = DetermineLinearModelR2(DelFactorVIII14507,DelayDelFactorVIII14507',fitDelayDelFactorVIII14507factors)
[fitETPDelFactorVIII14507factors,resfitETPDelFactorVIII14507norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14507,ETPDelFactorVIII14507',[],[],options)
R2fitETPDelFactorVIII14507 = DetermineLinearModelR2(DelFactorVIII14507,ETPDelFactorVIII14507',fitETPDelFactorVIII14507factors)



subplot(2,2,1)

h(1) = plot([0:100:1000],fitPeakDelFactorVIII14488factors(1)*[0:100:1000]+fitPeakDelFactorVIII14488factors(2),'r-.','LineWidth',6)
hold on
plot(DelFactorVIII14488,PeakDelFactorVIII14488,'ro','LineWidth',6,'MarkerSize',12);
grid on
box on
h(2) = plot([0:100:1000],fitPeakDelFactorVIII14489factors(1)*[0:100:1000]+fitPeakDelFactorVIII14489factors(2),'g--','LineWidth',6)
plot(DelFactorVIII14489,PeakDelFactorVIII14489,'gd','LineWidth',6,'MarkerSize',12);
h(3) = plot([0:100:1000],fitPeakDelFactorVIII14490factors(1)*[0:100:1000]+fitPeakDelFactorVIII14490factors(2),'b-','LineWidth',6)
plot(DelFactorVIII14490,PeakDelFactorVIII14490,'bs','LineWidth',6,'MarkerSize',12);
h(4) = plot([0:100:1000],fitPeakDelFactorVIII14492factors(1)*[0:100:1000]+fitPeakDelFactorVIII14492factors(2),'m:','LineWidth',6)
plot(DelFactorVIII14492,PeakDelFactorVIII14492,'m^','LineWidth',6,'MarkerSize',12);
h(5) = plot([0:100:1000],fitPeakDelFactorVIII14494factors(1)*[0:100:1000]+fitPeakDelFactorVIII14494factors(2),'-.','LineWidth',6,'Color',[1 0.5 0])
plot(DelFactorVIII14494,PeakDelFactorVIII14494,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)
h(6) = plot([0:100:1000],fitPeakDelFactorVIII14500factors(1)*[0:100:1000]+fitPeakDelFactorVIII14500factors(2),'c--','LineWidth',6)
plot(DelFactorVIII14500,PeakDelFactorVIII14500,'c*','LineWidth',6,'MarkerSize',12)
h(7) = plot([0:100:1100],fitPeakDelFactorVIII14501factors(1)*[0:100:1100]+fitPeakDelFactorVIII14501factors(2),':','LineWidth',6,'Color',[0.5 0.5 0.5])
plot(DelFactorVIII14501,PeakDelFactorVIII14501,'x','MarkerEdgeColor',[0.5 0.5 0.5],'LineWidth',6,'MarkerSize',12)
h(8) = plot([0:100:1100],fitPeakDelFactorVIII14504factors(1)*[0:100:1100]+fitPeakDelFactorVIII14504factors(2),'-.','LineWidth',6,'Color',[0 0.5 1])
plot(DelFactorVIII14504,PeakDelFactorVIII14504,'v','MarkerEdgeColor',[0 0.5 1],'LineWidth',6,'MarkerSize',12)
h(9) = plot([0:100:1100],fitPeakDelFactorVIII14506factors(1)*[0:100:1100]+fitPeakDelFactorVIII14506factors(2),'--','LineWidth',6,'Color',[0.75 0.75 0])
plot(DelFactorVIII14506,PeakDelFactorVIII14506,'<','MarkerEdgeColor',[0.75 0.75 0],'LineWidth',6,'MarkerSize',12)
h(10) = plot([0:100:1100],fitPeakDelFactorVIII14507factors(1)*[0:100:1100]+fitPeakDelFactorVIII14507factors(2),'-','LineWidth',6,'Color',[0.75 0 0.75])
plot(DelFactorVIII14507,PeakDelFactorVIII14507,'>','MarkerEdgeColor',[0.75 0 0.75],'LineWidth',6,'MarkerSize',12)

xlabel('VIII Concentration Increase [%-activity]')
ylabel('{\itP} [\muM]')
tA = title('A');
axis([0 900 0.06 0.42])
lA = legend([h(1) h(2) h(3) h(4) h(5) h(6) h(7) h(8) h(9) h(10)],{'#14488','#14489','#14490','#14492','#14494','#14500','#14501','#14504','#14506','#14507'})

figureHandle = gcf;
%# make all text in the figure to size 20 %and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)




subplot(2,2,2)

h(1) = plot([0:100:1000],fitRiseTimeDelFactorVIII14488factors(1)*[0:100:1000]+fitRiseTimeDelFactorVIII14488factors(2),'r-.','LineWidth',6)
hold on
plot(DelFactorVIII14488,RiseTimeDelFactorVIII14488,'ro','LineWidth',6,'MarkerSize',12);
grid on
box on
h(2) = plot([0:100:1000],fitRiseTimeDelFactorVIII14489factors(1)*[0:100:1000]+fitRiseTimeDelFactorVIII14489factors(2),'g--','LineWidth',6)
plot(DelFactorVIII14489,RiseTimeDelFactorVIII14489,'gd','LineWidth',6,'MarkerSize',12);
h(3) = plot([0:100:1000],fitRiseTimeDelFactorVIII14490factors(1)*[0:100:1000]+fitRiseTimeDelFactorVIII14490factors(2),'b-','LineWidth',6)
plot(DelFactorVIII14490,RiseTimeDelFactorVIII14490,'bs','LineWidth',6,'MarkerSize',12);
h(4) = plot([0:100:1000],fitRiseTimeDelFactorVIII14492factors(1)*[0:100:1000]+fitRiseTimeDelFactorVIII14492factors(2),'m:','LineWidth',6)
plot(DelFactorVIII14492,RiseTimeDelFactorVIII14492,'m^','LineWidth',6,'MarkerSize',12);
h(5) = plot([0:100:1000],fitRiseTimeDelFactorVIII14494factors(1)*[0:100:1000]+fitRiseTimeDelFactorVIII14494factors(2),'-.','LineWidth',6,'Color',[1 0.5 0])
plot(DelFactorVIII14494,RiseTimeDelFactorVIII14494,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)
h(6) = plot([0:100:1000],fitRiseTimeDelFactorVIII14500factors(1)*[0:100:1000]+fitRiseTimeDelFactorVIII14500factors(2),'c--','LineWidth',6)
plot(DelFactorVIII14500,RiseTimeDelFactorVIII14500,'c*','LineWidth',6,'MarkerSize',12)
h(7) = plot([0:100:1100],fitRiseTimeDelFactorVIII14501factors(1)*[0:100:1100]+fitRiseTimeDelFactorVIII14501factors(2),':','LineWidth',6,'Color',[0.5 0.5 0.5])
plot(DelFactorVIII14501,RiseTimeDelFactorVIII14501,'x','MarkerEdgeColor',[0.5 0.5 0.5],'LineWidth',6,'MarkerSize',12)
h(8) = plot([0:100:1100],fitRiseTimeDelFactorVIII14504factors(1)*[0:100:1100]+fitRiseTimeDelFactorVIII14504factors(2),'-.','LineWidth',6,'Color',[0 0.5 1])
plot(DelFactorVIII14504,RiseTimeDelFactorVIII14504,'v','MarkerEdgeColor',[0 0.5 1],'LineWidth',6,'MarkerSize',12)
h(9) = plot([0:100:1100],fitRiseTimeDelFactorVIII14506factors(1)*[0:100:1100]+fitRiseTimeDelFactorVIII14506factors(2),'--','LineWidth',6,'Color',[0.75 0.75 0])
plot(DelFactorVIII14506,RiseTimeDelFactorVIII14506,'<','MarkerEdgeColor',[0.75 0.75 0],'LineWidth',6,'MarkerSize',12)
h(10) = plot([0:100:1100],fitRiseTimeDelFactorVIII14507factors(1)*[0:100:1100]+fitRiseTimeDelFactorVIII14507factors(2),'-','LineWidth',6,'Color',[0.75 0 0.75])
plot(DelFactorVIII14507,RiseTimeDelFactorVIII14507,'>','MarkerEdgeColor',[0.75 0 0.75],'LineWidth',6,'MarkerSize',12)

xlabel('VIII Concentration Increase [%-activity]')
ylabel('{\itT_P-T} [min]')
tB = title('B');
axis([0 900 1.5 4.75])
lB = legend([h(1) h(2) h(3) h(4) h(5) h(6) h(7) h(8) h(9) h(10)],{'#14488','#14489','#14490','#14492','#14494','#14500','#14501','#14504','#14506','#14507'})

figureHandle = gcf;
%# make all text in the figure to size 20 %and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)



subplot(2,2,3)

h(1) = plot([0:100:1000],fitDelayDelFactorVIII14488factors(1)*[0:100:1000]+fitDelayDelFactorVIII14488factors(2),'r-.','LineWidth',6)
hold on
plot(DelFactorVIII14488,DelayDelFactorVIII14488,'ro','LineWidth',6,'MarkerSize',12);
grid on
box on
h(2) = plot([0:100:1000],fitDelayDelFactorVIII14489factors(1)*[0:100:1000]+fitDelayDelFactorVIII14489factors(2),'g--','LineWidth',6)
plot(DelFactorVIII14489,DelayDelFactorVIII14489,'gd','LineWidth',6,'MarkerSize',12);
h(3) = plot([0:100:1000],fitDelayDelFactorVIII14490factors(1)*[0:100:1000]+fitDelayDelFactorVIII14490factors(2),'b-','LineWidth',6)
plot(DelFactorVIII14490,DelayDelFactorVIII14490,'bs','LineWidth',6,'MarkerSize',12);
h(4) = plot([0:100:1000],fitDelayDelFactorVIII14492factors(1)*[0:100:1000]+fitDelayDelFactorVIII14492factors(2),'m:','LineWidth',6)
plot(DelFactorVIII14492,DelayDelFactorVIII14492,'m^','LineWidth',6,'MarkerSize',12);
h(5) = plot([0:100:1000],fitDelayDelFactorVIII14494factors(1)*[0:100:1000]+fitDelayDelFactorVIII14494factors(2),'-.','LineWidth',6,'Color',[1 0.5 0])
plot(DelFactorVIII14494,DelayDelFactorVIII14494,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)
h(6) = plot([0:100:1000],fitDelayDelFactorVIII14500factors(1)*[0:100:1000]+fitDelayDelFactorVIII14500factors(2),'c--','LineWidth',6)
plot(DelFactorVIII14500,DelayDelFactorVIII14500,'c*','LineWidth',6,'MarkerSize',12)
h(7) = plot([0:100:1100],fitDelayDelFactorVIII14501factors(1)*[0:100:1100]+fitDelayDelFactorVIII14501factors(2),':','LineWidth',6,'Color',[0.5 0.5 0.5])
plot(DelFactorVIII14501,DelayDelFactorVIII14501,'x','MarkerEdgeColor',[0.5 0.5 0.5],'LineWidth',6,'MarkerSize',12)
h(8) = plot([0:100:1100],fitDelayDelFactorVIII14504factors(1)*[0:100:1100]+fitDelayDelFactorVIII14504factors(2),'-.','LineWidth',6,'Color',[0 0.5 1])
plot(DelFactorVIII14504,DelayDelFactorVIII14504,'v','MarkerEdgeColor',[0 0.5 1],'LineWidth',6,'MarkerSize',12)
h(9) = plot([0:100:1100],fitDelayDelFactorVIII14506factors(1)*[0:100:1100]+fitDelayDelFactorVIII14506factors(2),'--','LineWidth',6,'Color',[0.75 0.75 0])
plot(DelFactorVIII14506,DelayDelFactorVIII14506,'<','MarkerEdgeColor',[0.75 0.75 0],'LineWidth',6,'MarkerSize',12)
h(10) = plot([0:100:1100],fitDelayDelFactorVIII14507factors(1)*[0:100:1100]+fitDelayDelFactorVIII14507factors(2),'-','LineWidth',6,'Color',[0.75 0 0.75])
plot(DelFactorVIII14507,DelayDelFactorVIII14507,'>','MarkerEdgeColor',[0.75 0 0.75],'LineWidth',6,'MarkerSize',12)

xlabel('VIII Concentration Increase [%-activity]')
ylabel('{\itT} [min]')
tC = title('C');
axis([0 900 1.9 3.5])
lC = legend([h(1) h(2) h(3) h(4) h(5) h(6) h(7) h(8) h(9) h(10)],{'#14488','#14489','#14490','#14492','#14494','#14500','#14501','#14504','#14506','#14507'})

figureHandle = gcf;
%# make all text in the figure to size 20 %and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)



subplot(2,2,4)

h(1) = plot([0:100:1000],fitETPDelFactorVIII14488factors(1)*[0:100:1000]+fitETPDelFactorVIII14488factors(2),'r-.','LineWidth',6)
hold on
plot(DelFactorVIII14488,ETPDelFactorVIII14488,'ro','LineWidth',6,'MarkerSize',12);
grid on
box on
h(2) = plot([0:100:1000],fitETPDelFactorVIII14489factors(1)*[0:100:1000]+fitETPDelFactorVIII14489factors(2),'g--','LineWidth',6)
plot(DelFactorVIII14489,ETPDelFactorVIII14489,'gd','LineWidth',6,'MarkerSize',12);
h(3) = plot([0:100:1000],fitETPDelFactorVIII14490factors(1)*[0:100:1000]+fitETPDelFactorVIII14490factors(2),'b-','LineWidth',6)
plot(DelFactorVIII14490,ETPDelFactorVIII14490,'bs','LineWidth',6,'MarkerSize',12);
h(4) = plot([0:100:1000],fitETPDelFactorVIII14492factors(1)*[0:100:1000]+fitETPDelFactorVIII14492factors(2),'m:','LineWidth',6)
plot(DelFactorVIII14492,ETPDelFactorVIII14492,'m^','LineWidth',6,'MarkerSize',12);
h(5) = plot([0:100:1000],fitETPDelFactorVIII14494factors(1)*[0:100:1000]+fitETPDelFactorVIII14494factors(2),'-.','LineWidth',6,'Color',[1 0.5 0])
plot(DelFactorVIII14494,ETPDelFactorVIII14494,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)
h(6) = plot([0:100:1000],fitETPDelFactorVIII14500factors(1)*[0:100:1000]+fitETPDelFactorVIII14500factors(2),'c--','LineWidth',6)
plot(DelFactorVIII14500,ETPDelFactorVIII14500,'c*','LineWidth',6,'MarkerSize',12)
h(7) = plot([0:100:1100],fitETPDelFactorVIII14501factors(1)*[0:100:1100]+fitETPDelFactorVIII14501factors(2),':','LineWidth',6,'Color',[0.5 0.5 0.5])
plot(DelFactorVIII14501,ETPDelFactorVIII14501,'x','MarkerEdgeColor',[0.5 0.5 0.5],'LineWidth',6,'MarkerSize',12)
h(8) = plot([0:100:1100],fitETPDelFactorVIII14504factors(1)*[0:100:1100]+fitETPDelFactorVIII14504factors(2),'-.','LineWidth',6,'Color',[0 0.5 1])
plot(DelFactorVIII14504,ETPDelFactorVIII14504,'v','MarkerEdgeColor',[0 0.5 1],'LineWidth',6,'MarkerSize',12)
h(9) = plot([0:100:1100],fitETPDelFactorVIII14506factors(1)*[0:100:1100]+fitETPDelFactorVIII14506factors(2),'--','LineWidth',6,'Color',[0.75 0.75 0])
plot(DelFactorVIII14506,ETPDelFactorVIII14506,'<','MarkerEdgeColor',[0.75 0.75 0],'LineWidth',6,'MarkerSize',12)
h(10) = plot([0:100:1100],fitETPDelFactorVIII14507factors(1)*[0:100:1100]+fitETPDelFactorVIII14507factors(2),'-','LineWidth',6,'Color',[0.75 0 0.75])
plot(DelFactorVIII14507,ETPDelFactorVIII14507,'>','MarkerEdgeColor',[0.75 0 0.75],'LineWidth',6,'MarkerSize',12)

xlabel('VIII Concentration Increase [%-activity]')
ylabel('IIa_{tot} [\muM min]')
tD = title('D');
axis([0 900 0.45 2.25])
lD = legend([h(1) h(2) h(3) h(4) h(5) h(6) h(7) h(8) h(9) h(10)],{'#14488','#14489','#14490','#14492','#14494','#14500','#14501','#14504','#14506','#14507'})

figureHandle = gcf;
%# make all text in the figure to size 20 %and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)

set(tA, 'FontSize',31, 'FontWeight', 'bold')
set(tB, 'FontSize',31, 'FontWeight', 'bold')
set(tC, 'FontSize',31, 'FontWeight', 'bold')
set(tD, 'FontSize',31, 'FontWeight', 'bold')

set(lA, 'FontSize',20)
set(lB, 'FontSize',20)
set(lC, 'FontSize',20)
set(lD, 'FontSize',20)

return


function fitLinearEstimate = fitLinearModel(x,xdata)

fitLinearEstimate = x(1)*xdata + x(2);

return

function Delay = DetermineDelay(Tcheck,MeasuredThrombin)

%first, look for the first data point below half of the thrombin peak

[MaxThrombin,MaxThrombinIndex] = max(MeasuredThrombin);
TimeMaxThrombin = Tcheck(MaxThrombinIndex);

SlopeUpperValueIndex = find(MeasuredThrombin<=0.5*MaxThrombin & Tcheck<=TimeMaxThrombin,1,'last');
SlopeUpperValue = MeasuredThrombin(SlopeUpperValueIndex);
SlopeUpperTime = Tcheck(SlopeUpperValueIndex);

%calculate the slope with the next lower data point
SlopeLowerValue = MeasuredThrombin(SlopeUpperValueIndex-1);
SlopeLowerTime = Tcheck(SlopeUpperValueIndex-1);
Slope = (SlopeUpperValue - SlopeLowerValue)/(SlopeUpperTime-SlopeLowerTime);

%calculate the x-intercept
b = SlopeLowerValue-Slope*SlopeLowerTime;
xintercept = -b/Slope;

if xintercept > 0
    EstimatedThrombinAtIntercept = interp1(Tcheck,MeasuredThrombin,xintercept);

    %calculate parameters for perpendicalar through this x-intercept
    SlopePerp = -1/Slope;
    bPerp = -SlopePerp*xintercept;

    %find a pair of points backwards from the x-intercept that lie on either
    %side of this perpendicular
    found = 0;
    CurrentIndex = find(MeasuredThrombin<=EstimatedThrombinAtIntercept & Tcheck<=TimeMaxThrombin,1,'last');
    while found == 0
        CurrentThrombinValue=MeasuredThrombin(CurrentIndex);
        CurrentPerpThrombinValue = SlopePerp*Tcheck(CurrentIndex)+bPerp;

        if CurrentIndex > 1
            NextThrombinValue = MeasuredThrombin(CurrentIndex-1);
            NextPerpThrombinValue = SlopePerp*Tcheck(CurrentIndex-1)+bPerp;

            if(CurrentThrombinValue <= CurrentPerpThrombinValue && NextThrombinValue < NextPerpThrombinValue)
                found = 1;
                Delay = Tcheck(CurrentIndex);
            elseif (CurrentThrombinValue >= CurrentPerpThrombinValue && NextThrombinValue < NextPerpThrombinValue)
                found = 1;
                Delay = Tcheck(CurrentIndex-1);
            else
                CurrentIndex = CurrentIndex-1;
            end
        else
            found = 1;
            Delay = Tcheck(CurrentIndex);
        end
    end
else
    Delay = Tcheck(1);
end

return

function R2ofLinearEstimate = DetermineLinearModelR2(Xdata,Yactualdata,LinearCoeffs)

Ypredicteddata = LinearCoeffs(1)*Xdata + LinearCoeffs(2);

MeanYactualdata = mean(Yactualdata);
SStot_vec = (Yactualdata - MeanYactualdata).^2;
SStot = sum(SStot_vec);
SSres_vec = (Yactualdata - Ypredicteddata).^2;
SSres = sum(SSres_vec);
R2ofLinearEstimate = 1 - SSres/SStot;


return
