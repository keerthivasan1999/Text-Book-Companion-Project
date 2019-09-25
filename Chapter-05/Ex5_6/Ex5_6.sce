clc                 //To clear the console screen
clear               //To clear all the existing variables in the memory


//Given data
Z1=5                //Z1 is height of water level in the tank in 'm'


//Assumption
rho=1000            //rho is water density in 'kg/m3'
P1=101325           //P1 is pressure at free surface of water in 'Pa'
P2=101325           //P2 is pressure at the outlet in 'Pa'
Z2=0                //Z2 is height of the outlet in 'm'
V1=0                //V1 is velocity of water at the water surface in 'm/s'
g=9.81              //g is the acceleration due to gravity in 'm/s2'


//Calculation
V2=sqrt(2*g*(((P1-P2)/(rho*g))+(V1^2/(2*g))+Z1-Z2))//V2 is water velocity at the outlet in 'm/s'


//Display of result
mprintf('Water velocity at the outlet is %.1f m/s.',V2)
