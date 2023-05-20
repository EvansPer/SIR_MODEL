function plot_model_vs_data(time,t,y,active_infections,total_removals,recovers,total_infected,model_recovered,model_total_infected)

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
    
    figure('units','normalized','outerposition',[0 0 1 1]);

    subplot(2,2,1);
    plot(time,active_infections,"*","LineWidth",1); hold on;
    plot(t,y(:,2),"--","LineWidth",1); hold off;
    legend("Active infections","SIR I(t)","Location","east");
    grid on;
    xlabel("Time [days]","FontWeight","bold");
    ylabel("Active infections / I(t)","FontWeight","bold");

    subplot(2,2,2);
    plot(time,total_removals,".","LineWidth",1); hold on;
    plot(t,y(:,3),"--","LineWidth",1); hold off;
    legend("Removed","SIR R_m(t)","Location","east");
    grid on;
    xlabel("Time [days]","FontWeight","bold");
    ylabel("Removed / R_m(t)","FontWeight","bold")

    subplot(2,2,3);
    plot(time,recovers,"o","LineWidth",1); hold on;
    plot(t,model_recovered,"--","LineWidth",1); hold off;
    legend("Recovers","Model R(t)","Location","east");
    grid on;
    xlabel("Time [days]","FontWeight","bold");
    ylabel("Recovered / R(t)","FontWeight","bold");

    subplot(2,2,4);
    plot(time,total_infected,"Marker","hexagram","LineWidth",1); hold on;
    plot(t,model_total_infected,"--","LineWidth",1); hold off;
    legend("Total infected","SIR I_T(t)","Location","east");
    grid on;
    xlabel("Time [days]","FontWeight","bold");
    ylabel("Total infected / I_T(t)","FontWeight","bold");
    
    Folder = cd;
    Folder = fullfile(Folder, '..');
    saveas(gcf,fullfile(Folder,"/GRAPHS/MODEL_vs_DATA.jpg"));

end
