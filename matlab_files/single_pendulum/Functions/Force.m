% Function generates Forces
function Q = Force(q)
global NumOfBodies Mass g;

    g=[0 -9.81]';

    Q=zeros(3*NumOfBodies,1);

    for i=1:NumOfBodies
        Q(3*i-2:3*i-1,:)=Mass(i)*g;
    end

end