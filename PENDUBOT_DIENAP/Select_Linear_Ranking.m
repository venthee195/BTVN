function parent=Select_Linear_Ranking(pop,fitness,eta,elitism,bestchrom)

% Linear Ranking Selection
% Programmed by   : Huynh Thai Hoang, University of Technology at Ho Chi Minh City. 
% Last updated    : November 25, 2005

if (nargin < 4),
   error(['Too few input arguments.']);
end;

N=length(fitness);
[fitness,order] = sort(fitness); %sap xep NST theo thu tu tang dan do thich nghi

for k=1:N,
    p(k)=(eta+(2-eta)*(k-1)/(N-1))/N;
end

s=zeros(1,N+1);

for k=1:N, 
    s(k+1)=s(k)+p(k); 
end;

for k = 1:N,
    if elitism==1 & order(k)==bestchrom	% If elitism on, and have the elite member
     	parent(order(k),:)=pop(order(k),:);       % the elite member gets into the next generation
        												
    else
        r=rand*s(N+1);                    % This makes the pointer for the roulette wheel.  
        index=find(s<r); j=index(end);    %j=find(s<r,1,'last');
  		parent(order(k),:)=pop(order(j),:);
    end
end   
