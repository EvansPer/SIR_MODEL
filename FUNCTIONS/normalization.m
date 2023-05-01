function [new_positives,active_infections,total_removals,total_infected,deaths,recovers] = normalization(data)

% This function provides the normilized variables extracted from the "data"
% dataframe to be fitted with the ODE solutions. 

% It is fed with the dataframe "data" and returns the normalized vectors of
% interest.

% The best approach in this situations is to scale down every variable to the normalized ODE solution
% rather than scaling the former up, losing track of variables interdependence.

% The first 4 variables are defined as vectors from raw 1 to 161 of "data"
% and coloumn 6,8,9,10, respectively.

% new_positives = I(t) 
% total removals = R(t) (ideally, so that a fit can be performed)
% normalization_fac is the normalization factor provided by the maximum value of the total # of infected

% Once all the variables have been defined, along with the
% normalization_fac, it is possible to scale them down to max 1.

    active_infections = data(1:161,6);
    new_positives = data(1:161,8); % I(t) in the ODE
    recovers = data(1:161,9);
    deaths = data(1:161,10);

    total_removals = recovers + deaths; % R(t) in the ODE
    total_infected = total_removals + active_infections;
    
    normalization_fact = max(total_infected); 
    
    total_removals = total_removals./normalization_fact;
    new_positives = new_positives./normalization_fact;
    active_infections = active_infections./normalization_fact;
    deaths = deaths./normalization_fact;
    recovers = recovers./normalization_fact;
    total_infected = total_infected./normalization_fact;

    save("Norm_dataset.mat");
end

    
