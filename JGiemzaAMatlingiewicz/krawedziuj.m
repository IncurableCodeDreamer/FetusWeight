function [E] = krawedziuj()
 global tab_figur
 global punkty_linii
 punkty_linii=[];
 
% Krawêdziowanie

for i=1:max(size(tab_figur));
  
obraz=tab_figur{i};
D1=zeros(size(obraz));
FILTR = [-1 0 1];
Dx = filter2(FILTR, obraz(:,:,1));
Dy = filter2(FILTR' , obraz(:,:,1));
G = sqrt(Dx.^2 + Dy.^2);
G = G(:,2:end-1);
G = G(2:end-1,:);
E{i}=zeros(size(G));
E{i}(G~=0)=1;


[ y, x] = find( E{i});
points = [ x y];
[d,idx] = pdist2( points, points, 'euclidean', 'Largest', 1);
idx1 = idx( d==max(d));
[~,idx2] = find(d==max( d));
 
p={};
for ij=1:length(idx1)
   p{end+1} = [ points(idx1(ij),1), points(idx1(ij),2), points(idx2(ij),1), points(idx2(ij),2)];
end

pp=[];
for ii=1:numel(p)
    for j=ii+1:numel(p)
        if prod( double( [p{ii}(3:4),p{ii}(1:2)] == p{j}))
            pp(end+1)=j;
        end
    end
end

j=1;
 ppp={};
for iii=1:numel(p)-numel(pp)
    if j<=numel(pp);iii~=pp(j)
        ppp{end+1}=p{iii};
        j=j+1;
    end
end

punkty_linii(i,1:4)=ppp{1}
end

