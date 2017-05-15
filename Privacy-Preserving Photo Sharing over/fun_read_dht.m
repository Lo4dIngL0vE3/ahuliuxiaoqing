function y = fun_read_dht(locff,ImgData,fid,num )
%提取文件头中得DHT段
m = find(ImgData(locff+1,1)==196);    %标记在a中行数数组
m = m(num,1);  %所需表标记在a中行数
n = locff(m,1);  %255，标记坐标
k = ImgData((n+2),1)*16*16+ImgData((n+3),1);  %各标记字节长度
status = fseek(fid,n-1,'bof');% bof-Before of File
y = fread(fid,k+2,'uint8');