ELWCODE 2010 version

											Katsumi Shimotsu, September 2010.

The package consists of seven m-files and this file. 

whittle.m is a function file that defines the objective function of the local Whittle estimator (Kuensch 1987, Robinson 1995).

felw2st.m is a function file that computes the 2-step ELW estimator defined in Shimotsu (2010). This version repeats quasi-Newton updates from the tapered estimator until convergence. It requires ewhittle.m, fracdiff.m, and veltaper.m. It also requires csminwel_ks.m, csminit_ks.m, and bfgsi_ks.m, which are a modified version of the BFGS optimzation codes by Chris Sims. I thank Chris Sims for generously making his Matlab codes publicly available.

ewhittle.m defines the objective function of the exact local Whittle estimator (Shimotsu and Phillips 2005, Shimotsu 2010).

dmtrend.m is a demeaning & detrending procedure.
fracdiff.m is a fractional differencing procedure.
veltaper.m computes the objective function of the tapered LW estimator by 
Velasco (1999) JTSA.

dest.m is a sample m-file. It generates an I(d) process and estimates d by the
(i) local Whittle estimator,
(ii) 2-step exact local Whittle estimator
(iii) 2-step exact local Whittle estimator with prior detrending.

Katsumi Shimotsu, September 2010

References

Kuensch, H. (1987). Statistical aspects of self-similar processes. In Proceedings of the First World Congress of the Bernoulli Society (Yu. Prokhorov and V. V. Sazanov, eds.) 1 67-74. VNU Science Press, Utrecht.
Robinson, P. M. (1995). Gaussian semiparametric estimation of long range dependence. Annals of Statistics 23: 1630-1661.
Shimotsu, K. and Phillips, P. C. B. (2005). Exact local Whittle  estimation of fractional integration. Annals of Statistics 33: 1890-1933.
Shimotsu, K. (2010). Exact local Whittle estimation of fractional integration with unknown mean and time trend. Econometric Theory 26: 501-540.
