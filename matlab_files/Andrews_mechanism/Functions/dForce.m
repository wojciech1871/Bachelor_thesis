% Calculate dForce using analytical formulas
function dF = dForce(q)
    
    dF=zeros(length(Force(q)),length(q));

    k=4530;
    L0=0.07785;
    OC=[0.01400;0.07200];
    ED=[0.02;0.017];
    CEBD=[0.01043;0.01626];
    sD=ED-CEBD;
        
    rEBD=q(19:20,:);
    fiEBD=q(21,:);
    
    L=OC-rEBD-rotation(fiEBD)*sD;
    normL=norm(L);
    versL=L/normL;
    
    A=eye(2)*k*(L0/normL-1);
    B=k*L0/normL^3*L*L';
    C=omega*rotation(fiEBD)*sD;
    
    dF(19:20,19:20)=eye(2)*A-B;
    dF(19:20,21)=(A-B)*C;
    dF(21,19:20)=C'*dF(19:20,19:20);
    dF(21,21)=C'*dF(19:20,21)-(rotation(fiEBD)*sD)'*(versL*k*(normL-L0));
end