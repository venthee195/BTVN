clc
ngovao = [out.e(3:length(out.e)) out.e_before1(2:(length(out.e)-1)) out.e_before2(1:(length(out.e)-2)) out.u_before(2:(length(out.e)-1))]';
ngora = out.u(3:length(out.e))';
net = newff([minmax(ngovao)],[40 1],{'tansig' 'purelin'},'trainrp');
net.trainParam.epochs = 200000;
net.trainParam.lr = 0.0001;
net.trainParam.goal = 0.000001;
net = train(net,[ngovao],[ngora]);
gensim(net,0.1)

    

    