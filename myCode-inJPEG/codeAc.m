function y = codeAc(r,s,acTable)

if s~=0
    if s<0
        v = -s;
        u = dec2bin(v);
        w = str2num(u(:));
        L = length(w);
        s = bitxor(v,2^length(w)-1);
    else
        u = dec2bin(s);
        w = str2num(u(:));
        L = length(w);
    end
    a = dec2bin(s,L);
    b = str2num(a(:));
    c = length(b);
    d = find(acTable(:,1)==r);
    e = find(acTable(d,2)==c);
    f = d(e);
    code = acTable(f,5:acTable(f,4)+4);
    data = b';
else
    data = [];
    code = acTable(152,5:acTable(152,4)+4);
end
y = [code,data];
