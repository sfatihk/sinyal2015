function [x,t] = note(frekans,sure)
   
    Fs=8192; % ornekleme frekansi
    Ts=1/Fs;   
    t=0:Ts:sure; % [0 - sure] sn araliginda,Fs frekansinda ornekler olusturulur
    
    
    A=[linspace(0,1.5,2*Fs*sure/8),... % 2T/8'lik surede [0 - 1.5] artis
    linspace(1.5,1,Fs*sure/8),...      % T/8'lik surede [1.5 - 1] azalis
    linspace(1,1,4*Fs*sure/8),...      % 4T/8'lik surede [1]sabit
    linspace(1,0,Fs*sure/8+1)];        % T/8'lik surede [1 - 0] azalis

    x=A.*sin(2*pi*frekans*t);
    %katsayilar vektoru, sinus sinyali ile carpilarak,
    %zarfa uygun bir cikis sinyali olusturuluyor.
    %Not: .* kullaniminin sebebi matlabin matris carpimi hatasi vermesini
    %onlemektir.
    
    
end