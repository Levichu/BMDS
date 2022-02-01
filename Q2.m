%%
clc;clear;
   f1=@(t,y1,y2,y3,y4)k2*y3 + k3*y3-k1*y1*y2 ;
   f2=@(t,y1,y2,y3,y4)k2*y3-k1*y1*y2;
   f3=@(t,y1,y2,y3,y4)k1*y1*y2 - k2*y3 - k3*y3;
   f4=@(t,y1,y2,y3,y4)k3*y3;%define the function
   
t_0=0;
y1_0=1;
y2_0=10;
y3_0=0;
y4_0=0;


h=0.0001;% the step size
N=1000;
t(1)=t_0;
y1(1)=y1_0;
y2(1)=y2_0;
y3(1)=y3_0;
y4(1)=y4_0;


for i =1:N
    K11 = f1(t(i), y1(i), y2(i), y3(i), y4(i)) ;
    K12 = f1(t(i) + 0.5*h, y1(i) + 0.5*h*K11, y2(i) + 0.5*h*K11, y3(i) + 0.5*h*K11, y4(i)+ 0.5*h*K11);
    K13 = f1(t(i) + 0.5*h, y1(i) + 0.5*h*K12, y2(i) + 0.5*h*K12, y3(i) + 0.5*h*K12, y4(i)+ 0.5*h*K12);
    K14 = f1(t(i)+ h, y1(i) + h*K13, y2(i) + h*K13, y3(i) + h*K13, y4(i)+ h*K13);
    y1_concentration = y1(1) - h/6*(K11 + 2*K12 + 2*K13 + K14);


    K21 = f2(t(i), y1(i), y2(i), y3(i), y4(i)) ;
    K22 = f2(t(i) + 0.5*h, y1(i) + 0.5*h*K21, y2(i) + 0.5*h*K21, y3(i) + 0.5*h*K21, y4(i)+ 0.5*h*K21);
    K23 = f2(t(i) + 0.5*h, y1(i) + 0.5*h*K22, y2(i) + 0.5*h*K22, y3(i) + 0.5*h*K22, y4(i)+ 0.5*h*K22);
    K24 = f2(t(i)+ h, y1(i) + h*K23, y2(i) + h*K23, y3(i) + h*K23, y4(i)+ h*K23);
    y2_concentration = y2(i) - h/6*(K21 + 2*K22 + 2*K23 + K24);


    
    K31 = f3(t(i), y1(i), y2(i), y3(i), y4(i)) ;  
    K32 = f3(t(i) + 0.5*h, y1(i) + 0.5*h*K31, y2(i) + 0.5*h*K31, y3(i) + 0.5*h*K31, y4(i)+ 0.5*h*K31);
    K33 = f3(t(i) + 0.5*h, y1(i) + 0.5*h*K32, y2(i) + 0.5*h*K32, y3(i) + 0.5*h*K32, y4(i)+ 0.5*h*K32);
    K34 = f3(t(i)+ h, y1(i) + h*K33, y2(i) + h*K33, y3(i) + h*K33, y4(i)+ h*K33);
    y3_concentration = y3(1) + h/6*(K31 + 2*K32 + 2*K33 + K34);

    
    K41 = f4(t(i), y1(i), y2(i), y3(i), y4(i)) ;  
    K42 = f4(t(i) + 0.5*h, y1(i) + 0.5*h*K41, y2(i) + 0.5*h*K41, y3(i) + 0.5*h*K41, y4(i)+ 0.5*h*K41);
    K43 = f4(t(i) + 0.5*h, y1(i) + 0.5*h*K42, y2(i) + 0.5*h*K42, y3(i) + 0.5*h*K42, y4(i)+ 0.5*h*K42);
    K44 = f4(t(i)+ h, y1(i) + h*K43, y2(i) + h*K43, y3(i) + h*K43, y4(i)+ h*K43);
    y4_concentration = y4(1) + h/6*(K41 + 2*K42 + 2*K43 + K44);

end
plot(t,y1);
xlabel('time');
ylabel('concentration');
plot(t,y2);
xlabel('time');
ylabel('concentration');
plot(t,y3);
xlabel('time');
ylabel('concentration');
plot(t,y4);
xlabel('time');
ylabel('concentration');
