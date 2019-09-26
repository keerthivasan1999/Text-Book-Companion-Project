clc                             //To clear the console screen
clear                           //To clear all the existing Variables in the memory


//Let '1' and '2' be the same naming notations as shown in FIGURE 6-26 page number 246.
//Given data
Q=18.5                          //Q is water flow rate through the faucet in 'gal/min'
D=0.780                         //D is inner diameter of the pipe at the location of flange in 'in'
P1_gage=13                      //P1_gage is pressure at the location of flange in 'psi'
W_faucet_water=12.8             //W_faucet_water is the total weight of the faucet assembly plus the water within it in 'lbf'


//Unit conversion
Q=Q*0.1337/60                   //Conversion from 'gal/min' to 'ft3/s'
D=D/12                          //Conversion from 'in' to 'ft'
P1_gage=P1_gage*12^2            //Conversion from 'psi' to 'lbf/ft2'


//Assumption
betaa=1.03                      //betaa is momentum flux correction factor(Assuming the flow to be turblent)
rho=62.3                        //rho is water density in 'lbm/ft3'


//Calculation
R=D/2                           //R is radius of pipe at the location of the flange in 'ft'
A1=%pi*R^2                      //A is the CSA of the pipe at the location of flange in 'ft2'
V1=Q/A1                         //V1 is the inflow velocity of water in 'ft/s'
V2=V1                           //V2 is the outflow velocity of water in 'ft/s'
m=Q*rho                         //m is the mass flow rate of water in 'lbm/s'
F_Rx=-(m*V1/32.2)-(P1_gage*A1)  //F_Rx is x-component of the force acting on the flange in 'lbf'
F_Rz=-(m*V2/32.2)+W_faucet_water//F_Rz is z-component of the force acting on the flange in 'lbf'
//From Newton's third law, the force the faucet assembly exerts on the flange is negative of above determined forces
F_Rx=-1*F_Rx                    //lbf
F_Rz=-1*F_Rz                    //lbf


//Display of result
mprintf('\nForce the faucet assembly excerts on the flange is F= %.2f i + %.1f k lbf.',F_Rx,F_Rz)
