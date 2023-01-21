% SUTUN BAZLI SILME FONKSIYONU
function yeniVeri = SutunBazliSil(data, indexler)
    yeniVeri = data;
    %sort:Sirala, unique:tekil olarak al, :,1 --> 1.sutun tum satirlar
    sutunlar = sort(unique(indexler(:, 2))); 
    
    for i=1:size(sutunlar, 1)
       sutun = sutunlar(i, 1);
       yeniVeri(sutun, :) = [];
       sutunlar = sutunlar - 1;
    end
end