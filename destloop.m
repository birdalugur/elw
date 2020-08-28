% DEST.M performs local Whittle estimation of the memory parameter d.
%   This program calls two other programs, ewhittle.m and whittle.m.
% 
% 
%               				Katsumi Shimotsu, September 2010
%_______________________________________________________________

clear;

data = readtable('lndiff.csv','ReadRowNames',true)

%d = 0.4;            % the value of d

%u = randn(500,1);	% In this example, we generate 500 observations of an I(d) process.
%x = fracdiff(u,-d); % Replace this part with your data.

column_names = data.Properties.VariableNames;



for i= 1:length(column_names)
    country = column_names{i};
    
    values = data.(country)
    
    joined(i) = dest(values,country)

end


result = struct2table(joined)

writetable(result,'dresults.csv','Delimiter',',')

