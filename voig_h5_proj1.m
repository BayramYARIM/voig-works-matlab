clc;
clear all;

% 1-100 arasýnda 75 satýr ve 2 sutun olmak üzere sayi üretir.
notlar = randi(100, 75, 2);

% Excel dosyasýndan veri okuma islemi
% xlsread ('dosya_adi', okunan_sayfa, okunan satýr-sutun araligi
fileNotlar = xlsread('ogrnotlar.xlsx', 1, 'A1:B50'); 

vizeler = fileNotlar(:,1); % vize notlarýnýn bulundugu sutunu alir
vizeCount = size(vizeler,1);
finaller = fileNotlar(:,2); % final notlarýnýn bulundugu sutunu alir.


siralivizeler = sort(vizeler); % Default : kücükten buyuge siralama yapar
siralifinaller = sort(finaller); % Default : kücükten buyuge siralama yapar

tekilVizeler = unique(siralivizeler); %Benzer olan notlari alir

tvAdet = size(tekilVizeler, 1); %Dizinin satir sayisini dondurur

tekilVizeler = [tekilVizeler zeros(tvAdet, 1)]; %Diziyi verilen boyut kadar genisletir.

% Vize notlarinda frekans degerini bulma islemi
for i=1:tvAdet 
    tekilVizeler(i,2) = sum(vizeler == tekilVizeler(i,1));
end

% Cizim fonksiyonudur
% plot(tekilVizeler(:,1), tekilVizeler(:,2));

tekilVizeler = [tekilVizeler zeros(tvAdet, 1)]; %Diziyi verilen boyut kadar genisletir.

% Yuzde
for j=1:tvAdet
    deger = (tekilVizeler(i,2) / vizeCount)*100;
    tekilVizeler(i, 3) = deger;
end

% Yuzdelik Dilim
x = 25;
kucuksayiadedi = sum(siralivizeler < x);
yuzdelikdilim = (kucuksayiadedi / vizeCount) *100;

%Yuzde -25 lik deger
y = 30;
indexYuzde = (y / 100) * (vizeCount + 1);

if mod(indexYuzde, 1)> 0
    index1 = floor(indexYuzde); % asagi yuvarlama yapar
    index2 = ceil(indexYuzde); % yukari yuvarlama yapar
    
    yuzdedekideger = (siralivizeler(index1, 1) + siralivizeler(index2,1)) / 2;
else
    yuzdedekideger = siralivizeler(indexYuzde, 1);
end


% ortalama, medyan, mod
ort1 = mean(vizeler); % dizideki tum degerlerin ortalamasini verir
ort2 = (sum(vizeler))/vizeCount; % vizelerin degerini toplayip ortalamasini almak 


maxFrekans = max(tekilVizeler(:,2));
diziMod = find(tekilVizeler(:,2) == maxFrekans);

for k=1:size(diziMod,1)
    fprintf('Mod: %d', tekilVizeler(diziMod(k,1),1));
end

% Standart Sapma fonksiyonu yazilacak
% Medyan fonksiyonu yazilacak
% 


boxplot([vizeler finaller])