clc                      //To clear the console screen
clear                    //To clear all the existing Variables in the memory


//Let '1' and '2' be the same naming notations as shown in FIGURE 6-21 page number 240.
//Given data
m=14                    //m is the mass flow rate of water in 'kg/s'
theta=180               //theta is bend angle of the reducing elbow in '°(degree)'
A1=113                  //A1 is inlet CSA of the elbow in 'cm2'
A2=7                    //A2 is outlet CSA of the elbow in 'cm2'
Z1=0                    //Z1 is the elevation of the inlet in 'cm'
Z2=30                   //Z2 is the elevation of the outlet in 'cm'


//Unit conversion
A1=A1*10^-4             //Conversion from 'cm2' to 'm2'
A2=A2*10^-4             //Conversion from 'cm2' to 'm2'
Z1=Z1/100               //Conversion from 'cm' to 'm'
Z2=Z2/100               //Conversion from 'cm' to 'm'
theta=theta*%pi/180     //Conversion from 'degree' to 'radian'


//Assumption
rho=1000                //rho is the water denisty in 'kg/m3'
P1=101325               //P1 is pressure at the inlet in 'Pa'
g=9.81                  //g is acceleration due to gravity in 'm/s2'
betaa=1.03              //betaa is momentum flux correction factor(Assuming flow to be turblent)
F_Rz=0                  //F_Rz is the z-component of the anchoring force of the elbow in 'N'


//Part (a)
//Calculation
V1=m/(rho*A1)           //V1 is the inlet water velocity in 'm/s'
V2=m/(rho*A2)           //V2 is the outlet water velocity in 'm/s'
P_1_gage=(((P1/(rho*g))+(V2^2/(2*g))+Z2-Z1-(V1^2/(2*g)))*rho*g)//P_1_gage is the pressure at the centre of the inlet of the elbow in 'Pa absolute'
P_1_gage=P_1_gage-101325//Conversion from 'Pa absolute' to 'Pa gage'
P_1_gage=P_1_gage/1000  //Conversion from 'Pa gage' to 'kPa gage'


//Display of result
mprintf('\n(a) The pressure at the centre of the inlet of the elbow is %.1f kPa gage.',P_1_gage)


//Part (b)
//Calculation
P_1_gage=P_1_gage*1000                                  //Conversion from 'kPa' to 'Pa'
F_Rx=(betaa*m*((V2*cos(theta)-V1)))-(P_1_gage*A1)       //F_Rx is the x-component of the anchoring force of the elbow in 'N'


//Display of result
mprintf('\n\n(b) x-component of the anchoring force of the elbow is %d N.',F_Rx)
//The answers vary due to round off error
