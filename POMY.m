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
set(handles.ScalNumber,'String','');
sciezka=uigetfile('*.jpg');
obraz=imread(sciezka);
axes(handles.LoadedPicture)
imshow(obraz);
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

x = str2num(get(handles.ScalNumber,'String')); %edit1 being Tag of ur edit box
 if isempty(x)
     h = msgbox('Wprowad¼ warto¶æ liczbow±!','B³±d','error');
     set(handles.ScalNumber,'String','');
 end
 if (x<=0)
     h = msgbox('Wprowad¼ warto¶æ liczbow±!','B³±d','error');
     set(handles.ScalNumber,'String','');
     x=[];
 end
 
 x1=handles.x1;
 x2=handles.x2;
 y1=handles.y1;
 y2=handles.y2;
 odleglosc = sqrt((x1-x2)^2+(y1-y2)^2);
 wartosc_piksela=x/odleglosc;

%[x,y] = ginput(6);
%hold(handles.LoadedPicture,'on');
%plot(x,y,'ro');
%hold off
%axes(handles.PictureWithPoints);
%plot(x,y,'*');
