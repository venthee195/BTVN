function par=Init(pop_size,npar,range)

% Programmed by   : Huynh Thai Hoang, University of Technology at Ho Chi Minh City. 
% Last updated    : November 25, 2005

for pop_index = 1:pop_size
    for par_index = 1:npar,
 		par(pop_index,par_index)=(rand-0.5)*(range(2,par_index)-range(1,par_index))+... 
		                         0.5*(range(2,par_index)+range(1,par_index));
	end
end 