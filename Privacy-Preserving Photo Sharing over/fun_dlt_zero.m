function y= fun_dlt_zero(y)
%Enter y is SOS except the markers such as processing of data compression
%255 after zero output y to remove part of the image data compression
locff = find(y==255);
b = find(y(locff+1,1)==0);
[m,n] = size(locff);
i=0;
for j=1:m
       y(locff(j,1)+1-i)=[];    
          i=i+1; 
end
  
end