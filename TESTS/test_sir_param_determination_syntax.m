function test_sir_param_determination_syntax()

% This test verifies that, by calling the function "sir_param_determination" 
% with the right parameters, no syntax error arises.

% INIT PARAMETERS:
% - A, B = 1x4 row vector containing float positive elements to possibly
%   identify the SIR model parameters
% - tspan: 1x2 row vector containing initial and final time 
% - y0: 1x3 row vector containing the Cauchy problem initial conditions 
% - option: void structure (irrelevant, since odeset deals with integration
%   properties of the algorithm) 
% - active_infections: empty vector that should contain raw data imported
%   from dataframe
% - threshold: float positive number (if set too small, convergence may not
%   be reached)

% By calling the function, if the parameters are wrong, a syntax error
% would arise.
    
    addpath(genpath(fullfile(pwd,"..","FUNCTIONS")));
    
    A = [0.1, 0.2, 0.3, 0.4];
    B = [0.5, 0.6, 0.7, 0.8];
    tspan = [0, 100];
    y0 = [0.99, 0.01, 0];
    options = odeset();
    active_infections = 100:10:1000;
    threshold = 0.01;
    try
        [t,y] = sir_param_determination(A,B,tspan,y0,options,active_infections,threshold);
    catch err
        error("Syntax error: " + err.message);
    end
end
