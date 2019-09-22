clc                 //To clear the console screen
clear               //To clear all the existing variables in the memory


//Given data
P_atm=14.5          //P_atm is atmospheric pressure in 'psi'
P_vac=5.8           //P_vac is vacuum pressure in 'psi'


//Calculation
P_abs=P_atm-P_vac   //P_abs is absolute pressure in 'psi'
//Absolute Pressure + Vacuum Pressure=Atmospheric Pressure


//Display of result
mprintf("Absolute pressure is %.1f psi.",P_abs)
