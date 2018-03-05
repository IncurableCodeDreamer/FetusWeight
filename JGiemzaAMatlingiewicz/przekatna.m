function [tab_z_przek] = przekatna(tab_krawedzi)
for i=1:length(tab_figur_kraw)
[ y, x] = find(tab_figur_kraw{i});
points = [ x y];
[d,idx] = pdist2( points, points, 'euclidean', 'Largest', 1);
idx1 = idx( d==max(d));
[~,idx2] = find(d==max( d));
 
p={};
for i=1:length(idx1)
   p{end+1} = [ points(idx1(i),1), points(idx1(i),2), points(idx2(i),1), points(idx2(i),2)];
end

pp=[];
for i=1:numel(p)
    for j=i+1:numel(p)
        if prod( double( [p{i}(3:4),p{i}(1:2)] == p{j}))
            pp(end+1)=j;
        end
    end
end
j=1;
ppp={};
for i=1:numel(p)-numel(pp)
    if j<=numel(pp);i~=pp(j)
        ppp{end+1}=p{i};
        j=j+1;
    end
end
p = ppp;
axes(handles.obraz_detekcja) 

line( [ p{1}(1), p{1}(3)], [p{1}(2), p{1}(4)],'Linewidth',2);

% hold off;

end

