function [dY,sigma]= H(t,Y)
global NumOfBodies NumOfRevJoints NumOfTransJoints alfa xi om;

    q=Y(1:3*NumOfBodies,:);
    p=Y(3*NumOfBodies+1:6*NumOfBodies,:);
    iConstraint=Y(6*NumOfBodies+1:6*NumOfBodies+(NumOfRevJoints+NumOfTransJoints)*2,:);

    Fq=Jacobi(q);

    A=[MassMatrix,Fq';Fq,zeros(2*(NumOfRevJoints+NumOfTransJoints))];
    b=[p;-2*xi*om*Constraint(q)-om*om*iConstraint];
    x=A\b;

    dq=x(1:3*NumOfBodies,:);
    dY(1:3*NumOfBodies,:)=dq;
    sigma=-x(3*NumOfBodies+1:3*NumOfBodies+2*(NumOfRevJoints+NumOfTransJoints),:);
    dY(3*NumOfBodies+1:6*NumOfBodies,:)=Force(q)-dJacobi(q,dq)'*sigma;
    dY(6*NumOfBodies+1:length(Y),:)=Constraint(q);
end

