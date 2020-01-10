function[im_lbp]=lbp_image(input)
im=input;
[r c]=size(im);
im_lbp=zeros(r,c);
 for m=2:r-1
     for n=2:c-1
        a=im(m-1:m+1,n-1:n+1);
          for i=1:3
             for j=1:3
               f0(i,j)=(a(i,j)-a(5));
               if f0(i,j)>0
               f(i,j)=1;
               else
               f(i,j)=0;
               end
            end
          end
        ref=[8 4 2;16 0 1;32 64 128];                                                                                                                                                                                                                 
        im_lbp(m,n)= sum(sum(ref.*f)) ;
    end
end
end