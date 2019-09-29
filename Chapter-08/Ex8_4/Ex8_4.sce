clc                     //To clear the console screen
clear                   //To clear all the existing variables in the memory


//Following is the function to determine Velocity (x(1)), Diameter (x(2)), Reynolds Mumber (x(3)) and Friction factor (x(4)) by solving 4 nonlinear equation using fsolve function.
function f=F(x)
    f(1)=(x(1)*x(2)^2)-((4*Q)/%pi)
    f(2)=x(3)-((1/Nu)*x(1)*x(2))
    f(3)=(h_L*x(2))-((L/(2*g))*x(4)*x(1)^2)
    f(4)=(1/x(4))-(4*(log10(2.51/(x(3)*sqrt(x(4)))))^2)
endfunction


//Given data
P=1                     //P is pressure of the air in 'atm'
T=35                    //T is temperature of the air in '°C'
L=150                   //L is length of circular plastic duct in 'm'
Q=0.35                  //Q is volume flow rate of water in the duct in 'm3/s'
h_L=20                  //h_L is head loss in the pipe in 'm'


//Assumption
Epsilon=0               //Epsilon is equivalent roughness value in 'm'(Assuming the duct to be smooth)
g=9.81                  //g is acceleration due to gravity in 'm/s2'
//Air properties at given Pressure and Temperature
rho=1.145               //rho is density of the air in 'kg/m3'
Mu=1.895E-5             //Mu is dynamic viscosity of the air in 'kg/(m s)'
Nu=1.655E-5             //Nu is kinematic viscosity of the air in 'm2/s'


//Calculation
x0=[3 1 10000 0.01]     //Guess Value for Velocity (x(1)), Diameter (x(2)), Reynolds Mumber (x(3)) and Friction factor (x(4)) respectively
x=fsolve(x0,F)          //Calling statement for fsolve function
D_By_SJF=0.66*(((Epsilon^1.25)*(L*Q/(g*h_L))^4.75)+(Nu*(Q^9.4)*(L/(g*h_L))^5.2))^0.04//D_By_SJF is diameter of the duct determined using Swamee-Jain forNula in 'm'


//Display of result
mprintf('\nVelocity is %.2f m/s.\nDiameter is %.3f m.\nReynolds Mumber is %d.\nFriction factor is %.4f.\n\nDiameter by Swamee-Jain forNula is %.3f m.',x(1),x(2),x(3),x(4),D_By_SJF)
//The answers vary due to round off error
