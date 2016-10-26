% function image_out = susan(im,threshold)  
% 功能：实现运用SUNSAN算子进行边缘检测  
% 输入：image_in-输入的待检测的图像  
%       threshold-阈值  
% 输出：image_out-检测边缘出的二值图像  
im = imread('2-05.tif')
figure,imshow(im)
title('待检测原图');
% 将输入的图像矩阵转换成double型  
% d = length(size(im));  
% if d==3  
%     image=double(rgb2gray(im));  
% elseif d==2  
%     image=double(im);  
% end  
%    
% 建立SUSAN模板  

image=double(im);   
mask = ([ 0 0 1 1 1 0 0 ;0 1 1 1 1 1 0;1 1 1 1 1 1 1;1 1 1 1 1 1 1;1 1 1 1 1 1 1;0 1 1 1 1 1 0;0 0 1 1 1 0 0]);     
R=zeros(size(image));  
% 定义USAN 区域  
nmax = 3*37/4;  
  
 [a b]=size(image);  
new=zeros(a+7,b+7);  
[c d]=size(new);  
new(4:c-4,4:d-4)=image;  
    
for i=4:c-4  
      
    for j=4:d-4  
          
        current_image = new(i-3:i+3,j-3:j+3);  
        current_masked_image = mask.*current_image;  
     
%   调用susan_threshold函数进行阈值比较处理  
                  
        current_thresholded = susan_threshold(current_masked_image,6);  
        g=sum(current_thresholded(:));  
          
        if nmax<g  
            R(i,j) = g-nmax;  
        else  
            R(i,j) = 0;  
        end  
    end  
end  
   
image_out=R(4:c-4,4:d-4);  
figure,imshow(image_out)
title('SUSAN检测后图像');