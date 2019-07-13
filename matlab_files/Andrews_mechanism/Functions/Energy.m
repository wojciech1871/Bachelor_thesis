% Calculate Total Energy for mechanism
function E = Energy(q,dq)

    tau=0.033;
    k=4530;
    L0=0.07785;
    OC=[0.01400;0.07200];
    ED=[0.02;0.017];
    CEBD=[0.01043;0.01626];
    sD=ED-CEBD;
    
    E=0.5*dq*MassMatrix*dq';
    rEBD=q(19:20)';
    fiEBD=q(21);

    L=OC-rEBD-rotation(fiEBD)*sD;
    PotEnergy=1/2*k*(norm(L)-L0)^2;
    E=E+PotEnergy-tau*q(3);
end
