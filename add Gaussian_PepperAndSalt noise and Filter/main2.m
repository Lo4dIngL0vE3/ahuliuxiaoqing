clear
clc
ImgData = imread('ckt-board-orig.tif');
ImgNoise1 = salt_pepper_Noise(ImgData,0.1,0.1);
subplot(2,2,1),imshow(ImgNoise1),title('10%��+10%������');
newImg1 = medianFiltering(ImgData,3);
subplot(2,2,2),imshow(newImg1),title('3X3��ֵ�˲�');
ImgNoise2 = imnoise(ImgData,'gaussian',0.1,0.01);
subplot(2,2,3),imshow(ImgNoise2),title('��ֵ0.1������0.01��˹����');
newImg2 = Alpha_trimedFliter(ImgData,3,4);
subplot(2,2,4),imshow(newImg2),title('3X3�����������˲�');