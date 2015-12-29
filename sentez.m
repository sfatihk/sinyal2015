function [] = sentez()
dosya_adi='notalar.txt';
oktav_ekle=0; %...(-1),0,1...
muzik_hizi=2; %0.25-0.5-1-2-4-8 ...

Fs=8192; %ornekleme frekansi
notalar=[]; %notalar matrisi tanimlaniyor

%her notadan sonra duraklama icin matris tanimlaniyor
duraklama_tt=linspace(0,1/100,Fs/100); %Fs nin %1 i kadar duraklama
duraklama_xx=zeros(1,length(duraklama_tt));
Duraklama=[duraklama_xx;duraklama_tt];

dosya = fopen(dosya_adi); 
satir = fgets(dosya);
zaman=0;
while ischar(satir) %dosya satir satir okunuyor
    veri = strsplit(satir,','); %satirlar virgullere gore parcalaniyor
    oktav=str2double(veri(2))+oktav_ekle; %oktav cekiliyor,ekleme varsa ekleniyor
    sure=str2num(char(veri(3)))/muzik_hizi; %sure cekiliyor, hiza bolunerek muzik hizi kontrol ediliyor
    
    tmp_frek=frek(veri(1),oktav); %frek fonks. ile nota frekansi hesaplaniyor
    [tmp_xx,tmp_tt]=note(tmp_frek,sure); %note fonks. ile sinyal olusturuluyor
    tmp_Matrix=[tmp_xx;tmp_tt]; %sinyal matrise aktariliyor
    
    tmp_Matrix(2,:)=tmp_Matrix(2,:)+zaman; 
    %sinyal, notalar matrisindeki son zamana kaydiriliyor.boylece yeni gelen sinyal en sona ekleniyor

    notalar=cat(2,notalar,tmp_Matrix);
    %sinyal, notalar matrisine ekleniyor

    zaman=notalar(2,end);
    %notalardaki, son zaman cekiliyor
   
    Duraklama(2,:)=Duraklama(2,:)+zaman;
    notalar=cat(2,notalar,Duraklama);
    %yeni nota sinyalinin sonuna, duraklama ekleniyor

    Duraklama=[duraklama_xx;duraklama_tt];
    %duraklama zaman vektoru sonraki cycle da kullanilmak uzere sifirlaniyor

    zaman=notalar(2,end);
    %duraklamanin ardindan tekrar, son zaman degeri cekiliyor
    
    satir = fgets(dosya);
end
fclose(dosya);

sesEcho=zeros(1,int16(Fs/10)); 
zamanEcho=linspace(0,1/10,Fs/10);
%Fs nin %10 kadar echo sesi olusturuluyor

sesEcho=[sesEcho notalar(1,:)];
sesEcho=sesEcho*(30/100);
%echo sesinin sonuna notalar eklerek,%10xFs kaydirilmis sinyal elde ediliyor
%genlik %30 a dusuruluyor

zamanEcho=zamanEcho+zaman;
zamanEcho=[notalar(2,:) zamanEcho];


Echo=[sesEcho;zamanEcho];

notalar=cat(2,notalar,zeros(2,int16(Fs/10)));
%orijinal ses, echo zamani kadar arttiriliyor

notalar=notalar+Echo;
%orijinal ses, ekolanmis haliyle birlestiriliyor

notalar(1,:)=notalar(1,:)/max(notalar(1,:));
%notalar genligi en buyuk olan pivot kabul edilerek
%1 e normalize ediliyor

plot(notalar(2,:),notalar(1,:)); %sinyalin grafigi
sound(notalar(1,:),8192); % sinyalin calinmasi

end
