function test_distance_model_raw_threshold()

% This test verifies that, provided with vectors with close values but
% a threshold too small, the function distance_model_raw returns a delta = false,
% since the values are not sufficiently close.

% INIT PARAMETERS:
% - active_infections = nx1 (n generic) column vector with numbers in
%   between 100 and 150
% - a: nx1 column vector with random numbers oscillating on the mean
%   defined by the vector 100:150
% - y = nx2 (n generic) matrix (y(:,2) = a will be compared by means of
%   distance_model_raw)
% - threshold: float positive number needed for vector comparison 

% The error arises when delta is still true despite the small threshold

    addpath(genpath(fullfile(pwd,"..","FUNCTIONS")));
    
    rng(1); % Random seed = 1, Mersenne Twister generator
    active_infections = (100:150)';
    a = (100:150)' + randn(51,1); 
    y = [(0:50)',a];
    threshold = 0.001;
    
    [delta, error] = distance_model_raw(active_infections, y, threshold);
    
    assert(~delta,"Error: Unexpected behavior, threshold should be too small. Please check vector elements and error parameter");
    
end
