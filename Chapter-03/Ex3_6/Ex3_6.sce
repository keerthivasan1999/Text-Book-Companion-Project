clc                 //To clear the console screen
clear               //To clear all the existing variables in the memory


//Given data
m=60                //m is mass of gas in the cylinder in 'kg'
g=9.81              //g is accelaration due to gravity in 'm/s2'
A=0.04              //A is cross sectional area in 'm2'
P_atm=0.97          //P_atm is atmospheric pressure in 'bar'


//Calculation
W=m*g                   //W is weight of gas in cylinder in 'N'
P=P_atm+(W/(A*(10^5)))  //P is pressure inside the cylinder in 'bar'
//Division by 10^5 on second term of above equation R.H.S is to convert the 'Pa' into 'bar'


//Display of result
mprintf('Pressure inside the cylinder is %.2f bars.',P)
