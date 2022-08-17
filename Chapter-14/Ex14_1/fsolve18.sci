//Chapter 14 example 14-1
//Following is the function to determine the friction factor using colebrook equation
function f=fsolve18(f0)
    f=(1/f0)-(4*(log10((epsilon_by_D/3.7)+(2.51/(Rey*sqrt(f0)))))^2)
endfunction
