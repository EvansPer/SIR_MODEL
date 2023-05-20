function plot_death_model(t,time,total_removals,deaths,model_D,model_D_vs_R)

    figure('units','normalized','outerposition',[0 0 1 1]);
    subplot(1,2,1);
    plot(total_removals,deaths,"*","LineWidth",1);
    hold on;
    plot(model_D_vs_R);
    hold off;
    legend("Raw data","Fit model","Location","east")
    grid on;
    xlabel("Total removed","FontWeight","bold");
    ylabel("Deaths","FontWeight","bold");
    
    subplot(1,2,2);
    plot(time,deaths,"diamond","LineWidth",1); hold on;
    plot(t,model_D,"--","LineWidth",1);
    hold off;
    legend("Deaths","Fit D(R_m)","Location","east");  
    grid on;
    xlabel("Time [days]","FontWeight","bold");
    ylabel("Deaths","FontWeight","bold");
 
    saveas(gcf,"GRAPHS/MODEL_DEATHS.jpg");
    
end