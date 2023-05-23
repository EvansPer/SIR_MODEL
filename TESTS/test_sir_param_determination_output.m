function test_sir_param_determination_output()

% This tests verifies that, given a set of parameters which generates the
% vectors expected_t and expected_y, by calling the function
% sir_param_determination with the same parameters, the obtained values [t,y] are compatible with
% expected_t and expected_y.

% INIT PARAMETERS:
% - A, B = 1x2 row vector containing float positive elements to possibly
%   identify the SIR model parameters
% - tspan: 1x2 row vector containing initial and final time 
% - y0: 1x3 row vector containing the Cauchy problem initial conditions 
% - option: void structure (irrelevant, since odeset deals with integration
%   properties of the algorithm) 
% - active_infections: 1x91 row vector
% - threshold: float positive number (if set too small, convergence may not
%   be reached)

% The expected vectors are defined and compared with a new outcome of
% the sir_param_determination function.

    addpath(genpath(fullfile(pwd,"..","FUNCTIONS")));

    A = [0.1, 0.2];
    B = [0.5, 0.6];
    tspan = [0, 100];
    y0 = [0.99, 0.01, 0];
    options = odeset();
    active_infections = 100:10:1000;
    threshold = 0.01;

    expected_t = [0; 0.818; 1.636; 2.454; 3.272];
    expected_y = [0.99, 0.00999988, 2.11493e-05;...
                  0.978341, 0.019559, 0.0021;...
                  0.964196, 0.0325938, 0.00321044;...
                  0.947551, 0.0487609, 0.00368728;...
                  0.928394, 0.0659243, 0.00568138];

    [t,y] = sir_param_determination(A,B,tspan,y0,options,active_infections,threshold);

    assert(all(size(t) == size(expected_t)), 'Unexpected size of t')
    assert(all(size(y) == size(expected_y)), 'Unexpected size of y')
    assert(all(t == expected_t, 'all'), 'Unexpected values of t')
    assert(all(abs(y - expected_y) < 1e-6, 'all'), 'Unexpected values of y')
    
end
