function [new_positives,active_infections,total_removals,total_infected,deaths,recovers] = normalization(data,duration)

% This function provides the normilized variables extracted from the "data"
% dataframe (by means of the value normalization_fact) to be fitted with the ODE solutions. 

% INPUT PARAMETERS:
% - data: nx10 matrix (n generic) containing the raw data of the virus evolution
% - duration: positive number determining the time span to analyse 

% OUTPUT PARAMETERS:
% - new_positives: duration x 1 column vector normalized to 1 -> I(t) of the SIR model
%   containing the data of the column 8 of "data"
% - active_infections: duration x 1 column vector normalized to 1
%   containing the data of the column 6 of "data"
% - total_removals: duration x 1 column vector normalized to 1 -> R(t) of the SIR model
%   given by the sum of recovers and deaths
% - total_infected: duration x 1 column vector normalized to 1
%   given by the sum of total_removals and active_infections
% - deaths: duration x 1 column vector normalized to 1
%   containing the data of the column 10 of "data"
% - recovers: duration x 1 column vector normalized to 1
%   containing the data of the column 9 of "data"
% A dataframe called "Norm_dataset.mat" is generated

% The best approach in this situations is to scale down every variable to the normalized ODE solution
% rather than scaling the former up, losing track of variables interdependence.

% normalization_fac is the normalization factor provided by the maximum value of the total # of infected


    active_infections = data(1:duration,6);
    new_positives = data(1:duration,8); % I(t) in the ODE
    recovers = data(1:duration,9);
    deaths = data(1:duration,10);

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

    
