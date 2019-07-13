% Gamma vector
function P = Gamma(q,dq)
global NumOfBodies NumOfRevJoints NumOfTransJoints io jo sAo sBo sAp ip jp v;

    for i=1:NumOfBodies
        r(:,i)=q((3*i-2):(3*i-1),1); 
        fi(i)=q(3*i,1);
    end
    
    r(:,NumOfBodies+1)=[0;0];
    fi(NumOfBodies+1)=0;
    dr(:,NumOfBodies+1)=[0; 0];
    dfi(NumOfBodies+1)=0;
    
    for i=1:NumOfBodies
        dr(:,i)=dq((3*i-2):(3*i-1),1); 
        dfi(i)=dq(3*i,1);
    end

    for i=1:NumOfRevJoints
        P(2*i-1:2*i,1)=rotation(fi(io(i)))*sAo(:,i)*dfi(io(i))^2-rotation(fi(jo(i)))*sBo(:,i)*dfi(jo(i))^2;
    end
    
    for i = 1:NumOfTransJoints
        P(2*lpo+2*i-1,1)=(rotation(fi(jp(i)))*v(:,i))'*(2*omega*(dr(:,jp(i))-dr(:,ip(i)))*dfi(jp(i))+(r(:,jp(i))-...
        r(:,ip(i)))*dfi(jp(i))^2-rotation(fi(ip(i))) * sAp(:,i)*(dfi(jp(i))-dfi(ip(i)))^2);
        P(2*lpo+2*i,1)=0;
    end
end