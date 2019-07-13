% Calculate Total Energy for mechanism
function E = Energy(q,dq)
global NumOfBodies Mass g;

    E=0.5*dq*MassMatrix*dq';
    PotEnergy=0;
    for i=1:NumOfBodies
        PotEnergy=PotEnergy+Mass(i)*g(2)*q(i*3-1);
    end
    E=E-PotEnergy;
end
