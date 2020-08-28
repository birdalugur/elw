function[r] = ewhittle(d,x,m,param)
% function[r] = ewhittle(d,x,m,param)
% EWHITTLE.M computes the exact Whittle likelihood, which uses
% the periodogram of a time series x accoding to the definition
%
%		Reference: Shimotsu and Phillips (2004), Shimotsu (2004)
%
%		Ixx(k) = w(x)*conj(w(x)),
%
%	where
%								  N
%		w(k) =  (2*pi*n)^(-1/2)  sum  x(t)*exp(i*2*pi*(k-1)*t/N), 1 <= k <= N.
%                  				 t=1
%
%										   Katsumi Shimotsu, July 2004
%
%		Dependency: this code required fracdiff.m
%
% 		INPUT	x: data (n*1 vector)
%				m: truncation number
%				d: parameter value
%				param: If 0, the initial value (x0) is assumed to be 0.
%					   If 1, the initial value is estimated by the method
%						in Shimotsu (2004).  
%____________________________________________________________________________

[n,nn] = size(x);

if param==1	

    weight = (d<=0.5) + (1/2)*(1 + cos(-2*pi+4*pi*d))*(d>0.5)*(d<0.75);
    myu = weight*sum(x)/n + (1-weight)*x(1);
    
	x = x - myu;

end

dx = fracdiff(x,d);
t = (0:1:n-1)';
lambda = 2*pi*t/n;
wdx = (2*pi*n)^(-1/2)*conj(fft(conj(dx))).*exp(i*lambda);

lambda = lambda(2:m+1);
vx = wdx(2:m+1);
Iv = vx.*conj(vx);

g = sum(Iv)/m;
r = log(g) - 2*d*sum(log(lambda))/m;
