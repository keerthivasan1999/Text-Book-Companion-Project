//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                    //To clear the console screen
clear;                  //To clear all the existing variables in the memory
clf(0)                  //Clear or reset or reset a figure 0
clf(1)                  //Clear or reset or reset a figure 1


//Given data
V=10                    //V is air velocity in 'm/s'
L=1.52                  //L is length of the flat plate in 'm'


//Assumption
Nu=1.516E-5             //Nu is kinematic viscosity of the air in 'm2/s'


//Calculation
//Part (a)
x=L                                 //m
Re_x=V*x/Nu                         //Re_x is Reynolds number at 'x'
delta_laminar=4.91*x/sqrt(Re_x)     //delta_laminar is laminar boundary layer thickness in 'm'
delta_laminar=delta_laminar*1000    //Conversion from 'm' to 'mm'
delta_turblent=0.16*x/(Re_x)^(1/7)  //delta_turblent is turblent boundary layer thickness in 'm'
delta_turblent=delta_turblent*1000  //Conversion from 'm' to 'mm'
y=1:100                             //y(in 'mm') denotes the vertical distance
n=length(y)                         //n is number of values present in 'y' matrix
for i=1:n
    if(y(i)<delta_laminar)
        u_laminar(i)=V/(delta_laminar^(1/7))*(y(i)^(1/7))   //u_laminar(in m) is velocity when the flow is laminar
    else
        u_laminar(i)=V
    end
    if(y(i)<delta_turblent)
        u_turblent(i)=V/(delta_turblent^(1/7))*(y(i)^(1/7)) //u_turblent(in m) is velocity when the flow is turblent
    else
        u_turblent(i)=V
    end
end


//Display of result
plot(u_laminar',y,'k',u_turblent',y,'r')
xlabel("u,m/s")
ylabel("y,mm")
title("FIGURE 10-115: Comparison of laminar and turblent flate plate boundary layer profiles in physical variables at the same x-location.")
legend('laminar','turblent')


//Part (b)
//Calculation
C_f_x_laminar=0.664/sqrt(Re_x)      //C_f_x_laminar is laminar local skin friction coefficient
C_f_x_turblent=0.027/(Re_x)^(1/7)   //C_f_x_turblent is turblent local skin friction coefficient


//Display of result
mprintf("\n(b) Laminar local skin friction coefficient is %f.\n    Turblent local skin friction coefficient is %f.",C_f_x_laminar,C_f_x_turblent)


//Part (c)
//Calculation
x=0:5
m=length(x)
for i=1:m
    delta_laminar(i)=x(i)*4.91/sqrt(Re_x)
    delta_laminar(i)=delta_laminar(i)*1000          //Conversion from 'm' to 'mm'
    delta_turblent_a(i)=x(i)*0.16/(Re_x)^(1/7)
    delta_turblent_a(i)=delta_turblent_a(i)*1000    //Conversion from 'm' to 'mm'
    delta_turblent_b(i)=x(i)*0.38/(Re_x)^(1/5)
    delta_turblent_b(i)=delta_turblent_b(i)*1000    //Conversion from 'm' to 'mm'
    
end


//Display of result
scf(1)
plot(x',delta_laminar,'k',x',delta_turblent_a,'r',x',delta_turblent_b,'r')
xlabel("x,m")
ylabel("delta,mm")
title("FIGURE 10-116: Comparison of the growth of a laminar and turblent flate plate boundary layer of Example 10-12.")
legend('laminar','turblent (a)','turblent (b)',2)

