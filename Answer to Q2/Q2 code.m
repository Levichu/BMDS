%RK4
clc;clear;
k1=100;
k2=600;
k3=150;
f1=@(t,y1,y2,y3,y4)-k1*y1*y2+k2*y3+k3*y3;
f2=@(t,y1,y2,y3,y4)-k1*y1*y2+k2*y3;
f3=@(t,y1,y2,y3,y4)k1*y1*y2-k2*y3-k3*y3;
f4=@(t,y1,y2,y3,y4)k3*y3;% let y1,y2,y3,y4 be the concentrations of E, S, ES, P respectively
t_0=0;
t_end=1;
y1_0=1;
y2_0=10;
y3_0=0;
y4_0=0;
h=0.0005;
t_axis=linspace(t_0,t_end,abs(t_end-t_0)/h+1);
t(1)=t_0;
y1(1)=y1_0;
y2(1)=y2_0;
y3(1)=y3_0;
y4(1)=y4_0;

for i=2:length(t_axis)
    t(i)=t_axis(i);
end

        for j=2:length(t_axis)
           
            K11=f1(t(j-1),y1(j-1),y2(j-1),y3(j-1),y4(j-1));
            K12=f1(t(j-1)+h/2,y1(j-1)+h/2*K11,y2(j-1)+0.5*h*K11,y3(j-1)+0.5*h*K11,y4(j-1)+0.5*h*K11);
            K13=f1(t(j-1)+h/2,y1(j-1)+h/2*K12,y2(j-1)+h/2*K12,y3(j-1)+h/2*K12,y4(j-1)+h/2*K12);
            K14=f1(t(j-1)+h,y1(j-1)+h*K13,y2(j-1)+h*K13,y3(j-1)+h*K13,y4(j-1)+h*K13);
            y1(j)=y1(j-1)+h/6*(K11+2*K12+2*K13+K14);
            
             K21=f2(t(j-1),y1(j-1),y2(j-1),y3(j-1),y4(j-1));
            K22=f2(t(j-1)+h/2,y1(j-1)+h/2*K21,y2(j-1)+0.5*h*K21, y3(j-1)+0.5*h*K21, y4(j-1)+0.5*h*K21);
            K23=f2(t(j-1)+h/2,y1(j-1)+h/2*K22,y2(j-1)+h/2*K22,y3(j-1)+h/2*K22,y4(j-1)+h/2*K22);
            K24=f2(t(j-1)+h,y1(j-1)+h*K23,y2(j-1)+h*K23,y3(j-1)+h*K23,y4(j-1)+h*K23);
            y2(j)=y2(j-1)+h/6*(K21+2*K22+2*K23+K24);
            
             K31=f3(t(j-1),y1(j-1),y2(j-1),y3(j-1),y4(j-1));
            K32=f3(t(j-1)+h/2,y1(j-1)+h/2*K31,y2(j-1)+0.5*h*K31, y3(j-1)+0.5*h*K31, y4(j-1)+0.5*h*K31);
            K33=f3(t(j-1)+h/2,y1(j-1)+h/2*K32,y2(j-1)+h/2*K32,y3(j-1)+h/2*K32,y4(j-1)+h/2*K32);
            K34=f3(t(j-1)+h,y1(j-1)+h*K33,y2(j-1)+h*K33,y3(j-1)+h*K33,y4(j-1)+h*K33);
            y3(j)=y3(j-1)+h/6*(K31+2*K32+2*K33+K34);
            
             K41=f4(t(j-1),y1(j-1),y2(j-1),y3(j-1),y4(j-1));
            K42=f4(t(j-1)+h/2,y1(j-1)+h/2*K41,y2(j-1)+0.5*h*K41, y3(j-1)+0.5*h*K41, y4(j-1)+0.5*h*K41);
            K43=f4(t(j-1)+h/2,y1(j-1)+h/2*K42,y2(j-1)+h/2*K42,y3(j-1)+h/2*K42,y4(j-1)+h/2*K42);
            K44=f4(t(j-1)+h,y1(j-1)+h*K43,y2(j-1)+h*K43,y3(j-1)+h*K43,y4(j-1)+h*K43);
            y4(j)=y4(j-1)+h/6*(K41+2*K42+2*K43+K44);
            
            v(j)=k3*y3(j);
            
            
        end
        subplot(3,2,1),plot(t,y1)
        subplot(3,2,2),plot(t,y2)
        subplot(3,2,3),plot(t,y3)
        subplot(3,2,4),plot(t,y4)
        subplot(3,2,5),plot(y2,v)
        
        