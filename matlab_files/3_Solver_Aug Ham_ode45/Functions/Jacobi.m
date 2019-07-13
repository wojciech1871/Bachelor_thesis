% Function calculates Jacobi Matrix
function J = Jacobi(q)
global NumOfBodies NumOfRevJoints NumOfTransJoints; 
global io jo sAo sBo v sAp;

    J=zeros(2*(NumOfRevJoints+NumOfTransJoints),3*NumOfBodies);
    for i=1:NumOfBodies
        r(:,i)=q((3*i-2):(3*i-1),1); 
        fi(i)=q(3*i,1);
    end
    r(:,NumOfBodies+1)=[0;0];
    fi(NumOfBodies+1) = 0;

    for i = 1:NumOfRevJoints
        m=io(i);
        n=jo(i);
        J(2*i-1:2*i,3*m-2:3*m-1)=eye(2);
        J(2*i-1:2*i,3*m)=omega*rotation(fi(m))*sAo(:,i);
        if (n<=NumOfBodies)
        J(2*i-1:2*i,3*n-2:3*n-1)=-eye(2);
        J(2*i-1:2*i,3*n)=-omega*rotation(fi(n))*sBo(:,i);
        end
    end

    for i = 1:NumOfTransJoints
        m=io(i);
        n=jo(i);
        J(2*NumOfRevJoints+2*i-1,3*m-2:3*m-1)=-(rotation(fi(n))*v(:,i))';
        J(2*NumOfRevJoints+2*i-1,3*m)=-(rotation(fi(n))*v(:,i))'*omega*rotation(fi(m))*sAp(:,i); 
        J(2*NumOfRevJoints+2*i,3*m)=1;
        if (n<=NumOfBodies)
        J(2*NumOfRevJoints+2*i-1,3*n-2:3*n-1)=(rotation(fi(n))*v(:,i))';
        J(2*NumOfRevJoints+2*i-1,3*n)=-(rotation(fi(n))*v(:,i))'*omega*(r(:,n)-r(:,m)-rotation(fi(m))*sAp(:,i));
        J(2*NumOfRevJoints+2*i,3*n)=-1;
        end
    end
end

