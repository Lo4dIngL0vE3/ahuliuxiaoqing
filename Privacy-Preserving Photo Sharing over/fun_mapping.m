function t = fun_mapping(y,dctable,actable)
t = {};
for i = 1:length(y)
    n = 1;
    j = 1;
    while j<=length(y{i})
        if j>length(y{i})
            break;
        end
        k = find(y{i}(j+1:end)~=0);
        if isempty(k)
            break;
        elseif k(1)>16
            t{i}(n,1) = 15;
            t{i}(n,2) = 0;
            n = n+1;
            j = 16+j;
        else
            t{i}(n,1) = k(1)-1;
            t{i}(n,2) = y{i}(k(1)+j);
            n = n+1;
            j = j+k(1);
        end
    end
end