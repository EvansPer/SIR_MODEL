function test_normalization_computational_time()

% This test verifies that, provided a large datast "data", the function
% normalization is capable of handling a large amount of data.

% It is fed with a matrix of 100000 raws and 10 columns (the normalization 
% function access the dataset up to column 10).

% It calculates the elapsed time necessary to perform the calculations.

    data = rand(100000, 10);

    tic;
    [new_positives, active_infections, total_removals, total_infected, deaths, recovers] = normalization(data);
    toc;

end