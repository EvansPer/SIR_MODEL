function test_distance_model_raw_threshold()

% This test verifies that, provided with vectors with close values but
% a threshold too small, the function model_fitting returns a delta = false,
% since the values are not sufficiently close.

% It is fed with 2 column vectors active_infections and y and a threshold
% value.

% The error arises since the threshold is too small

    rng(1); % Random seed = 1, Mersenne Twister generator
    active_infections = (100:150)';
    a = (100:150)' + rand(51,1); 
    y = [(0:50)',a];
    threshold = 0.001;
    
    [delta, error] = distance_model_raw(active_infections, y, threshold);
    
    assert(delta,"Error: Incompatible data, threshold may be too small")
    
end
