clc;
clear all;
close all;
input=imread('E:\bhavana_project\trial.jpg');
subplot(2,3,1);imshow(input);title('Orginal Image');
im=rgb2gray(input); 
% subplot(2,2,1);imshow(im);
% [pixelCount grayLevels] = imhist(im);
% subplot(2, 2, 2); 
% bar(pixelCount);
% subplot(2,2,3); imhist(im);
im=double(im);
[row col]=size(im);
%% find Iimage direction
for r=2:row-1
    for c=2:col-1
         gc=im(r,c);
        gh=im(r,c+1);gv=im(r-1,c);
        I0(r,c)=gh-gc;
        I90(r,c)=gv-gc;
    end
end
% [l1 m1]=size(I0_1);
% I0=I0_1(2:l1,2:m1);
% I90=I90_1(2:l1,2:m1);
[p q]=size(I0);
Idir=zeros(row,col);
for l=1:p
    for m=1:q
        if I0(l,m) >=0 && I90(l,m) >=0
               Idir(l,m)=1;
           elseif I0(l,m) >=0 && I90(l,m) < 0
               Idir(l,m)=4;
           end
           if I0(l,m) < 0 && I90(l,m) >=0
                Idir(l,m)=2;
           elseif I0(l,m) < 0 &&I90(l,m) < 0
                Idir(l,m)=3;
           end
    end
end

[r c]=size(Idir);
ltrp=zeros(r,c,8);
tp=zeros(1,8);
p=zeros(3,3);
for m=2:r-1
     for n=2:c-1
         p=Idir(m-1:m+1,n-1:n+1);
         for u=1:3
            for v=1:3
                if(p(u,v)==p(5))
                 p(u,v)=0;
                else
                    p(u,v)=p(u,v);
                end 
            end
         end
           tp(1)=p(2,3);
           tp(2)=p(1,3);
           tp(3)=p(1,2);
           tp(4)=p(1,1);
           tp(5)=p(2,1);
           tp(6)=p(3,1);
           tp(7)=p(3,2);
           tp(8)=p(3,3);
           ltrp(m,n,:)=tp;
     end
end
%% find direction patterm
[mm,nn,pp]=size(ltrp);
res=zeros(row,col,8);
for z=1:8
for i=2:mm
    for j=2:nn
        res(i-1,j-1,z)=ltrp(i,j,z);
    end
end
end    
idirec=Idir;
 patt=zeros(1,8);
 patt2=zeros(1,8);
 patt3=zeros(1,8);
 patt4=zeros(1,8);
 patt5=zeros(1,8);
 patt6=zeros(1,8);
 patt7=zeros(1,8);
 patt8=zeros(1,8);
 patt9=zeros(1,8);
 patt10=zeros(1,8);
 patt11=zeros(1,8);
 patt12=zeros(1,8);
for i=1:row
    for j=1:col
            if(idirec(i,j)==1)
                for z=1:8
                    if(res(i,j,z)==2)
                        patt(z)=1;
                    else
                        patt(z)=0;
                    end
                    if(res(i,j,z)==3)
                        patt2(z)=1;
                    else
                        patt2(z)=0;
                    end
                    if(res(i,j,z)==4)
                        patt3(z)=1;
                    else
                        patt3(z)=0;
                    end
                end
                s=0;
                s2=0;
                s3=0;
                for bin=1:8
                        s=s+2^(bin-1)*patt(bin);
                        s2=s2+2^(bin-1)*patt2(bin);
                        s3=s3+2^(bin-1)*patt3(bin);
                end
                ltrpat1(i,j)=s;
                ltrpat2(i,j)=s2;
                ltrpat3(i,j)=s3;
            else
                ltrpat1(i,j)=0;
                ltrpat2(i,j)=0;
                ltrpat3(i,j)=0;
            end
            if(idirec(i,j)==2)
                for z=1:8
                    if(res(i,j,z)==1)
                        patt4(z)=1;
                    else
                        patt4(z)=0;
                    end
                    if(res(i,j,z)==3)
                        patt5(z)=1;
                    else
                        patt5(z)=0;
                    end
                    if(res(i,j,z)==4)
                        patt6(z)=1;
                    else
                        patt6(z)=0;
                    end
                end
                s4=0;
                s5=0;
                s6=0;
                for bin=1:8
                        s4=s4+2^(bin-1)*patt4(bin);
                        s5=s5+2^(bin-1)*patt5(bin);
                        s6=s6+2^(bin-1)*patt6(bin);
                end
                ltrpat4(i,j)=s4;
                ltrpat5(i,j)=s5;
                ltrpat6(i,j)=s6;
            else
                ltrpat4(i,j)=0;
                ltrpat5(i,j)=0;
                ltrpat6(i,j)=0;
            end
            if(idirec(i,j)==3)
                for z=1:8
                    if(res(i,j,z)==1)
                        patt7(z)=1;
                    else
                        patt7(z)=0;
                    end
                    if(res(i,j,z)==2)
                        patt8(z)=1;
                    else
                        patt8(z)=0;
                    end
                    if(res(i,j,z)==4)
                        patt9(z)=1;
                    else
                        patt9(z)=0;
                    end
                end
                s7=0;
                s8=0;
                s9=0;
                for bin=1:8
                        s7=s7+2^(bin-1)*patt7(bin);
                        s8=s8+2^(bin-1)*patt8(bin);
                        s9=s9+2^(bin-1)*patt9(bin);
                end
                ltrpat7(i,j)=s7;
                ltrpat8(i,j)=s8;
                ltrpat9(i,j)=s9;
            else
                ltrpat7(i,j)=0;
                ltrpat8(i,j)=0;
                ltrpat9(i,j)=0;
            end
            if(idirec(i,j)==4)
                for z=1:8
                    if(res(i,j,z)==1)
                        patt10(z)=1;
                    else
                        patt10(z)=0;
                    end
                    if(res(i,j,z)==2)
                        patt11(z)=1;
                    else
                        patt11(z)=0;
                    end
                    if(res(i,j,z)==3)
                        patt12(z)=1;
                    else
                        patt12(z)=0;
                    end
                end
                s10=0;
                s11=0;
                s12=0;
                for bin=1:8
                        s10=s10+2^(bin-1)*patt10(bin);
                        s11=s11+2^(bin-1)*patt11(bin);
                        s12=s12+2^(bin-1)*patt12(bin);
                end
                ltrpat10(i,j)=s10;
                ltrpat11(i,j)=s11;
                ltrpat12(i,j)=s12;
            else
                ltrpat10(i,j)=0;
                ltrpat11(i,j)=0;
                ltrpat12(i,j)=0;
            end
    end
end 
%% magnitude pattern 
[row col]=size(im);
ltrp_mag_Image=zeros(row,col);
 for r=2:row-1
     for c=2:col-1
             gc=im(r,c);
             gh=im(r,c+1);gv=im(r-1,c);
             I0ref=gh-gc;
             I90ref=gv-gc;
             Mg_ref(r,c)=sqrt(double(I0ref.^2+I90ref.^2));
     end
 end
for r=2:row-2
     for c=2:col-2 
             Mgc=Mg_ref(r,c);
            p1=Mg_ref(r, c+1) > Mgc;  
            p2=Mg_ref(r-1, c+1) > Mgc;   
            p3=Mg_ref(r-1, c) > Mgc;  
            p4=Mg_ref(r-1, c-1) > Mgc;     
            p5=Mg_ref(r, c-1) > Mgc;    
            p6=Mg_ref(r+1, c-1) > Mgc;      
            p7=Mg_ref(r+1, c) >Mgc;     
            p8=Mg_ref(r+1, c+1) > Mgc;  
            ltrp_mag_Image(r,c) = uint8(...
            p8 * 2^7 + p7 * 2^6 + ...
            p6 * 2^5 + p5 * 2^4 + ...
            p4 * 2^3 + p3 * 2^2 + ...
            p2 * 2 + p1);

     end
end
subplot(2,3,2);imshow(ltrpat1);title('2nd Order LTrP dir.1');
subplot(2,3,3);imshow(ltrpat2);title('2nd Order LTrP dir.2');
subplot(2,3,4);imshow(ltrpat3);title('2nd Order LTrP dir.3');
subplot(2,3,5);imshow(ltrpat4);title('2nd Order LTrP dir.4');
subplot(2,3,6);imshow(ltrp_mag_Image);title('2nd Order Mag. LTrP');
figure
subplot(2,4,1);imshow(ltrpat5);title('2nd Order LTrP dir.1');
subplot(2,4,2);imshow(ltrpat6);title('2nd Order LTrP dir.2');
subplot(2,4,3);imshow(ltrpat7);title('2nd Order LTrP dir.3');
subplot(2,4,4);imshow(ltrpat8);title('2nd Order LTrP dir.4');
subplot(2,4,5);imshow(ltrpat9);title('2nd Order LTrP dir.1');
subplot(2,4,6);imshow(ltrpat10);title('2nd Order LTrP dir.2');
subplot(2,4,7);imshow(ltrpat11);title('2nd Order LTrP dir.3');
subplot(2,4,8);imshow(ltrpat12);title('2nd Order LTrP dir.4');
