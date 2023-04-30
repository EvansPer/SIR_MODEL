# SIR MODEL

# Table of content
* [ABSTRACT](#ABSTRACT)
* [INRODUCTOIN](#INTRODUCTION)
* [THE CODE](#THE-CODE)
* [SOME RESULTS](#SOME-RESULTS)


# ABSTRACT

This project aims to replicate and analyze the results proposed by Argha Mondal et al. (https://doi.org/10.1016/j.chaos.2020.110057) in their attempt to model and predict the behaviour of the COVID-19 spread in several regions of the world in a period that ranges from 02/26/2020 to 08/01/2020. 
More specifically, I focused my attention on the Italian case at the same time interval, deploying a slightly modified version of the well-known SIR model. 
The paper provides a detailed methodology from a theoretical point of view, yet the authors still rely on an approximated approach to find the best fit of the models deployed in their analysis (such as a trial-and-error method and visual inspection). 
Therefore, I tried and managed to add some iterative cycles in order to find the best values of the ODE parameters describing the SIR model, along with a function providing an automatic way to find the best initial guesses that accommodate a fit on its actual data. 

# INTRODUCTION

Infection diseases such as COVID-19 represent a significant threat to the public health. The ability to predict the evolution of a virus endemic or pandemic could make the difference in the infected/dead count, along with much more aware management of the infrastructures and available resources.
One possible solution to describe and fresee the evolution of a pandemic would be the deployment of the so-called SIR model (Susceptibles - Infected - Recovered) modelled by three ordinary differential equations (ODE) of the form:

$$ \frac{dS(t)}{dt} = -aS(t)I(t) $$

$$ \frac{dI(t)}{dt} = aS(t)I(t) - bI(t) \space\space\space\space (1) $$

$$ \frac{dR_m(t)}{dt} = bI(t) $$

where S(t) represents the time dependent value of the susceptible population (people who can potentially be infected), I(t) represents the number of infected people and 
$$R_m(t) = R(t) + D(t) \space\space\space\space (2) $$ 
describes the number of people removed from the previous cases (thus recovered or dead), while a and b represents the transmission rate constant and removal rate constant, respectively.
In this context, it is useful to introduce the effective reproductive rate

$$ R_e(t) = \frac{a}{b}S(t) \space\space\space\space (3) $$

which determines the very fate of the evolution: if it is greater than 1, the virus will spread with the typical initial exponential spike, while it will decrease monotonically to zero if it is smaller than 1.
