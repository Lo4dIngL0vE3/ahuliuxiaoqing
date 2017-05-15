% map ÐèÒªÑ¹Ëõ´«ËÍ
clc
k = 22;
fid = fopen('Img.jpg');
ImgData = fread(fid);
locff = find(ImgData==255);
jpgHeadData = fun_read_header(locff,ImgData);
[H, W] = fun_read_sof_wh(locff,ImgData);
height = H*256;
width = W*256;

%% To get huffman table
locc4 = find(ImgData(locff+1,1)==196);%Getting FFC4
if length(locc4)>1
	huffDcData = fun_read_dht(locff,ImgData,fid,1);%Get huffman table data
	dcHuffTable = fun_huff_dctable(huffDcData);%Get DC huffman  table
	huffAcData = fun_read_dht(locff,ImgData,fid,2);
	acHuffTable = fun_huff_actable(huffAcData);
else
    [huffDcData,huffAcData] = fun_read_huff(locff,locc4,ImgData,fid);
	dcHuffTable = fun_huff_dctable(huffDcData);
    %read DC huffman table--£¬The first code length,Followed by is bits of code word
	acHuffTable = fun_huff_actable(huffAcData);   %run - category - length - base code length -  base code
end

LocDB = find(ImgData(locff+1)==219);
DQT = ImgData(locff(LocDB)+5:locff(LocDB)+68);
%% Get  binary data stream
sosData = fun_read_sos(locff,ImgData,fid);% For scanning of effective image data compression
sosDataClr = fun_dlt_zero(sosData);   %Removal of data compression in 255 after supplemented 00
sosBits = fun_gen_bits(sosDataClr);   %The data compression section to form one line of code flow of 0 or 1
init_len = length(sosBits);         %The original code stream bits
%% to get DC/AC coefficients
[~,~,row,col] = fun_jpg_size(ImgData,locff);
blockNum = row*col;          %Calculate the 8 * 8 blocks in image segmentation
[y,c] = fun_read_matrixData(sosBits,dcHuffTable,acHuffTable,blockNum);
Py = y;

%% reshape DC coefficients - Decryption of DC coefficients
t = ceil(blockNum/4);
for i = 1:blockNum
    DCcoe2(i) = y{i}(1);
end
DCcoe2 = reshape(DCcoe2,[4,t]);
DCcoe2 = DCcoe2';
for i = 1:3
    DCcoe2 = circshift(DCcoe2,[-1,-k]);
end
for i = 1:blockNum
    y{i}(1) = DCcoe2(i);
end
%% I Quantificat
for i = 1:length(map)
    if map(i)==1
        y{i}(2:end) = round((y{i}(2:end)*5)/4);
    end
end

%% Decryption of AC coefficients
rand('seed',k);
ACkey = round(rand(blockNum*63,12));
n = 1;
for j = 1:blockNum
    if length(y{j})<2
        continue;
    end
    for k = 2:length(y{j})
        if y{j}(k)~=0
            y{j}(k) = fun_xor(y{j}(k),ACkey((j-1)*63+k-1,:));
        else
            continue;
        end
    end
end


%% close
fclose(fid);

%% Code-JPEG
[bitstream,check] = codeBinary(y,dcHuffTable,acHuffTable);
d = ceil(length(bitstream)/8)*8-length(bitstream);
bitstream = [bitstream,ones(1,d)];
L = length(bitstream)/8;
for i = 1:L
    s = bitstream((i-1)*8+1:i*8);
    IntData(i) = bin2dec(num2str(s));
end
Iil = length(find(IntData==255));
IntNum = Iil+ L;
m = 1;
n = 1;
SosData = [];
while m<=IntNum
    if IntData(n)~=255
        SosData(m) = IntData(n);
        m = m+1;
        n = n+1;
    else
        SosData(m) = IntData(n);
        m = m+2;
        n = n+1;
    end
end
SosData(m) = 255;
SosData(m+1) = 217;
jpgHeadData = jpgHeadData';
newImgData = [jpgHeadData,SosData];
fid = fopen('newImg.jpg','w+');
fwrite(fid,uint8(newImgData),'uint8');
fclose(fid);
nImg = imread('newImg.jpg');
imshow(nImg);