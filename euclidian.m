clc
clear
close all
daTrain=csvread('DataTrain_Tugas3_AI.csv',1,0);
daTest=readtable('DataTest_Tugas3_AI.csv');

dataT=daTrain(:,2:6);%mengambil 5 data tabel train
labelT=daTrain(:,7);%mengambil data terujung
test=daTest{:,[2:6]};

Jarak = zeros(size(dataT,1),size(test,1));
for i=1 : size(test,1)
    for j=1: size(dataT,1)
        Jarak(j,i) = sqrt(sum((dataT(j,:)-test(i,:)).^2));
    end
end
hhh = size(dataT,1);

[~,ind]=sort(Jarak,'ascend');

k=9;
prediksi= zeros(k,size(test,1));
for a=1 : size(test,1)
    for b=1 : k
        prediksi(b,a) = labelT(ind(b,a));
    end
end

prediksi=mode(prediksi)';
csvwrite('TebakanTugas3.csv',prediksi);


        

