%���ļ�
clc;
clear all;
close all;
%����ȫ�ֱ��� R�����������Ľ��ͼ��BW����ֵ��ͼ��counter������Ȥ��ͨ��������ظ���
%row��ͼ���������col��ͼ�������
global R row col
Q = imread('1-03.tif');
% [row,col] = size(Q);
figure,imshow(Q);
% figure,imhist(Q,256);
I = double(Q);
[row,col] = size(I);
% figure,imshow(I)
% level = graythresh(I);%�趨��ֵ
% BW = im2bw(I,level);
% figure,imshow(BW);
% imhist(Q);
  
[y0,x0] = getpts;%�������������ʼ��
x0 = round(x0);%��Ϊ������������Ȼ�Ҿ���û�б�Ҫ
y0 = round(y0);
x0 = uint32(x0);%
y0 = uint32(y0);%
R = zeros(row,col);

for f=0:0.2:1
    
    R=Regiongrow(x0,y0,4,Q,f);
    figure,imshow(R);
end
