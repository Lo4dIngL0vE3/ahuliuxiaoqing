clear
clc
ImgData = imread('Fig_characters_test_pattern.tif');
figure(1)
imshow(ImgData),title('原始图像');
%% 理想低通滤波
figure(2)
IdealImg = Ideal_low_pass(ImgData,30);
subplot(2,3,1),imshow(IdealImg),title('理想低通滤波');
%% 2阶巴特沃斯低通滤波
buttImg1 = butLowFilter(ImgData,5,2);
subplot(2,3,2),imshow(buttImg1),title('截至频率5Hz*低通滤波');
buttImg2 = butLowFilter(ImgData,15,2);
subplot(2,3,3),imshow(buttImg2),title('截至频率15Hz*低通滤波');
buttImg3 = butLowFilter(ImgData,30,2);
subplot(2,3,4),imshow(buttImg3),title('截至频率30Hz*低通滤波');
buttImg4 = butLowFilter(ImgData,80,2);
subplot(2,3,5),imshow(buttImg4),title('截至频率80Hz*低通滤波');
buttImg5 = butLowFilter(ImgData,230,2);
subplot(2,3,6),imshow(buttImg5),title('截至频率230Hz*低通滤波');
