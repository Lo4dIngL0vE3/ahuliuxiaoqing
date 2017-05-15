function [y,c] = fun_read_matrixData(I,dcHuffTable,acHuffTable,blockNum)
y = {};
z = [];
n = 1;
flag=1;
g = 1;
RS = length(I);
[DCt,p] = match_Get_DcData(I,dcHuffTable,g);
if isempty(DCt)
    H = 1;
elseif DCt(1)==1
    H = bin2dec(num2str(DCt));
else
    xor = bin2dec(num2str(DCt)); 
    H = -bitxor(xor,2^length(DCt)-1);
end
g = p+g;
z(1) = H;
q = 2;
while q<=64
    [ACt,p,tag,e,nake] = match_Get_AcData(I,acHuffTable,g);
    g = g+p;
    if tag == 1
        if nake == 152 %AC表第152行是15/0
            z(q:q+15) = 0;
            q = q+16;
        else
            if ACt(1)==1
                z(q+e) = bin2dec(num2str(ACt));
                q = q+e+1;     
            else
                xor = bin2dec(num2str(ACt)); 
                z(q+e) = -bitxor(xor,2^length(ACt)-1);
                q = q+e+1;
            end
        end
    else
        y{1} = z;
        break;
    end
end
c(1) = g;
if blockNum>1
    for i = 2:blockNum
        z = [];
        if isempty(I(g:RS))||isempty(find(I(g:RS)==0))
            break;
        end
        [DCt,p] = match_Get_DcData(I,dcHuffTable,g);
        g = g+p;
        if isempty(DCt)==1
            h = 0;
        else
            if DCt(1)==1
                h = bin2dec(num2str(DCt));
            else
                h = -bitxor(bin2dec(num2str(DCt)),2^(length(DCt))-1);
            end
        end
        z(1) = H+h;
        H = z(1);
        j = 2;
        while j<=64
            [ACt,p,tag,e,nake] = match_Get_AcData(I,acHuffTable,g);
            g = g+p;
            if tag == 1
                if nake == 152
                    z(j:j+15) = 0;
                    j = j+16;
                else
                    if ACt(1)==1
                        z(j+e) = bin2dec(num2str(ACt));
                        j = j+e+1;
                    else
                         z(j+e) = -bitxor(bin2dec(num2str(ACt)),2^(length(ACt))-1);
                         j = j+e+1;
                    end
                end
            else
                break;
            end
        end
        y{i} = z;
        c(i) = g;
    end
end
t = I(g:RS);
t = num2str(t);
if isempty(t)
    fprintf("数据流无剩余\n");
else
    fprintf("剩余数据流为:%s\n",t);
end

end