clc             //To clear the console screen
clear           //To clear all the existing variables in the memory


//Given Data
D=20            //D is diameter of the vertical cylindrical container in 'cm'
h=60            //h is height of the vertical cylindrical container in 'cm'
h0=50           //h0 is the original height of the liquid before rotation in 'cm'
rho=850         //rho is density of liquid in 'kg/m3'


//Unit conversion
D=D/100         //Conversion from 'cm' to 'm'
h=h/100         //Conversion from 'cm' to 'm'
h0=h0/100       //Conversion from 'cm' to 'm'


//Calculation
R=D/2                                   //R is radius of vertical cylindrical container in 'm'
Z_s_R=h                                 //Z_s_R is the height at the time of spilling in 'm'
Omega=sqrt((4*9.81*(Z_s_R-h0))/(R^2))   //Omega is angular velocity of the container in 'rad/s'
n=Omega/(2*%pi)                         //n is rotational speed of the container in 'rps'
n=n*60                                  //Conversion from 'rps' to 'rpm'


//Display of the result
mprintf("Rotational speed at the start of spilling from the eDges of the container is %.3f rpm.",n)
//The answers vary due to round off error
