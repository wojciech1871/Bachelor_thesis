function p = DrawCoordinate(body,coord,t,Y,dY)

    if (coord>=1) && (coord<=3)
        plot(t,Y(:,body*3+coord-3),'-');
        title("Position");
    elseif (coord>=4) && (coord<=6)
        plot(t,Y(:,body*6+coord-3),'-');
        title("Momentum");
    elseif (coord>=7) && (coord<=9)
        plot(t,dY(:,body*3+coord-9),'-');
        title("Velocity");
    elseif (coord>=10) && (coord<=12)
        plot(t,dY(:,body*6+coord-9),'-');
        title("dP/dt");
    else
        disp("Wrong data");
end

    grid on;
end
