%% SIR MODEL SIMULATION

% This is the main code where all the functions in the folder functions are
% called.

% INITIALIZATION:
% - From the dataset "dataframe.mat" importing:
%     - data: nxm (n generic, m >= 10) raw data matrix
%     - duration: int positive number determining the analysis length
%     - time: 1 x duration row vector set by the user (starting from 02/24/2020 and ending 08/01/2020)
%     - tspan: 1x2 row vector with initial and final time
%     - y0: 1x3 row vector containing ODE initial condition of the SIR model
%     - options: non mandatory, structure that sets the upper bound for the step size integration
%     - A,B: 1xn (n generic) vectors containing the increasing and decreasing expnential parameters
%     - threshold: float positive number set to identify A and B (if set to
%       small, convergence may not be reached). It defines the accuracy of the
%       superposition between the raw data and the model generated by the
%       function sir_param_determination. 

% OUTCOME: 
% - The variables of the model are defined and fitted on the raw data
%   collected from the dataframe
% - A directory "GRAPHS" is generated on the same level of the present
%   script
% - All the variables are plotted in 4 different graphs showing:
%     - the raw data fitted by the model vs time
%     - the normalized model vs time
%     - the repoductive rate vs time
%     - the D(R_m) model and D(t) vs time

% The normalization function is called to set to 1 the max value of
% the raw data, in order to compare them with the normalized model (it is
% thus easier to compare whe quantities).

% The functions sir_param_determination and model_R are called,
% returning the SIR solutions [t,y] (y being a length(time)x3 matrix) and
% the fitting model of the function D = D(R_m), to be used to fit the
% imported raw data.

% The function model_total_infected is used to fit a combination of some
% vectors imported from the dataset, and this helps having a better insight
% on the evolution of the virus.

clc; close all; clearvars;

load("dataframe.mat","data","duration","time","tspan","y0","options","A","B","threshold");

addpath(genpath("FUNCTIONS"));
addpath(genpath("TESTS"));

[new_positives,active_infections,total_removals,total_infected,deaths,recovers] = normalization(data,duration);

[t,y,A_0,B_0] = sir_param_determination(A,B,tspan,y0,options,active_infections,threshold);

R_e = y(:,1).*A_0/B_0;

[model_D_vs_R,model_D, model_recovered] = model_R(y,total_removals,deaths);

model_total_infected = (y(:,3) + y(:,2));

mkdir GRAPHS;

plot_model_vs_data(time,t,y,active_infections,total_removals,recovers,total_infected,model_recovered,model_total_infected)
plot_model(t,y);
plot_reproductive_rate(t,R_e);
plot_death_model(t,time,total_removals,deaths,model_D,model_D_vs_R);

