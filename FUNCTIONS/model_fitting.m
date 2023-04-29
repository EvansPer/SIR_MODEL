function [delta,error] = model_fitting(active_infections,y,threshold)
    
    delta = false;
    if abs(active_infections(fix(end/2 - 10)) - y(fix(end/2 - 10),2)) <= threshold ...
       && abs(active_infections(fix(end/2)) - y(fix(end/2),2)) <= threshold ...
       && abs(active_infections(fix(end/2 + 10)) - y(fix(end/2 + 10),2)) <= threshold ...
       
        delta = true;
    end
    error = abs(active_infections(round(end/2)) - y(round(end/2),2));
end