function [dydt] = sir(t,y,A,B)

% This function provides the structure (dydt is a 3 coloumns matrix) of the system of Ordinary
% Differential Equations describing the SIR model. 

% It is fed with y (a 3 columns matrix), the transmission rate (A) and 
% removal rate (B) constants (SIR parameters).

% y(:,1) = y(1) = S(t) (susceptibles), y(2) = I(t) (infected) and y(3) = R_m(t).

% It returns dydt, a 3 column matrix (initialized with elements 0), and in each column a
% specific differential equation (from the SIR model system) is allocated
% following the system (1) in the README Introduction.

    Susc = y(1);
    Infec = y(2);

    dydt = zeros(3,1);
    dydt(1) = -A*Susc*Infec;
    dydt(2) = A*Susc*Infec - B*Infec;
    dydt(3) = B*Infec;
end
