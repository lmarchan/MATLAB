%%  Cameron Olsen HW2 1358873 
% Section 1 a = 1
clc
clear all
a = vpa(1);
x = vpa(pi/4);

V = vpa([-1:20]);
H = vpa(exp(-V));
digits(6400)

for n = 1:22
   FHplus(n) = vpa(cos((a*(x+H(n)))))
    FHminus(n) = vpa(cos((a*(x-H(n)))))
    F(n) = vpa(cos((a*x)))
    Fexact(n)=vpa(-a*sin(a*x))
end

FOF = vpa((FHplus-F)./H)
SOC = vpa((FHplus-FHminus)./(2*H))
ErrorFOF = vpa(abs((Fexact-FOF)./Fexact))
ErrorSOC = vpa(abs((Fexact-SOC)./Fexact))
NEW = vpa(ErrorFOF./H)
NEW2 = vpa(ErrorSOC./(H.*H))
H
Fexact
SOC
double(NEW)
double(NEW2)
%plot(V,log(ErrorFOF))
%plot(V,ErrorSOC)
%% Section 2 a = 10
clc
clear all
a = vpa(10);
x = vpa(pi/4);

V = vpa([-1:20]);
H = vpa(exp(-V));
digits(6400)

for n = 1:22
   FHplus(n) = vpa(cos((a*(x+H(n)))))
    FHminus(n) = vpa(cos((a*(x-H(n)))))
    F(n) = vpa(cos((a*x)))
    Fexact(n)=vpa(-a*sin(a*x))
end

FOF = vpa((FHplus-F)./H)
SOC = vpa((FHplus-FHminus)./(2*H))
ErrorFOF = vpa(abs((Fexact-FOF)./Fexact))
ErrorSOC = vpa(abs((Fexact-SOC)./Fexact))
NEW = vpa(ErrorFOF./H)
NEW2 = vpa(ErrorSOC./(H.*H))
H
Fexact
SOC
double(NEW)
double(NEW2)
%% Section 3 a = 100
clc
clear all
a = vpa(100);
x = vpa(pi/4);

V = vpa([-1:20]);
H = vpa(exp(-V));
digits(6400)

for n = 1:22
   FHplus(n) = vpa(cos((a*(x+H(n)))))
    FHminus(n) = vpa(cos((a*(x-H(n)))))
    F(n) = vpa(cos((a*x)))
    Fexact(n)=vpa(-a*sin(a*x))
end

FOF = vpa((FHplus-F)./H)
SOC = vpa((FHplus-FHminus)./(2*H))
ErrorFOF = vpa(abs((Fexact-FOF)./Fexact))
ErrorSOC = vpa(abs((Fexact-SOC)./Fexact))
NEW = vpa(ErrorFOF./H)
NEW2 = vpa(ErrorSOC./(H.*H))
H
Fexact
SOC
double(NEW)
double(NEW2)









