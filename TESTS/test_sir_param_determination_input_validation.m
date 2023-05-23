function test_sir_param_determination_input_validation()

% This test verifies that, given one or more wrong parameters in the
% sir_param_determination input, an error arises.

% In Test 1 I provide an empty raw vector
% In Test 2 the threshold is negative

% INIT PARAMETERS:
% - A, B = 1x2 row vector containing float positive elements to possibly
%   identify the SIR model parameters
% - tspan: 1x2 row vector containing initial and final time 
% - y0: 1x3 row vector containing the Cauchy problem initial conditions 
% - option: void structure (irrelevant, since odeset deals with integration
%   properties of the algorithm) 
% - active_infections: empty vector that should contain raw data imported
%   from dataframe
% - threshold: float positive number (if set too small, convergence may not
%   be reached)

    
    addpath(genpath(fullfile(pwd,"..","FUNCTIONS")));
    
% Test 1

    A = [0.1, 0.2];
    B = [0.5, 0.6];
    tspan = [0, 100];
    y0 = [0.99, 0.01, 0];
    options = odeset();
    active_infections = [];
    threshold = 0.01;

    
    try
        [t,y] = sir_param_determination(A,B,tspan,y0,options,active_infections,threshold);
        error("Expected an error due to empty active_infections")
    catch err
    end

 % Test 2

    threshold = -0.01;
    try
        [t,y] = sir_param_determination(A,B,tspan,y0,options,active_infections,threshold);
        error("Expected an error due to negative value of threshold")
    catch err
    end

end