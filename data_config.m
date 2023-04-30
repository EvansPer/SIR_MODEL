%% DATA CONFIGURATION

% In this code the data provided by the Italian Minister of Health are
% saved into the "data" variable and the "time" interval vector is generated
% (starting from 02/24/2020 and ending 08/01/2020), along with the 
% parameters necessary to run an ODE routine. 
% The code then saves all these variables in a .mat dataframe

data = readmatrix("DATI.xlsx");
time = linspace(1,161,161);

% Cauchy starting points: Integration time and initial starting point for
% the ODE solution

tspan = [0 161]; 
y0 = [1 0.001 0];
options = odeset("MaxStep",4.1); % Upper bound on the step size
a = 0:0.01:1;                    % Initial increasing exponential growth parameter
b = 0:0.001:0.1;                 % Final decreasing exponential decay parameter
threshold = 0.007;               % Threshold set to identify a and b
save("dataframe.mat");