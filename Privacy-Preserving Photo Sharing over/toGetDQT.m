% clear
clc
fid = fopen('Lena-1.jpg');
I = fread(fid);
Locff = find(I==255);
LocDB = find(I(Locff+1)==219);
DQT = I(Locff(LocDB)+5:Locff(LocDB)+68);
fclose(fid);