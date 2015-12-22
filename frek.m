function [ nota_frek ] = frek( nota, oktav )
notalar={'Do','Dod','Re','Mib','Mi','Fa','Fad','Sol','Sold','La','Sib','Si','sus'}; %notalari tanimladim
nota_frek=0; %frekans sus gelme ihtimaline karsi sifirlaniyor

if nargin < 2  % eger oktav belirtilmemisse,
    oktav = 4; % 4.oktav kabul ediliyor.
end

nota_index=find(ismember(notalar,nota)); 
%arguman olarak gelen nota; eger notalar dizisinin elemaniysa,
%bu elemanin indisini cekiyorum. Boylece nota indexi(degeri) olusuyor.


if nota_index ~= 13 %eger 13.nota(sus) geldiyse frekans hesaplanmiyor.                                        
    
    f0 = 440; %La4(nota#10,oktav#4) notasini pivot olarak belirledim
    
    nota_frek=f0*2^((nota_index-10)/12 + (oktav-4)); 
    %notalar arasinda 2^(n/12)lik,oktavlar arasında 2^n lik oran vardir.
    %la4 notasi 10.nota ve 4.oktav oldugu icin fonksiyona bu farklari dahil ettim
end

end