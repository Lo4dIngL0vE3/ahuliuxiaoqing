function [DC,AC]= fun_read_huff(locff,locc4,ImgData,fid)

c4ff = locff(locc4,1);  %c4ff id the FF's location of FFC4
k = ImgData((c4ff +2),1)*16*16+ImgData((c4ff +3),1);  %Each tag length
status = fseek(fid,c4ff -1,'bof');
dht = fread(fid,k+2,'uint8');

dhtDcLoc = 5;
dcVariety = sum(dht(6:21,1));
DC = dht(6:21+dcVariety,1);
DC = [255;196;floor((length(DC)+3)/256);mod((length(DC)+3),256);dht(dhtDcLoc,1);DC];

dhtAcLoc = dhtDcLoc+17+dcVariety;
acVariety = sum(dht(dhtAcLoc+1:dhtAcLoc+16,1));
AC = dht(dhtAcLoc+1:dhtAcLoc+16+acVariety,1);
AC = [255;196;floor((length(AC)+3)/256);mod((length(AC)+3),256);dht(dhtAcLoc,1);AC];

end