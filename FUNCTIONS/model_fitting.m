function [delta,error] = model_fitting(active_infections,y,threshold)

% This function provides a positive feedback (delta = true) when the threshold condition is met, by 
% means of the boolean flag "delta".

% It is fed with the raw data vector "active_infections", the model
% matrix y to be compared with and the threshold value. 

% If the difference between the 2 vectors in more points is smaller than the
% threshold value, than the condition is met.

% The function provides the error of the model considering its distance
% from the real data.
    
    delta = false;
    if abs(active_infections(round(end/2 - 10)) - y(round(end/2 - 10),2)) <= threshold ...
       && abs(active_infections(round(end/2)) - y(round(end/2),2)) <= threshold ...
       && abs(active_infections(round(end/2 + 10)) - y(round(end/2 + 10),2)) <= threshold ...
       
        delta = true;
    end
    error = abs(active_infections(round(end/2)) - y(round(end/2),2));
end
