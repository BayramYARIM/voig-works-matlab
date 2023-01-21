% SATIR BAZLI SILME FONKSIYONU
function yeniVeri = SatirBazliSil(data, indexler)
    yeniVeri = data;
    %sort:Sirala, unique:tekil olarak al, :,1 --> 1.sutun tum satirlar
    satirlar = sort(unique(indexler(:, 1))); 
    
    for i=1:size(satirlar, 1)
       satir = satirlar(i, 1);
       yeniVeri(satir, :) = [];
       satirlar = satirlar - 1;
    end
end