function [ tab_figur ] = dziel( obraz_bin )

obraz_labels = bwconncomp(obraz_bin);

assignin ('base','obraz_labels',obraz_labels);
tab_figur={size(obraz_labels.NumObjects)};
for i=1:obraz_labels.NumObjects
    tab_figur{i}=zeros(size(obraz_bin));
    tab_figur{i}(obraz_labels.PixelIdxList{i})=1;
end

rzad=ceil(obraz_labels.NumObjects/3);
 figure
if(obraz_labels.NumObjects<=18)
    for i=1:obraz_labels.NumObjects
            num=sprintf('figura %d',i);
            subplot(3,rzad,i);imshow(tab_figur{i});title(num);
    end
end

end

