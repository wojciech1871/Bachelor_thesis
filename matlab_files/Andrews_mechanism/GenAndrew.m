options = optimoptions('fsolve');
options.FunctionTolerance=1.0e-15;
options.OptimalityTolerance=1.0e-15;

x1=zeros(9,1);
x1(1)=-0.062;
x1(2)=-0.062;
x1(3)=0.5;
x1(4)=-0.5;
x1(5)=0.5;
x1(6)=-0.5;

y1=fsolve(@AndrewsMech,x1,options);

x2=zeros(21,1);
x2(3)=y1(1);
x2(6)=y1(2);
x2(9)=y1(3);
x2(12)=y1(4);
x2(15)=y1(5);
x2(18)=y1(6);
x2(21)=y1(7);

y2=fsolve(@AndrewsMech2,x2,options);

MOF=0.04325;
MEF=0.00365; 
MHE=0.00706;    
MGE=0.00706; 
MAG=0.07050;
MAH=0.05498; 
MEBD=0.02373;

JOF=2.194e-6;
JEF=4.410e-7; 
JHE=5.667e-7;    
JGE=5.667e-7; 
JAG=1.169e-5;
JAH=1.912e-5; 
JEBD=5.255e-6;

OF=[0.007;0];
EF=[0.028;0];
HE=[0.02;0];
GE=[0.02;0];
AG=[0.04;0];
AH=[0.04;0];
EB=[0;0.035];
ED=[0.02;0.017];
DC=[0.07785;0];

OA=[-0.06934;-0.00227];
OB=[-0.03635;0.03273];
OC=[0.01400;0.07200];

COF=[0.00092;0];
CEF=[0.0165;0];
CHE=[0.00579;0];
CGE=[0.00579;0];
CAG=[0.02308;0.00916];
CAH=[0.01228;-0.00449];
CEBD=[0.01043;0.01626];
