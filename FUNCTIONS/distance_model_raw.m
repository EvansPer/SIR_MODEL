function [delta,error] = distance_model_raw(active_infections,y,threshold)

% This function provides a positive feedback (delta = true) when the threshold condition is met, by 
% means of the boolean flag "delta".

% INPUT PARAMETERS:
% - active_infections: nx1 column vector (n generic) 
% - y: nx3 matrix, solution of the ODE system of the SIR model
% - threshold: float positive number (if too small, convergence may not be found)

% OUTPUT PARAMETERS:
% - delta: boolean 1x1 array, may be true (logical(1)) or false (logical(0))
% - error: float positive number, measuring the distance between one point
%   of the active_infections vector and the correspondent value of y.

% If the difference between active_infections and y(:,2) (which is the vector of the model corresponding
% to active_infections) in more points is smaller than the threshold value, than the condition is met 
% (delta = true) and the error value is computed.
    
    delta = false;
    if abs(active_infections(round(end/2 - 10)) - y(round(end/2 - 10),2)) <= threshold ...
       && abs(active_infections(round(end/2)) - y(round(end/2),2)) <= threshold ...
       && abs(active_infections(round(end/2 + 10)) - y(round(end/2 + 10),2)) <= threshold ...
       
        delta = true;
    end
    error = abs(active_infections(round(end/2)) - y(round(end/2),2));
end
