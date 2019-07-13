function F = AndrewsMech(x)
    %x1-angle OF; x2-angle EF; x3-angle HE; x4-angle GE
    %x5-angle AG; x6-angle AH; x7-angle of triangle EBD
    %x8-angle of spring; %x9-length of spring
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
    
    F(1:2)=rotation(x(1))*OF-rotation(x(2))*EF-rotation(x(3))*HE-rotation(x(6))*AH-OA;
    F(3:4)=rotation(x(1))*OF-rotation(x(2))*EF-rotation(x(4))*GE-rotation(x(5))*AG-OA;
    F(5:6)=rotation(x(1))*OF-rotation(x(2))*EF+rotation(x(7))*EB-OB;
    F(7)=x(1)-beta;
    F(8:9)=rotation(x(1))*OF-rotation(x(2))*EF+rotation(x(7))*ED+rotation(x(8))*[x(9);0]-OC;
    
end

