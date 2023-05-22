function test_model_R_noise()

% This test verifies, provided a correct input with random fluctuations,
% that the function model_R is capable of returning the correct value
% within the selected threshold.

% It is fed with initial parameters and raw data perturbed with random
% fluctuation.

% When the model_R function is called, it produces a model to be compared
% with the raw data. An error arises when the compatibility condition is
% not met.
    
    addpath(genpath(fullfile(pwd,"..","FUNCTIONS")));
    
    D_0 = 5;
    k = 2.3;
    rng(1); % Random seed = 1, Mersenne Twister generator
    y = [linspace(1,20,100)',linspace(1,20,100)',linspace(1,20,100)'] + randn(100,3);
    total_removed = linspace(1,20,100)';
    deaths = D_0*(1-exp(-k*total_removed)) + rand(100,1);
    expected_model_recovered = y(:,3) - deaths;
    
    [model_D_vs_R, model_D, model_recovered] = model_R(y, total_removed, deaths);
    
    assert(all(abs(model_D - deaths) < 1), "Error: model_D does not match expected value");
    assert(all(abs(model_recovered - expected_model_recovered)< 1), "model_recovered does not match expected value");

end
