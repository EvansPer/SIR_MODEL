# SIR MODEL

## Table of content
* [ABSTRACT](#ABSTRACT)
* [HOW TO](#HOW-TO)
* [INRODUCTOIN](#THE-THEORY)
* [THE CODE](#THE-CODE)
* [RESULTS](#RESULTS)


## ABSTRACT

This project aims to replicate and analyze the results proposed by [Argha Mondal et al.](https://doi.org/10.1016/j.chaos.2020.110057) in their attempt to model and predict the behaviour of the COVID-19 spread in several regions of the world in a period that ranges from 02/26/2020 to 08/01/2020. 
More specifically, I focused my attention on the Italian case at the same time interval, deploying a slightly modified version of the well-known SIR model. 
The paper provides a detailed methodology from a theoretical point of view, yet the authors still rely on an approximated approach to find the best fit of the models deployed in their analysis (such as a trial-and-error method and visual inspection). 
Therefore, I tried and managed to add some iterative cycles in order to find the best values of the ODE parameters describing the SIR model, along with a function providing an automatic way to find the best initial guesses that accommodate a fit on its actual data. 

## HOW TO

Please refer to the following steps to run the simulation obtaining the desired ODE parameters and the graphs.

Once the user has downloaded the .zip file from the green Github command "<> Code", a folder containing the subfolders and the main scripts will be created.

Running the simulation: 
1. Run the [data_config.m](https://github.com/EvansPer/SIR_MODEL/blob/main/data_config.m) script to generate a data frame called [dataframe.mat](https://github.com/EvansPer/SIR_MODEL/blob/main/dataframe.m) containing all the initial variables and parameters to analyze. If the user whishes to change the raw data imported from the Minister of Health he/she can refer to the following [repository](https://github.com/pcm-dpc/COVID-19/blob/master/dati-andamento-nazionale/dpc-covid19-ita-andamento-nazionale.csv) and [website](https://www.worldometers.info/coronavirus/country/italy/#graph-cases-daily). The parameters inside the config file could be left alone even when analysing other data. Pay attention to the "duration" parameter which counts the total number of days to be analysed, since it affects the "time" vector and the tspan ODE vector. 
2. Now run [SIR_simulation.m](https://github.com/EvansPer/SIR_MODEL/blob/main/SIR_simulation.m) to perform the main analysis: vector normalization, SIR parameter determination, fitting procedure and plotting.
3. The implemented plot functions generate 4 main graphs: 
    - [plot_model_vs_data](https://github.com/EvansPer/SIR_MODEL/blob/main/FUNCTIONS/plot_model_vs_data.m) shows the superposition of the generated model with the raw data.
    - [plot_model](https://github.com/EvansPer/SIR_MODEL/blob/main/FUNCTIONS/plot_model.m) shows instead the model alone, normalised to 1.
    - [plot_reproductive_rate](https://github.com/EvansPer/SIR_MODEL/blob/main/FUNCTIONS/plot_reproductive_rate.m) shows the time profile of the reproductive rate.
    - [plot_death_model](https://github.com/EvansPer/SIR_MODEL/blob/main/FUNCTIONS/plot_death_model.m) shows the fitting procedure performed on deaths vs total removed data.

 

## INTRODUCTION

Infection diseases such as COVID-19 represent a significant threat to the public health. The ability to predict the evolution of a virus endemic or pandemic could make the difference in the infected/dead count, along with much more aware management of the infrastructures and available resources.
One possible solution to describe and foresee the evolution of a pandemic would be the deployment of the so-called SIR model (Susceptibles - Infected - Recovered) based on three ordinary differential equations (ODE) of the form:

$$ \frac{dS(t)}{dt} = -AS(t)I(t) $$

$$ \frac{dI(t)}{dt} = AS(t)I(t) - BI(t) \space\space\space\space (1) $$

$$ \frac{dR_m(t)}{dt} = BI(t) $$

where S(t) represents the time dependent value of the susceptible population (people who can potentially be infected), I(t) represents the number of infected people and 

$$R_m(t) = R(t) + D(t) \space\space\space\space (2) $$ 

describes the number of people removed from the previous cases (thus recovered or dead), while A and B represents the transmission rate constant and removal rate constant, respectively.
In this context, it is useful to introduce the effective reproductive rate

$$ R_e(t) = \frac{A}{B}S(t) \space\space\space\space (3) $$

which determines the very fate of the evolution: if it is greater than 1, the virus will spread with the typical initial exponential spike, while it will decrease monotonically to zero if it is smaller than 1.

Since the excistence of a threshold for the virus spread is not so trivial nor obvious, an accurate analysis of the reproductive rate must be carried out to forecast possible outbrakes and second waves of contagions. 

Furthermore, it is possible to model the profile of deaths vs total removed with the equation:

$$ D(R_m) = D_0(1-e^{-kR_m}), \space\space\space\space (4) $$

where $D_0$ and k can be estimated by a non-linear fitting procedure. Thus, it is possible to obtain the total value of recovered as follows:

$$ R(t) = R_m(t) - D(t). \space\space\space\space (5) $$

where clearly the first variable coincides with the third solution of the SIR problem and D(t) is the fitting model just evaluated.

## THE CODE

The idea behind this code is simple: once some initial parameters are configured, it is possible to launch the simulation, whose functions will try to adapt the models as much as possible to the raw data provided, returning in good approximation a model not only capable of describing the punctual evolution of the system but to extrapolating and forecast it, too.

The structure of the project is the following:

1. The [data_config.m](https://github.com/EvansPer/SIR_MODEL/blob/main/data_config.m) script imports the COVID-19 dataset and other variables useful to initialize the ODE function from my path and saves them in a data frame called [dataframe.mat](https://github.com/EvansPer/SIR_MODEL/blob/main/dataframe.m). 
2. Once dataframe.mat is generated (it'll be always saved inside the project unless new updates are added to the config file), it can be loaded by the main script [SIR_simulation.m](https://github.com/EvansPer/SIR_MODEL/blob/main/SIR_simulation.m).
3. The SIR_simulation can then call the functions [normalization](https://github.com/EvansPer/SIR_MODEL/blob/main/FUNCTIONS/normalization.m), [sir_param_determination](https://github.com/EvansPer/SIR_MODEL/blob/main/FUNCTIONS/sir_param_determination.m) and [model_R](https://github.com/EvansPer/SIR_MODEL/blob/main/SFUNCTIONS/model_R.m).
4. The [normalization](https://github.com/EvansPer/SIR_MODEL/blob/main/FUNCTIONS/normalization.m) function input is the matrix called "data" containing all the raw acquisitions imported by the Minister of Health. It defines all the variables to be used in the SIR model and finds what is the number of total_infected in order to obtain the normalization factor. The normalization of all vectors is then performed, as the function provides precisely these values. 
5. The [sir_param_determination](https://github.com/EvansPer/SIR_MODEL/blob/main/FUNCTIONS/sir_param_determination.m) function has been added to improve the efficiency of the code: while in the paper, the ODE parameters are found by visual inspection, I decided to implement a simple routine that, within two for cycles, identifies A and B.
To do so, the input provided is:
    - the vector parameters A and B in which it is assumed to find the proper values (defined in the [data_config.m](https://github.com/EvansPer/SIR_MODEL/blob/main/data_config.m) script)
    - ODE parameters and options
    - a raw vector to compare with the model
    - a threshold needed to reach convergence between the raw data vector and the generated model.
Inside the cycles, a SIR model is generated and compared with the real data. When it is compatible (within the threshold) with "active_infections", the cycles stop, the parameters A and B are identified and the model can be returned in the main script.
6. The function [model_R](https://github.com/EvansPer/SIR_MODEL/blob/main/FUNCTIONS/model_R.m) is fed with the generated model y (thus the solutions of the SIR ODE system expressed in eq. (1)) and the raw data vectors total_removed and deaths. It aims to find, through an automated approach, the best fit possible for eq. (4). Thus, by means of the least squares method, the non-linear fit parameters $D_0$ and k are identified, and the function can return this model of eq. (4), along with the model that describes the time profile of the recovered raw vector. 
7. Finally, the functions [plot_model_vs_data](https://github.com/EvansPer/SIR_MODEL/blob/main/FUNCTIONS/plot_model_vs_data.m), [plot_model](https://github.com/EvansPer/SIR_MODEL/blob/main/FUNCTIONS/plot_model.m), [plot_reproductive_rate](https://github.com/EvansPer/SIR_MODEL/blob/main/FUNCTIONS/plot_reproductive_rate.m), [plot_death_model](https://github.com/EvansPer/SIR_MODEL/blob/main/FUNCTIONS/plot_death_model.m) are called to produce 4 different images:
    - The I(t), $R_m(t)$, R(t) and $I_T(t)$ data plus fitting model
    - The SIR solution time evolution
    - The reproductive rate time profile 
    - The $D = D(R_m)$ fit and D(t) time profile
 
    A folder [GRAPHS](https://github.com/EvansPer/SIR_MODEL/blob/main/FUNCTIONS/GRAPHS) is generated to store the plotted images.
    
All the previous functions are found inside the [FUNCTIONS](https://github.com/EvansPer/SIR_MODEL/blob/main/FUNCTIONS) folder, which contains in total the following functions:
    - [model_R](https://github.com/EvansPer/SIR_MODEL/tree/main/FUNCTIONS/model_R.m)
    - [model_fitting](https://github.com/EvansPer/SIR_MODEL/tree/main/FUNCTIONS/model_fitting.m)
    - [normalization](https://github.com/EvansPer/SIR_MODEL/tree/main/FUNCTIONS/normalization.m)
    - [plot_model_vs_data](https://github.com/EvansPer/SIR_MODEL/blob/main/FUNCTIONS/plot_model_vs_data.m)
    - [plot_model](https://github.com/EvansPer/SIR_MODEL/blob/main/FUNCTIONS/plot_model.m)
    - [plot_reproductive_rate](https://github.com/EvansPer/SIR_MODEL/blob/main/FUNCTIONS/plot_reproductive_rate.m)
    - [plot_death_model](https://github.com/EvansPer/SIR_MODEL/blob/main/FUNCTIONS/plot_death_model.m)
    - [sir](https://github.com/EvansPer/SIR_MODEL/tree/main/FUNCTIONS/sir.m)
    - [sir_param_determination](https://github.com/EvansPer/SIR_MODEL/tree/main/FUNCTIONS/sir_param_determination.m)

The function tests are instead collected in the [TESTS](https://github.com/EvansPer/SIR_MODEL/blob/main/TESTS) folder.

## RESULTS

Figure 1 shows the time profile of the raw data fitted witht the SIR model solutions adapted to the spefic case:

1. Figure 1: Time evolution of the acquired variables with their fitted SIR model slution. 
![config](https://github.com/EvansPer/SIR_MODEL/blob/main/FUNCTIONS/GRAPHS/data_vs_model.jpg)

Figure 2 shows instead the solution of the SIR system described in eq. (1), normalized to 1.

2. Figure 2: Time evolution of the SIR model. A = 0.18 and B = 0.039 (the parameters found in the paper are A = 0.18 and B = 0.037)
![config](https://github.com/EvansPer/SIR_MODEL/blob/main/FUNCTIONS/GRAPHS/SIR_model.jpg)

3. Figure 3: Time evolution of the reproductive rate $R_e$
![config](https://github.com/EvansPer/SIR_MODEL/blob/main/FUNCTIONS/GRAPHS/R_e.jpg)

4. Figure 4: Deaths vs Total removed (left), deaths vs time (right).
![config](https://github.com/EvansPer/SIR_MODEL/blob/main/FUNCTIONS/GRAPHS/model_R_plot.jpg)
