//Chapter 12 example 12-12
//Following is the function to calculate the downstream Mach number using downstream Prandtl Meyer function(PMF).
function f=fsolve11(Ma_2)
    f=Nu_Ma2-((sqrt((k+1)/(k-1))*atan(sqrt((k-1)/(k+1)*(Ma_2^2-1))))-(atan(sqrt(Ma_2^2-1))))*180/%pi
    //Multiplication by the factor '180/%pi' on the second R.H.S term of above equation is to convert the second term from 'radian' to '°(degree)'.
endfunction
