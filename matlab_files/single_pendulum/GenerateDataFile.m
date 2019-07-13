% Single pendulum
F=fopen('data.txt','w');

NumOfBodies=1;
NumOfRevJoints=1;
NumOfTransJoints=0;

eps=1.0e-10;
alfa=1.0e8;
om=1;
xi=1.0e5;

t0=0;
tf=5;
timeStep=1.0e-3;

PA=[0 0]';

PC1=[0.5 -0.5]';

M1=2;

J1=0.5;

fprintf(F,'%d \n',NumOfBodies);
fprintf(F,'%d \n',NumOfRevJoints);
fprintf(F,'%d \n',NumOfTransJoints);
fprintf(F,'\n');

fprintf(F,'%e \n',eps); 
fprintf(F,'%e \n',alfa); 
fprintf(F,'%e \n',om); 
fprintf(F,'%e \n',xi); 

fprintf(F,'%e \n',t0); 
fprintf(F,'%e \n',tf);  
fprintf(F,'%e \n',timeStep); 
fprintf(F,'\n');

% Mass and moment of inertia
fprintf(F,'%e\t%e\n', M1,J1);
fprintf(F,'\n');

% Configuration of rotational joints
fprintf(F,'%d\t%d\n', 1,2);             % joint A
fprintf(F,'%e\t%e\n', PA-PC1, PA);

% Initial position
fprintf(F,'%e\t%e\n', PC1,0);
fprintf(F,'\n');

% Initial momenta
fprintf(F,'%e\t', zeros(3,1));
fprintf(F,'\n');

fclose('all');
clear