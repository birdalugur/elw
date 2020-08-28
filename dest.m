function s = dest(x,name)
    
    disp(x);
    d = 0.4;            % the value of d

    x = rmmissing(x)

    n = length(x);
    x2 = dmtrend(x);	% demeaned & detrended data

    m = fix(n^0.6);		% m is the number of frequencies used in estimation.

    options = optimset('fminbnd');
    s.dw = fminbnd('whittle',-1,3,options,x,m);		% LW estimate
    s.elw1 = felw2st(x,m,3,10);						% 2-step ELW 
    s.elw2 = felw2st(x2,m,3,10);						% 2-step ELW w/ detrending
    s.n = n
    s.m = m    
    s.name = name

end
 
%[n, m, dw, elw1, elw2]