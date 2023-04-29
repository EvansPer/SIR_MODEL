function dydt = sir(t,y,A,B)
        dydt = zeros(3,1);
        dydt(1) = -A*y(1)*y(2);
        dydt(2) = A*y(1)*y(2) - B*y(2);
        dydt(3) = B*y(2);
end
