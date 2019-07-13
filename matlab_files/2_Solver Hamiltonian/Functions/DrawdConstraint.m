function p = DrawdConstraint(t,Y,dY)
global NumOfBodies;
    
    set(0,'defaulttextinterpreter','latex')
    for i=1:length(t)
        normdConstraint(i)=norm(Jacobi(Y(i,1:3*NumOfBodies)')*dY(i,1:3*NumOfBodies)');
    end

    figure('DefaultAxesFontSize',20,'DefaultAxesFontName','Times New Roman');
    p = plot(t,normdConstraint);
    %title('Odchylenie wiêzów prêdkoœci','FontName','Times New Roman','FontWeight','Normal','FontSize',20);
    xlabel('Czas (s)','FontSize',22)
    ylabel('$|\dot{\Phi}| \left(\frac{m}{s} \right)$','fontweight','bold','FontSize',22);
    p(1).LineWidth=1;
    grid on;


end