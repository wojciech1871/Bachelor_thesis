function dY= H(t,Y)
global NumOfBodies NumOfRevJoints NumOfTransJoints alfa xi om;

    q=Y(1:3*NumOfBodies,:);
    dq=Y(3*NumOfBodies+1:6*NumOfBodies,:);

    Fq=Jacobi(q);

    A=[MassMatrix,Fq';Fq,zeros(2*(NumOfRevJoints+NumOfTransJoints))];
    b=[Force(q);Gamma(q,dq)-2*xi*om*Fq*dq-om*om*Constraint(q)];
    x=A\b;

    dY(1:3*NumOfBodies,:)=dq;
    dY(3*NumOfBodies+1:6*NumOfBodies,:)=x(1:3*NumOfBodies,1);
end

