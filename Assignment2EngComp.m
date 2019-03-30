% Assignment 2
% Scientific Computing for Mechanical Engineers
% 01/31/2019

clc
clear

%% a = 1

clc
clear all


a = (1);
PIE = vpa(pi/4)
v = [-1:100];
digits(100)
for c = 1:22
    h(c) = vpa(exp(-v(c)))
    
    fapprox1(c) = vpa((cos(a*(PIE+h(c)))-cos(a*PIE))/h(c))
    
    fapprox2(c) = vpa((cos(a*(PIE+h(c)))-cos(a*(PIE-h(c))))/(2*(h(c))))
    
    fexact(c) = vpa(-(a)*sin(a*PIE))
    
    error1(c) = vpa(abs((fexact(c)-fapprox1(c))/fexact(c)))
    
    error2(c) = vpa(abs((fexact(c)-fapprox2(c))/fexact(c)))
    
    lerror2(c) = log(error2(c))
    lh(c) = log(1/h(c))
end
PC4 = double(error2)
ProportionalConstant1 = error1./h;
ProportionalConstant2 = error2./(h.*h);
double(ProportionalConstant1)
double(ProportionalConstant2)
plot(lh,lerror2)
xlabel('h')
ylabel('error')    
%% a = 10

clc
clear all


a = (10);
PIE = vpa(pi/4)
v = [-1:100];
digits(100)
for c = 1:101
    h(c) = vpa(exp(-v(c)))
    
    fapprox1(c) = vpa((cos(a*(PIE+h(c)))-cos(a*PIE))/h(c))
    
    fapprox2(c) = vpa((cos(a*(PIE+h(c)))-cos(a*(PIE-h(c))))/(2*(h(c))))
    
    fexact(c) = vpa(-(a)*sin(a*PIE))
    
    error1(c) = vpa(abs((fexact(c)-fapprox1(c))/fexact(c)))
    
    error2(c) = vpa(abs((fexact(c)-fapprox2(c))/fexact(c)))
    
lerror2(c) = log(error2(c))
lh(c) = log(1/h(c))
end
ProportionalConstant1 = error1./h;
ProportionalConstant2 = error2./(h.*h);

double(ProportionalConstant1)
double(ProportionalConstant2)
plot(lh,lerror2)
xlabel('h')
ylabel('error')    

%% a = 100

clc
clear all


a = (100);
PIE = vpa(pi/4)
v = [-1:20];
digits(100)
for c = 1:101
    h(c) = vpa(exp(-v(c)))
    
    fapprox1(c) = vpa((cos(a*(PIE+h(c)))-cos(a*PIE))/h(c))
    
    fapprox2(c) = vpa((cos(a*(PIE+h(c)))-cos(a*(PIE-h(c))))/(2*(h(c))))
    
    fexact(c) = vpa(-(a)*sin(a*PIE))
    
    error1(c) = vpa(abs((fexact(c)-fapprox1(c))/fexact(c)))
    
    error2(c) = vpa(abs((fexact(c)-fapprox2(c))/fexact(c)))
    lerror1(c) = log(error1(c))
    lerror2(c) = log(error2(c))
    lh(c) = log(1/h(c))
end
ProportionalConstant1 = double(error1./h)
ProportionalConstant2 = double(error2./(h.*h))

 plot(lh,lerror1,lh,lerror2)
  xlabel('h')
  ylabel('error')