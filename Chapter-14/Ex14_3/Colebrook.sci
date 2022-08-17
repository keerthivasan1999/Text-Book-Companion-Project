//Chapter 14 example 14-3
//Following is the function to determine the friction factor using colebrook equation.
//Due to the implicit nature of the colebrook equation, it is solved using Newton Raphson Method.
function f=Colebrook(Epsilon_by_D,Re)
    A=Epsilon_by_D/3.7
    B=2.51/Re
    f_guess=64/Re
    Function=1/(sqrt(f_guess))+(2*log10(A+(B/sqrt(f_guess))))
    FunctionDerivative=(-0.5*f_guess^-(3/2))+((-1*B)/((A*f_guess^(3/2))+(B*f_guess)))
    f_new=f_guess-(Function/FunctionDerivative)
    while (abs(f_new-f_guess)>1e-10)
        f_guess=f_new
        Function=1/(sqrt(f_guess))+(2*log10(A+(B/sqrt(f_guess))))
        FunctionDerivative=((-1*f_guess^-1.5)/(2))+((-1*B)/((A*f_guess^1.5)+(B*f_guess)))
        f_new=f_guess-(Function/FunctionDerivative)
    end
    f=f_new;
endfunction
