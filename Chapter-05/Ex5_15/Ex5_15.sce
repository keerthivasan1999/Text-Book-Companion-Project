clc                     //To clear the console screen
clear                   //To clear all the existing Variables in the memory


//Let '1' and '2' be the same naming notations as shown in FIGURE 5-57 page number 5-15
//Given data
W_pump=20               //W_pump is the mechanical power provided by the pump in 'kW'
Z1=0                    //Z1 is height of the lower reservoir surface in 'm'
Z2=45                   //Z2 is height of the upper reservoir surface in 'm'
Q=0.03                  //Q is the water volume flow rate in 'm3/s'


//Assumption
P1=101325               //P1 is pressure at the surface of the lower reservoir in 'Pa'
P2=101325               //P2 is pressure at the surface of the upper reservor in 'Pa'
V1=0                    //V1 is velocity of the water at the lower reservoir surface in 'm/s'
V2=0                    //V2 is velocity of the water at the upper reservoir surface in 'm/s'
alpha1=1.1              //Assuming the flow to be turblent
alpha2=1.1              //Assuming the flow to be turblent
rho=1000                //rho is the water density in 'kg/m3'
W_turbine=0             //W_turbine is mechanical work output of turbine in 'W'
g=9.81                  //g is acceleration due to gravity in 'm/s2'


//Unit conversion
W_pump=W_pump*1000      //Conversion from 'kW' to 'W'


//Calculation
m=rho*Q                                     //m is mass flow rate of water through the system in 'kg/s'
E_mech_loss=(m*((P1/rho)+(alpha1*V1^2/2)+(Z1*g))-m*((P2/rho)+(alpha2*V2^2/2)+(Z2*g)))+W_pump-W_turbine//E_mech_loss is the mechanical power in 'W'
E_mech_loss_piping=E_mech_loss              //E_mech_loss_piping is the mechanical losses due to friction in piping in 'W'
h_L=E_mech_loss_piping/(m*g)                //h_L is the irreversible head loss in 'm'
E_mech_loss_piping=E_mech_loss_piping/1000  //Conversion from 'w' to 'kW'


//Display of result
mprintf('\nLost mechanical power is %.2f kW.\nHead loss is %.1f m.',E_mech_loss_piping,h_L)
