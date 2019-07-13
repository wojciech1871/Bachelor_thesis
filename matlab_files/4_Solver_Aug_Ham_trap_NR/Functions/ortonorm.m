% Function calculates vector b orthogonal to a
function b = ortonorm(a)
    b(2,1)=sqrt(1/(1+(a(2)/a(1))^2));
    b(1,1)=-a(2)*b(2)/a(1);
end

