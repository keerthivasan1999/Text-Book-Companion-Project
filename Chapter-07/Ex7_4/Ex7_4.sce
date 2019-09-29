clc                         //To clear the console screen
clear                       //To clear all the existing variables in the memory


//Given data
g_earth=9.81                //g_earth is acceleration due to gravity on earth in 'm/s2'
v_initial=21                //v_initial is the initial velocity of the baseball in 'm/s'
theta=5                     //theta is angle made with the horizon in '°(degree)'
Z0=2                        //Z0 is initial height above moon surface in 'm'


//Unit conversion
theta=theta*%pi/180         //Conversion from '°(degree)' to 'radian'


//Part (a)
//Calculation
W0=v_initial*sin(theta)     //W0 is the vertical component of initial speed in 'm/s'
g_moon=g_earth/6            //g_moon is acceleration due to gravity on moon in 'm/s2'
Fr_Square=W0^2/(g_moon*Z0)  //DimensionLess Froude Number
//Value obtained from the FIGURE 7-13 page number 275
//Choose the value of t_star that the curve obtained Fr^2 value makes when the z_star=0
t_star=2.75                 //This value of t_star is for computed Fr^2. Change t_star value accordingly if the input variables are changed
t=t_star*Z0/W0              //t is the time taken to strike the ground in 's'


//Display of result
mprintf('\n(a) Estimated time to strike the ground is %.2f s.',t)


//Part (b)
//Calculation
t_exact=(W0+sqrt((W0^2)+(2*Z0*g_moon)))/g_moon//t_exact is the exact time taken strike the ground in 's'


//Display of result
mprintf('\n(b) Exact time to strike the ground is %.2f s.',t_exact)
//The answers vary due to round off error

