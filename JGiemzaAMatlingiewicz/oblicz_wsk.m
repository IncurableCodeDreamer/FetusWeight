function wsk = oblicz_wsk(img)
        obwod = sum(sum(bwperim(img)));
        pole = sum(sum(img));
        sprintf('wsk1');
        wsk = 4*3.14*pole/(obwod^2)
end