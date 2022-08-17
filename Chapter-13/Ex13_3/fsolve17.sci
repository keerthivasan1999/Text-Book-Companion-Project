//Chapter 13 example 13-3
//Following is the function to determine the 'y2' for 'Bottom_Drop_2' using Manning equation
function f2=fsolve17(y)
    f2=(V_dot*n)-(a*b*y*((b*y)/((b)+(2*y)))^(2/3)*(S0_2)^(1/2))
endfunction
