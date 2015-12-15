function [ nota_frek ] = frek( nota, oktav )
notalar={'do','c#','re','eb','mi','fa','f#','sol','g#','la','bb','si'}; %notalari tanimladim

nota_index=find(ismember(notalar,nota)); %arguman olarak gelen nota,
                                         %eger notalar dizisinin elemaniysa
                                         %bu elemanin indisini cekiyorum
                                         %boylece nota indexi olusuyor

f0 = 440; %La4(nota#10,oktav#4) notasini pivot olarak belirledim
nota_frek=f0*2^((nota_index-10)/12 + (oktav-4)); %la4 notasi 10.nota ve 4.oktav oldugu icin
                                                 %fonksiyona bu farklari dahil ettim
end