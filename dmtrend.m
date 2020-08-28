function[y] = dmtrend(x)
% DMTREND.M DEMEANS & DETRENDES THE DATA.
%
%					Katsumi Shimotsu, February 2002
%_______________________________________________________

[n,nn] = size(x);
c = ones(n,1);
t = (1:1:n)';
p = [c t];
y = x - p*((p'*p)\p')*x;
