function test_normalization_zero_data()

% This test verifies that, provided a dataset of zeros, the function normalization can handle
% the dataframe as well, but an error arises since the normalization should
% be performed by dividing by normalization_fac = max(total_infected) = 0.

% It is fed with a dataset of 161 raws of zeros and 10 columns
    duration = 161;
    data = zeros(duration, 10);
    [new_positives, active_infections, total_removals, total_infected, deaths, recovers] = normalization(data,duration);
    
    assert(all(total_infected == zeros(duration, 1)),"Error: provided dataset of zeros, can't divide by 0");
    assert(all(new_positives == zeros(duration, 1)),"Error: provided dataset of zeros, new_positives is empty");
    assert(all(active_infections == zeros(duration, 1)),"Error: provided dataset of zeros, active_infections is empty");
    assert(all(total_removals == zeros(duration, 1)),"Error: provided dataset of zeros, total_removals is empty");
    assert(all(deaths == zeros(duration, 1)),"Error: provided dataset of zeros, deaths is empty");
    assert(all(recovers == zeros(duration, 1)),"Error: provided dataset of zeros, recovers is empty");
   
    
    
end

   