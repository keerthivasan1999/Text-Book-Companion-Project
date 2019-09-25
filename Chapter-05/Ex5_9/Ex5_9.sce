clc                     //To clear the console screen
clear                   //To clear all the existing Variables in the memory


//Let '1', '2', '3', 'A', and 'B' be the same naming notation as shown in FIGURE 5-42
//Given data
h1Hg=30                 //h1Hg is atmospheric pressure at point1 in 'in Hg'
h2Hg=22                 //h2Hg is hurricane atmospheric pressure at the eye of the storm in 'in Hg'
rho_Hg=848              //rho_Hg is density of mercury in 'lbm/ft3'
rho_atm_air=0.076       //rho_atm_air is density of air at normal conditions in 'lbm/ft3'
rho_sw=64               //rho_sw is density of sea water in 'lbm/ft3'
V_A=155                 //V_A is wind velocity in 'mph'


//Unit conversion
h1Hg=h1Hg/12            //Conversion from 'in' to 'ft'
h2Hg=h2Hg/12            //Conversion from 'in' to 'ft'
V_A=V_A*1.46667         //Conversion from 'mph' to 'ft/s'


//Part (a)
//Calculation
h_Hg=h1Hg-h2Hg          //'in of Hg'
h1=rho_Hg*h_Hg/rho_sw   //h1 is pressure difference between points 1 and 3 in terms of seawater column height in 'ft'


//Display of result
mprintf('\n(a) Storm surge at the eye of the hurricane is %.2f ft.',h1)


//Part (b)
//Assumption
H_A=0                   //ft
H_B=0                   //ft
V_B=0                   //V_B is velocity at point B in 'ft/s'


//Calculation
h_air=(H_A-H_B)+((V_A^2-V_B^2)/(2*32.185))//ft
rho_air=(h2Hg/h1Hg)*rho_atm_air           //rho_air is density of air in the hurricane in 'lbm/ft3'
h_dynamic=(rho_air/rho_sw)*h_air          //h_dynamic is seawater column height in 'ft'
h2=h1+h_dynamic                           //h2 is total storm surge at point 2 in 'ft'


//Display of result
mprintf('\n(b) Storm surge at point 2 is %.2f ft.',h2)
