clc                     //To clear the console screen
clear                   //To clear all the existing Variables in the memory


//Given data
m_sat=5000              //m_sat is the mass of satellite in 'kg'
m_f=100                 //m_f is the mass of gas discharged in 'kg'
v_f=3000                //v_f is the velocity at which gas is discharged in 'm/s
Delta_t=2               //Delta_t is the time period of discharge in 's'


//Part (a)
//Calculaton
a_sat=m_f*v_f/m_sat/Delta_t//a_sat is the acceleration of the satellite in 'm/s2'


//Display of result
mprintf('\n\n(a) Acceleration of the satelite during this %ds period is %d m/s2.',Delta_t,a_sat)


//Part (b)
//CalculaDelta_ton
Dela_V_sat=a_sat*Delta_t   //Dela_V_sat is the change in velocity of the satellite in 'm/s'


//Display of result
mprintf('\n\n(b) Change in velocity of the satelite during this %ds period is %d m/s.',Delta_t,Dela_V_sat)


//Part (c)
//CalculaDelta_ton
F_sat=(m_f/2)*v_f           //F_sat is the trust excerted on the satellite in 'kN'
F_sat=F_sat/1000            //Conversion from 'N' to 'kN'


//Display of result
mprintf('\n\n(c) The thrust excerted on the satellite is %d kN.',F_sat)
