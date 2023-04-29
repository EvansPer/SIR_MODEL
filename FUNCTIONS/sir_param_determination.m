function [t,y] = sir_param_determination(a,b,tspan,y0,options,active_infections,threshold)

    flag = false;
    
    for i = 1:length(a)
        for j = 1:length(b)
            sir_func = @(t,y) sir(t,y,a(i),b(j));
            [t,y] = ode45(sir_func,tspan,y0,options);
            [delta, error] = model_fitting(active_infections,y,threshold);
            if delta == true
                disp("a = " + a(i) + ", b = " + b(j) + ", y_{model} - y_{active inf} = " + error);
                flag = true;
                break
            end 
        end
        if flag == true
            break
        end
    end
end
