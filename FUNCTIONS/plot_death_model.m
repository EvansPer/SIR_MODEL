function plot_death_model(t,time,total_removed,deaths,model_D,model_D_vs_R)

% This function provides a graph with 2 subplots showing:
% - total_removals vs deaths fitted with model_D_vs_R
% - time vs deaths fitted with t vs model_D

% It saves the figure generated in the folder "GRAPHS" with the name
% "MODEL_DEATHS.jpg"

% INPUT PARAMETERS:
% - t: nx1 column vector (n generic) generated by solving the ODE SIR model, being the
%   time vector of the former
% - time: nx1 column vector being the time vector generated by the user
% - total_removed: nx1 column vector imported from the dataframe
% - deaths: nx1 column vector imported from the dataframe
% - model_D: nx1 column vector depending on total_removed -> D(t)
% - model_D_vs_R: fit object that encapsulates the result of fitting the model specified by the fittype FT
%   fit(total_removed,deaths,FitType,Initial_Guess) -> D = D(R_m)

% The function defines two subplots, generates a legend each, draws a grid on
% the canva and titles the axes.


    figure('units','normalized','outerposition',[0 0 1 1]);
    subplot(1,2,1);
    plot(total_removed,deaths,"*","LineWidth",1);
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