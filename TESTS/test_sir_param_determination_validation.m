function test_sir_param_determination_validation()

% This test verifies that, provided the true value A_true and B_true of [t_true,y_true]
% (calculated with the function sir), an error arises when the same
% parameters are extracted by the function sir_param_determination and the comparison
% with A_true and B_true fails. 
 
% If the assert condition (which compares the value of A_true and A,
% B_true and B with a threshold of 1e-8) is false, then the test fails.

% INIT PARAMETERS:
% - A_true, B_true = float positive number identifying the SIR model parameters
% - tspan: 1x2 row vector containing initial and final time 
% - y0: 1x3 row vector containing the Cauchy problem initial conditions 
% - option: structure containing the upper bound of step size for the time integration 
% - threshold: float positive number (if set too small, convergence may not
%   be reached)
% - [t_true,y_true]: [(nx1),(nx3)] matrix containing the ode45 solutions to
%   the SIR model
% - active_infections: nx1 column vector corresponding to the second column
%   vector of y_true
% - A, B: vectors containing the possible parameters that sir_param_determination may find.
    
    addpath(genpath(fullfile(pwd,"..","FUNCTIONS")));
    
    A_true = 0.18;
    B_true = 0.037;
    tspan = [0, 161];
    y0 = [0.999, 0.001, 0];
    options = odeset("MaxStep",4.1);

    [t_true, y_true] = ode45(@(t,y) sir(t,y,A_true,B_true), tspan, y0, options);
    active_infections = y_true(:,2);
    threshold = 0.007;
    
    A = 0:0.01:1;
    B = 0:0.001:0.1;

    [t, y] = sir_param_determination(A,B,tspan,y0,options,active_infections,threshold);
    
    assert(abs(A_true - A(end)) < 1e-8 && abs(B_true - B(end)) < 1e-8, "Test failed: function did not recover correct parameters");

end