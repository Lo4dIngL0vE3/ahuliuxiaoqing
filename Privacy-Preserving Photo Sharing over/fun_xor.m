function Int = fun_xor(intA,arrayB)
%输入一个整数和一个数组进行异或操作
if intA>0
    s = dec2bin(intA);
    arrayA = str2num(s(:))';
    L = length(arrayA);
else
    intA = -intA;
    s = dec2bin(intA);
    arrayA = str2num(s(:))';
    L = length(arrayA);
    arrayA = bitxor(arrayA,ones(1,L));
end
arrayB = arrayB(1:L);
c = bitxor(arrayA,arrayB);
if c(1)==1
    Int = bin2dec(num2str(c));
else
    d = length(c);
    c = bitxor(c,ones(1,d));
    Int = -bin2dec(num2str(c));
end