clear
clc
ImgData = imread('Fig_characters_test_pattern.tif');
[row,col] = size(ImgData);
subplot(2,3,1),imshow(ImgData);title('原图')
y1 = fspecial('gaussian',5,2);
newImg1 = imfilter(ImgData,y1,'symmetric');
subplot(2,3,2),imshow(newImg1);title('半径大小为5X5');
y2 = fspecial('gaussian',15,2);
newImg2 = imfilter(ImgData,y2,'symmetric');
subplot(2,3,3),imshow(newImg2);title('半径大小为15X15');
y3 = fspecial('gaussian',30,2);
newImg3 = imfilter(ImgData,y3,'symmetric');
subplot(2,3,4),imshow(newImg3);title('半径大小为30X30');
y4 = fspecial('gaussian',80,2);
newImg4 = imfilter(ImgData,y4,'symmetric');
subplot(2,3,5),imshow(newImg4);title('半径大小为80X80');
y5 = fspecial('gaussian',230,2);
newImg5 = imfilter(ImgData,y5,'symmetric');
subplot(2,3,6),imshow(newImg5);title('半径大小为230X230');
