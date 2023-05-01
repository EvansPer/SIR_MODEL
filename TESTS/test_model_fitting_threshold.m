function test_model_fitting_threshold()

% This test verifies that, provided with vectors with close values but with
% a threshold too small, the function model_fitting returns a delta = false,
% since the values are not sufficiently close.

% It is fed with 2 column vectors active_infections and y and a threshold
% value.

% The error arises since the threshold is too small

    active_infections = (100:150)';
    a = (100:150)' + rand(51,1); 
    y = [(0:50)',a];
    threshold = 0.001;
    
    [delta, error] = model_fitting(active_infections, y, threshold);
    
    assert(delta,"Error: Threshold too small")
    
end