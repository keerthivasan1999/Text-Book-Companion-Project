clc                 //To clear the console screen
clear               //To clear all the existing Variables in the memory


//Given data
V1=20               //V1 is velocity at which water strikes the vertical plate in 'm/s'
m=10                //m is mass flow rate of water when it strikes the vertical plate in 'kg/s'


//Assumption
betaa=1             //betaa is momentum flux correction factor


//Calculation
F_R=betaa*m*V1      //F_R is the force needed to prevent the plate from horizontal movement in 'N'


//Display of result
mprintf('\nForce needed to prevent the plate from moving horizontally due to water stream is %d N.',F_R)
