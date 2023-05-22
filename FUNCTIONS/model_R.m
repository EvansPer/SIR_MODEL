function [model_D_vs_R,model_D, model_recovered] = model_R(y, total_removed, deaths)
    
% This function provides a model that fits the function D(R_m) = D_0*(1-exp(-k*R_m)).

% INPUT PARAMETERS:
% - y: nx3 matrix (n generic) being the ODE system solution of the SIR model 
%   (y(:,1) = S(t), y(:,2) = I(t), y(:,3) = R_m(t))
% - total_removed: nx1 column vector (n generic)
% - deaths: nx1 column vector (n generic)

% OUTPUT PARAMETERS:
% - model_D_vs_R: fit object that encapsulates the result of fitting the model specified by the fittype FT
%   fit(total_removed,deaths,FitType,Initial_Guess) -> D = D(R_m)
% - model_D: nx1 column vector obtained operating on total_removed -> D(t)
% - model_recovered: nx1 column vector obtained by subtracting model_D to
%   the SIR vector y(:,3) -> R(t) = R_m(t) - D(t)

% Some guess parameters are initialized (D_0_guess and k_guess) to perform the fitting procedure,
% then the fitting function "fun" is defined symbolically.

% lsqcurvefit provides the solution to the non-linear least squares problem
% identified by the model "fun", the guess parameters and the raw data.

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
