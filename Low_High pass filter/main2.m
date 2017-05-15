clear
clc
ImgData = imread('Fig_characters_test_pattern.tif');
figure(1)
imshow(ImgData),title('ԭʼͼ��');
%% �����ͨ�˲�
figure(2)
IdealImg = Ideal_low_pass(ImgData,30);
subplot(2,3,1),imshow(IdealImg),title('�����ͨ�˲�');
%% 2�װ�����˹��ͨ�˲�
buttImg1 = butLowFilter(ImgData,5,2);
subplot(2,3,2),imshow(buttImg1),title('����Ƶ��5Hz*��ͨ�˲�');
buttImg2 = butLowFilter(ImgData,15,2);
subplot(2,3,3),imshow(buttImg2),title('����Ƶ��15Hz*��ͨ�˲�');
buttImg3 = butLowFilter(ImgData,30,2);
subplot(2,3,4),imshow(buttImg3),title('����Ƶ��30Hz*��ͨ�˲�');
buttImg4 = butLowFilter(ImgData,80,2);
subplot(2,3,5),imshow(buttImg4),title('����Ƶ��80Hz*��ͨ�˲�');
buttImg5 = butLowFilter(ImgData,230,2);
subplot(2,3,6),imshow(buttImg5),title('����Ƶ��230Hz*��ͨ�˲�');
