//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                 //To clear the console screen
clear;               //To clear all the existing variables in the memory


//Given data
v=1                 //v is water velocity in the channel in 'm/s'
W=2                 //W is wide of the channel in 'm'


//Assumption
Psi_wall=0          //Psi_wall is bottom wall streamline in 'm2/s'
Psi_dividing=1      //Psi_dividing is divding streamline in 'm2/s'


//Values obtained from the FIGURE 9-25 page number 418
Psi_1=1.8           //Psi_1 is streamline 1.8 in 'm2/s'
Psi_2=1.6           //Psi_2 is streamline 1.6 in 'm2/s'
Delta=0.21          //Delta is the distance between the two stream lines in 'm'


//Calculation
V_dot_by_W=Psi_dividing-Psi_wall        //V_dot_by_W is volume flow rate per unit width in 'm2/s'
V_dot=V_dot_by_W*W                      //V_dot is the total volume flow rate through the slot in 'm3/s'
V_A=(Psi_1-Psi_2)/Delta                 //V_A is the speed at point A in 'm/s '


//Display of result
mprintf('\nTotal volume flow rate through the slot is %.1f m3/s.\nSpeed at point A is %.2f m/s.',V_dot,V_A)
