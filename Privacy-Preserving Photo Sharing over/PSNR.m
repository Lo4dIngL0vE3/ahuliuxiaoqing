function psnr=PSNR(originalImg,stigoImg)
originalImg=double(originalImg);
stigoImg=double(stigoImg);
E=originalImg-stigoImg;
MSE=mean2(E.*E);
if MSE==0
    psnr=-1;
else
    psnr=10*log10(255*255/MSE);
end