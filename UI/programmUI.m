function varargout = programmUI(varargin)
% PROGRAMMUI MATLAB code for programmUI.fig
%      PROGRAMMUI, by itself, creates a new PROGRAMMUI or raises the existing
%      singleton*.
%
%      H = PROGRAMMUI returns the handle to a new PROGRAMMUI or the handle to
%      the existing singleton*.
%
%      PROGRAMMUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROGRAMMUI.M with the given input arguments.
%
%      PROGRAMMUI('Property','Value',...) creates a new PROGRAMMUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before programmUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to programmUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help programmUI

% Last Modified by GUIDE v2.5 24-May-2017 22:37:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @programmUI_OpeningFcn, ...
                   'gui_OutputFcn',  @programmUI_OutputFcn, ...
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


% --- Executes just before programmUI is made visible.
function programmUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to programmUI (see VARARGIN)

% Choose default command line output for programmUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes programmUI wait for user response (see UIRESUME)
% uiwait(handles.targetpath);


% --- Outputs from this function are returned to the command line.
function varargout = programmUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function targetPath_Callback(hObject, eventdata, handles)
% hObject    handle to targetPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of targetPath as text
%        str2double(get(hObject,'String')) returns contents of targetPath as a double


% --- Executes during object creation, after setting all properties.
function targetPath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to targetPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
  path = get( handles.targetPath, 'String' );
  target = LoadTargetFromFile(path);
  h=rotate3d;
  set(h,'Enable','on'); 
  f=figure('Name','Модель цели','NumberTitle','off');
  target.plotTarget(0.7);
  saveas(f,logo.fig);

  
% --- Executes on button press in choseFile.
function choseFile_Callback(hObject, eventdata, handles)
[FileName,PathName] = uigetfile('*.trg','Выберети кофигурационный файл цели');
if (PathName ~= 0)
set( handles.targetPath, 'String',PathName + FileName );
end




% --- Executes on button press in norm.
% function norm_Callback(hObject, eventdata, handles)
% set(handles.square,'visible','off');
% set(handles.text5,'visible','off');
