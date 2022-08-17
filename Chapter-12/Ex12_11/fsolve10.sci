//Chapter 12 example 12-11
//Following is the function to find shock angle β.
function f=fsolve10(Beta)
    f=tan(theta)-((2/tan(Beta)*(Ma_1^2*sin(Beta)*sin(Beta)-1))/((Ma_1^2*(k+cos(2*Beta)))+2))
endfunction
