function[d] = felw2st(x,m,p,rep)
% function[d] = felw2st(x,m,p,rep)
% FELW2ST.M computes the 2-step feasible exact Whittle likelihood
%       estimator. 
%
%		Reference: Shimotsu and Phillips (2005), Shimotsu (2010)
%
%										   Katsumi Shimotsu, September 2010
%
%		Depenency: this code requires ewhittle.m, fracdiff.m, veltaper.m,
%                   bfgsi_ks.m, csminit_ks.m, csminwel_ks.m, and numgrad.m.
%
% 		INPUT	x: data (n*1 vector)
%				m: number of Fourier frequencies
%               p: the order of the taper, p = 2 or 3, 3 is preferable
%				rep: number of steps
%
%       Updated in September 2010.
%       This version uses quasi-Netwon updating instead of Newton steps.
%       It produces more stable estimates than the previous version when m is small.
%
%       This code uses a modified version of Chris Sims' BFGS optimization software,
%           specifically bfgsi_ks.m, csminit_ks.m, csminwel_ks.m, and numgrad.m.
%
%       Visit Chris Sims' webpage http://www.princeton.edu/~sims for the original code
%       and its documentation. I thank Chris Sims for generously making his Matlab codes
%       publicly available.
%
%____________________________________________________________________________

[n,nn] = size(x);

d0 = fminbnd('veltaper',-1,3,[],x,m,p);    % 1st step estimator

crit = 1e-12;
nit = 100;

[fval,d] = csminwel_ks('ewhittle',d0,4,[],crit,nit,x,m,1);
