function [dY,sigma]= H(Y)
global NumOfBodies NumOfRevJoints NumOfTransJoints alfa xi om;

    q=Y(1:3*NumOfBodies,:);
    p=Y(3*NumOfBodies+1:6*NumOfBodies,:);

    Fq=Jacobi(q);

    A=[MassMatrix,Fq';Fq,zeros(2*(NumOfRevJoints+NumOfTransJoints))];
    b=[p;zeros(2*(NumOfRevJoints+NumOfTransJoints),1)];
    x=A\b;
    
    dq=x(1:3*NumOfBodies,:);
    dY(1:3*NumOfBodies,:)=dq;
    sigma=x(3*NumOfBodies+1:3*NumOfBodies+2*(NumOfRevJoints+NumOfTransJoints),:);
    dY(3*NumOfBodies+1:6*NumOfBodies,:)=Force(q)-dJacobi(q,dq)'*sigma;
end

