function [wskazniki]= SF_sprawdz()

global tab_figur
global punkty_linii

    for i=1:max(size(tab_figur))
        wskazniki(i)= oblicz_wsk2(punkty_linii(i,:),tab_figur{i});
    end

end

