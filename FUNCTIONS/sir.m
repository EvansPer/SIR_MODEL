function [dydt] = sir(t,y,A,B)

% This function provides the structure (dydt is a 3 coloumns matrix) of the system of Ordinary
% Differential Equations describing the SIR model. 

% It is fed with y (a 3 coloumns matrix) and the transmission rate (A) and 
% removal rate (B) constants.

% y(1) = S(t) (susceptibles) while y(2) = I(t) (infected).

% It returns dydt, a coloumn vector with 3 raws (initialized with elements 0), and in each column a
% specific differential equation (from the SIR model system) is allocated
% following the system (1) in the README Introduction.

        dydt = zeros(3,1);
        dydt(1) = -A*y(1)*y(2);
        dydt(2) = A*y(1)*y(2) - B*y(2);
        dydt(3) = B*y(2);
end
