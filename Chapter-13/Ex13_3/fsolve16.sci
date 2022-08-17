//Chapter 13 example 13-3
//Following is the function to determine the height 1 'y1' for 'Bottom_Drop_1' using Manning equation
function f1=fsolve16(y)
    f1=(V_dot*n)-(a*b*y*((b*y)/((b)+(2*y)))^(2/3)*(S0_1)^(1/2))
endfunction
