//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                    //To clear the console screen
clear;                  //To clear all the existing variables in the memory


//Given data
V_lobe=0.45             //V_lobe is the volume of motor oil in 'cm3'
n_pump=900              //n_pump is the rotation speed of the pump in 'rpm'


//Assumption
n=0.5                   //n is rotations for 180° rotation. Obtained from FIGURE 14-27 page number 752.


//Calculation
V_closed=2*V_lobe       //V_closed is total volume of oil pumped in 'cm3'
V_dot=n_pump*V_closed/n //V_dot is the volume flow rate in 'cm3/min'


//Display of result
mprintf('\nThe volume flow rate is %d cm3/min.',V_dot)
