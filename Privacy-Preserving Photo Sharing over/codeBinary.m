function [bitstream,check] = codeBinary(y,dcHuffTable,acHuffTable)
% y是细胞类型，y{i}代表的是第i块DC和AC系数
%dcHuffTable和acHuffTable分别是DC ACHuffman表
endtag = [1 0 1 0];
Dc = y{1}(1);
bitstream = codeDc(Dc,dcHuffTable);
i = 1;
while i<=length(y{1})
    if i>length(y{1})
        break;
    end
    k = find(y{1}(i+1:end)~=0);
    if isempty(k)
        i = i+1;
        break;
    elseif k(1)>16
        r = 15;
        s = 0;
        stream = codeAc(r,s,acHuffTable);
        bitstream = [bitstream,stream];
        i = 16+i;
    else
        r = k(1)-1;
        s = y{1}(k(1)+i);
        stream = codeAc(r,s,acHuffTable);
        bitstream = [bitstream,stream];
        i = i+k(1);
    end
end
bitstream = [bitstream,endtag];
check(1) = length(bitstream);
if length(y)>1
    for j = 2:length(y)
        dif = y{j}(1)-Dc;
        Dc = y{j}(1);
        dcStream = codeDc(dif,dcHuffTable);
        bitstream = [bitstream,dcStream];
        i = 1;
        while i<=length(y{j})
            if i>length(y{j})
                break;
            end
            k = find(y{j}(i+1:end)~=0);
            if isempty(k)
                i = i+1;
                break;
            elseif k(1)>16
                r = 15;
                s = 0;
                stream = codeAc(r,s,acHuffTable);
                bitstream = [bitstream,stream];
                i = 16+i;
            else
                r = k(1)-1;
                s = y{j}(k(1)+i);
                stream = codeAc(r,s,acHuffTable);
                bitstream = [bitstream,stream];
                i = i+k(1);
            end
        end
        if length(y{j})~=64
            bitstream = [bitstream,endtag];
        end
        check(j) = length(bitstream);
    end
end