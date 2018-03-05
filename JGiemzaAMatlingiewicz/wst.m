function varargout = wst(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @wst_OpeningFcn, ...
                   'gui_OutputFcn',  @wst_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
function wst_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for wst
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

axes(handles.obraz_detekcja) 
imshow(1);

axes(handles.obraz) 
imshow(1);

function varargout = wst_OutputFcn(hObject, eventdata, handles) 

% Get default command line output from handles structure
varargout{1} = handles.output;

%<---<->---<->---BUTTONS---<->---<->--->%

function button_wczytajobraz_Callback(hObject, eventdata, handles)
global tab_figur
global obraz
global szer
global dl
global tab_figur_kraw
global nr_figury
global E
nr_figury=1;
sciezka=uigetfile({'*.png';'*.jpg';'*.bmp'});
obraz=imread(sciezka);

axes(handles.obraz)
imshow(obraz);

% informacje o obrazie
infobraz=imfinfo(sciezka);
szer=infobraz.Width;
dl=infobraz. Height;

text = sprintf('\n Szerokoœæ:  %d  pikseli \n D³ugoœæ:  %d  pikseli', szer,dl);
set(handles.tekst_infoobraz, 'String', text);

%binaryzacja i podzia³ na figury
tab_figur=binaryzuj_dziel(obraz);


E=krawedziuj();

text2 = sprintf('%d', nr_figury);
set(handles.text_nrfig, 'String', text2);

axes(handles.obraz_detekcja)
rysuj_figure(handles)

function button_analizuj_Callback(hObject, eventdata, handles)

global tab_figur

tab_figurHere     = tab_figur;

  wyniki_z_sieci=siec_neuronowa_sprawdz(); 
  
  wyniki_z_SF2=SF_sprawdz(); 
  
  tableData = get(handles.tabela_wynikowa,'data');

dane={};

 for x=1:length(wyniki_z_sieci)
      
 switch wyniki_z_sieci(x)
     case 1 
         ksztalt='kwadrat';
     case 2 
         ksztalt='kolo';
     case 3 
         ksztalt='prostok¹t';
     case 4 
         ksztalt='trójk¹t';
 end
 
if wyniki_z_SF2(x)>=0.484 && wyniki_z_SF2(x)<=0.55
    ksztalt2='kwadrat';
    elseif wyniki_z_SF2(x)>=0.7 && wyniki_z_SF2(x)<=0.8
    ksztalt2='kolo';
    elseif  wyniki_z_SF2(x)>=0.2 && wyniki_z_SF2(x)<=0.3
    ksztalt2='prostok¹t';
    elseif wyniki_z_SF2(x)>=0.44 && wyniki_z_SF2(x)<=0.48
    ksztalt2='trójk¹t';
else 
    ksztalt2='nieznana figura'
end
 
     dane(x,:)={ksztalt2,ksztalt};
    end
    


colnames = {'SF2','Sieæ neuronowa'};
set(handles.tabela_wynikowa,'data',dane,'ColumnName',colnames);
   


function button_porownaj_Callback(hObject, eventdata, handles)

%<---<->---<->---LISTS---<->---<->--->%

function wybor_metody_Callback(hObject, eventdata, handles)

function wybor_metody_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%<---<->---<->---TEXT-<>-FIELDS---<->---<->--->%

% --- Executes during object creation, after setting all properties.
function tekst_infoobraz_CreateFcn(hObject, eventdata, handles)


%<---<->---<->---TABLES---<->---<->--->%


% --- Executes when entered data in editable cell(s) in tabela_wynikowa.
function tabela_wynikowa_CellEditCallback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function tabela_wynikowa_CreateFcn(hObject, eventdata, handles)

% --- Executes on button press in button_poprz.
function button_poprz_Callback(hObject, eventdata, handles)
global tab_figur
global nr_figury

% nr_figury=max(size(tab_figur));
nr_figury=nr_figury-1;

if nr_figury<=0
     nr_figury=1;
end
rysuj_figure(handles);
text2 = sprintf('%d', nr_figury);
set(handles.text_nrfig, 'String', text2);

% --- Executes on button press in button_nast.
function button_nast_Callback(hObject, eventdata, handles)
% hObject    handle to button_nast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tab_figur
global nr_figury

wymiar=max(size(tab_figur));

nr_figury=nr_figury+1;

if nr_figury>(wymiar)
    
        nr_figury=wymiar;
end
rysuj_figure(handles);
text2 = sprintf('%d', nr_figury);
set(handles.text_nrfig, 'String', text2);
