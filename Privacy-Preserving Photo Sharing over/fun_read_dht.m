function y = fun_read_dht(locff,ImgData,fid,num )
%��ȡ�ļ�ͷ�е�DHT��
m = find(ImgData(locff+1,1)==196);    %�����a����������
m = m(num,1);  %���������a������
n = locff(m,1);  %255���������
k = ImgData((n+2),1)*16*16+ImgData((n+3),1);  %������ֽڳ���
status = fseek(fid,n-1,'bof');% bof-Before of File
y = fread(fid,k+2,'uint8');