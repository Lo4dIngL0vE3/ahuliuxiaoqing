function [z,p,tag,e,none] = match_Get_AcData(I,table,g)
[r,~] = size(table);
for i = 1:r
    if g+table(i,3)-1>length(I)
        continue;
    end
    y = I(g:g+table(i,4)-1);
    K = (y==table(i,5:table(i,4)+4));
    x = find(K==0);
    if isempty(x)
        a = table(i,4);
        b = table(i,3);
        p = b;
        if i==1
            tag = 0;
            z = [0];
        else
            tag = 1;
            z = I(g+a:g+b-1);
        end
        e = table(i,1);
        none = i;
        break;
    end
end
    
end