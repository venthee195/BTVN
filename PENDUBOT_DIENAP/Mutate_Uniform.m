function newpop=Mutate_Uniform(pop,mutate_prob,elitism,bestchrom)

% MUTATION Mutation
% Programmed by   : Huynh Thai Hoang, University of Technology at Ho Chi Minh City. 
% Last updated    : November 25, 2005

if (nargin < 4),
   error(['Too few input arguments.']);
end;

[pop_size,chrom_len]=size(pop);
newpop=pop;
for pop_index= 1:pop_size,
   if (elitism==0) || (elitism==1 && pop_index~=bestchrom),
      for gene_index = 1:chrom_len,
         if mutate_prob > rand				% If true then mutate  
            rand_gene=rand*10;				% Creat a random gene
            
            % If it is the same as the one already there or rand_gene=10 then 
            % generate another random allele in the alphabe
            while (pop(pop_index,gene_index)==rand_gene-rem(rand_gene,1)|rand_gene==10),
               rand_gene=rand*10;
            end;
            
            newpop(pop_index,gene_index)=rand_gene-rem(rand_gene,1);
         end  
      end  
   end  
end  