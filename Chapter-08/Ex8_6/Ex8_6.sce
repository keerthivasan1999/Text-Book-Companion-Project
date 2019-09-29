clc                 //To clear the console screen
clear               //To clear all the existing variables in the memory


//Let '1' and '2' be the same numbering notation as shown FIGURE 8-40 page number 353
//Given data
D1=6                //D1 is diameter of the pipe before expansion in 'cm'
D2=9                //D2 is diameter of the pipe after expansion in 'cm'
theta=30            //theta is angle made by wall with the horizontal in '°(degree)'
V1=7                //V1 is the average velocity of water before the expansion in 'm/s'
P1=150              //P1 is the pressure of water before the expansion in 'kPa'


//Unit conversion
D1=D1/100           //Conversion from 'cm' to 'm'
D2=D2/100           //Conversion from 'cm' to 'm'
P1=P1*1000          //Conversion from 'kPa' to 'Pa'


//Assumption
alpha1=1.06         //alpha1 is the upstream kinetic energy correction factor(Assuming flow to be turblent)
alpha2=1.06         //alpha1 is the downstream kinetic energy correction factor(Assuming flow to be turblent)
rho=1000            //rho is density of the water in 'kg/m3'
K_L=0.07            //K_L is loss co-efficient for gradual expansion
Z1=0                //Z1 is elevation of pipe before expansion from the reference plane in 'm'
Z2=0                //Z2 is elevation of pipe after expansion from the reference plane in 'm'
h_pump_u=0          //h_pump_u is the useful pump head delivered to the water in 'm'
h_turbine_e=0       //h_turbine_e is the turbine head extracted from the water in 'm'
g=9.81              //g is acceleration due to gravity in 'm/s2'


//Calculation
V2=V1*(D1/D2)^2     //V2 is the average velocity of water after the expansion in 'm/s'
h_L=K_L*V1^2/(2*g)  //h_L is the irreversible head loss in the expansion section in 'm'
P2=rho*g*(((alpha1*V1^2/(2*g))-(alpha2*V2^2/(2*g)))+Z1-Z2+h_pump_u-h_turbine_e-h_L+(P1/(rho*g)))
//P2 is the pressure of water after the expansion in 'Pa'
P2=P2/1000           //Conversion from 'Pa' to 'kPa'


//Display of result
mprintf('\nHead loss in the expansion section is %.3f m.\nPressure in the larger diameter pipe is %d kPa.',h_L,P2)

