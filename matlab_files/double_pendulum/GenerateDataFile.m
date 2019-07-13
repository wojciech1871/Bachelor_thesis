% Double pendulum
F=fopen('data.txt','w');

NumOfBodies=2;
NumOfRevJoints=2;
NumOfTransJoints=0;

eps=1.0e-7;
alfa=1.0e8;
om=12;
xi=12;

t0=0;
tf=5;
timeStep=1.0e-3;

L1=1;
L2=1.5;

fi1=pi/4;
fi2=pi/2;

M1=6;
M2=10;

J1=1;
J2=1.6;

PC1=rotation(fi1-pi)*[0; L1/2];
PC2=rotation(fi1-pi)*[0; L1]+rotation(fi2-pi)*[0; L2/2];

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
fprintf(F,'%e\t%e\n', M2,J2);
fprintf(F,'\n');

% Configuration of rotational joints
fprintf(F,'%d\t%d\n', 1,3);             % joint A
fprintf(F,'%e\t%e\n', [0; L1/2], [0; 0]);

fprintf(F,'%d\t%d\n', 1,2);             % joint B
fprintf(F,'%e\t%e\n', [0; -L1/2], [0; L2/2]);

% Initial position
fprintf(F,'%20.30e\t%20.30e\n', PC1,pi/4);
fprintf(F,'%20.30e\t%20.30e\n', PC2,pi/2);
fprintf(F,'\n');

% Initial momenta
fprintf(F,'%e\t', zeros(6,1));
fprintf(F,'\n');

fclose('all');
clear