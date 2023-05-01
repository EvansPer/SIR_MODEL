function test_normalization_zero_data()

% This test verifies that, provided a dataset of zeros, the function normalization can handle
% the dataframe as well, but an error arises since the normalization should
% be performed by dividing by normalization_fac = max(total_infected) = 0.

% It is fed with a dataset of 161 raws of zeros and 10 columns

    data = zeros(161, 10);
    [new_positives, active_infections, total_removals, total_infected, deaths, recovers] = normalization(data);
    
    assert(all(new_positives == zeros(161, 1)),"Error: provided dataset of zeros, can't divide by 0");
    assert(all(active_infections == zeros(161, 1)),"Error: provided dataset of zeros, can't divide by 0");
    assert(all(total_removals == zeros(161, 1)),"Error: provided dataset of zeros, can't divide by 0");
    assert(all(total_infected == zeros(161, 1)),"Error: provided dataset of zeros, can't divide by 0");
    assert(all(deaths == zeros(161, 1)),"Error: provided dataset of zeros, can't divide by 0");
    assert(all(recovers == zeros(161, 1)),"Error: provided dataset of zeros, can't divide by 0");
    
end

   