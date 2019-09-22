clc                 //To clear the console screen
clear               //To clear all the existing variables in the memory


//Given data
D=1                 //D is diameter of the hydrometer in 'cm'
L=20                //L is length of the hydrometer in 'cm'
h_sub=10            //h_sub is lead height in hydrometer in 'cm'


//Unit conversion
D=D/100             //Conversion from 'cm' to 'm'
L=L/100             //Conversion from 'cm' to 'm'
h_sub=h_sub/100     //Conversion from 'cm' to 'm'


//Assumption 
rho_W=1000          //rho_W is density of water in 'kg/m3'


//Calculation
R=D/2                   //R is radius of hydrometer in 'm'
V_sub=%pi*(R^2)*h_sub   //V_sub is volume of lead submerged in 'm3'
m=rho_W*V_sub           //m is required mass of lead in 'kg'


//Diplay of result
mprintf("Mass of lead is %.5f kg.",m)
