function y= fun_read_sos(locff,ImgData,fid)
%a is file all 255 rows
%z is machine code file
%y is SOS except the markers such as processing of data compression
m = find(ImgData(locff+1)==218);
n = locff(m,1); %FF mark coordinates
k = ImgData((n+2),1)*16*16+ImgData((n+3),1);  %Each tag length
e = find(ImgData(locff+1)==217);
g = locff(e,1)-n(1,1)-k(1,1)-2;  %FFD9-FFDA-D9'length-D9'tag_length
status = fseek(fid,n+k+1,'bof');
y = fread(fid,g,'uint8');

end