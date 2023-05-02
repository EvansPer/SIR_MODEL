# SIR MODEL

# Table of content
* [ABSTRACT](#ABSTRACT)
* [INRODUCTOIN](#INTRODUCTION)
* [THE CODE](#THE-CODE)
* [SOME RESULTS](#SOME-RESULTS)


## ABSTRACT

This project aims to replicate and analyze the results proposed by Argha Mondal et al. (https://doi.org/10.1016/j.chaos.2020.110057) in their attempt to model and predict the behaviour of the COVID-19 spread in several regions of the world in a period that ranges from 02/26/2020 to 08/01/2020. 
More specifically, I focused my attention on the Italian case at the same time interval, deploying a slightly modified version of the well-known SIR model. 
The paper provides a detailed methodology from a theoretical point of view, yet the authors still rely on an approximated approach to find the best fit of the models deployed in their analysis (such as a trial-and-error method and visual inspection). 
Therefore, I tried and managed to add some iterative cycles in order to find the best values of the ODE parameters describing the SIR model, along with a function providing an automatic way to find the best initial guesses that accommodate a fit on its actual data. 

## INTRODUCTION

Infection diseases such as COVID-19 represent a significant threat to the public health. The ability to predict the evolution of a virus endemic or pandemic could make the difference in the infected/dead count, along with much more aware management of the infrastructures and available resources.
One possible solution to describe and foresee the evolution of a pandemic would be the deployment of the so-called SIR model (Susceptibles - Infected - Recovered) modelled by three ordinary differential equations (ODE) of the form:

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

where D_0 and k can be estimated by a non-linear fitting procedure. Thus, it is possible to obtain the total value of recovered as follows:

$$ R(t) = R_m(t) - D(t). \space\space\space\space (5) $$

where clearly the first variable coincides with the third solution of the SIR problem and D(t) is the fitting model just evaluated.

## THE CODE

The idea behind this code is simple: once some initial parameters are configured, it is possible to launch the simulation, whose function will try to adapt the models as much as possible to the raw data provided, returning in good approximation a model not only capable of describing the punctual evolution of the system but to extrapolating and forecast it, too.

The structure of the project is the following:

1. The [data_config.m](https://github.com/EvansPer/SIR_MODEL/blob/main/data_config.m) script imports the COVID-19 dataset and other variables from my path and saves them in a data frame called [dataframe.mat](https://github.com/EvansPer/SIR_MODEL/blob/main/dataframe.m). 
2. Once dataframe.mat is generated (it'll be always saved inside the project unless new updates are added to the config file), it can be loaded by the main script [SIR_simulation.m](https://github.com/EvansPer/SIR_MODEL/blob/main/SIR_simulation.m).
3. The SIR_simulation can then call the functions [normalization](https://github.com/EvansPer/SIR_MODEL/blob/main/FUNCTIONS/normalization.m), [sir_param_determination](https://github.com/EvansPer/SIR_MODEL/blob/main/FUNCTIONS/sir_param_determination.m) and [model_R](https://github.com/EvansPer/SIR_MODEL/blob/main/SFUNCTIONS/model_R.m).


