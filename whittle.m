function[r] = whittle(d,x,m)
% WHITTLE.M computes the local Whittle likelihood, which uses
% the periodogram of data x accoding to the definition
%
%		Ixx(k) = w(x)*conj(w(x)),
%
%	where
%								  N
%		w(k) =  (2*pi*n)^(-1/2)  sum  x(t)*exp(i*2*pi*(k-1)*t/N), 1 <= k <= N.
%                  				 t=1
%
%										   Katsumi Shimotsu, April 1999
%
% 		INPUT	x: data (n*1 vector)
%				m: truncation number
%				d: parameter value
%____________________________________________________________________________

[n,nn] = size(x);
t = (0:1:n-1)';
lambda = 2*pi*t/n;
wx = (2*pi*n)^(-1/2)*conj(fft(conj(x))).*exp(i*lambda);
lambda = lambda(2:m+1);
wx = wx(2:m+1);
Ix = wx.*conj(wx);

g = mean((lambda.^(2*d)).*Ix);
r = log(g) - 2*d*mean(log(lambda));
