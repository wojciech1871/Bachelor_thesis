% Calkowanie procedura TR+NumOfBodiesR
global NumOfBodies NumOfRevJoints NumOfTransJoints; 
global q0 p0 t0 tf timeStep eps alfa om xi;

iConstraint=zeros((NumOfRevJoints+NumOfTransJoints)*2,1);
iJacobi=zeros((NumOfRevJoints+NumOfTransJoints)*2,3*NumOfBodies);

numOfSteps=floor((tf-t0)/timeStep)+1;
t(1,:)=t0;
Y(:,1)=[q0;p0];
[dY(:,1),Sig(:,1)]=H(Y(:,1));
normSig(1)=norm(Sig(:,1));
norms(1)=0;
iters(1)=1;

for i=2:numOfSteps-1

    delY=1;
    iter=0;

    yOld=Y(:,i-1);
    dyOld=dY(:,i-1);
    q=yOld(1:3*NumOfBodies,1);
    iConstraint=iConstraint+timeStep*Constraint(q);
    iJacobi=iJacobi+timeStep*Jacobi(q);

    y=yOld+timeStep*dyOld;
    dy=dyOld;
    sigma=zeros((NumOfRevJoints+NumOfTransJoints)*2,1);

    while((norm(delY)>eps) && (iter<10))
        q=y(1:3*NumOfBodies,1);
        p=y(3*NumOfBodies+1:2*3*NumOfBodies,1);
        dq=dy(1:3*NumOfBodies,1);
        dp=dy(3*NumOfBodies+1:2*3*NumOfBodies,1);

        G1=timeStep/2*(MassMatrix*dq-p+Jacobi(q)'*sigma+Jacobi(q)'*alfa*...
           (Jacobi(q)*dq+2*xi*om*Constraint(q)+om*om*iConstraint));
        G2=timeStep/2*(dp-Force(q)-dJacobi(q,dq)'*sigma-dJacobi(q,dq)'*alfa*...
           (Jacobi(q)*dq+2*xi*om*Constraint(q)+om*om*iConstraint));

        DG1=MassMatrix+Jacobi(q)'*alfa*((1+timeStep*xi*om)*Jacobi(q)+timeStep*om*om/2*iJacobi);
        DG2=-dForce(q)-dJacobi(q,dq)'*alfa*((1+timeStep*xi*om)*Jacobi(q)+timeStep*om*om/2*iJacobi);

        F=[G1;G2];

        delQ=(DG1+timeStep/2*DG2)\(-G1-timeStep/2*G2);
        delP=-G2-DG2*delQ;

        delY=[delQ;delP];

        y=y+delY;
        dy=2/timeStep*(y-yOld)-dyOld;

        q=y(1:3*NumOfBodies,1);
        dq=dy(1:3*NumOfBodies,1);
        sigma=sigma+alfa*(Jacobi(q)*dq+2*xi*om*Constraint(q)+om*om*iConstraint);

        iter=iter+1;
    end
    Y(:,i)=y';
    dY(:,i)=dy';
    Sig(:,i)=sigma;
    normSig(i)=norm(sigma);
    t(i,:)=t(i-1,:)+timeStep;
    norms(i)=norm(delY);
    iters(i)=iter;
end
Y=Y';
dY=dY';
