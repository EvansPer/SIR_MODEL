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
