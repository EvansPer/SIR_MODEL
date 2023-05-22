%% DATA CONFIGURATION

% In this code the data provided by the Italian Minister of Health (please refer to the following 
% repository: 

% https://github.com/pcm-dpc/COVID-19/blob/master/dati-andamento-nazionale/dpc-covid19-ita-andamento-nazionale.csv )

% are saved. More specifically:

% - data: raw data matrix
% - duration: parameter determining the analysis length 
% - time interval: 1xduration row vector (starting from 02/24/2020 and ending 08/01/2020).
% The starting parameters of the ODE routine are initialised:

% - tspan: 1x2 vector with initial and final time
% - y0: 1x3 vector containing ODE initial condition
% - options: non mandatory, structure that sets the upper bound for the step size integration
% - A, B: vectors containing the increasing and decreasing expnential parameters.
% - threshold: parameter set to identify A and B

% The code then saves all these variables in a .mat dataframe

data = readmatrix("DATI.xlsx");
duration = 161;
time = linspace(1,duration,duration);

% Cauchy starting points: Integration time and initial starting point for
% the ODE solution

tspan = [0 duration]; 
y0 = [0.999 0.001 0];
options = odeset("MaxStep",4.1); % Upper bound on the step size
A = 0:0.01:1;                    % Initial increasing exponential growth parameter
B = 0:0.001:0.1;                 % Final decreasing exponential decay parameter
threshold = 0.007;               % Threshold set to identify A and B

save("dataframe.mat");