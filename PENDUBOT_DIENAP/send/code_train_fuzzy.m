K = length(u);
% tạo mạng thần kinh lan truyền ngược
X = e(1:K)'; % dữ liệu đầu vào
D = u(1:K)'; % dữ liệu đầu ra
% thiết lập thông số của mạng thần kinh
net=newff([minmax(X)],[50 1],{'tansig' 'purelin'},'trainlm');
net.trainparam.epochs=20000;	% số vòng lặp
net.trainparam.lr= 0.0001;		% tốc độ học
net.trainparam.goal = 1e-7;		% sai số
net = train(net,X,D);			% huấn luyện mạng
gensim(net,0.01);			% tạo khối nơ-rơn
