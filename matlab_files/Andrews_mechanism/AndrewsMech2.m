function F = AndrewsMech2(x)
    beta=-0.062;
    
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
    
    rOF=x(1:2);
    fiOF=x(3);
    rEF=x(4:5);
    fiEF=x(6);
    rHE=x(7:8);
    fiHE=x(9);
    rGE=x(10:11);
    fiGE=x(12);
    rAG=x(13:14);
    fiAG=x(15);
    rAH=x(16:17);
    fiAH=x(18);
    rEBD=x(19:20);
    fiEBD=x(21);
    
    F(1:2)=rOF+rotation(fiOF)*(-COF);   %joint O
    F(3:4)=rEF+rotation(fiEF)*(EF-CEF)-(rOF+rotation(fiOF)*(OF-COF));   %joint F
    F(5:6)=rHE+rotation(fiHE)*(HE-CHE)-(rEF+rotation(fiEF)*(-CEF));     %joint E
    F(7:8)=rGE+rotation(fiGE)*(GE-CGE)-(rEF+rotation(fiEF)*(-CEF));
    F(9:10)=rEBD+rotation(fiEBD)*(-CEBD)-(rEF+rotation(fiEF)*(-CEF));
    F(11:12)=rAG+rotation(fiAG)*(AG-CAG)-(rGE+rotation(fiGE)*(-CGE));   %joint G
    F(13:14)=rAH+rotation(fiAH)*(AH-CAH)-(rHE+rotation(fiHE)*(-CHE));   %joint H
    F(15:16)=rAG+rotation(fiAG)*(-CAG)-OA;   %joint A
    F(17:18)=rAH+rotation(fiAH)*(-CAH)-OA;
    F(19:20)=rEBD+rotation(fiEBD)*(EB-CEBD)-OB; %joint B
    F(21)=fiOF-beta;
end