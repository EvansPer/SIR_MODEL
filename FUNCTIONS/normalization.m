function [new_positives,active_infections,total_removals,total_infected,deaths,recovers] = normalization(data)

% This function provides the normilized variables extracted from the "data"
% dataframe to be fitted with the ODE solution. The best approach in this
% situations is to scale down every variable to the normalized ODE solution
% rather than scaling the former up, losing track of variables
% interdependence.

    active_infections = data(1:161,6);
    new_positives = data(1:161,8); % I(t) in the ODE
    recovers = data(1:161,9);
    deaths = data(1:161,10);

    total_removals = recovers + deaths; % R(t) in the ODE
    total_infected = total_removals + active_infections;
    
    % Normalization factor provided by the maximum value of the total # of infected
    f = max(total_infected); 
    
    % Normalizing the previous variables
    total_removals = total_removals./f;
    new_positives = new_positives./f;
    active_infections = active_infections./f;
    deaths = deaths./f;
    recovers = recovers./f;
    total_infected = total_infected./f;

end

    
