clc;
close all;
clear all;
srcfiles_q=dir('C:\Users\ECE22\Desktop\New folder\DB10\*.jpg');
for q=1:length(srcfiles_q)  
 query_img_1=strcat('C:\Users\ECE22\Desktop\New folder\DB10\',srcfiles_q(q).name);   
 query_img=imread( query_img_1);
Radius = [4 6];
RegionColNum =6;
 RegionRowNum = 6; 
 OffSet = [0 pi/4];
%%  feature vector of query image.
fea_vect_query1= main(query_img, RegionRowNum, RegionColNum, Radius);% main function call for generation of feature vector of guery image.
fea_vect_query=transpose(fea_vect_query1);
fea_vect_DB=zeros(1,767);
srcfiles=dir('C:\Users\ECE22\Desktop\New folder\DB\*.jpg');
for y=1:length(srcfiles)
input1=strcat('C:\Users\ECE22\Desktop\New folder\DB\',srcfiles(y).name); 
input=imread(input1);
%%  feature vector of database images.
fea_vect_DB1=main(input, RegionRowNum, RegionColNum, Radius);% main function call for generation of feature vector of database images.
fea_vect_DB=transpose(fea_vect_DB1);
%% similarity distance metric D
D(y)=(fea_vect_DB-fea_vect_query)/(1+fea_vect_DB+fea_vect_query);

end

 [M,I] = sort(abs(D),'ascend');index=length(I);

 for i=1:100
      temp_P(i)=ceil(I(i)/100);
      if(temp_P(i)==9)
          temp_P(i)=1;
      else
          temp_P(i)=0;
      end
  end
  n=sum(temp_P);
  temp_1=zeros(1,100);
   for j=1:n
      temp_1(j)=ceil(I(j)/100);
      if(temp_1(j)==9)
          temp_1(j)=1;
      else
          temp_1(j)=0;
      end
  end
  P(q)=(1/n)*sum(temp_1)*100;
  R(q)=(1/100)*sum(temp_P)*100;

end
%% save a result
filename1 = 'Pdcp9file.xlsx';
xlswrite(filename1,P);
filename2='Rdcp9file.xlsx';
xlswrite(filename2,R);
