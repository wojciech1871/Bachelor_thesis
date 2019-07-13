function dY = H(t,Y)

global NumOfBodies NumOfRevJoints NumOfTransJoints alfa xi om;

    q=Y(1:3*NumOfBodies,:);
    p=Y(3*NumOfBodies+1:6*NumOfBodies,:);
    iConstraint=Y(6*NumOfBodies+1:6*NumOfBodies+(NumOfRevJoints+NumOfTransJoints)*2,:);

    dq=MassMatrix\p;
    sigma=zeros((NumOfRevJoints+NumOfTransJoints)*2,1);
    iter=1;
    ddq=1;
    while(iter<6 && ddq>eps)
        dqOld=dq;
        A=MassMatrix+Jacobi(q)'*alfa*Jacobi(q);
        b=MassMatrix*dq-Jacobi(q)'*alfa*(2*xi*om*Constraint(q)+om*om*iConstraint);
        dq=A\b;
        sigma=sigma+alfa*(Jacobi(q)*dq+2*xi*om*Constraint(q)+om*om*iConstraint);
        iter=iter+1;
        ddq=norm(dq-dqOld);
    end

    dY(1:3*NumOfBodies,:)=dq;
    dY(3*NumOfBodies+1:6*NumOfBodies,:)=Force(q)+dJacobi(q,dq)'*alfa*...
        (Jacobi(q)*dq+2*xi*om*Constraint(q)+om*om*iConstraint)+dJacobi(q,dq)'*sigma;
    dY(6*NumOfBodies+1:length(Y),:)=Constraint(q);

end

