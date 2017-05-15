function [z,p] = match_Get_DcData(I,table,g)
[r,~] = size(table);
for i = 1:r
    if g+table(i,1)+i-1>length(I)
        continue;
    end
    y = I(g:g+table(i,1)-1);
    K = (y==table(i,2:table(i,1)+1));
    x = find(K==0);
    if isempty(x)
        z = I(g+table(i,1):g+table(i,1)+i-2);
        p = table(i,1)+i-1;
        break;
    end
end

end