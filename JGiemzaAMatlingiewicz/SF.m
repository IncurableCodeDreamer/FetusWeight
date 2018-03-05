function [ wartosci_SF ] = SF( tab_figurHere )
 ile=max(size(tab_figurHere));
for i=1:ile(2);
A=tab_figurHere{i};

D1=zeros(size(A));
FILTR = [-1 0 1];
Dx = filter2(FILTR, A);
Dy = filter2(FILTR' , A);
G = sqrt(Dx.^2 + Dy.^2);
G = G(:,2:end-1);
G = G(2:end-1,:);
E=zeros(size(G));
E(G~=0)=1;



[ y, x] = find( E);
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
figure; 
imshow( E);
hold on;
line( [ p{1}(1), p{1}(3)], [p{1}(2), p{1}(4)],'Linewidth',2);
hold off;
wartosci_SF(i)=sqrt((p{1}(1)-p{1}(2))^2 +(p{1}(3)-p{1}(4))^2);
end

end
