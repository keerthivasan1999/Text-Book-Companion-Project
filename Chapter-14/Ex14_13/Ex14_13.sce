//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                        //To clear the console screen
clear;                      //To clear all the existing variables in the memory


//Given data
D_A=2.05                    //D_A is the diameter of the turbine A in 'm'
n_A=10                      //n_A is the rotational speed of turbine A in 'rpm'
Omega_A=12.57               //Omega_A is the angular velocity of turbine A in 'rad/s'
V_dot_A=350                 //V_dot_A is the volume flow rate in the tubine A in 'm3/s'
H_A=75                      //H_A is the net head in the turbine A 'm of water'
bhp_A=242                   //bhp_A is the brake horse power of turbine A in 'MW'
n_B=n_A                     //n_B is the rotational speed of turbine B in 'rpm'
H_B=104                     //H_B is the net head in the turbine B 'm of water'


//Assumption
rho_A=998                   //rho_A is the water density in turbine A in 'kg/m3'
rho_B=998                   //rho_B is the water density in turbine B in 'kg/m3'
g=9.81                      //g is the acceleration due to gravity in 'm/s2'


//Unit conversion
bhp_A=bhp_A*10^6            //Conversion from 'MW' to 'W'


//Calculation
Omega_B=Omega_A                                     //Omega_B is the angular velocity of the turbine B in 'rad/s'
D_B=D_A*(n_A/n_B)*sqrt(H_B/H_A)                     //D_B is the diameter of turbine B in 'm'
V_dot_B=V_dot_A*(n_B/n_A)*(D_B/D_A)^3               //V_dot_B is the volume flow rate in turbine B in 'm3/s'
bhp_B=bhp_A*(rho_B/rho_A)*(n_B/n_A)^3*(D_B/D_A)^5   //bhp_B is the brake horse power of turbine B in 'W'
Eta_turbine_A=bhp_A/(rho_A*g*H_A*V_dot_A)           //Eta_turbine_A is the efficiency of the turbine A
Eta_turbine_B=1-((1-Eta_turbine_A)*(D_A/D_B)^(1/5)) //Eta_turbine_B is the efficiency of the turbine B
C_H_A=g*H_A/(Omega_A^2*D_A^2)                       //C_H_A is the heat coefficient of turbine A
C_H_B=g*H_B/(Omega_B^2*D_B^2)                       //C_H_B is the heat coefficient of turbine B
C_Q_A=V_dot_A/(Omega_A*D_A^3)                       //C_Q_A is the capacity coefficient of turbine A
C_Q_B=V_dot_B/(Omega_B*D_B^3)                       //C_Q_B is the capacity coefficient of turbine B
C_P_A=bhp_A/(rho_A*Omega_A^3*D_A^5)                 //C_P_A is the power coefficient of turbine A
C_P_B=bhp_B/(rho_B*Omega_B^3*D_B^5)                 //C_P_B is the power coefficient of turbine B
bhp_B=bhp_B/10^6                                    //Conversion from 'W' to 'MW'


//Display of result
mprintf('\nDiameter of turbine B is %.2f m.\nVolume flow rate in turbine B is %d m3/s.\nBrake horse power of turbine B is %d MW.\nEfficiency of turbine B is %.3f.',D_B,V_dot_B,bhp_B,Eta_turbine_B)
//The answers vary due to round off error
mprintf('\n\nDimension less turbine parameters for both turbines are as follows:')
mprintf('\n\n\tTurbine A\tTrbine B\nC_H\t%f\t%f\nC_Q\t%f\t%f\nC_P\t%f\t%f',C_H_A,C_H_B,C_Q_A,C_Q_B,C_P_A,C_P_B)


