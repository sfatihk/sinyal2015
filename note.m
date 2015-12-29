function [x,t] = note(frekans,sure)
   
    Fs=8192; % ornekleme frekansi
    Ts=1/Fs;   
    t=0:Ts:sure; % [0 - sure] sn araliginda,Fs frekansinda ornekler olusturulur
    
    
    A=[linspace(0,1.5,2*Fs*sure/8),... % 2T/8'lik surede [0 - 1.5] artis
    linspace(1.5,1,Fs*sure/8),...      % T/8'lik surede [1.5 - 1] azalis
    linspace(1,1,4*Fs*sure/8),...      % 4T/8'lik surede [1]sabit
    linspace(1,0,Fs*sure/8+1)];        % T/8'lik surede [1 - 0] azalis
    
    h0=sin(2*pi*frekans*t); %orijinal
    h1=sin(2*pi*frekans*t*2); %harmonik1
    h2=sin(2*pi*frekans*t*3); %harmonik2
    h3=sin(2*pi*frekans*t*4); %harmonik3
    h=h0+0.8*h1+0.4*h2+0.1*h3; % %80.h1 + %40.h2 + %10.h3
    
    x=A.*h;
    %katsayilar vektoru, sinus sinyali ile carpilarak,
    %zarfa uygun bir cikis sinyali olusturuluyor.
    %Not: .* kullaniminin sebebi matlabin matris carpimi hatasi vermesini
    %onlemektir.
    
    
end