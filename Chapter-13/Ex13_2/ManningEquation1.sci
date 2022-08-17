//Chapter 13 example 13-2
//Following is the function to calculate Volume flow rate using Manning equation
function V_dot=ManningEquation1(S0)
    V_dot=a*A_c*R_h^(2/3)*S0^(1/2)/n//V_dot is volume flow rate through the channel in 'm3/s'
endfunction
