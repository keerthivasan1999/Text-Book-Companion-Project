clc                         //To clear the console screen
clear                       //To clear all the existing variables in the memory


//Given data
L_m_by_L_p=1/100            //L_m_by_L_p is the length scale factor


//Assumption
Nu_p=1.002E-6               //Nu_p is prototype kinematic viscosity in 'm2/s'


//Calculation
Nu_m=Nu_p*(L_m_by_L_p)^1.5  //Nu_m is model kinematic vicosity in 'm2/s'
Nu_m=Nu_m*10^9              //Modification for display of result purpose.


//Display of result
mprintf('\nLiquid with kinematic viscosity of %.3f E-9 m2/s is preffered.\nBut no liquid fall under this kinematic vicosity range. So water can be used.',Nu_m)
//The answers vary due to round off error
