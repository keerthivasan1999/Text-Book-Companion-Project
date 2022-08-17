clc                         //To clear the console screen
clear                       //To clear all the existing variables in the memory


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
bhp_B=bhp_A*(rho_B/rho_A)*(n_B/n_A)^3*(D_B/D_A)^5   //bhp_B is the brake horse power in 'W'
N_st_A=Omega_A*(bhp_A)^0.5/(rho_A^0.5*(g*H_A)^(5/4))//N_st_A is the dimension less turbine specific speed for turbine A
N_st_B=Omega_B*(bhp_B)^0.5/(rho_B^0.5*(g*H_B)^(5/4))//N_st_B is the dimension less turbine specific speed for turbine B
//Formula for N_st_US is obtained from FIGURE 14-107 page number 799.
N_st_US_A=43.46*N_st_A                              //N_st_US_A is the turbine specific speed in customary U.S. units of turbine A
N_st_US_B=43.46*N_st_B                              //N_st_US_B is the turbine specific speed in customary U.S. units of turbine B


//Display of result
if (N_st_A-N_st_B)<0.001 then
    mprintf('\nTurbine specific speed of the two turbines are same..!')
else 
    mprintf('\nTurbine specific speed of the two turbines are not same..!')
end
mprintf('\nDimensionless turbine specific speed for turbine A and B are %.2f and %.2f respectively.\nTurbine specific speed in customary U.S. units of turbine A and B are %.2f and %.2f respectively.',N_st_A,N_st_B,N_st_US_A,N_st_US_B)

