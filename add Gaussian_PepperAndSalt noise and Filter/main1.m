clear
clc
ImgData = imread('ckt-board-orig.tif');
%% �⺯��������
figure(1);
ImgNoise1 = imnoise(ImgData,'gaussian',0.1,0.01);
subplot(1,2,1),imshow(ImgNoise1),title('��ֵ0.1������0.01��˹����');
ImgNoise2 = imnoise(ImgData,'salt & pepper',0.1);
subplot(1,2,2),imshow(ImgNoise2),title('10%��������');
%% �Զ��庯��������
figure(2);
ImgNoise1 = add_gaussian_Noise(ImgData,30);
subplot(1,2,1),imshow(ImgNoise1),title('30dB��˹����');
ImgNoise2 = salt_pepper_Noise(ImgData,0.05,0.05);
subplot(1,2,2),imshow(ImgNoise2),title('10%��������');