addpath('./Functions');
GenerateDataFile;
global NumOfBodies NumOfRevJoints NumOfTransJoints; 
global io jo sAo sBo ip jp fi0 v sAp sBp Mass Jz;
global q0 p0;
global eps alfa om xi t0 tf timeStep;

F=fopen('data.txt','r');

NumOfBodies=fscanf(F,'%d',[1]);
NumOfRevJoints=fscanf(F,'%d',[1]);
NumOfTransJoints=fscanf(F,'%d',[1]);

eps=fscanf(F,'%e',[1]);
alfa=fscanf(F,'%e',[1]);
om=fscanf(F,'%e',[1]);
xi=fscanf(F,'%e',[1]);

t0=fscanf(F,'%e',[1]);
tf=fscanf(F,'%e',[1]);
timeStep=fscanf(F,'%e',[1]);

for i=1:NumOfBodies
    Mass(i)=fscanf(F,'%e',[1]);
    Jz(i)=fscanf(F,'%e',[1]);
end

for i=1:NumOfRevJoints
    io(i)=fscanf(F,'%d',[1]);
    jo(i)=fscanf(F,'%d',[1]);
    sAo(:,i)=fscanf(F,'%e',[2]);
    sBo(:,i)=fscanf(F,'%e',[2]);
end

for i=1:NumOfTransJoints
    ip(i)=fscanf(F,'%d',[1]);
    jp(i)=fscanf(F,'%d',[1]);
    fi0(i)=fscanf(F,'%e',[1]);
    v(:,i)=fscanf(F,'%e',[2]);
    sAp(:,i)=fscanf(F,'%e',[2]);
    sBp(:,i)=fscanf(F,'%e',[2]);
end

q0=fscanf(F,'%e',[NumOfBodies*3]);
p0=fscanf(F,'%e',[NumOfBodies*3]);

fclose('all');
