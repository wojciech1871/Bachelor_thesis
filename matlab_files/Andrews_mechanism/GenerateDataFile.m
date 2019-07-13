% Andrew's mechanism
F=fopen('data.txt','w');

NumOfBodies=7;
NumOfRevJoints=10;
NumOfTransJoints=0;

eps=1.0e-10;
alfa=1.0e8;
om=1;
xi=1.0e5;

t0=0;
tf=0.05;
timeStep=1.0e-6;

GenAndrew;

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
fprintf(F,'%e\t%e\n', MOF,JOF);
fprintf(F,'%e\t%e\n', MEF,JEF);
fprintf(F,'%e\t%e\n', MHE,JHE);
fprintf(F,'%e\t%e\n', MGE,JGE);
fprintf(F,'%e\t%e\n', MAG,JAG);
fprintf(F,'%e\t%e\n', MAH,JAH);
fprintf(F,'%e\t%e\n', MEBD,JEBD);
fprintf(F,'\n');

% Configuration of rotational joints
fprintf(F,'%d\t%d\n', 1,8);
fprintf(F,'%e\t%e\n', -COF, zeros(2,1));    %joint O
fprintf(F,'%d\t%d\n', 1,2);
fprintf(F,'%e\t%e\n', OF-COF, EF-CEF);      %joint F
fprintf(F,'%d\t%d\n', 2,3);
fprintf(F,'%e\t%e\n', -CEF, HE-CHE);        %joint E
fprintf(F,'%d\t%d\n', 2,4);
fprintf(F,'%e\t%e\n', -CEF, GE-CGE);
fprintf(F,'%d\t%d\n', 2,7);
fprintf(F,'%e\t%e\n', -CEF, -CEBD);
fprintf(F,'%d\t%d\n', 4,5);
fprintf(F,'%e\t%e\n', -CGE, AG-CAG);    	%joint G
fprintf(F,'%d\t%d\n', 3,6);
fprintf(F,'%e\t%e\n', -CHE, AH-CAH);        %joint H
fprintf(F,'%d\t%d\n', 5,8);
fprintf(F,'%e\t%e\n', -CAG, OA);    %joint A
fprintf(F,'%d\t%d\n', 6,8);
fprintf(F,'%e\t%e\n', -CAH, OA);
fprintf(F,'%d\t%d\n', 7,8);
fprintf(F,'%e\t%e\n', EB-CEBD, OB);    %joint B

% Initial position
fprintf(F,'%20.20e\t', y2);
fprintf(F,'\n');

% Initial momenta
fprintf(F,'%e\t', zeros(21,1));
fprintf(F,'\n');

fclose('all');
clear