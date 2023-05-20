function plot_model(t,y)

    figure('units','normalized','outerposition',[0 0 1 1]);

    plot(t,y,"LineWidth",1);

    legend("Susceptibles","Infeted","Removed","Location","east");

    grid on;
    xlabel("Time [days]","FontWeight","bold");
    ylabel("SIR solutions","FontWeight","bold");

    saveas(gcf,"GRAPHS/MODEL.jpg");

end