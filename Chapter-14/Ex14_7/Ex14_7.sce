//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                        //To clear the console screen
clear;                      //To clear all the existing variables in the memory


//Given data
D_propeller=34              //D_propeller is the propeller diameter in 'cm'
D_hub=5.5                   //D_hub is the hub assembly diameter in 'cm'
n=1700                      //n is the rotational speed of propeller in 'rpm'
alpha=14                    //alpha is the attack angle in '°(degree)'
v=30                        //v is the velocity of the airplane in 'mi/h'


//Unit conversion
D_propeller=D_propeller/100 //Conversion from 'cm' to 'm'
D_hub=D_hub/100             //Conversion from 'cm' to 'm'
v=v*1609.34/3600            //Conversion from 'mi/h' to 'm/s'


//Calculation
Omega=n*(%pi*2)/60                                          //Omega is the angular velocity in 'rad/s'
r_propeller=D_propeller/2                                   //r_propeller is the radius of the propeller in 'm'
r_hub=D_hub/2                                               //r_hub is the radius of the hub assembly in 'm'
theta_propeller=alpha+(atan(v/(Omega*r_propeller))*180/%pi) //theta_propeller is the blade pitch angle at the tip in '°(degree)'
theta_hub=alpha+(atan(v/(Omega*r_hub))*180/%pi)             //theta_hub is the balde pitch angle at the root in '°(degree)'
//Multiplication by '180/%pi' on the second term of 'theta_propeller' and 'theta_hub' equations R.H.S is to convert the second term from 'radian' to '°(degree)'


//Display of result
mprintf('\nThe pitch angle at the root is %.1f°.\nThe pitch angle at the tip is %.1f°.',theta_hub,theta_propeller)
