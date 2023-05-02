function [model_D_vs_R,model_D, model_recovered] = model_R(y, total_removed, deaths)
    
% This function provides a model that fits the function D(R_m) = D_0*(1-exp(-k*R_m)).

% The function is fed with raw data and the ODE solutions just to give back
% the fitting models for D(R_m), D(t) and R(t), respectively.

% Some guess parameters are initialized (D_0_guess and k_guess), then the
% fitting function is defined symbolically.

% lsqcurvefit provides the solution to the non-linear least squares problem
% identified by the model, the guesses and the raw data.

% Since R_m(t) = D(t) + R(t) (total removed = deaths + recovered), it is
% possible to calculate R(t) to be used in the main simulation.

    D_0_guess = max(deaths);
    k_guess = 0.1;

    fun = @(p, x) p(1)*(1-exp(-p(2)*x));

    StarPoint = [D_0_guess, k_guess];
    trial_fit = lsqcurvefit(fun, StarPoint, total_removed, deaths);

    D_0 = trial_fit(1);
    k = trial_fit(2);

    model_D_vs_R = fit(total_removed, deaths,"D_0*(1-exp(-k*x))","StartPoint",[D_0 k]);
    model_D = D_0*(1-exp(-k*total_removed));
    model_recovered = y(:,3) - model_D;

end
