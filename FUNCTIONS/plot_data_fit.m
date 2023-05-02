function plot_data_fit(time,t,y,model_D_vs_R,model_D,model_recovered,model_total_infected,R_e)

% This function provides the graphical visualization of all the variables
% deployed in the simulation.

% It is fed with the time variable imported by the dataframe.mat
% configuration, the SIR solutions t and y, the fitting models obtained by
% the function model_R (model_D_vs_R,model_D,model_recovered,model_total_infected)
% and finally the reproductive rate R_e.
% It also loads all the variables from the dataframe "Norm_dataset" which
% is generated by the function normalization.

% It generates a subfolder named "GRAPHS" and saves all the plots inside
% this folder.

    load("Norm_dataset.mat","total_removals","new_positives","active_infections","deaths","recovers","total_infected");
    
    figure('units','normalized','outerposition',[0 0 1 1]);

    subplot(2,2,1);
    plot(time,active_infections,"*","LineWidth",1); hold on;
    plot(t,y(:,2),"--","LineWidth",1); hold off;
    legend("Active infections","SIR I(t)","Location","northeast");
    grid on;
    xlabel("Time [days]","FontWeight","bold");
    ylabel("Active infections / I(t)","FontWeight","bold");

    subplot(2,2,2);
    plot(time,total_removals,".","LineWidth",1); hold on;
    plot(t,y(:,3),"--","LineWidth",1); hold off;
    legend("Removed","SIR R_m(t)","Location","southeast");
    grid on;
    xlabel("Time [days]","FontWeight","bold");
    ylabel("Removed / R_m(t)","FontWeight","bold")

    subplot(2,2,3);
    plot(time,recovers,"o","LineWidth",1); hold on;
    plot(t,model_recovered,"--","LineWidth",1); hold off;
    legend("Recovers","Model R(t)","Location","southeast");
    grid on;
    xlabel("Time [days]","FontWeight","bold");
    ylabel("Recovered / R(t)","FontWeight","bold");

    subplot(2,2,4);
    plot(time,total_infected,"Marker","hexagram","LineWidth",1); hold on;
    plot(t,model_total_infected,"--","LineWidth",1); hold off;
    legend("Total infected","SIR I_T(t)","Location","southeast");
    grid on;
    xlabel("Time [days]","FontWeight","bold");
    ylabel("Total infected / I_T(t)","FontWeight","bold");
    
    if ~exist("GRAPHS","dir")
    mkdir("GRAPHS");
    end

    saveas(gcf, '././FUNCTIONS/GRAPHS/data_vs_model.jpg');

    figure('units','normalized','outerposition',[0 0 1 1]);
    plot(t,y,"LineWidth",1);
    legend("Susceptibles","Infeted","Removed","Location","east");
    grid on;
    xlabel("Time [days]","FontWeight","bold");
    ylabel("SIR solutions","FontWeight","bold");

    
    saveas(gcf, '././FUNCTIONS/GRAPHS/SIR_model.jpg');

    
    figure('units','normalized','outerposition',[0 0 1 1]);
    plot(t,R_e,"o","LineWidth",1);
    legend("Reproductive rate","Location","east");  
    grid on;
    xlabel("Time [days]","FontWeight","bold");
    ylabel("Reproductive rate","FontWeight","bold");

    saveas(gcf, '././FUNCTIONS/GRAPHS/R_e.jpg');

    
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
    
    saveas(gcf, '././FUNCTIONS/GRAPHS/model_R_plot.jpg');

end