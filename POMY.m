function varargout = POMY(varargin)
% POMY MATLAB code for POMY.fig
%      POMY, by itself, creates a new POMY or raises the existing
%      singleton*.
%
%      H = POMY returns the handle to a new POMY or the handle to
%      the existing singleton*.
%
%      POMY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in POMY.M with the given input arguments.
%
%      POMY('Property','Value',...) creates a new POMY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before POMY_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to POMY_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help POMY
% Last Modified by GUIDE v2.5 05-Mar-2018 14:41:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @POMY_OpeningFcn, ...
                   'gui_OutputFcn',  @POMY_OutputFcn, ...
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
% End initialization code - DO NOT EDIT

% --- Executes just before POMY is made visible.
function POMY_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to POMY (see VARARGIN)

% Choose default command line output for POMY
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes POMY wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = POMY_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in LoadBtn.
function LoadBtn_Callback(hObject, eventdata, handles)
% hObject    handle to LoadBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global obraz 
global rozmiar_obrazu;
cla(handles.PictureWithPoints,'reset');
set(handles.ScalNumber,'String','');
sciezka=uigetfile('*.jpg');
obraz=imread(sciezka);
rozmiar_obrazu = size(obraz);
set(handles.LoadedPicture,'Units','pixels');
resizePos = get(handles.LoadedPicture,'Position');
obraz= imresize(obraz, [resizePos(3) resizePos(3)]);
axes(handles.LoadedPicture);
imshow(obraz);
set(handles.LoadedPicture,'Units','normalized');
h = msgbox('Zaznacz dwa punkty, a nastêpnie wpisz rzeczywist± odleg³o¶æ miêdzy nimi. Potem naci¶nij przycisk SKALUJ','Skalowanie','help');
waitfor(h);

[x1,y1] = ginput(1);
hold(handles.LoadedPicture,'on');
plot(x1,y1,'r*');
[x2,y2] = ginput(1);
hold(handles.LoadedPicture,'on');
plot(x2,y2,'r*');

handles.x1=x1;
handles.x2=x2;
handles.y1=y1;
handles.y2=y2;
guidata(hObject,handles)

% --- Executes on button press in ReturnBtn.
function ReturnBtn_Callback(hObject, eventdata, handles)
% hObject    handle to ReturnBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in CountBtn.
function CountBtn_Callback(hObject, eventdata, handles)
% hObject    handle to CountBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global wartosc_piksela;
x1=handles.x1;
 x2=handles.x2;
 y1=handles.y1;
 y2=handles.y2;
 x=handles.x;
 x3=handles.x3;
 y=handles.y;
 y3=handles.y3;
 x4=handles.x4;
 x5=handles.x5;
 y4=handles.y4;
 y5=handles.y5;
 HC=sqrt((x-x1)^2+(y-y1)^2)*wartosc_piksela*pi
 AC=sqrt((x2-x3)^2+(y2-y3)^2)*wartosc_piksela*pi
 FL=sqrt((x4-x5)^2+(y4-y5)^2)*wartosc_piksela
 BW=10^(1.304+(0.05281*AC)+(0.1938*FL)-(0.004*(AC*FL)))
 j='cm';
 j2='g';
 set(handles.text10,'String',strcat(num2str(HC),j))
 set(handles.text9,'String',strcat(num2str(AC),j))
 set(handles.text11,'String',strcat(num2str(FL),j))
 set(handles.text12,'String',strcat(num2str(BW),j2))


function ScalNumber_Callback(hObject, eventdata, handles)
% hObject    handle to ScalNumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ScalNumber as text
%        str2double(get(hObject,'String')) returns contents of ScalNumber as a double


% --- Executes during object creation, after setting all properties.
function ScalNumber_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ScalNumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ScalBtn.
function ScalBtn_Callback(hObject, eventdata, handles)
% hObject    handle to ScalBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global obraz;
global wartosc_piksela;
bool =true;
x = str2num(get(handles.ScalNumber,'String')); %edit1 being Tag of ur edit box
 if isempty(x)
     h = msgbox('Wprowad¼ warto¶æ liczbow±!','B³±d','error');
     set(handles.ScalNumber,'String','');
     bool =false;
 end
 if (x<=0)
     h = msgbox('Wprowad¼ warto¶æ liczbow±!','B³±d','error');
     set(handles.ScalNumber,'String','');
     x=[];
     bool =false;
 end
 
 if(bool)
 x1=handles.x1;
 x2=handles.x2;
 y1=handles.y1;
 y2=handles.y2;
 odleglosc = sqrt((x1-x2)^2+(y1-y2)^2)
 wartosc_piksela=x/odleglosc
 end 
 
 set(handles.LoadedPicture,'Units','pixels');
 resizePos = get(handles.LoadedPicture,'Position');
 obraz= imresize(obraz, [resizePos(3) resizePos(3)]);
 axes(handles.LoadedPicture);
 imshow(obraz);
 
 hFigure = figure;
 set(hFigure, 'MenuBar', 'none');
 set(hFigure, 'ToolBar', 'none');
 set(hFigure, 'Name','Instrukcja zaznaczania punktów na obrazie usg')
 Image = imread('instrukcja.jpg');
 imshow(Image,'Border','tight');
 title('Zaznacz odpowiednie punkty w przedstawionej kolejno¶ci');

 waitfor(hFigure);
 [x,y] = ginput(1); 
 hold(handles.LoadedPicture,'on');
 plot(x,y,'go');
 [x1,y1] = ginput(1);
 hold(handles.LoadedPicture,'on');
 plot(x1,y1,'go');
 [x2,y2] = ginput(1); 
 hold(handles.LoadedPicture,'on');
 plot(x2,y2,'go');
 [x3,y3] = ginput(1); 
 hold(handles.LoadedPicture,'on');
 plot(x3,y3,'go');
 [x4,y4] = ginput(1);
 hold(handles.LoadedPicture,'on');
 plot(x4,y4,'go');
 [x5,y5] = ginput(1);
 hold(handles.LoadedPicture,'on');
 plot(x5,y5,'go');
 
 wektor_pkt1=[x,x1,x2,x3,x4,x5;y,y1,y2,y3,y4,y5]
 wektor_pkt1_1=[x x1; y y1];
 wektor_pkt1_2=[x2 x3; y2 y3];
 wektor_pkt1_3=[x4 x5; y4 y5];
 hold off
 axes(handles.PictureWithPoints);
 points_plot=plot(wektor_pkt1(1,:),wektor_pkt1(2,:),'b*');
 direction = [1 0 0];
rotate(points_plot,direction,180)
hold on
points_plot1=plot(wektor_pkt1_1(1,:),wektor_pkt1_1(2,:),'r');
 direction = [1 0 0];
rotate(points_plot1,direction,180)
points_plot2=plot(wektor_pkt1_2(1,:),wektor_pkt1_2(2,:),'r');
 direction = [1 0 0];
rotate(points_plot2,direction,180)
points_plot3=plot(wektor_pkt1_3(1,:),wektor_pkt1_3(2,:),'r');
 direction = [1 0 0];
rotate(points_plot3,direction,180)
 grid on;
 handles.x=x;
handles.x1=x1;
handles.y=y;
handles.y1=y1;
handles.x3=x3;
handles.x2=x2;
handles.y3=y3;
handles.y2=y2;
handles.x4=x4;
handles.x5=x5;
handles.y4=y4;
handles.y5=y5;
guidata(hObject,handles)
guidata(hObject,handles)
