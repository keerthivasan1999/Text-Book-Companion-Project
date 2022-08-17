//Chapter 12 example 12-16
//Following is the function to determine the friction factor using colebrook equation.
function f=fsolve13(f0)
    f=(1/f0)-(4*(log10((epsilon_by_D/3.7)+(2.51/(Re_1*sqrt(f0)))))^2)
endfunction
