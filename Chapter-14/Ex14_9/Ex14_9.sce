//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                        //To clear the console screen
clear;                      //To clear all the existing variables in the memory


//Given data
V_dot=320                   //V_dot is the volume flow rate in 'gpm'
n=1170                      //n is the rotational speed of the pump shaft in 'rpm'
H=23.5                      //H is the required net head in 'ft of gasoline'


//Calculation
N_sp_US=n*V_dot^0.5/H^(3/4) //N_sp_US is the pump specific speed in customary U.S. units
N_sp=3.658E-4*N_sp_US       //N_sp is the normalized pump specific speed    (Formula is obtained from FIGURE 14-72 page number 776)
//Condition for N_sp is obtained from FIGURE 14-73 page number 777.
if N_sp>0 & N_sp<=1.8 then
    pump="Centrifugal"
else 
    if N_sp>1.8 & N_sp<=3.5
        pump="Mixed"
    else
        pump="Axial"
    end
end


//Display of result
mprintf('\nPump specific speed in customary U.S. units is %d.\nNormalized pump specific speed is %.3f\n%s pump is the suitable choice.',N_sp_US,N_sp,pump)
