clc                     //To clear the console screen
clear                   //To clear all the existing variables in the memory


//Given data
h0=4                    //h0 is initial height of water in the tank in 'ft'
D_tank=3                //D_tank is diameter of the tank in 'ft'
h2=2                    //h2 is final height of water in the tank in 'ft'
D_jet=0.5               //D_jet is diameter of the water jet in 'in'


//Unit conversion
h0=h0*0.3048            //Converiosn from 'ft' to 'm'
h2=h2*0.3048            //Converiosn from 'ft' to 'm'
D_tank=D_tank*0.3048    //Converiosn from 'ft' to 'm'
D_jet=D_jet*0.0254      //Converiosn from 'in' to 'm'


//Assumption
g=9.81                  //g is acceleration due to gravity in 'm/s2'


//Calculation
t=((sqrt(h0)-sqrt(h2))/sqrt(g/2))*((D_tank/D_jet)^2)/60//t is time taken for the water level to drop half of its initial level in 's'
h2=h2/0.3048          //Conversion from 'ft' from 'm'


//Display of result
mprintf('\nTime taken for the water level to drop to %d ft is %.1f min.',h2,t)
