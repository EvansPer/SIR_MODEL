%% SIR MODEL SIMULATION

% This is the main code where all the functions in the folder functions are
% called.
% It starts by importing data from the saved "dataframe.mat", specifically
% I call:
% - the whole dataset "data" containing the raw data of the virus spread
% - the variable time I generated to visualize those data
% - tspan, y0 options and A,B are, respectively, the integration time,
%   Cauchy starting point, ODE45 options, SIR parameters
% - the parameter threshold, which defines the accuracy of the
%   superposition between the raw data and the model generated by the
%   function sir_param_determination.

% The normalization function is then called to set to 1 the max value of
% the raw data, in order to compare them with the normalized model (it is
% thus easier to compare whe quantities).

% Finally, the functions sir_param_determination and model_R are called,
% returning the SIR solutions [t,y] (y being a length(time)x3 matrix) and
% the fitting model of the function D = D(R_m), to be used to fit the
% imported raw data.

% The function model_total_infected is used to fit a combination of some
% vectors imported from the dataset, and this helps having a better insight
% on the evolution of the virus.

% The plot_data_fit functions returns 4 graphs representing the fitted raw
% data, the repoductive rate, the D(R_m) model and the normalized SIR model
% sulutions.

clc; close all; clearvars;

load("dataframe.mat","data","time","tspan","y0","options","A","B","threshold");

addpath(genpath("FUNCTIONS"));
addpath(genpath("GRAPHS"));
addpath(genpath("TESTS"));

[new_positives,active_infections,total_removals,total_infected,deaths,recovers] = normalization(data);

[t,y] = sir_param_determination(A,B,tspan,y0,options,active_infections,threshold);

R_e = y(:,1).*A/B;

[model_D_vs_R,model_D, model_recovered] = model_R(y,total_removals,deaths);

model_total_infected = (y(:,3) + y(:,2));

plot_data_fit(time,t,y,model_D_vs_R,model_D,model_recovered,model_total_infected,R_e);

