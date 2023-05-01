function test_model_R_validation()

% This test verifies that, provided some parameters and raw data, the
% function model_R can return values compatible with the expected values
% obtained by raw data and parameters.

% It is fed with param D_0 and k, raw data y, total_removed and deaths.
% From here, the expected values to be compared with the model provided by
% model_r function are generated.

% The model_R function is then called and its results are compared with the
% expected ones. Error arises if the compatibility is lower than a certain
% threshold.

    D_0 = 5;
    k = 2.3;

    y = [linspace(1,20,100)',linspace(1,20,100)',linspace(1,20,100)'];
    total_removed = linspace(1,20,100)';
    deaths = D_0*(1-exp(-k*total_removed));
    
    expected_D_vs_R = fit(total_removed,deaths,"D_0*(1-exp(-k*x))","StartPoint",[D_0 k]);
    expected_model_D = expected_D_vs_R.D_0*(1-exp(-expected_D_vs_R.k*total_removed)); 
    expected_model_recovered = y(:,3) - expected_model_D;

    [model_D_vs_R, model_D, model_recovered] = model_R(y,total_removed, deaths);

    assert(isequal(class(model_D_vs_R), class(expected_D_vs_R)), "Unexpected class for model_D_vs_R");
    assert(all(abs(model_D - expected_model_D) < 1e-7), "model_D does not match expected value");
    assert(all(abs(model_recovered - expected_model_recovered)< 1e-7), "model_recovered does not match expected value");
    
end
