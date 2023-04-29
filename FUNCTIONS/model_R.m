function [model_D_vs_R,model_D, model_recovered] = model_R(y, total_removals, deaths)
    
    % Set initial guesses for D_0 and k
    D_0_guess = max(deaths);
    k_guess = 0.1;

    % Define the model function
    fun = @(p, x) p(1)*(1-exp(-p(2)*x));

    % Fit the model to the data using lsqcurvefit
    StarPoint = [D_0_guess, k_guess];
    trial_fit = lsqcurvefit(fun, StarPoint, total_removals, deaths);

    % Extract the estimated parameters
    D_0 = trial_fit(1);
    k = trial_fit(2);

    % Generate the model predictions

    model_D_vs_R = fit(total_removals, deaths,"D_0*(1-exp(-k*x))","StartPoint",[D_0 k]);
    model_D = D_0*(1-exp(-k*total_removals));
    model_recovered = y(:,3) - model_D;

end
