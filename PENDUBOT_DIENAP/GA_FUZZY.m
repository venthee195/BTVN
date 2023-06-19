clc;
clear all
rand('state',sum(100*clock));
max_generation=200;			% có 250 l?n ch?y trong quá trình
max_stall_generation=20;		% 50 th? h? gi?ng nhau thì d?ng
epsilon=0.0001;			% J chu?n
pop_size=35;				% s? l??ng cá th? cha m? trong qu?n th?
npar = 5;				% có 5 nhi?m s?c th? trong 1 cá th?
range=[ 0 0 0 0 0;...
100 100 100 100 100];		% giá tr? K1 K2 K3 K4 K5 n?m trong kho?ng 0-100
dec=[2 2 2 2 2];			% có 2 ch? s? nguyên
sig=[5 5 5 5 5];			% có 5 ch? s? th?p phân
cross_prob = 0.95;			% xác xu?t lai ghép
mutate_prob = 0.05;			% xác xu?t ??t bi?n
elitism = 1;				% luôn gi? l?i giá tr? t?t nh?t trong khi lai t?o
rho=0.02;				% tr?ng s? quy?t ??nh cái nào quan tr?ng v?i J h?n
par=Init(pop_size,npar,range);	% khai t?o 35 cá th? cha me ??u tiên
Terminal=0;				% kh?i ??ng các giá tr? ??u tiên tr??c khi ch?y GA
generation = 0;			% kh?i ??ng các giá tr? ??u tiên tr??c khi ch?y GA
stall_generation=0;			% kh?i ??ng các giá tr? ??u tiên tr??c khi ch?y GA
for pop_index=1:pop_size,
K1=par(pop_index,1)-100;
K2=par(pop_index,2)-100;
K3=par(pop_index,3)-100;
K4=par(pop_index,4)-100;
K5=par(pop_index,5)-100;
sim('FINAL_DKTM.slx');		% b?t ??u mô ph?ng
J=(e'*e)+rho*(u'*u);
fitness(pop_index)=1/(J+eps); % tìm c?c ti?u hàm thích nghi
end;
[bestfit0,bestchrom]=max(fitness);
K10=par(bestchrom,1)-100;		%các cá th? cha m? ??u tiên
K20=par(bestchrom,2)-100;		%các cá th? cha m? ??u tiên
K30=par(bestchrom,3)-100;		%các cá th? cha m? ??u tiên
K40=par(bestchrom,4)-100;		%các cá th? cha m? ??u tiên
K50=par(bestchrom,5)-100;		%các cá th? cha m? ??u tiên
J0=1/bestfit0-0.001
while ~Terminal
generation = generation+1;
disp(['generation #' num2str(generation) ' of maximum ' num2str(max_generation)]);
pop=Encode_Decimal_Unsigned(par,sig,dec); % mã hóa th?p phân (NST c?a các cha m?)
parent=Select_Linear_Ranking(pop,fitness,0.2,elitism,bestchrom); 
child=Cross_Twopoint(parent,cross_prob,elitism,bestchrom);% lai ghép 2 ?i?m
pop=Mutate_Uniform(child,mutate_prob,elitism,bestchrom);% ??t bi?n theo d?ng phân b? ??u
par=Decode_Decimal_Unsigned(pop,sig,dec);% gi?i mã k?t qu? v? l?i NST
for pop_index=1:pop_size,		% ?ánh giá l?i ?? thích nghi các cá th? sau ti?n hóa
 K1=par(pop_index,1)-100;		% quy ??i giá tr? NST v? K1
 K2=par(pop_index,2)-100;		% quy ??i giá tr? NST v? K2
 K3=par(pop_index,3)-100;		% quy ??i giá tr? NST v? K3
 K4=par(pop_index,4)-100;		% quy ??i giá tr? NST v? K4
 K5=par(pop_index,5)-100;		% quy ??i giá tr? NST v? K5
 sim('FINAL_DKTM.slx');		% ti?n hành ch?y mô ph?ng ?? ki?m tra
 J=(e'*e)+rho*(u'*u);
 fitness(pop_index)=1/(J+eps);
end;
[bestfit(generation),bestchrom]=max(fitness);
if generation == max_generation	% ?i?u ki?n d?ng
Terminal = 1; 
elseif generation>1,
if abs(bestfit(generation)-bestfit(generation-1))<epsilon,
stall_generation=stall_generation+1;
if stall_generation == max_stall_generation, Terminal = 1;end 
else
stall_generation=0;
end;
end;
end
plot(1./bestfit)				% v? ?? th? hàm thích nghi
K10
K20
K30
K40
K50
J0
K1=par(bestchrom,1)			% hi?n th? NST K1 
K2=par(bestchrom,2)			% hi?n th? NST K2 
K3=par(bestchrom,3)			% hi?n th? NST K3 
K4=par(bestchrom,4)			% hi?n th? NST K4 
K5=par(bestchrom,5)			% hi?n th? NST K5 
J=1/bestfit(end)			% hàm tiêu chu?n t??ng ?ng v?i cá th? con t?t nh?t này
sim('FINAL_DKTM.slx');		%tien hành mô ph?ng l?i 
