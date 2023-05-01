function test_sir_time_profile()

% This test verifies that, when the sir function is called with valid
% parameters, it returns variables with the right time profile:

% 1) The total number of people must be normalized to 1
% 2) The number of susceptibles decreases over time
% 3) The number of infecteds increases up to its max value and then decreases over time
% 4) The number of recovered individuals increases over time

% Test 1, A = 0.18, B = 0.037
    [t, y] = ode45(@(t,y) sir(t,y,0.18,0.037), [0, 150], [0.999, 0.001, 0]);
    [i,j] = max(y(:,2));

    assert(all(sum(y, 2) - 1 <= 1e-15));
    assert(all(diff(y(:,1)) <= 0));
    assert(all(diff(y(1:j,2)) >= 0) & all(diff(y(j:end,2)) <= 0));
    assert(all(diff(y(:,3)) >= 0));

% Test 2, A = 0.4, B = 0.2
    [t, y] = ode45(@(t,y) sir(t,y,0.4,0.2), [0, 150], [0.999, 0.001, 0]);
    [i,j] = max(y(:,2));
    assert(all(sum(y, 2) - 1 <= 1e-15));
    assert(all(diff(y(:,1)) <= 0));
    assert(all(diff(y(1:j,2)) >= 0) & all(diff(y(j:end,2)) <= 0));
    assert(all(diff(y(:,3)) >= 0));
end