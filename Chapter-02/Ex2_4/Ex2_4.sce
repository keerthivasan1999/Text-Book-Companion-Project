clc                 //To clear the console screen
clear               //To clear all the existing variables in the memory


//Given data
T=1.8               //T is torque in 'N m'
l=0.15              //l is the gap between the two cylinders in 'cm'
D=12                //D is diameter of the inner cylinder in 'cm'
L=40                //L is length of the concentric cylinders in 'cm'
n=300               //n is rotational speed of inner cylinder in 'rpm'


//Unit conversion
L=L/100             //Conversion from 'cm' to 'm'
D=D/100             //Conversion from 'cm' to 'm'
l=l/100             //Conversion from 'cm' to 'm'
n=300/60            //Conversion from 'rpm' to 'rps'


//Calculation
R=D/2               //R is radius of the inner cylinder in 'm'
Mu=T*l/(4*((%pi)^2)*(R^3)*n*L)//Mu is viscosity of the fluid in '(N s)/m2'


//Display of result
printf("Viscosity of the fluid is %.3f (N s)/m2.",Mu)
