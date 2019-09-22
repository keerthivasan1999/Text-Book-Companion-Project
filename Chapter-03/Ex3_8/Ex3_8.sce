clc                 //To clear the console screen
clear               //To clear all the existing variables in the memory_P


//Given data
s=8                 //s is distance between top edge of the door and water surface in 'm'
b=1.2               //b is height of the door in 'm'
W=1                 //W is the door width in 'm'


//Assumption
rho=1000            //rho is density of water in 'kg/m3'


//Calculation
P_ave=rho*9.81*(s+(b/2))/1000   //P_ave is average pressure on the door in 'kN/m2'
A=b*W                           //A is area of door in 'm2'
F_R=P_ave*A                     //F_R is resultant hydrostatic force on the door in 'kN'
y_P=s+(b/2)+(b^2/(12*(s+(b/2))))//y_P is distance of pressure center from the lake surface in 'm'


//Display of result
mprintf('\nThe resultant hydrostatic on the door is %.1f kN.\nPressure center distance from the surface of the lake is %.2f m.',F_R,y_P)
//The answers vary due to round off error
