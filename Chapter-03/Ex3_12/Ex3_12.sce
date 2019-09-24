clc                     //To clear the console screen
clear                   //To clear all the existing variables in the memory


//Given data
h=80                    //h is height of fish tank in 'cm'
b1=2                    //m
b2=0.6                  //m
V1=0                    //V1 is initial velocity of the truck in 'km/h'
V2=90                   //V2 is final velocity of the truck in 'km/h'
t1=0                    //t1 is initial time in 's'
t2=10                   //t2 is final time in 's'


//Assumption
a_z=0                   //a_z is the vertical acceleration component of truck in 'm/s2'
g=9.81                  //g is acceleration due to gravity in 'm/s2'


//Unit conversion
V1=V1*1000/3600         //Conversion from 'km/h' to 'm/s'
V2=V2*1000/3600         //Conversion from 'km/h' to 'm/s'


//Calculation
a_X=(V2-V1)/(t2-t1)     //a_X is the horizontal acceleration component of truck in 'm/s2'
theta=atan(a_X/(g+a_z)) //theta is angle that free surface males with the horizontal in 'radian'
theta=theta*180/%pi     //Conversion of theta from 'radian' to 'degree'
delta_z_s1=(b1/2)*tan(theta*%pi/180)//delta_z_s1 is vertical rise incase the long side is aligned parallel to the direction of motion in 'm'
delta_z_s2=(b2/2)*tan(theta*%pi/180)//delta_z_s2 is vertical rise incase the short side is aligned parallel to the direction of motion in 'm'


//Display of result
mprintf('\nHorizontal acceleration component magnitude is %.1f m/s2.\ntheta that free surface make with the horizontal is %.1f°.\nVertical rise incase the long side is aligned parallel to the direction of motion is %.1f cm.\nVertical rise incase the short side is aligned parallel to the direction of motion is %.1f cm.',a_X,theta,delta_z_s1*100,delta_z_s2*100)
if(delta_z_s1<delta_z_s2)
    mprintf("\n\nLong side must be aligned parallel to the direction of motion.")
else
    mprintf("\n\nShort side must be aligned parallel to the direction of motion.")
end
