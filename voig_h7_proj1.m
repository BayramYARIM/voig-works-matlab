clc;
clear all;

veri = xlsread('fname');

[i, j] = find(isnan(veri));

eksikIndex = [i j];

%Menu olusturma
while(true)
    disp("[1] : Satýr bazlý silme ");
    disp("[2] : Sütun bazlý silme ");
    disp("[3] : Ortalama bazlý tamamlama ");
    disp("[4] : Medyan bazlý tamamlama ");
    disp("[5] : Mod bazlý tamamlama ");
    disp("[6] : Çýkýs ");
    secim = input('Seçim yapýnýz');
    
    switch(secim)
        case 1
            yeniVeri = SatirBazliSil(veri, eksikIndex);
        case 2
            yeniVeri = SutunBazliSil(veri, eksikIndex);
        case 3
            yeniVeri = OrtTamamla(veri, eksikIndex);
        case 4
            yeniVeri = MedTamamla(veri, eksikIndex);
        case 5
            yeniVeri = ModTamamlama(veri, eksikIndex);
        case 6
            break;
        otherwise
                disp("Yanlis secim");
    end
    
    subplot(1,2,1); %1 satir 2 sutuna bol 1 cerceve seklinde
    
    boxplot(veri);
    title('Eski Veriler');
    
    subplot(1,2,2); 
    boxplot(yeniVeri); 
    title('Yeni Veri');
end