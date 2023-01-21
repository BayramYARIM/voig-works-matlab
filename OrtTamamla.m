% ortalama tamamla
% naber
function yeniVeri = OrtTamamla(data, indexler)
    yeniVeri = data;
    
    sutunSayisi = size(data, 2);
    satirSayisi = size(data, 1);
    eksikVeriSayisi = size(indexler, 1);
    
    for i=1:eksikVeriSayisi
        satir = indexler(i,1);
        sutun = indexler(i,2);
        sinif = data(satir, sutunSayisi);
        sinifVerisi = [];
        
        for j=1:satirSayisi
            if veri(j, sutunSayisi) == sinif
                sinifVerisi = [sinifVerisi, data(j, sutun)];
            end
        end
        
        %ort = mean(sinifVerisi); %ortalama iþlemi
        ort = nanmean(sinifVerisi); %ortalama iþlemi - ignore isNan
        yeniVeri(satir, sutun) = ort;
    end
end