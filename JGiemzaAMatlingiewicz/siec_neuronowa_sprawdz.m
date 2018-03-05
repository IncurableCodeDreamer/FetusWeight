function [testIndices]=siec_neuronowa_sprawdz ( )
load('net.mat');
global tab_figur
global punkty_linii
% jeszcze mozemy zrobic weryfikacje za pomoca zbioru testowego
zbior_testowy_WSKAZNIKI = zeros(2,max(size(tab_figur)));

for i=1:max(size(tab_figur))
    zbior_testowy_WSKAZNIKI(:,i) = [oblicz_wsk(tab_figur{i}),oblicz_wsk2(punkty_linii(i,:),tab_figur{i})];
end

x_test = zbior_testowy_WSKAZNIKI;
wynik_test = net(x_test);

testIndices = vec2ind(wynik_test); % caly wektor na raz mozemy "przekodowac"

end

