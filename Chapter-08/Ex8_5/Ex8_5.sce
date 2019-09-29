clc                     //To clear the console screen
clear                   //To clear all the existing variables in the memory


//Following is the function to determine New volume flow rate (x(1)), Friction factor (x(2)), Velocity (x(3)) and Reynolds Number (x(4)) by solving 4 nonlinear equation with fsolve function
function f=F(x)
    f(1)=x(3)-(x(1)/A)
    f(2)=x(4)-(D*x(3)/Nu)
    f(3)=(1/x(2))-(4*(log10((Epsilon_by_D/3.7)+(2.51/(x(4)*sqrt(x(2))))))^2)
    f(4)=(h_L*D*2*g)-(L*x(2)*x(3)^2)
endfunction


//Given data
P=1                     //P is P of the air in 'atm'
T=35                    //T is T of the air in '°C'
L=300                   //L is L of circular plastic duct in 'm'
h_L=20                  //h_L is head loss in the pipe in 'm'
D=0.267                 //D is diameter of the duct in 'm'
Q_old=0.35              //Q is old volume flow rate of water in the duct in 'm3/s'


//Assumption
Epsilon=0               //Epsilon is equivalent roughness value in 'm'(Assuming the duct to be smooth)
g=9.81                  //g is acceleration due to gravity in 'm/s2'
//Air properties at given Pressure and Temperature
rho=1.145               //rho is density of the air in 'kg/m3'
Mu=1.895E-5             //Mu is dynamic viscosity of the air in 'kg/(m s)'
Nu=1.655E-5             //Nu is kinematic viscosity of the air in 'm2/s'


//Calculation
Epsilon_by_D=Epsilon/D  //Epsilon_by_D is the roughness factor of the duct
R=D/2                   //R is radius of the duct in 'm'
A=%pi*R^2               //A is CSA of the duct in 'm2'
x0=[1 0.01 3 50000]     //Guess Value for New volume flow rate (x(1)), Friction factor (x(2)), Velocity (x(3)) and Reynolds Number (x(4)) respectively
x=fsolve(x0,F)          //Calling statement for fsolve function
Q_drop=Q_old-x(1)       //Q_drop is drop in the volume flow rate in 'm3/s'


//Display of result
mprintf('\nOld volume flow rate is %.2f m3/s.\nNew volume flow rate is %.2f m3/s.\nFriction factor is %.4f.\nVelocity is %.2f m/s.\nReynolds Number is %d.\n\nThe drop in the flow rate is %.2f m3/s.',Q_old,x(1),x(2),x(3),x(4),Q_drop)
//The answers vary due to round off error
