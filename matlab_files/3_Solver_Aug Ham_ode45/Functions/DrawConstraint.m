function p = DrawConstraint(t,Y,dY)
global NumOfBodies;
    
    set(0,'defaulttextinterpreter','latex')
    for i=1:length(t)
        normConstraint(i)=norm(Constraint(Y(i,1:3*NumOfBodies)'));
    end
    
    figure('DefaultAxesFontSize',20,'DefaultAxesFontName','Times New Roman');
    p = plot(t,normConstraint);
    %title('Odchylenie wiêzów po³o¿eñ','FontName','Times New Roman','FontWeight','Normal','FontSize',26);
    xlabel('Czas (s)','FontSize',22)
    ylabel('$|\Phi|$ (m)','fontweight','bold','FontSize',22);
    p(1).LineWidth=1;
    grid on;

end