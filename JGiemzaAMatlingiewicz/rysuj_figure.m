function rysuj_figure(handles)
global E
global punkty_linii
global nr_figury
global x1
global x2
global y1
global y2

nr_figury

x1=punkty_linii(nr_figury,1);
y1=punkty_linii(nr_figury,3);

x2=punkty_linii(nr_figury,2);
y2=punkty_linii(nr_figury,4);

axes(handles.obraz_detekcja) 
imshow(E{nr_figury});

hold on;
    line( [x1,y1], [x2,y2 ],'Linewidth',1);
hold off;

end

