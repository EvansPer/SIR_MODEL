clc; close all; clearvars;

%% IMPORTING DATA

load("dataframe.mat","data","time","tspan","y0","options","A","B","threshold");

addpath(genpath("Functions"));
addpath(genpath("GRAPHS"));
addpath(genpath("Tests"));

[new_positives,active_infections,total_removals,total_infected,deaths,recovers] = normalization(data);

%% SIR MODEL

[t,y] = sir_param_determination(A,B,tspan,y0,options,active_infections,threshold);

R_e = y(:,1).*A/B;

[model_D_vs_R,model_D, model_recovered] = model_R(y,total_removals,deaths);

model_total_infected = (y(:,3) + y(:,2));

plot_data_fit(time,t,y,model_D_vs_R,model_D,model_recovered,model_total_infected,R_e);

