
clc;
clear all;
close all;
im1=imread('A:\bhavana_project\trial.jpg');
im=rgb2gray(im1);
subplot(2,2,1);imshow(im);title('original image');
%% LBP output for image
 lbp=lbp_image(im);% call function
 subplot(2,2,2);imshow(lbp);title('LBP Pattern');% LBP output 
 %% LTP output for image
[row col]=size(im);
 ltp_upperPattern=zeros(row,col);
 ltp_lowerpattern=zeros(row,col);
threshold=5;
 for r=2:row-1
     for c=2:col-1
        a=im(r-1:r+1,c-1:c+1);
         centerPixel =im(r,c);
         lm=centerPixel-threshold;
         um=centerPixel+threshold;
         for i=1:3
         for j=1:3
          if a(i,j)>=um
            f(i,j)=1;
          elseif a(i,j)<=lm
            f(i,j)=-1;
          end
         end
         end
         f1=f(1:3,1:3);
         f2=f1;
         ref=[8 4 2;16 0 1;32 64 128];
         for i=1:3
         for j=1:3
            if f1(i,j)==1
               upperPattern(i,j)=1;
            else
              upperPattern(i,j)=0;
            end
            if f2(i,j)==-1
            lowerpattern(i,j)=1;
            else
            lowerpattern(i,j)=0;
            end
         end
         end
         ltp_upperPattern(r,c)=uint8(sum(sum(ref.*upperPattern)));
         ltp_lowerpattern(r,c)=uint8(sum(sum(ref.*lowerpattern)));
     end
 end
%LTP output
 subplot(2,2,3);imshow(ltp_upperPattern,[]);title('LTP upperPattern');
subplot(2,2,4);imshow(ltp_lowerpattern,[]);title('LTP lowerpattern');