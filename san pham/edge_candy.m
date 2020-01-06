% I = imread('Lena.png');
% I2 = rgb2gray(I);
% level = graythresh(I2);
% I3 = im2bw(I2, level);
% I4 = edge(I3, 'Canny');
% [D,IDX] = bwdist(I4, 'euclidean');
% imshow(I3);
% [row col] = size(I3);
% diemDen = uint32(0);
% diemTrang = uint32(0);
% diemCanhCanny = uint32(0);
% for i=1:row
%     for j=1:col
%         if I3(i,j) == 0
%             diemDen = diemDen + 1;
%         else
%             diemTrang = diemTrang + 1;
%         end
%         if I4(i,j) == 1
%             diemCanhCanny = diemCanhCanny + 1;
%         end
%     end
% end
% 
% %imshow(I3), title('Euclidean')
% % hold on, 
% % I3 = imcontour(D);
% 
% 
% 
k=imread('xe3.jpg');
k=rgb2gray(k);
levelk = graythresh(k);
k=im2bw(k, levelk);

p=imread('xe4.jpg');
p=rgb2gray(p);
levelp = graythresh(p);
p=im2bw(p, levelp);

edge_det_k = k;
edge_det_p = p;


% edge_det_k = edge(k,'Canny');
% edge_det_p = edge(p,'Canny');
[rowk colk] = size(edge_det_k);
[rowp colp] = size(edge_det_p);
dong = uint32(0);
if rowk < rowp
    dong = rowk;
else dong = rowp;
end
cot = uint32(0);
if colk < colp
    cot = colk;
else cot = colp;
end
subplot()

matched_data = 0;
white_points = 0;
black_points = 0;
x=0;
y=0;
l=0;
m=0;
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
display('testing');
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
    



%calculating percentage matching.
total_data = white_points;
total_matched_percentage = (matched_data/total_data)*100;
%handles.pp=total_matched_percentage;
%guidata(hObject,handles);

%outputting the result of the system.

