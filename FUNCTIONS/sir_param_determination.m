function [t,y] = sir_param_determination(a,b,tspan,y0,options,active_infections,threshold)

% This function provides the parameters "a" and "b" describing the ODE
% reported in the introduction, and then build the solution for that system
% of ODE, [t,y].
% The duoble iterative cycle spans over the 2 vectors a and b in which I
% assumed the true value of the parameters would have been. 
% Within the cylces, the sir model is built by means of the function "sir",
% then the system of ODE is solved with the function "ODE45". The
% difference between the raw data (active infections) and the model (y) is accounted by the
% function "model_fitting". If this difference is smaller than a provided
% threshold (so if delta == true), the associated parameters "a" and "b" are identified and the
% cylces are stopped.

    flag = false;
    for i = 1:length(a)
        for j = 1:length(b)
            sir_func = @(t,y) sir(t,y,a(i),b(j));
            [t,y] = ode45(sir_func,tspan,y0,options);
            [delta, error] = model_fitting(active_infections,y,threshold);
            if delta == true
                disp("a = " + a(i) + ", b = " + b(j) + ", y_{model} - y_{active inf} = " + error);
                flag = true;
                break
            end 
        end
        if flag == true
            break
        end
    end
end
