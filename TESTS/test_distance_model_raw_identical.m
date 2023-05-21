function test_distance_model_raw_identical()

% This test verifies that, provided 2 identical vectors (active_infections
% and y(:,2)) the model_fiting function finds no difference, thus resulting
% in delta = true and error = 0.

    active_infections = (100:150)';
    y = [(0:50)',(100:150)'];
    threshold = 0.001;
    
    [delta, error] = distance_model_raw(active_infections, y, threshold);
    
    assert(delta)

end
