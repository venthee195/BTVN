function child=Cross_Twopoint(parent,cross_prob,elitism,bestchrom)

% One points crossover
% Programmed by: Huynh Thai Hoang
% Last updated : November 25, 2005

if (nargin < 4),
   error(['Too few input arguments.']);
end;

[pop_size,chrom_len]=size(parent);
for p1 = 1:pop_size,						% parent number 1 
	if (elitism==1) & (p1 == bestchrom)  	% If elitism on, and have the elite member
        child(p1,:)=parent(p1,:);
    else
        p2=p1;  							% Randomly chose the parent number 2
        while p2 == p1,   					% other than parent number 1
        	p2 = rand*pop_size; 											 								
        	p2 = p2 - rem(p2,1)+1;     
        end
    	if cross_prob > rand           		% If true then crossover occur
            k1 = rand*(chrom_len-1);		% Choose the firstcrossover point
            k1 = k1-rem(k1,1)+1;            % and make it a valid integer number
            k2=k1;
            while k2==k1,
                k2 = rand*(chrom_len-1);		% Choose the firstcrossover point
                k2 = k2-rem(k2,1)+1;            % and make it a valid integer number
            end;
            if k1>k2, t=k2; k2=k1; k1=t; end;   %Make sure that k1<k2
            child(p1,1:k1)=parent(p1,1:k1);
            child(p1,k1+1:k2)=parent(p2,k1+1:k2);
            child(p1,k2+1:chrom_len)=parent(p1,k2+1:chrom_len);
     	else                           		% No crossover occurs
			child(p1,:)=parent(p1,:);
 		end
  	end  	% End the "if ELITISM..." statement
end  		% End "for p1=..." loop
