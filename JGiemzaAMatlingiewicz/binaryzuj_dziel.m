function [tab_figur ] = binaryzuj_dziel( obraz )

% Konwersja obrazu w skalê szaroœci
B=rgb2gray(obraz);

% Wyznaczenie t³a
[counts,binLoc] = imhist(B);
[countmax,ind]=max(counts);
tlo=binLoc(ind,1);

%  Binaryzacja obrazu
global obraz_bin
obraz_bin=zeros(size(B));
obraz_bin(B~=tlo)=1;


% Podzia³ na figury
tab_figur=dziel(obraz_bin);
end

