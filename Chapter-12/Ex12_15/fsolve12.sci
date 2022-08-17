//Chapter 12 example 12-15
//Following is the function to determine 'Ma_2' using the exit stag-temperature ratio by using the formula present in APPENDIX 1 page number 901.
function f=fsolve12(Ma_2)
    f=(Stag_T_2/T_0_star*(1+(k*Ma_2^2))^2)-((k+1)*(2+((k-1)*Ma_2^2))*Ma_2^2)
endfunction
