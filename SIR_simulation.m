clc; close all; clearvars;

%% IMPORTING DATA

load("dataframe.mat");

addpath(genpath("Functions"));
addpath(genpath("Plots"));
addpath(genpath("Tests"));

[new_positives,active_infections,total_removals,total_infected,deaths,recovers] = normalization(data);

%% SIR MODEL

[t,y] = sir_param_determination(a,b,tspan,y0,options,active_infections,threshold);


%%
plot(t,y);
legend("Susceptibles","Infeted","Removed");

%% R_e
R_e = y(:,1).*a/b;
figure;
plot(t,R_e,"o");
legend("R_e");

%% ACTIVE INFECTIONS

figure;
plot(time,active_infections,"*"); hold on;
plot(t,y(:,2),"--");
legend("Active infections","Model");

%% NEW POS

figure;
plot(time,new_positives,"+");
legend("New pos");

%% TOTAL R

figure;
plot(time,total_removals,"."); hold on;
plot(t,y(:,3),"--");
legend("Removals","Model R(t)");

%% D vs R
[model_D_vs_R,model_D, model_recovered] = model_R(y,total_removals,deaths);
figure;
plot(total_removals,deaths,"*");
hold on;
plot(model_D_vs_R);

hold off;

%% DEATHS

figure;
plot(time,deaths,"diamond"); hold on;
plot(t,model_D,"--");
hold off;
legend("Deaths","Fit D(R_m)");

%%  RECOVERIES

figure;
plot(time,recovers,"o"); hold on;
plot(t,model_recovered,"--");
legend("Recevers","Model R(t)");

%%
model_total_infected = (y(:,3) + y(:,2));

figure;
plot(time,total_infected,"Marker","hexagram"); hold on;
plot(t,model_total_infected,"--");
hold off;
legend("Total infected","Model I_T(t)");
