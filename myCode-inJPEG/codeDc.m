function  y = codeDc(dif,dcTable)

if dif<0
    dif = -dif;
    binDif = dec2bin(dif);
    matDif = str2num(binDif(:));
    L = length(matDif);
    orDif = bitxor(dif,2^L-1);
    f = dec2bin(orDif,L);
    data = str2num(f(:))';
    size = L+1;
elseif dif==0
    data = [];
    size = 1;
else
    f = dec2bin(dif);
    data = str2num(f(:))';
    size = length(data)+1;
end
code = dcTable(size,2:dcTable(size)+1);
y = [code,data];
end