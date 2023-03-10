% Mod Tamamlama
function yeniVeri = ModTamamlama(data, indexler)
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
        
        sinifVerisi(isnan(sinifVerisi)) = [];
        
        %ort = mean(sinifVerisi); %ortalama i?lemi
        md = round(mode(sinifVerisi)); 
        yeniVeri(satir, sutun) = md;        
        % mode komutunu inclee
    end
end