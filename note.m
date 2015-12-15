function [xx,tt] = note(frekans,ornekSayisi,sure) %sesfrekansi,bir periyottaki ornek sayisi,gecen sure
   	tt = 0:1/(ornekSayisi*frekans):sure; %x(zaman) ekseni,
    xx = sin(2*pi*frekans*tt);%sinus fonksiyonu
end