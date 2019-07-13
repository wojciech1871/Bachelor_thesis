% Calculate dForce using sinite difference method
function dF = dForce_v2(q)
    delQ=1.0e-12;
    
    %{
    for i=1:length(q)
        q2=q;
        q1=q;
        q2(i)=q1(i)+delQ;
        q1(i)=q2(i)-delQ;
        dF(:,i)=(Force(q2)-Force(q1))/(2*delQ);
    end
    %}
    dF=zeros(length(Force(q)),length(q));
    for i=18:length(q)
        q2=q;
        q1=q;
        q2(i)=q2(i)+delQ;
        q1(i)=q1(i)-delQ;
        dF(:,i)=(Force(q2)-Force(q1))/(2*delQ);
    end
end