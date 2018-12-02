clc
clear
daTrain=csvread('DataTrain_Tugas3_AI.csv',1,0);
r=randperm(size(daTrain,1));
dataT=daTrain(r(1:700),2:6);
labelT=daTrain(r(1:700),7);
test=daTrain(r(701:800),[2:6]);
ceklabel=daTrain(r(701:800),7);
Jarak = zeros(size(dataT,1),size(test,1));
for i=1 : size(test,1)
    for j=1: size(dataT,1)
        Jarak(j,i) = sqrt(sum((dataT(j,:)-test(i,:)).^2));
    end
end

[~,ind]=sort(Jarak,'ascend');
k=9;
prediksi= zeros(k,size(test,1));
for a=1 : size(test,1)
    for b=1 : k
        prediksi(b,a) = labelT(ind(b,a));
    end
end

prediksi=mode(prediksi)';
length(find(prediksi==ceklabel))*size(prediksi,1)/100


        

