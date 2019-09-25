clc                     //To clear the console screen
clear                   //To clear all the existing Variables in the memory


//Given data
W_electric=15           //W_electric is electric motor power in 'kW'
Eta_motor=0.90          //Eta_motor is efficiency of the motor
Q=50                    //Q is water flow rate through the pump in 'L/s'
P1=100                  //P1 is pressure at the inlet of the pump in 'kPa'
P2=300                  //P2 is pressure at the outlet of the pump in 'kPa'


//Unit conversion
Q=Q/1000                //Conversion from 'L/s' to 'm3/s'


//Assumption 
C=4.18                  //C is the specific heat of the water in 'kJ/(kg °C)'
rho=1000                //rho is water density in 'kg/m3'
Z1=0                    //Z1 is the elevation of the inlet of the pump in 'm'
Z2=0                    //Z2 is the elevation of the outlet of the pump in 'm'
g=9.81                  //g is the acceleration due to gravity in 'm/s2'


//Part (a)
//Calculation
W_pump_shaft=Eta_motor*W_electric       //W_pump_shaft is the mechanical shaft power in 'kW'
m=rho*Q                                 //m is the mass flow rate of water in 'kg/s'
Delta_E_mech_fluid=(m*((P2/rho)+(g*Z2)))-(m*((P1/rho)+(g*Z1)))//Delta_E_mech_fluid is the mechanical energy of the fluid in 'kW'
Eta_pump=Delta_E_mech_fluid/W_pump_shaft//Eta_pump is the efficiency of the pump


//Display of result
mprintf("\n(a) Mechanical efficiency of the pump is %.3f or %.1f Percentage.",Eta_pump,100*Eta_pump)


//Part (b)
//Calculation
E_mech_loss=W_pump_shaft-Delta_E_mech_fluid    //E_mech_loss is the lost mechanical energy in 'kW'
Delta_T=E_mech_loss/m/C                        //Delta_T is the temperature rise of water in '°C'


//Display of result
mprintf('\n(b) Temperature rise of water as it flow through the pump due to mechanical inefficiency is %.3f °C.',Delta_T)
