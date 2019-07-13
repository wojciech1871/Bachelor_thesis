% Function generates Mass Matrix
function MM = MassMatrix()
global NumOfBodies Mass Jz;

    for i=1:NumOfBodies
        MM(3*i-2:3*i-1,3*i-2:3*i-1)=eye(2)*Mass(i);
        MM(3*i,3*i)=Jz(i);
    end
end