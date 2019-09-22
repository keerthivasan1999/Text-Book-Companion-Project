clc                 //To clear the console screen
clear               //To clear all the existing variables in the memory


//Given data
D=0.6               //D is diameter of glass tube in 'mm'
T=20                //T is temperature of water in '°c'


//Assumption
Phi=0               //Phi is contact angle of water with glass in '°(degree)'
rho=1000            //rho is density of water in 'kg/m3'
Sigma_s=0.073       //Sigma_s is surface tension water in 'N/m'
g=9.81              //g is the acceleration due to gravity in 'm/s2'


//Unit conversion
D=D/1000            //Conversion from 'mm' to 'm'
Phi=Phi*%pi/180     //Conversion from '°(degree)' to 'radian'


//Calculation
R=D/2               //R is radius of glass tube in 'm'
h=2*Sigma_s*cos(Phi)/(rho*g*R)//h is the capillary rise in 'm'
h=h*100             //Conversion from 'm' to 'cm'


//Display of result
printf("The capollary rise of water is %.1f cm.",h)
