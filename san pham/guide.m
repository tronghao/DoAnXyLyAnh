function varargout = guide(varargin)
% GUIDE MATLAB code for guide.fig
%      GUIDE, by itself, creates a new GUIDE or raises the existing
%      singleton*.
%
%      H = GUIDE returns the handle to a new GUIDE or the handle to
%      the existing singleton*.
%
%      GUIDE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIDE.M with the given input arguments.
%
%      GUIDE('Property','Value',...) creates a new GUIDE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guide_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guide_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guide

% Last Modified by GUIDE v2.5 13-Jan-2020 14:34:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guide_OpeningFcn, ...
                   'gui_OutputFcn',  @guide_OutputFcn, ...
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


% --- Executes just before guide is made visible.
function guide_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guide (see VARARGIN)

% Choose default command line output for guide
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guide wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guide_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S;
[fileName, path] = uigetfile({'*.jpg;*.png;','Imges (*.jpg,*.png)'; '*.*',  'All Files (*.*)'}, 'File Selector');
fullPath = strcat(path, fileName);
S = imread(fullPath);
axes(handles.axes1);
imshow(S);



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global T;
[fileName, path] = uigetfile({'*.jpg;*.png;','Imges (*.jpg,*.png)'; '*.*',  'All Files (*.*)'}, 'File Selector');
fullPath = strcat(path, fileName);
T = imread(fullPath);
axes(handles.axes2);
imshow(T);



function doPH_Callback(hObject, eventdata, handles)
% hObject    handle to doPH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of doPH as text
%        str2double(get(hObject,'String')) returns contents of doPH as a double


% --- Executes during object creation, after setting all properties.
function doPH_CreateFcn(hObject, eventdata, handles)
% hObject    handle to doPH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S;
global T;

S = imresize(S, [500, 500]);
T = imresize(T, [500,500]);

k=rgb2gray(S);
levelS = graythresh(S);
k=im2bw(S, levelS);
% k = edge(k, 'Canny');
% [dongk, cotk] = size(k);
% for i=1:dongk
%     for j=1:cotk
%         if k(i,j) == 1
%             k(i,j) = 0;
%         else k(i,j) = 1;
%         end
%     end
% end



p=rgb2gray(T);
levelT = graythresh(T);
p=im2bw(T, levelT);
% p = edge(p, 'Canny');
% [dongp, cotp] = size(p);
% for i=1:dongp
%     for j=1:cotp
%         if p(i,j) == 1
%             p(i,j) = 0;
%         else p(i,j) = 1;
%         end
%     end
% end



edge_det_k = k;
edge_det_p = p;

%output
OUTPUT_MESSAGE = 'Hoaøn toaøn phuø hôïp';
OUTPUT_MESSAGE2 = 'Gaàn gioáng';
OUTPUT_MESSAGE3 = 'Khoâng gioáng';

% edge_det_k = edge(k,'Canny');
% edge_det_p = edge(p,'Canny');
[dong cot] = size(edge_det_k);
[rowp colp] = size(edge_det_p);

matched_data = 0;
white_points = 0;
black_points = 0;
%for loop used for detecting black and white points in the picture.
for a = 1:1:dong
    for b = 1:1:cot
        if(edge_det_k(a,b)==1)
            white_points = white_points+1;
        else
            black_points = black_points+1;
        end
    end
end

%for loop comparing the white (edge points) in the two pictures
for i = 1:1:dong
    for j = 1:1:cot
        if(edge_det_k(i,j)==1)&(edge_det_p(i,j)==1)
            matched_data = matched_data+1;
            else
                ;
        end
    end
end
fprintf('\n %d \n %d \n %d', white_points, black_points, matched_data);

%calculating percentage matching.
total_data = white_points;
total_matched_percentage = (matched_data/total_data)*100;
set(handles.doPH, 'String', total_matched_percentage);
if total_matched_percentage == 100
    set(handles.kq, 'String', OUTPUT_MESSAGE);
elseif total_matched_percentage >= 70
    set(handles.kq, 'String', OUTPUT_MESSAGE2);
else
    set(handles.kq, 'String', OUTPUT_MESSAGE3);
end




function kq_Callback(hObject, eventdata, handles)
% hObject    handle to kq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kq as text
%        str2double(get(hObject,'String')) returns contents of kq as a double


% --- Executes during object creation, after setting all properties.
function kq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
cla reset;
axes(handles.axes2);
cla reset;
set(handles.doPH, 'String', '');
set(handles.kq, 'String', '');
