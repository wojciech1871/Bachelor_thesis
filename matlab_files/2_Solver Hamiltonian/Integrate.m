% Inegrate with ode45
global q0 p0 t0 timeStep tf;

t=[t0:timeStep:tf]';
Y0=[q0;p0;zeros((NumOfRevJoints+NumOfTransJoints)*2,1)];
[t,Y]=ode45(@H,t,Y0);

for i=1:length(t)
    dY(i,:)=H(t(i,:),Y(i,:)')';
    norms(i,:)=0;
end
