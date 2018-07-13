function varargout = POMY_2(varargin)
% POMY_2 MATLAB code for POMY_2.fig
%      POMY_2, by itself, creates a new POMY_2 or raises the existing
%      singleton*.
%
%      H = POMY_2 returns the handle to a new POMY_2 or the handle to
%      the existing singleton*.
%
%      POMY_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in POMY_2.M with the given input arguments.
%
%      POMY_2('Property','Value',...) creates a new POMY_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before POMY_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to POMY_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help POMY_2

% Last Modified by GUIDE v2.5 26-Mar-2018 14:40:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @POMY_2_OpeningFcn, ...
                   'gui_OutputFcn',  @POMY_2_OutputFcn, ...
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


% --- Executes just before POMY_2 is made visible.
function POMY_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to POMY_2 (see VARARGIN)

% Choose default command line output for POMY_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes POMY_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = POMY_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
g = msgbox('Wprowad¼ tydzieñ ci±¿y, a nastêpnie naci¶nij przycisk ZATWIER¬','Statystyki','help');
waitfor(g);

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global HC;
global AC;
global FL;
global BW;
dane = load('tabele.txt');
wiek = str2num(get(handles.ageTxt,'String'));
bool=true;
if isempty(wiek)
     h = msgbox('Wprowad¼ warto¶æ liczbow±!','B³±d','error');
     set(handles.ScalNumber,'String','');
     bool =false;
 end
 if (wiek<16 || wiek>40)
     h = msgbox('Wprowad¼ warto¶æ liczbow± z przedzia³u <16, 40>!','B³±d','error');
     set(handles.ScalNumber,'String','');
     x=[];
     bool =false;
 end
 
if(bool)
    daneTydzien = dane((wiek+1)-16,:)
     %wartoscl normal roznica; opis
    if(HC<daneTydzien(2))
        opisHC = '< 5 centyl';
    elseif(HC>daneTydzien(4))
        opisHC='> 95 centyla';
    else
        opisHC='+/- 50 centyl';
    end
    HCcentyl=daneTydzien(3);
    HCroznica=abs(HCcentyl - HC);
    
    if(AC<daneTydzien(8))
        opisAC = '< 5 centyl';
    elseif(AC>daneTydzien(10))
        opisAC='> 95 centyla';
    else
        opisAC='+/- 50 centyl';
    end
    ACcentyl=daneTydzien(9);
    ACroznica=abs(ACcentyl - AC);
    
    if(FL<daneTydzien(5))
        opisFL = '< 5 centyl';
    elseif(FL>daneTydzien(7))
        opisFL='> 95 centyla';
    else
        opisFL='+/- 50 centyl';
    end
    FLcentyl=daneTydzien(6);
    FLroznica=abs(FLcentyl - FL);
    
    if(BW<daneTydzien(11))
        opisBW = '< 10 centyla';
    elseif(BW>daneTydzien(13))
        opisBW='> 90 centyla';
    else
        opisBW='+/- 50 centyl';
    end
    BWcentyl=daneTydzien(12);
    BWroznica=abs(BWcentyl - BW);
d =[{HC} {HCcentyl} {HCroznica} {opisHC}; {AC} {ACcentyl} {ACroznica} {opisAC}; {FL} {FLcentyl} {FLroznica} {opisFL}; {BW} {BWcentyl} {BWroznica} {opisBW}] 

%d = cellfun(@(s) sprintf('%*s',max(cellfun(@length,d)),s),d);

t = handles.normyTab;
set(t, 'ColumnFormat', {'char','char','char','char'} );
set(t,'Data',d);
end
 
function ageTxt_Callback(hObject, eventdata, handles)
% hObject    handle to ageTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ageTxt as text
%        str2double(get(hObject,'String')) returns contents of ageTxt as a double


% --- Executes during object creation, after setting all properties.
function ageTxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ageTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
