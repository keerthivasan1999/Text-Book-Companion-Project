//Chapter 12 example 12-6
//Following is the function to determine Mach number 'Ma2' using the formula for 'A_2_ratio' given in page number 899 APPENDIX 1.
function f=fsolve9(Ma2)
    f=(A_2_ratio*Ma2)-((2/(k+1))*(1+(0.5*Ma2^2*(k-1))))^((0.5*(k+1))/(k-1))
endfunction
