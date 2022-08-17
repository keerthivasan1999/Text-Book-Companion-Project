//Chapter 12 example 12-17
//Following is the function to 'Ma_2' from 'fl_star_by_D_out' by using the formula present in page number 902 APPENDIX 1.
function f=fsolve14(Ma_2)
   f=(fl_star_by_D_out*Ma_2^2)-(((1-Ma_2^2)/k)+((((k+1)*Ma_2^2)/(2*k))*log(((k+1)*Ma_2^2)/(2+((k-1)*Ma_2^2)))))
endfunction
