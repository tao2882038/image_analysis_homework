%主文件
clc;
clear all;
close all;
%申明全局变量 R：区域生长的结果图像；BW：二值化图像；counter：感兴趣连通区域的像素个数
%row：图像的行数；col：图像的列数
global R row col
Q = imread('1-03.tif');
% [row,col] = size(Q);
figure,imshow(Q);
% figure,imhist(Q,256);
I = double(Q);
[row,col] = size(I);
% figure,imshow(I)
% level = graythresh(I);%设定阈值
% BW = im2bw(I,level);
% figure,imshow(BW);
% imhist(Q);
  
[y0,x0] = getpts;%获得区域生长起始点
x0 = round(x0);%化为整数，，，虽然我觉得没有必要
y0 = round(y0);
x0 = uint32(x0);%
y0 = uint32(y0);%
R = zeros(row,col);

for f=0:0.2:1
    
    R=Regiongrow(x0,y0,4,Q,f);
    figure,imshow(R);
end
