% Inegrate with ode45
global NumOfRevJoints NumOfTransJoints q0 p0 t0 timeStep tf;

t=[t0:timeStep:tf]';
Constraint0=zeros((NumOfRevJoints+NumOfTransJoints)*2,1);
Y0=[q0;p0;Constraint0];
[t,Y]=ode15s(@H,t,Y0);

for i=1:length(t)
 dY(i,:)=H(t(i,:),Y(i,:)')';
 norms(i,:)=0;
end
