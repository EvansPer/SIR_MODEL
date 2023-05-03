function test_SIR_simulation_validation()

    % This test verifies that, provided the right parameters imported by
    % loading "dataframe.mat", by calling the functions presesnt in the
    % main script "SIR_simulation" they return the proper results:
    % - sir_parame_determination returns the correct y matrix.
    % - model_R returns the proper vector size

    % If that's not the case, an error message arises.
     
    load("dataframe.mat","data","tspan","y0","options","A","B","threshold");
    addpath(genpath("FUNCTIONS"));    
   
    [new_positives,active_infections,total_removals,total_infected,deaths,recovers] = normalization(data);
    [t,y] = sir_param_determination(A,B,tspan,y0,options,active_infections,threshold);
    [model_D_vs_R, model_D, model_recovered] = model_R(y,total_removals,deaths);
    

    % Test 1 
    assert(all(y(:,1) - y0(1) < 1e-10), "Error: Initial conditions of y are incorrect");
    assert(all(y(:,1) >= 0), "Error: S(t) contains negative values");
    
    % Test 2 
    assert(isequal(size(model_D), [161 1]), "Error: model_D vector has incorrect size");
       
    

end
