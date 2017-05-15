clear
clc
ImgData = imread('ckt-board-orig.tif');
ImgNoise1 = salt_pepper_Noise(ImgData,0.1,0.1);
subplot(2,2,1),imshow(ImgNoise1),title('10%椒+10%盐噪声');
newImg1 = medianFiltering(ImgData,3);
subplot(2,2,2),imshow(newImg1),title('3X3中值滤波');
ImgNoise2 = imnoise(ImgData,'gaussian',0.1,0.01);
subplot(2,2,3),imshow(ImgNoise2),title('均值0.1，方差0.01高斯噪声');
newImg2 = Alpha_trimedFliter(ImgData,3,4);
subplot(2,2,4),imshow(newImg2),title('3X3修正阿尔法滤波');