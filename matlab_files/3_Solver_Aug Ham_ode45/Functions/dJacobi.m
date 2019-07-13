% Derivative of Jacobi Matrix
function dJ = dJacobi(q,dq)
global NumOfBodies NumOfRevJoints NumOfTransJoints; 
global io jo sAo sBo ip jp fi0 v sAp sBp;

    dJ=zeros(2*(NumOfRevJoints+NumOfTransJoints),3*NumOfBodies);
    for i=1:NumOfBodies
        r(:,i)=q((3*i-2):(3*i-1),:); 
        fi(i)=q(3*i,:);
        dr(:,i)=dq((3*i-2):(3*i-1),:); 
        dfi(i)=dq(3*i,:);
    end
    r(:,NumOfBodies+1)=[0;0];
    fi(NumOfBodies+1) = 0;
    dr(:,NumOfBodies+1)=[0;0];
    dfi(NumOfBodies+1) = 0;

    for i=1:NumOfRevJoints
        m=io(i);
        n=jo(i);
        dJ(2*i-1:2*i,3*m)=-rotation(fi(m))*sAo(:,i)*dfi(m);
        if (n<=NumOfBodies)
        dJ(2*i-1:2*i,3*n)=rotation(fi(n))*sBo(:,i)*dfi(n);
        end
    end
    
    for i=1:NumOfTransJoints
        m=ip(i);
        n=jp(i);
        dJ(2*NumOfRevJoints+2*i-1,3*m-2:3*m-1) =(rotation(fi(n))*v(:,i))'*omega*dfi(n);
        dJ(2*NumOfRevJoints+2*i-1,3*m)=(rotation(fi(n))*v(:,i))'*rotation(fi(m))*sAp(:,i)*(dfi(m)-dfi(n));
        if (n<=NumOfBodies)
        dJ(2*NumOfRevJoints+2*i-1,3*n-2:3*n-1) =-(rotation(fi(n))*v(:,i))'*omega*dfi(n);
        dJ(2*NumOfRevJoints+2*i-1,3*n)=(-dr(:,m)-omega*rotation(m)*sAp(:,i)*dfi(m)+dr(:,n)-...
            omega*(r(:,n)-r(:,m)-rotation(m)*sAp(:,i))*dfi(n))'*omega*rotation(fi(n))*v(:,i);
        end
    end
end

