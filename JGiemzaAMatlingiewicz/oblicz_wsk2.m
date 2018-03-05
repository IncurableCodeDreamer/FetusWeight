function [SF]=oblicz_wsk2(punkty_linii,img)
        linia=sqrt((punkty_linii(1)-punkty_linii(3))^2+((punkty_linii(2)-punkty_linii(4))^2));
        pole = sum(sum(img));
        sprintf('SF');
        SF=pole/(linia*linia)
end


