clc                 //To clear the console screen
clear               //To clear all the existing variables in the memory


//Let '1' and '2' be the same numbering notation as shown FIGURE 8-60 page number 369
//Given data
T=20                //T is temperature of methanol in '°C'
rho_met=788.4       //rho_met is density of methanol in 'kg/m3'
Mu_met=5.857E-4     //Mu_met is viscosity of methanol in 'kg/(m s)'
D_p=4               //D_P is pipe diameter in 'cm'
D_o=3               //D_o is orifice diameter in 'cm'
h=11                //h is differential height of the manometer in 'cm'


//Unit conversion
D_p=D_p/100         //Conversion from 'cm' to 'm'
D_o=D_o/100         //Conversion from 'cm' to 'm'
h=h/100             //Conversion from 'cm' to 'm'


//Assumption
CD=0.61             //CD is the dimensionLess discharge coefficient
rho_Hg=13600        //rho_Hg is density of the mercury in 'kg/m3'
g=9.81              //g is acceleration due to gravity in 'm/s2'


//Calculation
Betaa=D_o/D_p       //Betaa is the dimensionLess diameter ratio
R_o=D_o/2           //R_o is radius of the orifice in 'm'
R_p=D_p/2           //R_p is radius of the pipe in 'm'
A_c=%pi*R_p^2       //A_c is CSA of the pipe in 'm2'
A_o=%pi*R_o^2       //A_o is area of the orifice in 'm2'
Q=A_o*CD*sqrt((2*g*h*(rho_Hg-rho_met))/(rho_met*(1-Betaa^4)))//Q is water flow rate in 'm3/s'
V=Q/A_c             //V is average velocity in the pipe in 'm/s'


//Display of result
mprintf('\nVolume flow rate is %f m3/s or %.2f L/s.\nAverage flow V in the pipe is %.2f m/s.',Q,Q*1000,V)
