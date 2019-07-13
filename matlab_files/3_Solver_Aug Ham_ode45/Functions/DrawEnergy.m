function p = DrawEnergy(t,Y,dY)
global NumOfBodies;

    set(0,'defaulttextinterpreter','latex')
    E0=Energy(Y(1,1:3*NumOfBodies),dY(1,1:3*NumOfBodies));
    for i=1:length(t)
        E(i)=Energy(Y(i,1:3*NumOfBodies),dY(i,1:3*NumOfBodies))-E0;
    end
    
    figure('DefaultAxesFontSize',20,'DefaultAxesFontName','Times New Roman');
    p = plot(t,E);
    %title('Odchylenie energii','FontName','Times New Roman','FontWeight','Normal','FontSize',20);
    xlabel('Czas (s)','FontSize',22)
    ylabel('$\Delta U $ (J)','fontweight','bold','FontSize',22);
    p(1).LineWidth=1;
    grid on;
    
end