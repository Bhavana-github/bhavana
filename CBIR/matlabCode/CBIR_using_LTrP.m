clc;
close all;
clear all;
srcfiles_q=dir('C:\Users\ECE22\Desktop\New folder\DB5\*.jpg');
for q=1:length(srcfiles_q)  
 query_img_1=strcat('C:\Users\ECE22\Desktop\New folder\DB5\',srcfiles_q(q).name);   
 query_img=imread( query_img_1);
%%  feature vector of query image.
fea_vect_query=zeros(1,767);
fea_vect_query=LTrPs(query_img);% LTrPs function call for generation of feature vector of guery images.
fea_vect_DB=zeros(1,767);
srcfiles=dir('C:\Users\ECE22\Desktop\New folder\DB\*.jpg');
for y=1:length(srcfiles)
input1=strcat('C:\Users\ECE22\Desktop\New folder\DB\',srcfiles(y).name); 
input=imread(input1);
%%  feature vector of database images.
fea_vect_DB=LTrPs(input); % LTrPs function call for generation of feature vector of database images.
%% similarity distance metric D
D(y)=(fea_vect_DB-fea_vect_query)/(1+fea_vect_DB+fea_vect_query);

end


 [M,I] = sort(abs(D),'ascend');
 [N p]=sort(D,'ascend');
  I1=find(~D);
  index=length(I);
%   for i=1:100
%       temp(i)=ceil(I(i)/100);
%       if(temp(i)==4)
%           temp(i)=1;
%       else
%           temp(i)=0;
%       end
%   end
%   n=sum(temp);
  
  for j=1:100
      temp_P(j)=ceil(I(j)/100);
      if(temp_P(j)==4)
          temp_P(j)=1;
      else
          temp_P(j)=0;
      end
  end
  n=sum(temp_P);
   for j=1:n
      temp_1(j)=ceil(I(j)/100);
      if(temp_1(j)==4)
          temp_1(j)=1;
      else
          temp_1(j)=0;
      end
  end
  P(q)=(1/n)*sum(temp_1);
  R(q)=(1/100)*sum(temp_1);
  
 retrieval_img1=strcat('C:\Users\ECE22\Desktop\New folder\DB\',srcfiles(I1).name); 
 retrieval1_img=imread(retrieval_img1);
 figure; subplot(5,4,1);imshow(retrieval1_img);title(num2str(I1));
 
 retrieval_img2=strcat('C:\Users\ECE22\Desktop\New folder\DB\',srcfiles(I(2)).name); 
 retrieval2_img=imread(retrieval_img2);
 subplot(5,4,2);imshow(retrieval2_img);title(num2str(I(2)));
 
 retrieval_img3=strcat('C:\Users\ECE22\Desktop\New folder\DB\',srcfiles(I(3)).name); 
 retrieval3_img=imread(retrieval_img3);
 subplot(5,4,3);imshow(retrieval3_img);title(num2str(I(3)));
 
 retrieval_img4=strcat('C:\Users\ECE22\Desktop\New folder\DB\',srcfiles(I(4)).name); 
 retrieval4_img=imread(retrieval_img4);
 subplot(5,4,4);imshow(retrieval4_img);title(num2str(I(4)));
 
 retrieval_img5=strcat('C:\Users\ECE22\Desktop\New folder\DB\',srcfiles(I(5)).name); 
 retrieval5_img=imread(retrieval_img5);
 subplot(5,4,5);imshow(retrieval5_img);title(num2str(I(5)));
 
 retrieval_img6=strcat('C:\Users\ECE22\Desktop\New folder\DB\',srcfiles(I(6)).name); 
 retrieval6_img=imread(retrieval_img6);
 subplot(5,4,6);imshow(retrieval6_img);title(num2str(I(6)));
 
 retrieval_img7=strcat('C:\Users\ECE22\Desktop\New folder\DB\',srcfiles(I(7)).name); 
 retrieval7_img=imread(retrieval_img7);
 subplot(5,4,7);imshow(retrieval7_img);title(num2str(I(7)));
 
 retrieval_img8=strcat('C:\Users\ECE22\Desktop\New folder\DB\',srcfiles(I(8)).name); 
 retrieval8_img=imread(retrieval_img8);
 subplot(5,4,8);imshow(retrieval8_img);title(num2str(I(8)));
 
 retrieval_img9=strcat('C:\Users\ECE22\Desktop\New folder\DB\',srcfiles(I(9)).name); 
 retrieval9_img=imread(retrieval_img9);
 subplot(5,4,9);imshow(retrieval9_img);title(num2str(I(9)));
 
 retrieval_img10=strcat('C:\Users\ECE22\Desktop\New folder\DB\',srcfiles(I(10)).name); 
 retrieval10_img=imread(retrieval_img10);
 subplot(5,4,10);imshow(retrieval10_img);title(num2str(I(10)));
 
 retrieval_img10=strcat('C:\Users\ECE22\Desktop\New folder\DB\',srcfiles(I(11)).name); 
 retrieval10_img=imread(retrieval_img10);
 subplot(5,4,11);imshow(retrieval10_img);title(num2str(I(11)));
 
 retrieval_img10=strcat('C:\Users\ECE22\Desktop\New folder\DB\',srcfiles(I(12)).name); 
 retrieval10_img=imread(retrieval_img10);
 subplot(5,4,12);imshow(retrieval10_img);title(num2str(I(12)));
 
 retrieval_img10=strcat('C:\Users\ECE22\Desktop\New folder\DB\',srcfiles(I(13)).name); 
 retrieval10_img=imread(retrieval_img10);
 subplot(5,4,13);imshow(retrieval10_img);title(num2str(I(13)));
 
 retrieval_img10=strcat('C:\Users\ECE22\Desktop\New folder\DB\',srcfiles(I(14)).name); 
 retrieval10_img=imread(retrieval_img10);
 subplot(5,4,14);imshow(retrieval10_img);title(num2str(I(14)));
 
 retrieval_img10=strcat('C:\Users\ECE22\Desktop\New folder\DB\',srcfiles(I(15)).name); 
 retrieval10_img=imread(retrieval_img10);
 subplot(5,4,15);imshow(retrieval10_img);title(num2str(I(15)));
 
 retrieval_img10=strcat('C:\Users\ECE22\Desktop\New folder\DB\',srcfiles(I(16)).name); 
 retrieval10_img=imread(retrieval_img10);
 subplot(5,4,16);imshow(retrieval10_img);title(num2str(I(16)));
 
 retrieval_img10=strcat('C:\Users\ECE22\Desktop\New folder\DB\',srcfiles(I(17)).name); 
 retrieval10_img=imread(retrieval_img10);
 subplot(5,4,17);imshow(retrieval10_img);title(num2str(I(17)));
 
 retrieval_img10=strcat('C:\Users\ECE22\Desktop\New folder\DB\',srcfiles(I(18)).name); 
 retrieval10_img=imread(retrieval_img10);
 subplot(5,4,18);imshow(retrieval10_img);title(num2str(I(18)));
 
 retrieval_img10=strcat('C:\Users\ECE22\Desktop\New folder\DB\',srcfiles(I(19)).name); 
 retrieval10_img=imread(retrieval_img10);
 subplot(5,4,19);imshow(retrieval10_img);title(num2str(I(19)));
 
 retrieval_img10=strcat('C:\Users\ECE22\Desktop\New folder\DB\',srcfiles(I(20)).name); 
 retrieval10_img=imread(retrieval_img10);
 subplot(5,4,20);imshow(retrieval10_img);title(num2str(I(20)));
end
%% save a result
filename1 = 'PLTrP5.xlsx';
xlswrite(filename1,P);
filename2='RLTrP5.xlsx';
xlswrite(filename2,R);
