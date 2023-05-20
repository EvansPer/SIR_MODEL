function plot_reproductive_rate(t,R_e)

    figure('units','normalized','outerposition',[0 0 1 1]);

    plot(t,R_e,"o","LineWidth",1);
    
    legend("Reproductive rate","Location","east");  
    
    grid on;
    xlabel("Time [days]","FontWeight","bold");
    ylabel("Reproductive rate","FontWeight","bold");

    saveas(gcf,"GRAPHS/REPRODUCTIVE_RATE.jpg");

end
