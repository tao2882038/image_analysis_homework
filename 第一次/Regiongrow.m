
function R=Regiongrow(x0,y0,mode,I,f)

%���ܣ�        ģ��ջ���Ƚ����˼·�Զ�ֵ��ͼ��ָ����ͨ����ʵ����������                         

%���������    x0,y0��ʾ�������������꣬mode��ʾ�Զ���������������������ȡmode = 4��mode = 8��

%���������    void                                                                                                                           
global  row col

zhan = zeros(row*col,2);%����ջ����

pzhan = 0;              %ջ����
c = numel(x0);

[m,n]=size(I);

R=zeros(m,n); %����һ���հ�����
for a=1:1:c%����ʼѡȡ���ӵ���ջ
        pzhan=pzhan+1;
        zhan(pzhan,1) = x0(a);
        zhan(pzhan,2) = y0(a);
        R(x0(a),y0(a)) = 255; 
end
%   ����ɨ��
while pzhan ~= 0
    x=zhan(pzhan,1);
    y=zhan(pzhan,2);
    pzhan=pzhan-1;
   dh = I(x,y)
  if 4 == mode  %4��������
    i=0;
        for j = -1:2:1
            if y+j>0 && y+j <col
               % dt = abs(I(x,y)-I(x+i,y+j));
                dt = abs(dh-I(x+i,y+j));
                if dt<f && R(x,y)~=R(x+i,y+j)
%                 if(I(x+i,y+j)>double(dh)-f && I(x+i,y+j)<double(dh)+f && R(x,y)~=R(x+i,y+j))
                   R(x+i,y+j)=R(x,y);
                   pzhan = pzhan+1;
                   zhan(pzhan,1)=x+i;
                   zhan(pzhan,2)=y+j;
                end
            end
        end
    j=0;
        for i = -1:2:1
            if x+i>0 && x+i <row
                %dt = abs(I(x,y)-I(x+i,y+j));
                 dt = abs(dh-I(x+i,y+j));
                if dt<f && R(x,y)~=R(x+i,y+j)
%                  if(I(x+i,y+j)>double(dh)-f && I(x+i,y+j)<double(dh)+f && R(x,y)~=R(x+i,y+j))
                   R(x+i,y+j)=R(x,y);
                   pzhan = pzhan+1;
                   zhan(pzhan,1)=x+i;
                   zhan(pzhan,2)=y+j;
                end
            end
        end
  if 8 == mode   %8��������
    for i = -1 : 1
        for j = -1 : 1
            if x+i > 0 && x+i <= row && y+j > 0 && y+j <= col 
                  dt = abs(dh-I(x+i,y+j));
                if dt<f && R(x,y)~=R(x+i,y+j)
                   R(x+i,y+j)=R(x,y);
                   pzhan = pzhan+1; 
                   zhan(pzhan,1)=x+i;
                   zhan(pzhan,2)=y+j;
                end
            end
        end
    end
  end
  end
  end
end


%     x=zhan(pzhan,1);
%     y=zhan(pzhan,2);
%     pzhan=pzhan-1;
%     i=0;
%     while i+x<row
%         for j = -100:1:100
%             if y+j>0 && y+j <col
%                 dt = abs(I(x,y)-I(x+i,y+j));
%                 if dt<f && R(x,y)~=R(x+i,y+j)
%                    R(x+i,y+j)=R(x,y);
%                    pzhan = pzhan+1;
%                    zhan(pzhan,1)=x+i;
%                    zhan(pzhan,2)=y+j;
%                 end
%             end
%         end
%         i=i+1;
%     end
% end








% 
% if 4 == mode
%     while pzhan > 0
%         x1 = zhan(pzhan,1);
%         y1 = zhan(pzhan,2);
%         pzhan = pzhan - 1;
%         
%         for i = -1 : 2 : 1    
%             j = 0;
%             if x1+i > 0 && x1+i <= row && y1+j > 0 && y1+j <= col 
%                 dt = abs(I(x1+i,y1+j)-I(x1,y1));
%                 if dt<=f && R(x1+i,y1+j) ~=255
%                     R(x1+i,y1+j) = 255;
%                    % R(x1+i,y1+j) = I(x1,y1);
%                     %counter = %counter + 1;
%                     pzhan = pzhan + 1;
%                     zhan(pzhan,1) = x1 + i;
%                     zhan(pzhan,2) = y1 + j;           
%                 end           
%             end        
%         end
%         for j = -1 : 2 : 1    
%             i = 0;
% 
%             if x1+i > 0 && x1+i <= row && y1+j > 0 && y1+j <= col
%                 dt=abs(I(x1+i,y1+j)-I(x1,y1));
%                 if  dt<=f && R(x1+i,y1+j) ~= 255
%                     R(x1+i,y1+j) = 255;
%                   % R(x1+i,y1+j) = I(x1,y1);
%                     %counter = %counter + 1;
%                     pzhan = pzhan + 1;
%                     zhan(pzhan,1) = x1 + i;
%                     zhan(pzhan,2) = y1 + j;           
%                 end
%             end        
%         end
%     end
% end

% end