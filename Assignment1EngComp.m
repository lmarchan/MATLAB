
% Assignment 1
% Scientific Computing for Mechanical Engineers
% 01/21/19

clc
clear

% No digits specification

X = 0;
Y = 0;

for c = 1 : 1000000
    X=X+(1/c)
    Y=((log(c))/X)-1
end

%%
% 5 digits specification

digits(5);
X = 0;
Y = 0;

for c = 1 : 1000000
    X=vpa(X+(1/c))
    Y=vpa(((log(c))/X)-1)
end

%%
% 20 digits specification

digits(20);
X = 0;
Y = 0;

for c = 1 : 1000000
    X=vpa(X+(1/c))
    Y=vpa(((log(c))/X)-1)
end

%%
% 100 digits specification

digits(100);
X = 0;
Y = 0;

for c = 1 : 1000000
    X=vpa(X+(1/c))
    Y=vpa(((log(c))/X)-1)
end

% The scripts with the specified number of digits never seemed to end. 
% After an hour, I stopped the 5 digit section of the script and the
% results were:
% S(n) = 12.365, ((log n)/S(n)?1) = -0.046681
% The script without ended after around five minutes and yielded the
% results bellow:
% S(n) = 14.392726722864989, ((log n)/S(n)?1) = -0.040104712332495
% It seems that the unspecified section is closer to the actual answer than
% the five digit specification, displaying that Matlab uses more than five 
% digits by default. After googling it, Matlab seems to use 16 digits by
% default.
% How come the section that had fewer digits took much longer to complete?