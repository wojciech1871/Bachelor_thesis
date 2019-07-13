% Function generates Forces
function Q = Force(q)
global NumOfBodies;

    tau=0.033;
    k=4530;
    L0=0.07785;
    OC=[0.01400;0.07200];
    ED=[0.02;0.017];
    CEBD=[0.01043;0.01626];
    sD=ED-CEBD;
    
    Q=zeros(3*NumOfBodies,1);
    Q(3,:)=tau;
    
    rEBD=q(19:20,:);
    fiEBD=q(21,:);
    
    L=OC-rEBD-rotation(fiEBD)*sD;
    normL=norm(L);
    versL=L/normL;
    
    Fk=k*(normL-L0);
    Q(19:21,:)=[eye(2);(omega*rotation(fiEBD)*sD)']*versL*Fk;
    
end