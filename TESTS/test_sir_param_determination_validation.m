function test_sir_param_determination_validation()

% This test verifies that, provided the true value of [t_true,y_true],
% (calculated with the function sir) A_true and B_true, an error arises when the same
% parameters are extracted by the function sir_param_determination and compared
% with A_true and B_true. If the assert condition (which compares the value of A_true and A,
% B_true and B with a threshold of 1e-8) is false, then the test fails.

% It tested function is fed with:
% - the 2 ODE parameters A_true and B_true
% - time range tspan and Cauchy initial condition y0
% - The simulated vector active_infections and a threshold

% A and B are the vectors containing the possible parameters that
% sir_param_determination may find.
    
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