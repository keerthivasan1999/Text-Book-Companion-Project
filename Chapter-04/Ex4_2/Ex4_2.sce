clc                                     //To clear the console screen
clear                                   //To clear all the existing variables in the memory


//Given Data
delta_x=3.90                            //delta_x is length of the nozzle in 'in'
D_inlet=0.420                           //D_inlet is inlet diameter of nozzle in 'in'
D_outlet=0.182                          //D_outlet is outlet diameter of the nozzle in 'in'
Q=0.841                                 //Q is volume flow rate through teh hose in 'gal/min'


//Unit conversion
delta_x=delta_x/12                      //Conversion from 'in' to 'ft'
D_inlet=D_inlet/12                      //Conversion from 'in' to 'ft'
D_outlet=D_outlet/12                    //Conversion from 'in' to 'ft'
Q=Q*0.133681/60                         //Conversion form 'gal/min' to 'ft3/s'


//Calculation
u_inlet=4*Q/(%pi*D_inlet^2)            //u_inlet is inlet velocity in 'ft/s'
u_outlet=4*Q/(%pi*D_outlet^2)          //u_outlet is outlet velocity in 'ft/s'
a_x=(u_outlet^2-u_inlet^2)/(2*delta_x) //a_x is axial acceleration in 'ft/s2'


//Display of result
mprintf('\nInlet speed is %.2f ft/s.\nOutlet speed is %.1f ft/s.\nAxial acceleration is %d ft/s2.',u_inlet,u_outlet,a_x)
//The answers vary due to round off error

