function test_sir_param_determination_output()

% This tests verifies that, given a set of parameters which generates the
% vectors expected_t and expected_y, by calling the function
% sir_param_determination, the obtained values [t,y] must be compatible with
% expected_t and expected_y.

% It is fed with:
% - the 2 ODE parameters A and B
% - time range tspan and Cauchy initial condition y0
% - no specific option (irrelevant, since odeset deals with integration
%   properties of the algorithm 
% - a raw data vector active_infections and a threshold

% The expected vectors are then defined and compared with a new outcome of
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
