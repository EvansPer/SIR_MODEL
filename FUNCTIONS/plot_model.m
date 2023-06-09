function plot_model(t,y)

% This function provides a graph showing:
% - t vs y (ODE solution of the SIR model)

% It saves the figure generated in the folder "GRAPHS" with the name
% "MODEL.jpg"

% INPUT PARAMETERS:
% - t: nx1 column vector (n generic) generated by solving the ODE SIR model, being the
%   time vector of the former
% - y: nx3 matrix (n generic) being the ODE system solution of the SIR model 
%   (y(:,1) = S(t), y(:,2) = I(t), y(:,3) = R_m(t)) normalized to 1

% The function generates one plot, a legend, draws a grid on the canva and titles the axes.

    figure('units','normalized','outerposition',[0 0 1 1]);

    plot(t,y,"LineWidth",1);

    legend("Susceptibles","Infeted","Removed","Location","east");

    grid on;
    xlabel("Time [days]","FontWeight","bold");
    ylabel("SIR solutions","FontWeight","bold");

    saveas(gcf,"GRAPHS/MODEL.jpg");

end