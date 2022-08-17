//Chapter 14 example 14-3
//Following fsolve20 function is to find the point of intersection of 'V_dot' vs 'NPSH_at_T2' curve and 'V_dot' vs 'NPSH_required' curve using fsolve function
function f1_at_T2=fsolve20(V_dot_op)
    Velocity2=V_dot_op/Area
    Re=rho_at_T2*Velocity2*D/Mu_at_T2
    fd=Colebrook(Epsilon_by_D,Re)
    f1_at_T2=(Slope_intercept(2)+(V_dot_op*Slope_intercept(1)))-(((P_atm-P_v_at_T2)/(rho_at_T2*g))+Z1-Z2-(((fd*L/D)+(Sigma_K_L))*(V_dot_op/Area)^2/2/g)-((Alpha2-1)*(V_dot_op/Area)^2/(2*g)))
endfunction
