% Function calculates Constraints
function F = Constraint(q)
global NumOfBodies NumOfRevJoints NumOfTransJoints; 
global io jo sAo sBo ip jp fi0 v sAp sBp;

    for i=1:NumOfBodies
        r(:,i)=q((3*i-2):(3*i-1),:); 
        fi(i)=q(3*i,:);
    end
    r(:,NumOfBodies+1)=[0;0];
    fi(NumOfBodies+1)=0;

    for i=1:NumOfRevJoints
        m=io(i);
        n=jo(i);
        F((2*i-1):(2*i),:)=r(:,m)+rotation(fi(m))*sAo(:,i)-(r(:,n)+rotation(fi(n))*sBo(:,i));
    end

    for i=1:NumOfTransJoints
        m=ip(i);
        n=jp(i);
        F((2*NumOfRevJoints+2*i-1),:)=(rotation(fi(n))*v(:,i))'*(r(:,n)-r(:,m)-rotation(fi(m))*sAp(:,i))+v(:,i)'*sBp(:,i);
        F((2*NumOfRevJoints+2*i),:)=fi(m)-fi(n)-fi0(i);
    end
end