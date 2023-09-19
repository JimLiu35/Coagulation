
function Factor_Spiking_Supp_X


clear all;
close all;
clc;

figure(1)
clf

options = optimset('MaxFunEvals',1e6,'MaxIter',1e6,'TolFun',1e-6,'TolX',1e-6);

DelFactorX14488 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','I98:I103');
a0DelFactorX14488 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','B98:B103');
a1DelFactorX14488 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','C98:C103');
a2DelFactorX14488 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','D98:D103');
bDelFactorX14488 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','E98:E103');
KDelFactorX14488 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','G98:G103');
pDelFactorX14488 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','K98:K103');
omeganDelFactorX14488 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','L98:L103');
TDelFactorX14488 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','F98:F103');

[fita0DelFactorX14488factors,resfita0DelFactorX14488norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14488,a0DelFactorX14488,[],[],options)
[fita1DelFactorX14488factors,resfita1DelFactorX14488norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14488,a1DelFactorX14488,[],[],options)
[fita2DelFactorX14488factors,resfita2DelFactorX14488norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14488,a2DelFactorX14488,[],[],options)
[fitbDelFactorX14488factors,resfitbDelFactorX14488norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14488,bDelFactorX14488,[],[],options)
[fitKDelFactorX14488factors,resfitkDelFactorX14488norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14488,KDelFactorX14488,[],[],options)
[fitpDelFactorX14488factors,resfitpDelFactorX14488norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14488,pDelFactorX14488,[],[],options)
[fitomeganDelFactorX14488factors,resfitomeganDelFactorX14488norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14488,omeganDelFactorX14488,[],[],options)
[fitTDelFactorX14488factors,resfitTDelFactorX14488norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14488,TDelFactorX14488,[],[],options)


DelFactorX14490 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','I105:I109');
a0DelFactorX14490 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','B105:B109');
a1DelFactorX14490 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','C105:C109');
a2DelFactorX14490 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','D105:D109');
bDelFactorX14490 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','E105:E109');
KDelFactorX14490 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','G105:G109');
pDelFactorX14490 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','K105:K109');
omeganDelFactorX14490 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','L105:L109');
TDelFactorX14490 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','F105:F109');

[fita0DelFactorX14490factors,resfita0DelFactorX14490norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14490,a0DelFactorX14490,[],[],options)
[fita1DelFactorX14490factors,resfita1DelFactorX14490norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14490,a1DelFactorX14490,[],[],options)
[fita2DelFactorX14490factors,resfita2DelFactorX14490norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14490,a2DelFactorX14490,[],[],options)
[fitbDelFactorX14490factors,resfitbDelFactorX14490norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14490,bDelFactorX14490,[],[],options)
[fitKDelFactorX14490factors,resfitkDelFactorX14490norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14490,KDelFactorX14490,[],[],options)
[fitpDelFactorX14490factors,resfitpDelFactorX14490norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14490,pDelFactorX14490,[],[],options)
[fitomeganDelFactorX14490factors,resfitomeganDelFactorX14490norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14490,omeganDelFactorX14490,[],[],options)
[fitTDelFactorX14490factors,resfitTDelFactorX14490norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14490,TDelFactorX14490,[],[],options)


DelFactorX14492 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','I111:I117');
a0DelFactorX14492 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','B111:B117');
a1DelFactorX14492 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','C111:C117');
a2DelFactorX14492 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','D111:D117');
bDelFactorX14492 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','E111:E117');
KDelFactorX14492 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','G111:G117');
pDelFactorX14492 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','K111:K117');
omeganDelFactorX14492 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','L111:L117');
TDelFactorX14492 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','F111:F117');

[fita0DelFactorX14492factors,resfita0DelFactorX14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14492,a0DelFactorX14492,[],[],options)
[fita1DelFactorX14492factors,resfita1DelFactorX14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14492,a1DelFactorX14492,[],[],options)
[fita2DelFactorX14492factors,resfita2DelFactorX14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14492,a2DelFactorX14492,[],[],options)
[fitbDelFactorX14492factors,resfitbDelFactorX14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14492,bDelFactorX14492,[],[],options)
[fitKDelFactorX14492factors,resfitkDelFactorX14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14492,KDelFactorX14492,[],[],options)
[fitpDelFactorX14492factors,resfitpDelFactorX14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14492,pDelFactorX14492,[],[],options)
[fitomeganDelFactorX14492factors,resfitomeganDelFactorX14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14492,omeganDelFactorX14492,[],[],options)
[fitTDelFactorX14492factors,resfitTDelFactorX14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14492,TDelFactorX14492,[],[],options)


DelFactorX14494 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','I119:I124');
a0DelFactorX14494 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','B119:B124');
a1DelFactorX14494 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','C119:C124');
a2DelFactorX14494 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','D119:D124');
bDelFactorX14494 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','E119:E124');
KDelFactorX14494 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','G119:G124');
pDelFactorX14494 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','K119:K124');
omeganDelFactorX14494 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','L119:L124');
TDelFactorX14494 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','F119:F124');

[fita0DelFactorX14494factors,resfita0DelFactorX14494norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14494,a0DelFactorX14494,[],[],options)
[fita1DelFactorX14494factors,resfita1DelFactorX14494norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14494,a1DelFactorX14494,[],[],options)
[fita2DelFactorX14494factors,resfita2DelFactorX14494norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14494,a2DelFactorX14494,[],[],options)
[fitbDelFactorX14494factors,resfitbDelFactorX14494norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14494,bDelFactorX14494,[],[],options)
[fitKDelFactorX14494factors,resfitkDelFactorX14494norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14494,KDelFactorX14494,[],[],options)
[fitpDelFactorX14494factors,resfitpDelFactorX14494norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14494,pDelFactorX14494,[],[],options)
[fitomeganDelFactorX14494factors,resfitomeganDelFactorX14494norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14494,omeganDelFactorX14494,[],[],options)
[fitTDelFactorX14494factors,resfitTDelFactorX14494norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14494,TDelFactorX14494,[],[],options)


DelFactorX14495 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','I126:I131');
a0DelFactorX14495 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','B126:B131');
a1DelFactorX14495 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','C126:C131');
a2DelFactorX14495 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','D126:D131');
bDelFactorX14495 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','E126:E131');
KDelFactorX14495 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','G126:G131');
pDelFactorX14495 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','K126:K131');
omeganDelFactorX14495 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','L126:L131');
TDelFactorX14495 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','F126:F131');

[fita0DelFactorX14495factors,resfita0DelFactorX14495norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14495,a0DelFactorX14495,[],[],options)
[fita1DelFactorX14495factors,resfita1DelFactorX14495norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14495,a1DelFactorX14495,[],[],options)
[fita2DelFactorX14495factors,resfita2DelFactorX14495norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14495,a2DelFactorX14495,[],[],options)
[fitbDelFactorX14495factors,resfitbDelFactorX14495norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14495,bDelFactorX14495,[],[],options)
[fitKDelFactorX14495factors,resfitkDelFactorX14495norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14495,KDelFactorX14495,[],[],options)
[fitpDelFactorX14495factors,resfitpDelFactorX14495norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14495,pDelFactorX14495,[],[],options)
[fitomeganDelFactorX14495factors,resfitomeganDelFactorX14495norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14495,omeganDelFactorX14495,[],[],options)
[fitTDelFactorX14495factors,resfitTDelFactorX14495norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14495,TDelFactorX14495,[],[],options)


DelFactorX14500 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','I133:I137');
a0DelFactorX14500 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','B133:B137');
a1DelFactorX14500 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','C133:C137');
a2DelFactorX14500 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','D133:D137');
bDelFactorX14500 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','E133:E137');
KDelFactorX14500 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','G133:G137');
pDelFactorX14500 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','K133:K137');
omeganDelFactorX14500 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','L133:L137');
TDelFactorX14500 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','F133:F137');

[fita0DelFactorX14500factors,resfita0DelFactorX14500norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14500,a0DelFactorX14500,[],[],options)
[fita1DelFactorX14500factors,resfita1DelFactorX14500norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14500,a1DelFactorX14500,[],[],options)
[fita2DelFactorX14500factors,resfita2DelFactorX14500norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14500,a2DelFactorX14500,[],[],options)
[fitbDelFactorX14500factors,resfitbDelFactorX14500norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14500,bDelFactorX14500,[],[],options)
[fitKDelFactorX14500factors,resfitkDelFactorX14500norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14500,KDelFactorX14500,[],[],options)
[fitpDelFactorX14500factors,resfitpDelFactorX14500norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14500,pDelFactorX14500,[],[],options)
[fitomeganDelFactorX14500factors,resfitomeganDelFactorX14500norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14500,omeganDelFactorX14500,[],[],options)
[fitTDelFactorX14500factors,resfitTDelFactorX14500norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14500,TDelFactorX14500,[],[],options)


DelFactorX14501 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','I139:I144');
a0DelFactorX14501 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','B139:B144');
a1DelFactorX14501 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','C139:C144');
a2DelFactorX14501 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','D139:D144');
bDelFactorX14501 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','E139:E144');
KDelFactorX14501 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','G139:G144');
pDelFactorX14501 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','K139:K144');
omeganDelFactorX14501 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','L139:L144');
TDelFactorX14501 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','F139:F144');

[fita0DelFactorX14501factors,resfita0DelFactorX14501norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14501,a0DelFactorX14501,[],[],options)
[fita1DelFactorX14501factors,resfita1DelFactorX14501norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14501,a1DelFactorX14501,[],[],options)
[fita2DelFactorX14501factors,resfita2DelFactorX14501norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14501,a2DelFactorX14501,[],[],options)
[fitbDelFactorX14501factors,resfitbDelFactorX14501norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14501,bDelFactorX14501,[],[],options)
[fitKDelFactorX14501factors,resfitkDelFactorX14501norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14501,KDelFactorX14501,[],[],options)
[fitpDelFactorX14501factors,resfitpDelFactorX14501norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14501,pDelFactorX14501,[],[],options)
[fitomeganDelFactorX14501factors,resfitomeganDelFactorX14501norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14501,omeganDelFactorX14501,[],[],options)
[fitTDelFactorX14501factors,resfitTDelFactorX14501norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14501,TDelFactorX14501,[],[],options)


DelFactorX14504 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','I146:I151');
a0DelFactorX14504 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','B146:B151');
a1DelFactorX14504 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','C146:C151');
a2DelFactorX14504 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','D146:D151');
bDelFactorX14504 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','E146:E151');
KDelFactorX14504 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','G146:G151');
pDelFactorX14504 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','K146:K151');
omeganDelFactorX14504 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','L146:L151');
TDelFactorX14504 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','F146:F151');

[fita0DelFactorX14504factors,resfita0DelFactorX14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14504,a0DelFactorX14504,[],[],options)
[fita1DelFactorX14504factors,resfita1DelFactorX14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14504,a1DelFactorX14504,[],[],options)
[fita2DelFactorX14504factors,resfita2DelFactorX14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14504,a2DelFactorX14504,[],[],options)
[fitbDelFactorX14504factors,resfitbDelFactorX14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14504,bDelFactorX14504,[],[],options)
[fitKDelFactorX14504factors,resfitkDelFactorX14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14504,KDelFactorX14504,[],[],options)
[fitpDelFactorX14504factors,resfitpDelFactorX14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14504,pDelFactorX14504,[],[],options)
[fitomeganDelFactorX14504factors,resfitomeganDelFactorX14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14504,omeganDelFactorX14504,[],[],options)
[fitTDelFactorX14504factors,resfitTDelFactorX14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14504,TDelFactorX14504,[],[],options)


DelFactorX14506 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','I153:I158');
a0DelFactorX14506 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','B153:B158');
a1DelFactorX14506 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','C153:C158');
a2DelFactorX14506 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','D153:D158');
bDelFactorX14506 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','E153:E158');
KDelFactorX14506 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','G153:G158');
pDelFactorX14506 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','K153:K158');
omeganDelFactorX14506 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','L153:L158');
TDelFactorX14506 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','F153:F158');

[fita0DelFactorX14506factors,resfita0DelFactorX14506norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14506,a0DelFactorX14506,[],[],options)
[fita1DelFactorX14506factors,resfita1DelFactorX14506norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14506,a1DelFactorX14506,[],[],options)
[fita2DelFactorX14506factors,resfita2DelFactorX14506norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14506,a2DelFactorX14506,[],[],options)
[fitbDelFactorX14506factors,resfitbDelFactorX14506norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14506,bDelFactorX14506,[],[],options)
[fitKDelFactorX14506factors,resfitkDelFactorX14506norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14506,KDelFactorX14506,[],[],options)
[fitpDelFactorX14506factors,resfitpDelFactorX14506norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14506,pDelFactorX14506,[],[],options)
[fitomeganDelFactorX14506factors,resfitomeganDelFactorX14506norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14506,omeganDelFactorX14506,[],[],options)
[fitTDelFactorX14506factors,resfitTDelFactorX14506norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14506,TDelFactorX14506,[],[],options)


DelFactorX14507 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','I160:I165');
a0DelFactorX14507 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','B160:B165');
a1DelFactorX14507 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','C160:C165');
a2DelFactorX14507 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','D160:D165');
bDelFactorX14507 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','E160:E165');
KDelFactorX14507 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','G160:G165');
pDelFactorX14507 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','K160:K165');
omeganDelFactorX14507 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','L160:L165');
TDelFactorX14507 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','F160:F165');

[fita0DelFactorX14507factors,resfita0DelFactorX14507norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14507,a0DelFactorX14507,[],[],options)
[fita1DelFactorX14507factors,resfita1DelFactorX14507norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14507,a1DelFactorX14507,[],[],options)
[fita2DelFactorX14507factors,resfita2DelFactorX14507norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14507,a2DelFactorX14507,[],[],options)
[fitbDelFactorX14507factors,resfitbDelFactorX14507norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14507,bDelFactorX14507,[],[],options)
[fitKDelFactorX14507factors,resfitkDelFactorX14507norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14507,KDelFactorX14507,[],[],options)
[fitpDelFactorX14507factors,resfitpDelFactorX14507norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14507,pDelFactorX14507,[],[],options)
[fitomeganDelFactorX14507factors,resfitomeganDelFactorX14507norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14507,omeganDelFactorX14507,[],[],options)
[fitTDelFactorX14507factors,resfitTDelFactorX14507norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14507,TDelFactorX14507,[],[],options)

%%

subplot(2,2,3)

h(1) = plot([0:100:1000],fita0DelFactorX14488factors(1)*[0:100:1000]+fita0DelFactorX14488factors(2),'r-.','LineWidth',6)
hold on
plot(DelFactorX14488,a0DelFactorX14488,'ro','LineWidth',6,'MarkerSize',12);
grid on
box on
h(2) = plot([0:100:1000],fita0DelFactorX14490factors(1)*[0:100:1000]+fita0DelFactorX14490factors(2),'g--','LineWidth',6)
plot(DelFactorX14490,a0DelFactorX14490,'gd','LineWidth',6,'MarkerSize',12);
h(3) = plot([0:100:1000],fita0DelFactorX14492factors(1)*[0:100:1000]+fita0DelFactorX14492factors(2),'b-','LineWidth',6)
plot(DelFactorX14492,a0DelFactorX14492,'bs','LineWidth',6,'MarkerSize',12);
h(4) = plot([0:100:1000],fita0DelFactorX14494factors(1)*[0:100:1000]+fita0DelFactorX14494factors(2),'m:','LineWidth',6)
plot(DelFactorX14494,a0DelFactorX14494,'m^','LineWidth',6,'MarkerSize',12);
h(5) = plot([0:100:1000],fita0DelFactorX14495factors(1)*[0:100:1000]+fita0DelFactorX14495factors(2),'-.','LineWidth',6,'Color',[1 0.5 0])
plot(DelFactorX14495,a0DelFactorX14495,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)
h(6) = plot([0:100:1000],fita0DelFactorX14500factors(1)*[0:100:1000]+fita0DelFactorX14500factors(2),'c--','LineWidth',6)
plot(DelFactorX14500,a0DelFactorX14500,'c*','LineWidth',6,'MarkerSize',12)
h(7) = plot([0:100:1100],fita0DelFactorX14501factors(1)*[0:100:1100]+fita0DelFactorX14501factors(2),':','LineWidth',6,'Color',[0.5 0.5 0.5])
plot(DelFactorX14501,a0DelFactorX14501,'x','MarkerEdgeColor',[0.5 0.5 0.5],'LineWidth',6,'MarkerSize',12)
h(8) = plot([0:100:1100],fita0DelFactorX14504factors(1)*[0:100:1100]+fita0DelFactorX14504factors(2),'-.','LineWidth',6,'Color',[0 0.5 1])
plot(DelFactorX14504,a0DelFactorX14504,'v','MarkerEdgeColor',[0 0.5 1],'LineWidth',6,'MarkerSize',12)
h(9) = plot([0:100:1100],fita0DelFactorX14506factors(1)*[0:100:1100]+fita0DelFactorX14506factors(2),'--','LineWidth',6,'Color',[0.75 0.75 0])
plot(DelFactorX14506,a0DelFactorX14506,'<','MarkerEdgeColor',[0.75 0.75 0],'LineWidth',6,'MarkerSize',12)
h(10) = plot([0:100:1100],fita0DelFactorX14507factors(1)*[0:100:1100]+fita0DelFactorX14507factors(2),'-','LineWidth',6,'Color',[0.75 0 0.75])
plot(DelFactorX14507,a0DelFactorX14507,'>','MarkerEdgeColor',[0.75 0 0.75],'LineWidth',6,'MarkerSize',12)

xlabel('X Concentration Increase [%-activity]')
ylabel('a_0')
tG = title('G');
axis([0 450 0.04 0.82])
lG = legend([h(1) h(2) h(3) h(4) h(5) h(6) h(7) h(8) h(9) h(10)],{'#14488','#14490','#14492','#14494','#14495','#14500','#14501','#14504','#14506','#14507'})

figureHandle = gcf;
%# make all text in the figure to size 20 %and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)



subplot(2,2,2)

h(1) = plot([0:100:1000],fita1DelFactorX14488factors(1)*[0:100:1000]+fita1DelFactorX14488factors(2),'r-.','LineWidth',6)
hold on
plot(DelFactorX14488,a1DelFactorX14488,'ro','LineWidth',6,'MarkerSize',12);
grid on
box on
h(2) = plot([0:100:1000],fita1DelFactorX14490factors(1)*[0:100:1000]+fita1DelFactorX14490factors(2),'g--','LineWidth',6)
plot(DelFactorX14490,a1DelFactorX14490,'gd','LineWidth',6,'MarkerSize',12);
h(3) = plot([0:100:1000],fita1DelFactorX14492factors(1)*[0:100:1000]+fita1DelFactorX14492factors(2),'b-','LineWidth',6)
plot(DelFactorX14492,a1DelFactorX14492,'bs','LineWidth',6,'MarkerSize',12);
h(4) = plot([0:100:1000],fita1DelFactorX14494factors(1)*[0:100:1000]+fita1DelFactorX14494factors(2),'m:','LineWidth',6)
plot(DelFactorX14494,a1DelFactorX14494,'m^','LineWidth',6,'MarkerSize',12);
h(5) = plot([0:100:1000],fita1DelFactorX14495factors(1)*[0:100:1000]+fita1DelFactorX14495factors(2),'-.','LineWidth',6,'Color',[1 0.5 0])
plot(DelFactorX14495,a1DelFactorX14495,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)
h(6) = plot([0:100:1000],fita1DelFactorX14500factors(1)*[0:100:1000]+fita1DelFactorX14500factors(2),'c--','LineWidth',6)
plot(DelFactorX14500,a1DelFactorX14500,'c*','LineWidth',6,'MarkerSize',12)
h(7) = plot([0:100:1100],fita1DelFactorX14501factors(1)*[0:100:1100]+fita1DelFactorX14501factors(2),':','LineWidth',6,'Color',[0.5 0.5 0.5])
plot(DelFactorX14501,a1DelFactorX14501,'x','MarkerEdgeColor',[0.5 0.5 0.5],'LineWidth',6,'MarkerSize',12)
h(8) = plot([0:100:1100],fita1DelFactorX14504factors(1)*[0:100:1100]+fita1DelFactorX14504factors(2),'-.','LineWidth',6,'Color',[0 0.5 1])
plot(DelFactorX14504,a1DelFactorX14504,'v','MarkerEdgeColor',[0 0.5 1],'LineWidth',6,'MarkerSize',12)
h(9) = plot([0:100:1100],fita1DelFactorX14506factors(1)*[0:100:1100]+fita1DelFactorX14506factors(2),'--','LineWidth',6,'Color',[0.75 0.75 0])
plot(DelFactorX14506,a1DelFactorX14506,'<','MarkerEdgeColor',[0.75 0.75 0],'LineWidth',6,'MarkerSize',12)
h(10) = plot([0:100:1100],fita1DelFactorX14507factors(1)*[0:100:1100]+fita1DelFactorX14507factors(2),'-','LineWidth',6,'Color',[0.75 0 0.75])
plot(DelFactorX14507,a1DelFactorX14507,'>','MarkerEdgeColor',[0.75 0 0.75],'LineWidth',6,'MarkerSize',12)

xlabel('X Concentration Increase [%-activity]')
ylabel('a_1')
tF = title('F');
axis([0 450 0.35 3.2])
lF = legend([h(1) h(2) h(3) h(4) h(5) h(6) h(7) h(8) h(9) h(10)],{'#14488','#14490','#14492','#14494','#14495','#14500','#14501','#14504','#14506','#14507'})

figureHandle = gcf;
%# make all text in the figure to size 20 %and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)



subplot(2,2,1)

h(1) = plot([0:100:1000],fita2DelFactorX14488factors(1)*[0:100:1000]+fita2DelFactorX14488factors(2),'r-.','LineWidth',6)
hold on
plot(DelFactorX14488,a2DelFactorX14488,'ro','LineWidth',6,'MarkerSize',12);
grid on
box on
h(2) = plot([0:100:1000],fita2DelFactorX14490factors(1)*[0:100:1000]+fita2DelFactorX14490factors(2),'g--','LineWidth',6)
plot(DelFactorX14490,a2DelFactorX14490,'gd','LineWidth',6,'MarkerSize',12);
h(3) = plot([0:100:1000],fita2DelFactorX14492factors(1)*[0:100:1000]+fita2DelFactorX14492factors(2),'b-','LineWidth',6)
plot(DelFactorX14492,a2DelFactorX14492,'bs','LineWidth',6,'MarkerSize',12);
h(4) = plot([0:100:1000],fita2DelFactorX14494factors(1)*[0:100:1000]+fita2DelFactorX14494factors(2),'m:','LineWidth',6)
plot(DelFactorX14494,a2DelFactorX14494,'m^','LineWidth',6,'MarkerSize',12);
h(5) = plot([0:100:1000],fita2DelFactorX14495factors(1)*[0:100:1000]+fita2DelFactorX14495factors(2),'-.','LineWidth',6,'Color',[1 0.5 0])
plot(DelFactorX14495,a2DelFactorX14495,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)
h(6) = plot([0:100:1000],fita2DelFactorX14500factors(1)*[0:100:1000]+fita2DelFactorX14500factors(2),'c--','LineWidth',6)
plot(DelFactorX14500,a2DelFactorX14500,'c*','LineWidth',6,'MarkerSize',12)
h(7) = plot([0:100:1100],fita2DelFactorX14501factors(1)*[0:100:1100]+fita2DelFactorX14501factors(2),':','LineWidth',6,'Color',[0.5 0.5 0.5])
plot(DelFactorX14501,a2DelFactorX14501,'x','MarkerEdgeColor',[0.5 0.5 0.5],'LineWidth',6,'MarkerSize',12)
h(8) = plot([0:100:1100],fita2DelFactorX14504factors(1)*[0:100:1100]+fita2DelFactorX14504factors(2),'-.','LineWidth',6,'Color',[0 0.5 1])
plot(DelFactorX14504,a2DelFactorX14504,'v','MarkerEdgeColor',[0 0.5 1],'LineWidth',6,'MarkerSize',12)
h(9) = plot([0:100:1100],fita2DelFactorX14506factors(1)*[0:100:1100]+fita2DelFactorX14506factors(2),'--','LineWidth',6,'Color',[0.75 0.75 0])
plot(DelFactorX14506,a2DelFactorX14506,'<','MarkerEdgeColor',[0.75 0.75 0],'LineWidth',6,'MarkerSize',12)
h(10) = plot([0:100:1100],fita2DelFactorX14507factors(1)*[0:100:1100]+fita2DelFactorX14507factors(2),'-','LineWidth',6,'Color',[0.75 0 0.75])
plot(DelFactorX14507,a2DelFactorX14507,'>','MarkerEdgeColor',[0.75 0 0.75],'LineWidth',6,'MarkerSize',12)

xlabel('X Concentration Increase [%-activity]')
ylabel('a_2')
tE = title('E');
axis([0 450 0.88 2.6])
lE = legend([h(1) h(2) h(3) h(4) h(5) h(6) h(7) h(8) h(9) h(10)],{'#14488','#14490','#14492','#14494','#14495','#14500','#14501','#14504','#14506','#14507'})

figureHandle = gcf;
%# make all text in the figure to size 20 %and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)



subplot(2,2,4)

h(1) = plot([0:100:1000],fitbDelFactorX14488factors(1)*[0:100:1000]+fitbDelFactorX14488factors(2),'r-.','LineWidth',6)
hold on
plot(DelFactorX14488,bDelFactorX14488,'ro','LineWidth',6,'MarkerSize',12);
grid on
box on
h(2) = plot([0:100:1000],fitbDelFactorX14490factors(1)*[0:100:1000]+fitbDelFactorX14490factors(2),'g--','LineWidth',6)
plot(DelFactorX14490,bDelFactorX14490,'gd','LineWidth',6,'MarkerSize',12);
h(3) = plot([0:100:1000],fitbDelFactorX14492factors(1)*[0:100:1000]+fitbDelFactorX14492factors(2),'b-','LineWidth',6)
plot(DelFactorX14492,bDelFactorX14492,'bs','LineWidth',6,'MarkerSize',12);
h(4) = plot([0:100:1000],fitbDelFactorX14494factors(1)*[0:100:1000]+fitbDelFactorX14494factors(2),'m:','LineWidth',6)
plot(DelFactorX14494,bDelFactorX14494,'m^','LineWidth',6,'MarkerSize',12);
h(5) = plot([0:100:1000],fitbDelFactorX14495factors(1)*[0:100:1000]+fitbDelFactorX14495factors(2),'-.','LineWidth',6,'Color',[1 0.5 0])
plot(DelFactorX14495,bDelFactorX14495,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)
h(6) = plot([0:100:1000],fitbDelFactorX14500factors(1)*[0:100:1000]+fitbDelFactorX14500factors(2),'c--','LineWidth',6)
plot(DelFactorX14500,bDelFactorX14500,'c*','LineWidth',6,'MarkerSize',12)
h(7) = plot([0:100:1100],fitbDelFactorX14501factors(1)*[0:100:1100]+fitbDelFactorX14501factors(2),':','LineWidth',6,'Color',[0.5 0.5 0.5])
plot(DelFactorX14501,bDelFactorX14501,'x','MarkerEdgeColor',[0.5 0.5 0.5],'LineWidth',6,'MarkerSize',12)
h(8) = plot([0:100:1100],fitbDelFactorX14504factors(1)*[0:100:1100]+fitbDelFactorX14504factors(2),'-.','LineWidth',6,'Color',[0 0.5 1])
plot(DelFactorX14504,bDelFactorX14504,'v','MarkerEdgeColor',[0 0.5 1],'LineWidth',6,'MarkerSize',12)
h(9) = plot([0:100:1100],fitbDelFactorX14506factors(1)*[0:100:1100]+fitbDelFactorX14506factors(2),'--','LineWidth',6,'Color',[0.75 0.75 0])
plot(DelFactorX14506,bDelFactorX14506,'<','MarkerEdgeColor',[0.75 0.75 0],'LineWidth',6,'MarkerSize',12)
h(10) = plot([0:100:1100],fitbDelFactorX14507factors(1)*[0:100:1100]+fitbDelFactorX14507factors(2),'-','LineWidth',6,'Color',[0.75 0 0.75])
plot(DelFactorX14507,bDelFactorX14507,'>','MarkerEdgeColor',[0.75 0 0.75],'LineWidth',6,'MarkerSize',12)

xlabel('X Concentration Increase [%-activity]')
ylabel('b')
tH = title('H');
axis([0 450 0 22])
lH = legend([h(1) h(2) h(3) h(4) h(5) h(6) h(7) h(8) h(9) h(10)],{'#14488','#14490','#14492','#14494','#14495','#14500','#14501','#14504','#14506','#14507'})

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

h(1) = plot([0:100:1000],fitomeganDelFactorX14488factors(1)*[0:100:1000]+fitomeganDelFactorX14488factors(2),'r-.','LineWidth',6)
hold on
plot(DelFactorX14488,omeganDelFactorX14488,'ro','LineWidth',6,'MarkerSize',12);
grid on
box on
h(2) = plot([0:100:1000],fitomeganDelFactorX14490factors(1)*[0:100:1000]+fitomeganDelFactorX14490factors(2),'g--','LineWidth',6)
plot(DelFactorX14490,omeganDelFactorX14490,'gd','LineWidth',6,'MarkerSize',12);
h(3) = plot([0:100:1000],fitomeganDelFactorX14492factors(1)*[0:100:1000]+fitomeganDelFactorX14492factors(2),'b-','LineWidth',6)
plot(DelFactorX14492,omeganDelFactorX14492,'bs','LineWidth',6,'MarkerSize',12);
h(4) = plot([0:100:1000],fitomeganDelFactorX14494factors(1)*[0:100:1000]+fitomeganDelFactorX14494factors(2),'m:','LineWidth',6)
plot(DelFactorX14494,omeganDelFactorX14494,'m^','LineWidth',6,'MarkerSize',12);
h(5) = plot([0:100:1000],fitomeganDelFactorX14495factors(1)*[0:100:1000]+fitomeganDelFactorX14495factors(2),'-.','LineWidth',6,'Color',[1 0.5 0])
plot(DelFactorX14495,omeganDelFactorX14495,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)
h(6) = plot([0:100:1000],fitomeganDelFactorX14500factors(1)*[0:100:1000]+fitomeganDelFactorX14500factors(2),'c--','LineWidth',6)
plot(DelFactorX14500,omeganDelFactorX14500,'c*','LineWidth',6,'MarkerSize',12)
h(7) = plot([0:100:1100],fitomeganDelFactorX14501factors(1)*[0:100:1100]+fitomeganDelFactorX14501factors(2),':','LineWidth',6,'Color',[0.5 0.5 0.5])
plot(DelFactorX14501,omeganDelFactorX14501,'x','MarkerEdgeColor',[0.5 0.5 0.5],'LineWidth',6,'MarkerSize',12)
h(8) = plot([0:100:1100],fitomeganDelFactorX14504factors(1)*[0:100:1100]+fitomeganDelFactorX14504factors(2),'-.','LineWidth',6,'Color',[0 0.5 1])
plot(DelFactorX14504,omeganDelFactorX14504,'v','MarkerEdgeColor',[0 0.5 1],'LineWidth',6,'MarkerSize',12)
h(9) = plot([0:100:1100],fitomeganDelFactorX14506factors(1)*[0:100:1100]+fitomeganDelFactorX14506factors(2),'--','LineWidth',6,'Color',[0.75 0.75 0])
plot(DelFactorX14506,omeganDelFactorX14506,'<','MarkerEdgeColor',[0.75 0.75 0],'LineWidth',6,'MarkerSize',12)
h(10) = plot([0:100:1100],fitomeganDelFactorX14507factors(1)*[0:100:1100]+fitomeganDelFactorX14507factors(2),'-','LineWidth',6,'Color',[0.75 0 0.75])
plot(DelFactorX14507,omeganDelFactorX14507,'>','MarkerEdgeColor',[0.75 0 0.75],'LineWidth',6,'MarkerSize',12)

xlabel('X Concentration Increase [%-activity]')
ylabel('\omega_n')
tK = title('K');
axis([0 450 0.4 1.6])
lK = legend([h(1) h(2) h(3) h(4) h(5) h(6) h(7) h(8) h(9) h(10)],{'#14488','#14490','#14492','#14494','#14495','#14500','#14501','#14504','#14506','#14507'})

figureHandle = gcf;
%# make all text in the figure to size 20 %and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)



subplot(2,2,2)

h(1) = plot([0:100:1000],fitpDelFactorX14488factors(1)*[0:100:1000]+fitpDelFactorX14488factors(2),'r-.','LineWidth',6)
hold on
plot(DelFactorX14488,pDelFactorX14488,'ro','LineWidth',6,'MarkerSize',12);
grid on
box on
h(2) = plot([0:100:1000],fitpDelFactorX14490factors(1)*[0:100:1000]+fitpDelFactorX14490factors(2),'g--','LineWidth',6)
plot(DelFactorX14490,pDelFactorX14490,'gd','LineWidth',6,'MarkerSize',12);
h(3) = plot([0:100:1000],fitpDelFactorX14492factors(1)*[0:100:1000]+fitpDelFactorX14492factors(2),'b-','LineWidth',6)
plot(DelFactorX14492,pDelFactorX14492,'bs','LineWidth',6,'MarkerSize',12);
h(4) = plot([0:100:1000],fitpDelFactorX14494factors(1)*[0:100:1000]+fitpDelFactorX14494factors(2),'m:','LineWidth',6)
plot(DelFactorX14494,pDelFactorX14494,'m^','LineWidth',6,'MarkerSize',12);
h(5) = plot([0:100:1000],fitpDelFactorX14495factors(1)*[0:100:1000]+fitpDelFactorX14495factors(2),'-.','LineWidth',6,'Color',[1 0.5 0])
plot(DelFactorX14495,pDelFactorX14495,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)
h(6) = plot([0:100:1000],fitpDelFactorX14500factors(1)*[0:100:1000]+fitpDelFactorX14500factors(2),'c--','LineWidth',6)
plot(DelFactorX14500,pDelFactorX14500,'c*','LineWidth',6,'MarkerSize',12)
h(7) = plot([0:100:1100],fitpDelFactorX14501factors(1)*[0:100:1100]+fitpDelFactorX14501factors(2),':','LineWidth',6,'Color',[0.5 0.5 0.5])
plot(DelFactorX14501,pDelFactorX14501,'x','MarkerEdgeColor',[0.5 0.5 0.5],'LineWidth',6,'MarkerSize',12)
h(8) = plot([0:100:1100],fitpDelFactorX14504factors(1)*[0:100:1100]+fitpDelFactorX14504factors(2),'-.','LineWidth',6,'Color',[0 0.5 1])
plot(DelFactorX14504,pDelFactorX14504,'v','MarkerEdgeColor',[0 0.5 1],'LineWidth',6,'MarkerSize',12)
h(9) = plot([0:100:1100],fitpDelFactorX14506factors(1)*[0:100:1100]+fitpDelFactorX14506factors(2),'--','LineWidth',6,'Color',[0.75 0.75 0])
plot(DelFactorX14506,pDelFactorX14506,'<','MarkerEdgeColor',[0.75 0.75 0],'LineWidth',6,'MarkerSize',12)
h(10) = plot([0:100:1100],fitpDelFactorX14507factors(1)*[0:100:1100]+fitpDelFactorX14507factors(2),'-','LineWidth',6,'Color',[0.75 0 0.75])
plot(DelFactorX14507,pDelFactorX14507,'>','MarkerEdgeColor',[0.75 0 0.75],'LineWidth',6,'MarkerSize',12)

xlabel('X Concentration Increase [%-activity]')
ylabel('p')
tJ = title('J');
axis([0 450 0.2 0.35])
lJ = legend([h(1) h(2) h(3) h(4) h(5) h(6) h(7) h(8) h(9) h(10)],{'#14488','#14490','#14492','#14494','#14495','#14500','#14501','#14504','#14506','#14507'})

figureHandle = gcf;
%# make all text in the figure to size 20 %and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)



subplot(2,2,1)

h(1) = plot([0:100:1000],fitKDelFactorX14488factors(1)*[0:100:1000]+fitKDelFactorX14488factors(2),'r-.','LineWidth',6)
hold on
plot(DelFactorX14488,KDelFactorX14488,'ro','LineWidth',6,'MarkerSize',12);
grid on
box on
h(2) = plot([0:100:1000],fitKDelFactorX14490factors(1)*[0:100:1000]+fitKDelFactorX14490factors(2),'g--','LineWidth',6)
plot(DelFactorX14490,KDelFactorX14490,'gd','LineWidth',6,'MarkerSize',12);
h(3) = plot([0:100:1000],fitKDelFactorX14492factors(1)*[0:100:1000]+fitKDelFactorX14492factors(2),'b-','LineWidth',6)
plot(DelFactorX14492,KDelFactorX14492,'bs','LineWidth',6,'MarkerSize',12);
h(4) = plot([0:100:1000],fitKDelFactorX14494factors(1)*[0:100:1000]+fitKDelFactorX14494factors(2),'m:','LineWidth',6)
plot(DelFactorX14494,KDelFactorX14494,'m^','LineWidth',6,'MarkerSize',12);
h(5) = plot([0:100:1000],fitKDelFactorX14495factors(1)*[0:100:1000]+fitKDelFactorX14495factors(2),'-.','LineWidth',6,'Color',[1 0.5 0])
plot(DelFactorX14495,KDelFactorX14495,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)
h(6) = plot([0:100:1000],fitKDelFactorX14500factors(1)*[0:100:1000]+fitKDelFactorX14500factors(2),'c--','LineWidth',6)
plot(DelFactorX14500,KDelFactorX14500,'c*','LineWidth',6,'MarkerSize',12)
h(7) = plot([0:100:1100],fitKDelFactorX14501factors(1)*[0:100:1100]+fitKDelFactorX14501factors(2),':','LineWidth',6,'Color',[0.5 0.5 0.5])
plot(DelFactorX14501,KDelFactorX14501,'x','MarkerEdgeColor',[0.5 0.5 0.5],'LineWidth',6,'MarkerSize',12)
h(8) = plot([0:100:1100],fitKDelFactorX14504factors(1)*[0:100:1100]+fitKDelFactorX14504factors(2),'-.','LineWidth',6,'Color',[0 0.5 1])
plot(DelFactorX14504,KDelFactorX14504,'v','MarkerEdgeColor',[0 0.5 1],'LineWidth',6,'MarkerSize',12)
h(9) = plot([0:100:1100],fitKDelFactorX14506factors(1)*[0:100:1100]+fitKDelFactorX14506factors(2),'--','LineWidth',6,'Color',[0.75 0.75 0])
plot(DelFactorX14506,KDelFactorX14506,'<','MarkerEdgeColor',[0.75 0.75 0],'LineWidth',6,'MarkerSize',12)
h(10) = plot([0:100:1100],fitKDelFactorX14507factors(1)*[0:100:1100]+fitKDelFactorX14507factors(2),'-','LineWidth',6,'Color',[0.75 0 0.75])
plot(DelFactorX14507,KDelFactorX14507,'>','MarkerEdgeColor',[0.75 0 0.75],'LineWidth',6,'MarkerSize',12)

xlabel('X Concentration Increase [%-activity]')
ylabel('K')
tI = title('I');
axis([0 450 0.12 0.4])
lI = legend([h(1) h(2) h(3) h(4) h(5) h(6) h(7) h(8) h(9) h(10)],{'#14488','#14490','#14492','#14494','#14495','#14500','#14501','#14504','#14506','#14507'})

figureHandle = gcf;
%# make all text in the figure to size 20 %and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)



subplot(2,2,4)

h(1) = plot([0:100:1000],fitTDelFactorX14488factors(1)*[0:100:1000]+fitTDelFactorX14488factors(2),'r-.','LineWidth',6)
hold on
plot(DelFactorX14488,TDelFactorX14488,'ro','LineWidth',6,'MarkerSize',12);
grid on
box on
h(2) = plot([0:100:1000],fitTDelFactorX14490factors(1)*[0:100:1000]+fitTDelFactorX14490factors(2),'g--','LineWidth',6)
plot(DelFactorX14490,TDelFactorX14490,'gd','LineWidth',6,'MarkerSize',12);
h(3) = plot([0:100:1000],fitTDelFactorX14492factors(1)*[0:100:1000]+fitTDelFactorX14492factors(2),'b-','LineWidth',6)
plot(DelFactorX14492,TDelFactorX14492,'bs','LineWidth',6,'MarkerSize',12);
h(4) = plot([0:100:1000],fitTDelFactorX14494factors(1)*[0:100:1000]+fitTDelFactorX14494factors(2),'m:','LineWidth',6)
plot(DelFactorX14494,TDelFactorX14494,'m^','LineWidth',6,'MarkerSize',12);
h(5) = plot([0:100:1000],fitTDelFactorX14495factors(1)*[0:100:1000]+fitTDelFactorX14495factors(2),'-.','LineWidth',6,'Color',[1 0.5 0])
plot(DelFactorX14495,TDelFactorX14495,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)
h(6) = plot([0:100:1000],fitTDelFactorX14500factors(1)*[0:100:1000]+fitTDelFactorX14500factors(2),'c--','LineWidth',6)
plot(DelFactorX14500,TDelFactorX14500,'c*','LineWidth',6,'MarkerSize',12)
h(7) = plot([0:100:1100],fitTDelFactorX14501factors(1)*[0:100:1100]+fitTDelFactorX14501factors(2),':','LineWidth',6,'Color',[0.5 0.5 0.5])
plot(DelFactorX14501,TDelFactorX14501,'x','MarkerEdgeColor',[0.5 0.5 0.5],'LineWidth',6,'MarkerSize',12)
h(8) = plot([0:100:1100],fitTDelFactorX14504factors(1)*[0:100:1100]+fitTDelFactorX14504factors(2),'-.','LineWidth',6,'Color',[0 0.5 1])
plot(DelFactorX14504,TDelFactorX14504,'v','MarkerEdgeColor',[0 0.5 1],'LineWidth',6,'MarkerSize',12)
h(9) = plot([0:100:1100],fitTDelFactorX14506factors(1)*[0:100:1100]+fitTDelFactorX14506factors(2),'--','LineWidth',6,'Color',[0.75 0.75 0])
plot(DelFactorX14506,TDelFactorX14506,'<','MarkerEdgeColor',[0.75 0.75 0],'LineWidth',6,'MarkerSize',12)
h(10) = plot([0:100:1100],fitTDelFactorX14507factors(1)*[0:100:1100]+fitTDelFactorX14507factors(2),'-','LineWidth',6,'Color',[0.75 0 0.75])
plot(DelFactorX14507,TDelFactorX14507,'>','MarkerEdgeColor',[0.75 0 0.75],'LineWidth',6,'MarkerSize',12)

xlabel('X Concentration Increase [%-activity]')
ylabel('T')
tL = title('L');
axis([0 450 1.7 3.2])
lL = legend([h(1) h(2) h(3) h(4) h(5) h(6) h(7) h(8) h(9) h(10)],{'#14488','#14490','#14492','#14494','#14495','#14500','#14501','#14504','#14506','#14507'})

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
CATDataFactorX14488 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Dynamic','BO2:BT121')/1000;
CATTimeFactorX14488 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Dynamic','BN2:BN121');
[PeakDelFactorX14488,PeakIndexDelFactorX14488] = max(CATDataFactorX14488);
PeakTimeDelFactorX14488 = CATTimeFactorX14488(PeakIndexDelFactorX14488);
ETPDelFactorX14488 = trapz(CATTimeFactorX14488,CATDataFactorX14488);
for counter = 1:length(CATDataFactorX14488(1,:))
    DelayDelFactorX14488(1,counter) = DetermineDelay(CATTimeFactorX14488,CATDataFactorX14488(:,counter));
end
RiseTimeDelFactorX14488 = PeakTimeDelFactorX14488'-DelayDelFactorX14488;

[fitPeakDelFactorX14488factors,resfitPeakDelFactorX14488norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14488,PeakDelFactorX14488',[],[],options)
R2fitPeakDelFactorX14488 = DetermineLinearModelR2(DelFactorX14488,PeakDelFactorX14488',fitPeakDelFactorX14488factors)
[fitRiseTimeDelFactorX14488factors,resfitRiseTimeDelFactorX14488norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14488,RiseTimeDelFactorX14488',[],[],options)
R2fitRiseTimeDelFactorX14488 = DetermineLinearModelR2(DelFactorX14488,RiseTimeDelFactorX14488',fitRiseTimeDelFactorX14488factors)
[fitDelayDelFactorX14488factors,resfitDelayDelFactorX14488norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14488,DelayDelFactorX14488',[],[],options)
R2fitDelayDelFactorX14488 = DetermineLinearModelR2(DelFactorX14488,DelayDelFactorX14488',fitDelayDelFactorX14488factors)
[fitETPDelFactorX14488factors,resfitETPDelFactorX14488norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14488,ETPDelFactorX14488',[],[],options)
R2fitETPDelFactorX14488 = DetermineLinearModelR2(DelFactorX14488,ETPDelFactorX14488',fitETPDelFactorX14488factors)


% 14490
CATDataFactorX14490 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Dynamic','AR2:AV121')/1000;
CATTimeFactorX14490 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Dynamic','AP2:AP121');
[PeakDelFactorX14490,PeakIndexDelFactorX14490] = max(CATDataFactorX14490);
PeakTimeDelFactorX14490 = CATTimeFactorX14490(PeakIndexDelFactorX14490);
ETPDelFactorX14490 = trapz(CATTimeFactorX14490,CATDataFactorX14490);
for counter = 1:length(CATDataFactorX14490(1,:))
    DelayDelFactorX14490(1,counter) = DetermineDelay(CATTimeFactorX14490,CATDataFactorX14490(:,counter));
end
RiseTimeDelFactorX14490 = PeakTimeDelFactorX14490'-DelayDelFactorX14490;

[fitPeakDelFactorX14490factors,resfitPeakDelFactorX14490norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14490,PeakDelFactorX14490',[],[],options)
R2fitPeakDelFactorX14490 = DetermineLinearModelR2(DelFactorX14490,PeakDelFactorX14490',fitPeakDelFactorX14490factors)
[fitRiseTimeDelFactorX14490factors,resfitRiseTimeDelFactorX14490norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14490,RiseTimeDelFactorX14490',[],[],options)
R2fitRiseTimeDelFactorX14490 = DetermineLinearModelR2(DelFactorX14490,RiseTimeDelFactorX14490',fitRiseTimeDelFactorX14490factors)
[fitDelayDelFactorX14490factors,resfitDelayDelFactorX14490norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14490,DelayDelFactorX14490',[],[],options)
R2fitDelayDelFactorX14490 = DetermineLinearModelR2(DelFactorX14490,DelayDelFactorX14490',fitDelayDelFactorX14490factors)
[fitETPDelFactorX14490factors,resfitETPDelFactorX14490norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14490,ETPDelFactorX14490',[],[],options)
R2fitETPDelFactorX14490 = DetermineLinearModelR2(DelFactorX14490,ETPDelFactorX14490',fitETPDelFactorX14490factors)


% 14492
CATDataFactorX14492 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Dynamic','BW2:CC121')/1000;
CATTimeFactorX14492 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Dynamic','BV2:BV121');
[PeakDelFactorX14492,PeakIndexDelFactorX14492] = max(CATDataFactorX14492);
PeakTimeDelFactorX14492 = CATTimeFactorX14492(PeakIndexDelFactorX14492);
ETPDelFactorX14492 = trapz(CATTimeFactorX14492,CATDataFactorX14492);
for counter = 1:length(CATDataFactorX14492(1,:))
    DelayDelFactorX14492(1,counter) = DetermineDelay(CATTimeFactorX14492,CATDataFactorX14492(:,counter));
end
RiseTimeDelFactorX14492 = PeakTimeDelFactorX14492'-DelayDelFactorX14492;

[fitPeakDelFactorX14492factors,resfitPeakDelFactorX14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14492,PeakDelFactorX14492',[],[],options)
R2fitPeakDelFactorX14492 = DetermineLinearModelR2(DelFactorX14492,PeakDelFactorX14492',fitPeakDelFactorX14492factors)
[fitRiseTimeDelFactorX14492factors,resfitRiseTimeDelFactorX14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14492,RiseTimeDelFactorX14492',[],[],options)
R2fitRiseTimeDelFactorX14492 = DetermineLinearModelR2(DelFactorX14492,RiseTimeDelFactorX14492',fitRiseTimeDelFactorX14492factors)
[fitDelayDelFactorX14492factors,resfitDelayDelFactorX14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14492,DelayDelFactorX14492',[],[],options)
R2fitDelayDelFactorX14492 = DetermineLinearModelR2(DelFactorX14492,DelayDelFactorX14492',fitDelayDelFactorX14492factors)
[fitETPDelFactorX14492factors,resfitETPDelFactorX14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14492,ETPDelFactorX14492',[],[],options)
R2fitETPDelFactorX14492 = DetermineLinearModelR2(DelFactorX14492,ETPDelFactorX14492',fitETPDelFactorX14492factors)
 

% 14494
CATDataFactorX14494 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Dynamic','AY2:BD121')/1000;
CATTimeFactorX14494 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Dynamic','AX2:AX121');
[PeakDelFactorX14494,PeakIndexDelFactorX14494] = max(CATDataFactorX14494);
PeakTimeDelFactorX14494 = CATTimeFactorX14494(PeakIndexDelFactorX14494);
ETPDelFactorX14494 = trapz(CATTimeFactorX14494,CATDataFactorX14494);
for counter = 1:length(CATDataFactorX14494(1,:))
    DelayDelFactorX14494(1,counter) = DetermineDelay(CATTimeFactorX14494,CATDataFactorX14494(:,counter));
end
RiseTimeDelFactorX14494 = PeakTimeDelFactorX14494'-DelayDelFactorX14494;

[fitPeakDelFactorX14494factors,resfitPeakDelFactorX14494norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14494,PeakDelFactorX14494',[],[],options)
R2fitPeakDelFactorX14494 = DetermineLinearModelR2(DelFactorX14494,PeakDelFactorX14494',fitPeakDelFactorX14494factors)
[fitRiseTimeDelFactorX14494factors,resfitRiseTimeDelFactorX14494norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14494,RiseTimeDelFactorX14494',[],[],options)
R2fitRiseTimeDelFactorX14494 = DetermineLinearModelR2(DelFactorX14494,RiseTimeDelFactorX14494',fitRiseTimeDelFactorX14494factors)
[fitDelayDelFactorX14494factors,resfitDelayDelFactorX14494norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14494,DelayDelFactorX14494',[],[],options)
R2fitDelayDelFactorX14494 = DetermineLinearModelR2(DelFactorX14494,DelayDelFactorX14494',fitDelayDelFactorX14494factors)
[fitETPDelFactorX14494factors,resfitETPDelFactorX14494norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14494,ETPDelFactorX14494',[],[],options)
R2fitETPDelFactorX14494 = DetermineLinearModelR2(DelFactorX14494,ETPDelFactorX14494',fitETPDelFactorX14494factors)


% 14495
CATDataFactorX14495 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Dynamic','CF2:CK121')/1000;
CATTimeFactorX14495 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Dynamic','CE2:CE121');
[PeakDelFactorX14495,PeakIndexDelFactorX14495] = max(CATDataFactorX14495);
PeakTimeDelFactorX14495 = CATTimeFactorX14495(PeakIndexDelFactorX14495);
ETPDelFactorX14495 = trapz(CATTimeFactorX14495,CATDataFactorX14495);
for counter = 1:length(CATDataFactorX14495(1,:))
    DelayDelFactorX14495(1,counter) = DetermineDelay(CATTimeFactorX14495,CATDataFactorX14495(:,counter));
end
RiseTimeDelFactorX14495 = PeakTimeDelFactorX14495'-DelayDelFactorX14495;

[fitPeakDelFactorX14495factors,resfitPeakDelFactorX14495norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14495,PeakDelFactorX14495',[],[],options)
R2fitPeakDelFactorX14495 = DetermineLinearModelR2(DelFactorX14495,PeakDelFactorX14495',fitPeakDelFactorX14495factors)
[fitRiseTimeDelFactorX14495factors,resfitRiseTimeDelFactorX14495norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14495,RiseTimeDelFactorX14495',[],[],options)
R2fitRiseTimeDelFactorX14495 = DetermineLinearModelR2(DelFactorX14495,RiseTimeDelFactorX14495',fitRiseTimeDelFactorX14495factors)
[fitDelayDelFactorX14495factors,resfitDelayDelFactorX14495norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14495,DelayDelFactorX14495',[],[],options)
R2fitDelayDelFactorX14495 = DetermineLinearModelR2(DelFactorX14495,DelayDelFactorX14495',fitDelayDelFactorX14495factors)
[fitETPDelFactorX14495factors,resfitETPDelFactorX14495norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14495,ETPDelFactorX14495',[],[],options)
R2fitETPDelFactorX14495 = DetermineLinearModelR2(DelFactorX14495,ETPDelFactorX14495',fitETPDelFactorX14495factors)



% 14500
CATDataFactorX14500 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Dynamic','CN2:CR121')/1000;
CATTimeFactorX14500 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Dynamic','CM2:CM121');
[PeakDelFactorX14500,PeakIndexDelFactorX14500] = max(CATDataFactorX14500);
PeakTimeDelFactorX14500 = CATTimeFactorX14500(PeakIndexDelFactorX14500);
ETPDelFactorX14500 = trapz(CATTimeFactorX14500,CATDataFactorX14500);
for counter = 1:length(CATDataFactorX14500(1,:))
    DelayDelFactorX14500(1,counter) = DetermineDelay(CATTimeFactorX14500,CATDataFactorX14500(:,counter));
end
RiseTimeDelFactorX14500 = PeakTimeDelFactorX14500'-DelayDelFactorX14500;

[fitPeakDelFactorX14500factors,resfitPeakDelFactorX14500norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14500,PeakDelFactorX14500',[],[],options)
R2fitPeakDelFactorX14500 = DetermineLinearModelR2(DelFactorX14500,PeakDelFactorX14500',fitPeakDelFactorX14500factors)
[fitRiseTimeDelFactorX14500factors,resfitRiseTimeDelFactorX14500norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14500,RiseTimeDelFactorX14500',[],[],options)
R2fitRiseTimeDelFactorX14500 = DetermineLinearModelR2(DelFactorX14500,RiseTimeDelFactorX14500',fitRiseTimeDelFactorX14500factors)
[fitDelayDelFactorX14500factors,resfitDelayDelFactorX14500norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14500,DelayDelFactorX14500',[],[],options)
R2fitDelayDelFactorX14500 = DetermineLinearModelR2(DelFactorX14500,DelayDelFactorX14500',fitDelayDelFactorX14500factors)
[fitETPDelFactorX14500factors,resfitETPDelFactorX14500norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14500,ETPDelFactorX14500',[],[],options)
R2fitETPDelFactorX14500 = DetermineLinearModelR2(DelFactorX14500,ETPDelFactorX14500',fitETPDelFactorX14500factors)



% 14501
CATDataFactorX14501 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Dynamic','CU2:CZ121')/1000;
CATTimeFactorX14501 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Dynamic','CT2:CT121');
[PeakDelFactorX14501,PeakIndexDelFactorX14501] = max(CATDataFactorX14501);
PeakTimeDelFactorX14501 = CATTimeFactorX14501(PeakIndexDelFactorX14501);
ETPDelFactorX14501 = trapz(CATTimeFactorX14501,CATDataFactorX14501);
for counter = 1:length(CATDataFactorX14501(1,:))
    DelayDelFactorX14501(1,counter) = DetermineDelay(CATTimeFactorX14501,CATDataFactorX14501(:,counter));
end
RiseTimeDelFactorX14501 = PeakTimeDelFactorX14501'-DelayDelFactorX14501;

[fitPeakDelFactorX14501factors,resfitPeakDelFactorX14501norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14501,PeakDelFactorX14501',[],[],options)
R2fitPeakDelFactorX14501 = DetermineLinearModelR2(DelFactorX14501,PeakDelFactorX14501',fitPeakDelFactorX14501factors)
[fitRiseTimeDelFactorX14501factors,resfitRiseTimeDelFactorX14501norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14501,RiseTimeDelFactorX14501',[],[],options)
R2fitRiseTimeDelFactorX14501 = DetermineLinearModelR2(DelFactorX14501,RiseTimeDelFactorX14501',fitRiseTimeDelFactorX14501factors)
[fitDelayDelFactorX14501factors,resfitDelayDelFactorX14501norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14501,DelayDelFactorX14501',[],[],options)
R2fitDelayDelFactorX14501 = DetermineLinearModelR2(DelFactorX14501,DelayDelFactorX14501',fitDelayDelFactorX14501factors)
[fitETPDelFactorX14501factors,resfitETPDelFactorX14501norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14501,ETPDelFactorX14501',[],[],options)
R2fitETPDelFactorX14501 = DetermineLinearModelR2(DelFactorX14501,ETPDelFactorX14501',fitETPDelFactorX14501factors)


% 14504
CATDataFactorX14504 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Dynamic','AA2:AF121')/1000;
CATTimeFactorX14504 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Dynamic','Z2:Z121');
[PeakDelFactorX14504,PeakIndexDelFactorX14504] = max(CATDataFactorX14504);
PeakTimeDelFactorX14504 = CATTimeFactorX14504(PeakIndexDelFactorX14504);
ETPDelFactorX14504 = trapz(CATTimeFactorX14504,CATDataFactorX14504);
for counter = 1:length(CATDataFactorX14504(1,:))
    DelayDelFactorX14504(1,counter) = DetermineDelay(CATTimeFactorX14504,CATDataFactorX14504(:,counter));
end
RiseTimeDelFactorX14504 = PeakTimeDelFactorX14504'-DelayDelFactorX14504;

[fitPeakDelFactorX14504factors,resfitPeakDelFactorX14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14504,PeakDelFactorX14504',[],[],options)
R2fitPeakDelFactorX14504 = DetermineLinearModelR2(DelFactorX14504,PeakDelFactorX14504',fitPeakDelFactorX14504factors)
[fitRiseTimeDelFactorX14504factors,resfitRiseTimeDelFactorX14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14504,RiseTimeDelFactorX14504',[],[],options)
R2fitRiseTimeDelFactorX14504 = DetermineLinearModelR2(DelFactorX14504,RiseTimeDelFactorX14504',fitRiseTimeDelFactorX14504factors)
[fitDelayDelFactorX14504factors,resfitDelayDelFactorX14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14504,DelayDelFactorX14504',[],[],options)
R2fitDelayDelFactorX14504 = DetermineLinearModelR2(DelFactorX14504,DelayDelFactorX14504',fitDelayDelFactorX14504factors)
[fitETPDelFactorX14504factors,resfitETPDelFactorX14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14504,ETPDelFactorX14504',[],[],options)
R2fitETPDelFactorX14504 = DetermineLinearModelR2(DelFactorX14504,ETPDelFactorX14504',fitETPDelFactorX14504factors)



% 14506
CATDataFactorX14506 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Dynamic','AI2:AN121')/1000;
CATTimeFactorX14506 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Dynamic','AH2:AH121');
[PeakDelFactorX14506,PeakIndexDelFactorX14506] = max(CATDataFactorX14506);
PeakTimeDelFactorX14506 = CATTimeFactorX14506(PeakIndexDelFactorX14506);
ETPDelFactorX14506 = trapz(CATTimeFactorX14506,CATDataFactorX14506);
for counter = 1:length(CATDataFactorX14506(1,:))
    DelayDelFactorX14506(1,counter) = DetermineDelay(CATTimeFactorX14506,CATDataFactorX14506(:,counter));
end
RiseTimeDelFactorX14506 = PeakTimeDelFactorX14506'-DelayDelFactorX14506;

[fitPeakDelFactorX14506factors,resfitPeakDelFactorX14506norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14506,PeakDelFactorX14506',[],[],options)
R2fitPeakDelFactorX14506 = DetermineLinearModelR2(DelFactorX14506,PeakDelFactorX14506',fitPeakDelFactorX14506factors)
[fitRiseTimeDelFactorX14506factors,resfitRiseTimeDelFactorX14506norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14506,RiseTimeDelFactorX14506',[],[],options)
R2fitRiseTimeDelFactorX14506 = DetermineLinearModelR2(DelFactorX14506,RiseTimeDelFactorX14506',fitRiseTimeDelFactorX14506factors)
[fitDelayDelFactorX14506factors,resfitDelayDelFactorX14506norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14506,DelayDelFactorX14506',[],[],options)
R2fitDelayDelFactorX14506 = DetermineLinearModelR2(DelFactorX14506,DelayDelFactorX14506',fitDelayDelFactorX14506factors)
[fitETPDelFactorX14506factors,resfitETPDelFactorX14506norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14506,ETPDelFactorX14506',[],[],options)
R2fitETPDelFactorX14506 = DetermineLinearModelR2(DelFactorX14506,ETPDelFactorX14506',fitETPDelFactorX14506factors)


% 14507
CATDataFactorX14507 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Dynamic','BG2:BL121')/1000;
CATTimeFactorX14507 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Dynamic','BF2:BF121');
[PeakDelFactorX14507,PeakIndexDelFactorX14507] = max(CATDataFactorX14507);
PeakTimeDelFactorX14507 = CATTimeFactorX14507(PeakIndexDelFactorX14507);
ETPDelFactorX14507 = trapz(CATTimeFactorX14507,CATDataFactorX14507);
for counter = 1:length(CATDataFactorX14507(1,:))
    DelayDelFactorX14507(1,counter) = DetermineDelay(CATTimeFactorX14507,CATDataFactorX14507(:,counter));
end
RiseTimeDelFactorX14507 = PeakTimeDelFactorX14507'-DelayDelFactorX14507;

[fitPeakDelFactorX14507factors,resfitPeakDelFactorX14507norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14507,PeakDelFactorX14507',[],[],options)
R2fitPeakDelFactorX14507 = DetermineLinearModelR2(DelFactorX14507,PeakDelFactorX14507',fitPeakDelFactorX14507factors)
[fitRiseTimeDelFactorX14507factors,resfitRiseTimeDelFactorX14507norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14507,RiseTimeDelFactorX14507',[],[],options)
R2fitRiseTimeDelFactorX14507 = DetermineLinearModelR2(DelFactorX14507,RiseTimeDelFactorX14507',fitRiseTimeDelFactorX14507factors)
[fitDelayDelFactorX14507factors,resfitDelayDelFactorX14507norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14507,DelayDelFactorX14507',[],[],options)
R2fitDelayDelFactorX14507 = DetermineLinearModelR2(DelFactorX14507,DelayDelFactorX14507',fitDelayDelFactorX14507factors)
[fitETPDelFactorX14507factors,resfitETPDelFactorX14507norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14507,ETPDelFactorX14507',[],[],options)
R2fitETPDelFactorX14507 = DetermineLinearModelR2(DelFactorX14507,ETPDelFactorX14507',fitETPDelFactorX14507factors)



subplot(2,2,1)

h(1) = plot([0:100:1000],fitPeakDelFactorX14488factors(1)*[0:100:1000]+fitPeakDelFactorX14488factors(2),'r-.','LineWidth',6)
hold on
plot(DelFactorX14488,PeakDelFactorX14488,'ro','LineWidth',6,'MarkerSize',12);
grid on
box on
h(2) = plot([0:100:1000],fitPeakDelFactorX14490factors(1)*[0:100:1000]+fitPeakDelFactorX14490factors(2),'g--','LineWidth',6)
plot(DelFactorX14490,PeakDelFactorX14490,'gd','LineWidth',6,'MarkerSize',12);
h(3) = plot([0:100:1000],fitPeakDelFactorX14492factors(1)*[0:100:1000]+fitPeakDelFactorX14492factors(2),'b-','LineWidth',6)
plot(DelFactorX14492,PeakDelFactorX14492,'bs','LineWidth',6,'MarkerSize',12);
h(4) = plot([0:100:1000],fitPeakDelFactorX14494factors(1)*[0:100:1000]+fitPeakDelFactorX14494factors(2),'m:','LineWidth',6)
plot(DelFactorX14494,PeakDelFactorX14494,'m^','LineWidth',6,'MarkerSize',12);
h(5) = plot([0:100:1000],fitPeakDelFactorX14495factors(1)*[0:100:1000]+fitPeakDelFactorX14495factors(2),'-.','LineWidth',6,'Color',[1 0.5 0])
plot(DelFactorX14495,PeakDelFactorX14495,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)
h(6) = plot([0:100:1000],fitPeakDelFactorX14500factors(1)*[0:100:1000]+fitPeakDelFactorX14500factors(2),'c--','LineWidth',6)
plot(DelFactorX14500,PeakDelFactorX14500,'c*','LineWidth',6,'MarkerSize',12)
h(7) = plot([0:100:1100],fitPeakDelFactorX14501factors(1)*[0:100:1100]+fitPeakDelFactorX14501factors(2),':','LineWidth',6,'Color',[0.5 0.5 0.5])
plot(DelFactorX14501,PeakDelFactorX14501,'x','MarkerEdgeColor',[0.5 0.5 0.5],'LineWidth',6,'MarkerSize',12)
h(8) = plot([0:100:1100],fitPeakDelFactorX14504factors(1)*[0:100:1100]+fitPeakDelFactorX14504factors(2),'-.','LineWidth',6,'Color',[0 0.5 1])
plot(DelFactorX14504,PeakDelFactorX14504,'v','MarkerEdgeColor',[0 0.5 1],'LineWidth',6,'MarkerSize',12)
h(9) = plot([0:100:1100],fitPeakDelFactorX14506factors(1)*[0:100:1100]+fitPeakDelFactorX14506factors(2),'--','LineWidth',6,'Color',[0.75 0.75 0])
plot(DelFactorX14506,PeakDelFactorX14506,'<','MarkerEdgeColor',[0.75 0.75 0],'LineWidth',6,'MarkerSize',12)
h(10) = plot([0:100:1100],fitPeakDelFactorX14507factors(1)*[0:100:1100]+fitPeakDelFactorX14507factors(2),'-','LineWidth',6,'Color',[0.75 0 0.75])
plot(DelFactorX14507,PeakDelFactorX14507,'>','MarkerEdgeColor',[0.75 0 0.75],'LineWidth',6,'MarkerSize',12)

xlabel('X Concentration Increase [%-activity]')
ylabel('{\itP} [\muM]')
tA = title('A');
axis([0 450 0.09 0.35])
lA = legend([h(1) h(2) h(3) h(4) h(5) h(6) h(7) h(8) h(9) h(10)],{'#14488','#14490','#14492','#14494','#14495','#14500','#14501','#14504','#14506','#14507'})

figureHandle = gcf;
%# make all text in the figure to size 20 %and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)




subplot(2,2,2)

h(1) = plot([0:100:1000],fitRiseTimeDelFactorX14488factors(1)*[0:100:1000]+fitRiseTimeDelFactorX14488factors(2),'r-.','LineWidth',6)
hold on
plot(DelFactorX14488,RiseTimeDelFactorX14488,'ro','LineWidth',6,'MarkerSize',12);
grid on
box on
h(2) = plot([0:100:1000],fitRiseTimeDelFactorX14490factors(1)*[0:100:1000]+fitRiseTimeDelFactorX14490factors(2),'g--','LineWidth',6)
plot(DelFactorX14490,RiseTimeDelFactorX14490,'gd','LineWidth',6,'MarkerSize',12);
h(3) = plot([0:100:1000],fitRiseTimeDelFactorX14492factors(1)*[0:100:1000]+fitRiseTimeDelFactorX14492factors(2),'b-','LineWidth',6)
plot(DelFactorX14492,RiseTimeDelFactorX14492,'bs','LineWidth',6,'MarkerSize',12);
h(4) = plot([0:100:1000],fitRiseTimeDelFactorX14494factors(1)*[0:100:1000]+fitRiseTimeDelFactorX14494factors(2),'m:','LineWidth',6)
plot(DelFactorX14494,RiseTimeDelFactorX14494,'m^','LineWidth',6,'MarkerSize',12);
h(5) = plot([0:100:1000],fitRiseTimeDelFactorX14495factors(1)*[0:100:1000]+fitRiseTimeDelFactorX14495factors(2),'-.','LineWidth',6,'Color',[1 0.5 0])
plot(DelFactorX14495,RiseTimeDelFactorX14495,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)
h(6) = plot([0:100:1000],fitRiseTimeDelFactorX14500factors(1)*[0:100:1000]+fitRiseTimeDelFactorX14500factors(2),'c--','LineWidth',6)
plot(DelFactorX14500,RiseTimeDelFactorX14500,'c*','LineWidth',6,'MarkerSize',12)
h(7) = plot([0:100:1100],fitRiseTimeDelFactorX14501factors(1)*[0:100:1100]+fitRiseTimeDelFactorX14501factors(2),':','LineWidth',6,'Color',[0.5 0.5 0.5])
plot(DelFactorX14501,RiseTimeDelFactorX14501,'x','MarkerEdgeColor',[0.5 0.5 0.5],'LineWidth',6,'MarkerSize',12)
h(8) = plot([0:100:1100],fitRiseTimeDelFactorX14504factors(1)*[0:100:1100]+fitRiseTimeDelFactorX14504factors(2),'-.','LineWidth',6,'Color',[0 0.5 1])
plot(DelFactorX14504,RiseTimeDelFactorX14504,'v','MarkerEdgeColor',[0 0.5 1],'LineWidth',6,'MarkerSize',12)
h(9) = plot([0:100:1100],fitRiseTimeDelFactorX14506factors(1)*[0:100:1100]+fitRiseTimeDelFactorX14506factors(2),'--','LineWidth',6,'Color',[0.75 0.75 0])
plot(DelFactorX14506,RiseTimeDelFactorX14506,'<','MarkerEdgeColor',[0.75 0.75 0],'LineWidth',6,'MarkerSize',12)
h(10) = plot([0:100:1100],fitRiseTimeDelFactorX14507factors(1)*[0:100:1100]+fitRiseTimeDelFactorX14507factors(2),'-','LineWidth',6,'Color',[0.75 0 0.75])
plot(DelFactorX14507,RiseTimeDelFactorX14507,'>','MarkerEdgeColor',[0.75 0 0.75],'LineWidth',6,'MarkerSize',12)

xlabel('X Concentration Increase [%-activity]')
ylabel('{\itT_P-T} [min]')
tB = title('B');
axis([0 450 2 5])
lB = legend([h(1) h(2) h(3) h(4) h(5) h(6) h(7) h(8) h(9) h(10)],{'#14488','#14490','#14492','#14494','#14495','#14500','#14501','#14504','#14506','#14507'})

figureHandle = gcf;
%# make all text in the figure to size 20 %and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)



subplot(2,2,3)

h(1) = plot([0:100:1000],fitDelayDelFactorX14488factors(1)*[0:100:1000]+fitDelayDelFactorX14488factors(2),'r-.','LineWidth',6)
hold on
plot(DelFactorX14488,DelayDelFactorX14488,'ro','LineWidth',6,'MarkerSize',12);
grid on
box on
h(2) = plot([0:100:1000],fitDelayDelFactorX14490factors(1)*[0:100:1000]+fitDelayDelFactorX14490factors(2),'g--','LineWidth',6)
plot(DelFactorX14490,DelayDelFactorX14490,'gd','LineWidth',6,'MarkerSize',12);
h(3) = plot([0:100:1000],fitDelayDelFactorX14492factors(1)*[0:100:1000]+fitDelayDelFactorX14492factors(2),'b-','LineWidth',6)
plot(DelFactorX14492,DelayDelFactorX14492,'bs','LineWidth',6,'MarkerSize',12);
h(4) = plot([0:100:1000],fitDelayDelFactorX14494factors(1)*[0:100:1000]+fitDelayDelFactorX14494factors(2),'m:','LineWidth',6)
plot(DelFactorX14494,DelayDelFactorX14494,'m^','LineWidth',6,'MarkerSize',12);
h(5) = plot([0:100:1000],fitDelayDelFactorX14495factors(1)*[0:100:1000]+fitDelayDelFactorX14495factors(2),'-.','LineWidth',6,'Color',[1 0.5 0])
plot(DelFactorX14495,DelayDelFactorX14495,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)
h(6) = plot([0:100:1000],fitDelayDelFactorX14500factors(1)*[0:100:1000]+fitDelayDelFactorX14500factors(2),'c--','LineWidth',6)
plot(DelFactorX14500,DelayDelFactorX14500,'c*','LineWidth',6,'MarkerSize',12)
h(7) = plot([0:100:1100],fitDelayDelFactorX14501factors(1)*[0:100:1100]+fitDelayDelFactorX14501factors(2),':','LineWidth',6,'Color',[0.5 0.5 0.5])
plot(DelFactorX14501,DelayDelFactorX14501,'x','MarkerEdgeColor',[0.5 0.5 0.5],'LineWidth',6,'MarkerSize',12)
h(8) = plot([0:100:1100],fitDelayDelFactorX14504factors(1)*[0:100:1100]+fitDelayDelFactorX14504factors(2),'-.','LineWidth',6,'Color',[0 0.5 1])
plot(DelFactorX14504,DelayDelFactorX14504,'v','MarkerEdgeColor',[0 0.5 1],'LineWidth',6,'MarkerSize',12)
h(9) = plot([0:100:1100],fitDelayDelFactorX14506factors(1)*[0:100:1100]+fitDelayDelFactorX14506factors(2),'--','LineWidth',6,'Color',[0.75 0.75 0])
plot(DelFactorX14506,DelayDelFactorX14506,'<','MarkerEdgeColor',[0.75 0.75 0],'LineWidth',6,'MarkerSize',12)
h(10) = plot([0:100:1100],fitDelayDelFactorX14507factors(1)*[0:100:1100]+fitDelayDelFactorX14507factors(2),'-','LineWidth',6,'Color',[0.75 0 0.75])
plot(DelFactorX14507,DelayDelFactorX14507,'>','MarkerEdgeColor',[0.75 0 0.75],'LineWidth',6,'MarkerSize',12)

xlabel('X Concentration Increase [%-activity]')
ylabel('{\itT} [min]')
tC = title('C');
axis([0 450 1.6 3.4])
lC = legend([h(1) h(2) h(3) h(4) h(5) h(6) h(7) h(8) h(9) h(10)],{'#14488','#14490','#14492','#14494','#14495','#14500','#14501','#14504','#14506','#14507'})

figureHandle = gcf;
%# make all text in the figure to size 20 %and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)



subplot(2,2,4)

h(1) = plot([0:100:1000],fitETPDelFactorX14488factors(1)*[0:100:1000]+fitETPDelFactorX14488factors(2),'r-.','LineWidth',6)
hold on
plot(DelFactorX14488,ETPDelFactorX14488,'ro','LineWidth',6,'MarkerSize',12);
grid on
box on
h(2) = plot([0:100:1000],fitETPDelFactorX14490factors(1)*[0:100:1000]+fitETPDelFactorX14490factors(2),'g--','LineWidth',6)
plot(DelFactorX14490,ETPDelFactorX14490,'gd','LineWidth',6,'MarkerSize',12);
h(3) = plot([0:100:1000],fitETPDelFactorX14492factors(1)*[0:100:1000]+fitETPDelFactorX14492factors(2),'b-','LineWidth',6)
plot(DelFactorX14492,ETPDelFactorX14492,'bs','LineWidth',6,'MarkerSize',12);
h(4) = plot([0:100:1000],fitETPDelFactorX14494factors(1)*[0:100:1000]+fitETPDelFactorX14494factors(2),'m:','LineWidth',6)
plot(DelFactorX14494,ETPDelFactorX14494,'m^','LineWidth',6,'MarkerSize',12);
h(5) = plot([0:100:1000],fitETPDelFactorX14495factors(1)*[0:100:1000]+fitETPDelFactorX14495factors(2),'-.','LineWidth',6,'Color',[1 0.5 0])
plot(DelFactorX14495,ETPDelFactorX14495,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)
h(6) = plot([0:100:1000],fitETPDelFactorX14500factors(1)*[0:100:1000]+fitETPDelFactorX14500factors(2),'c--','LineWidth',6)
plot(DelFactorX14500,ETPDelFactorX14500,'c*','LineWidth',6,'MarkerSize',12)
h(7) = plot([0:100:1100],fitETPDelFactorX14501factors(1)*[0:100:1100]+fitETPDelFactorX14501factors(2),':','LineWidth',6,'Color',[0.5 0.5 0.5])
plot(DelFactorX14501,ETPDelFactorX14501,'x','MarkerEdgeColor',[0.5 0.5 0.5],'LineWidth',6,'MarkerSize',12)
h(8) = plot([0:100:1100],fitETPDelFactorX14504factors(1)*[0:100:1100]+fitETPDelFactorX14504factors(2),'-.','LineWidth',6,'Color',[0 0.5 1])
plot(DelFactorX14504,ETPDelFactorX14504,'v','MarkerEdgeColor',[0 0.5 1],'LineWidth',6,'MarkerSize',12)
h(9) = plot([0:100:1100],fitETPDelFactorX14506factors(1)*[0:100:1100]+fitETPDelFactorX14506factors(2),'--','LineWidth',6,'Color',[0.75 0.75 0])
plot(DelFactorX14506,ETPDelFactorX14506,'<','MarkerEdgeColor',[0.75 0.75 0],'LineWidth',6,'MarkerSize',12)
h(10) = plot([0:100:1100],fitETPDelFactorX14507factors(1)*[0:100:1100]+fitETPDelFactorX14507factors(2),'-','LineWidth',6,'Color',[0.75 0 0.75])
plot(DelFactorX14507,ETPDelFactorX14507,'>','MarkerEdgeColor',[0.75 0 0.75],'LineWidth',6,'MarkerSize',12)

xlabel('X Concentration Increase [%-activity]')
ylabel('IIa_{tot} [\muM min]')
tD = title('D');
axis([0 450 0.6 2])
lD = legend([h(1) h(2) h(3) h(4) h(5) h(6) h(7) h(8) h(9) h(10)],{'#14488','#14490','#14492','#14494','#14495','#14500','#14501','#14504','#14506','#14507'})

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
