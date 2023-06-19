function child=Cross_BLX(parent,Pc,alpha,elitism,bestchrom)
if(nargin<5)
    error(['Không ?? ??i s? ?? th?c thi ch??ng trình con']);
end;
[N,L]=size(parent);
for p1=1:N
    if(elitism==1)&(p1==bestchrom)
        child(p1,:)=parent(p1,:);
    else
        p2=p1;
        while p2==p1,
            p2=rand*N;
            p2=p2-rem(p2,1)+1;
        end
        if Pc>rand
            for gene=1:L
                pMin=min(parent(p1,gene),parent(p2,gene))-alpha*abs(parent(p1,gene)-parent(p2,gene));
                pMax=max(parent(p1,gene),parent(p2,gene))+alpha*abs(parent(p1,gene)-parent(p2,gene));
                child(p1,gene)=pMin+rand*(pMax-pMin);
            end
        else
            child(p1,:)=parent(p1,:);
        end
    end
end

                
