function test_sir_param_determination_syntax()

% This test verifies that, by calling the function "sir_param_determination" 
% with the right parameters, no syntax error arises.

% It is fed with:
% - the 2 ODE parameters A and B
% - time range tspan and Cauchy initial condition y0
% - no specific option (irrelevant, since odeset deals with integration
%   properties of the algorithm 
% - a raw data vector active_infections and a threshold

% By calling the function, if the parameters are wrong, a syntax error
% would arise.

    A = [0.1, 0.2, 0.3, 0.4];
    B = [0.5, 0.6, 0.7, 0.8];
    tspan = [0, 100];
    y0 = [0.99, 0.01, 0];
    options = odeset();
    active_infections = [100, 200, 300, 400, 500];
    threshold = 0.01;
    try
        [t,y] = sir_param_determination(A,B,tspan,y0,options,active_infections,threshold);
    catch err
        error("Syntax error: " + err.message);
    end
end
