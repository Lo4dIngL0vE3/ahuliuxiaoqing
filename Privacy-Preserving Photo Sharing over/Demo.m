clear
clc
a = imread('Lena-71.jpg');
% b = ones(512,512);
% d = 1:4096;
% c = 1:4096;
% c = reshape(c,[64,64])';
% Location = circshift(c,[32,32]);
% for i = 1:64
%     for j = 1:64
%         n = mod(Location(i,j),64);
%         m = ((Location(i,j)-n)/64)+1;
%         if n==0
%             n = 64;
%             m = m-1;
%         end
%         b((i-1)*8+1:i*8,(j-1)*8+1:j*8) = a((m-1)*8+1:m*8,(n-1)*8+1:n*8);
%     end
% end
% b = uint8(b);
% imshow(b)
mask = [-1 -1 -1;-1 8 -1;-1 -1 -1];
d = imfilter(a,mask);
figure(1)
imshow(d)
figure(2)
imhist(d)