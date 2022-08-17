//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                        //To clear the console screen
clear;                      //To clear all the existing variables in the memory


//Given data
V_dot=370                   //V_dot is the volume flow rate in 'gpm'
head=24                     //head is the required net head in 'ft'
Impeller1=8.25              //in
Impeller2=12.75             //in
speed=1160                  //'speed' is the pump speed in 'rpm'
H_Impeller1=24              //H_Impeller1 is impeller1's head in 'ft'
Impeller1_Eta_pump=0.7      //Impeller1_Eta_pump is the pump efficiency when Impeller1 is used
Impeller2_Eta_pump=0.765    //Impeller2_Eta_pump is the pump efficiency when Impeller2 is used


//Unit conversion
V_dot=V_dot*0.1337/60       //Conversion from 'gpm' to 'ft3/s'


//Assumption
rho=62.30                   //rho is water density in 'lbm/ft3'
g=32.2                      //g is acceleration due to gravity in 'ft/s2'


//Calculation
bhp_Impeller1=rho*g*V_dot*H_Impeller1/(Impeller1_Eta_pump)  //bhp_Impeller1 is the bhp required for impeller1 in '(lbm ft2)/s3'
bhp_Impeller1=bhp_Impeller1/32.2                            //Conversion from '(lbm ft2)/s3' to '(lbf ft)/s'
bhp_Impeller1=bhp_Impeller1/550                             //Conversion from '(lbf ft)/s' to 'hp'
H_Impeller2=72                                              //H_Impeller2 is impeller2's head in 'ft' (Obtained from FIGURE 14-15 using the point of intersection of 12.5 inche curve and V_dot=370 gpm line)
bhp_Impeller2=rho*g*V_dot*H_Impeller2/(Impeller2_Eta_pump)  //bhp_Impeller2 is the bhp required for impeller 2 in '(lbm ft2)/s3'
bhp_Impeller2=bhp_Impeller2/32.2                            //Conversion from '(lbm ft2)/s3' to '(lbf ft)/s'
bhp_Impeller2=bhp_Impeller2/550                             //Conversion from '(lbf ft)/s' to 'hp'


//Display of result
mprintf('\nbhp for %.2f in impeller option is %.2f hp.\nbhp for %.2f in impeller option is %.2f hp.',Impeller1,bhp_Impeller1,Impeller2,bhp_Impeller2)
//The answers vary due to round off error
if bhp_Impeller1<bhp_Impeller2 then
    mprintf('\nClearly, the smaller diameter impeller option is the better choice because it uses less power.')
else 
    mprintf('\nClearly, the larger diameter impeller option is the better choice because it uses less power.')
end
