function varargout = ME_GUI(varargin)
% ME_GUI MATLAB code for ME_GUI.fig
%      ME_GUI, by itself, creates a new ME_GUI or raises the existing
%      singleton*.
%
%      H = ME_GUI returns the handle to a new ME_GUI or the handle to
%      the existing singleton*.
%
%      ME_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ME_GUI.M with the given input arguments.
%
%      ME_GUI('Property','Value',...) creates a new ME_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ME_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ME_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ME_GUI

% Last Modified by GUIDE v2.5 10-Apr-2020 16:24:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ME_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @ME_GUI_OutputFcn, ...
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


% --- Executes just before ME_GUI is made visible.
function ME_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ME_GUI (see VARARGIN)

% Choose default command line output for ME_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ME_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ME_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Load_Data.
function Load_Data_Callback(hObject, eventdata, handles)
% hObject    handle to Load_Data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile('*.*');
info = VideoReader([pathname, filesep, filename]);

n = info.NumFrames 

VIDEO = readFrame(info);
imagesc(VIDEO);


% --- Executes on button press in Select_ROI.
function Select_ROI_Callback(hObject, eventdata, handles)
% hObject    handle to Select_ROI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

a = getrect;
xmax = a(:,1) + a(:,3);
xmin = a(:,1);
ymin = a(:,2);
ymax = a(:,2) + a(:,4);

avea = mean((xmax - xmin)*(ymax-ymin))
% gives average of the frame picked 
% how do we get the average of the heart in each frame seperate from the
% new frame 

% changes pixels 

% --- Executes on button press in Calculate_HR.
function Calculate_HR_Callback(hObject, eventdata, handles)
% hObject    handle to Calculate_HR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%% 

% while
%     addframe(info) = f
%         if f == 1 
%           mean(frame) = b 
%         end
%     if f == 0
%     end
% end

% plot(b);
% c = findpeaks(b);
% heartbeats = c*video seconds
% how to find video seconds? find duration/frames = frame rate


