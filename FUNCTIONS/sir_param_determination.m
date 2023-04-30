function [t,y] = sir_param_determination(A,B,tspan,y0,options,active_infections,threshold)

% This function provides the parameters "A" and "B" describing the ODE
% reported in the introduction, and then build the solution for that system
% of ODE, [t,y].

% It is fed with tspan, y0 and options, used by the ODE45 function to build the 3 ODE
% solutions (commented in the data_config.m file), while active_infections is the raw data 
% vector imported by SIR_simulation, along with "threshold".

% The duoble iterative cycle spans over the 2 vectors A and B in which I
% assumed the true value of the parameters would have been.

% Within the cylces, the sir model is built by means of the function "sir",
% then the system of ODE is solved with the function "ODE45". 

% The difference between the raw data (active infections) and the model (y) is accounted by the
% function "model_fitting". If this difference is smaller than a provided
% threshold (so if delta == true), the associated parameters "A" and "B" are identified and the
% cylces are stopped.

    flag = false;
    for i = 1:length(A)
        for j = 1:length(B)
            sir_func = @(t,y) sir(t,y,A(i),B(j));
            [t,y] = ode45(sir_func,tspan,y0,options);
            [delta, error] = model_fitting(active_infections,y,threshold);
            if delta == true
                disp("a = " + A(i) + ", b = " + B(j) + ", y_{model} - y_{active inf} = " + error);
                flag = true;
                break
            end 
        end
        if flag == true
            break
        end
    end
end
