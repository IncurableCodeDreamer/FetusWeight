function out = GenerujKsztalt(m,n,typ,obrot)

promien = rand*(0.5*max(m,n)-5)+5;
y_center = rand*(m-(promien+1)*2)+promien;
x_center = rand*(n-(promien+1)*2)+promien;
promien = floor(promien);
y_center = uint16(y_center);
out = zeros(m,n);

out(y_center,uint16(x_center))=1; % punkt srodkowy

if strcmp(typ,'kwadrat')
    se1 = strel('square',promien);
elseif strcmp(typ,'kolo')
    se1 = strel('disk',promien,0);
elseif strcmp(typ,'prostokat')
    se1 = strel('rectangle',[promien,floor(promien/2)]);
elseif strcmp(typ,'trojkat')
    se1 = strel('diamond',promien);
end

out = imdilate(out,se1);

%obciecie rombu do trojkata
if strcmp(typ,'trojkat')
    out(y_center:m,:) = out(y_center:m,:)*0;
end

if obrot==1
    out = imrotate(out,rand*90,'bilinear'); %dodatkowy obrot w zakresie 0-90 stopni
    out(out<0.3)=0;
    out(out>=0.3)=1;
end

end