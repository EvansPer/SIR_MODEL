function test_distance_model_raw_identical()

% This test verifies that, provided 2 identical vectors, the distance_model_raw function 
% finds no difference, 

% RESULTING in delta = true and error = 0.

% INIT PARAMETERS:
% - active_infections = nx1 (n generic) column vector with numbers in
%   between 100 and 150
% - y = nx2 (n generic) matrix (y(:,2) will be compared by means of
%   distance_model_raw
% - threshold: float positive number needed for vector comparison 

    addpath(genpath(fullfile(pwd,"..","FUNCTIONS")));

    active_infections = (100:150)';
    y = [(0:50)',(100:150)'];
    threshold = 0.001;
    
    [delta, error] = distance_model_raw(active_infections, y, threshold);
    
    assert(delta)

end
