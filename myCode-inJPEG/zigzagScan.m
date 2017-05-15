function y = zigzagScan(array)
% 8*8 zigzag scan
array = double(array);
y = zeros(8,8);;
m = length(array);
row = 1;
col = 1;
for i = 1:m
    y(row,col) = array(i);
    if row==1
        if col~=8 & mod(row+col,2)==0
            col = col+1;
        elseif col~=8 & mod(row+col,2)==1
            row = row+1;
            col = col-1;
        else
            row = row+1;
            col = col-1;
        end
    elseif col==1 & row~=1
        if row~=8 & mod(row+col,2)==1
            row = row+1;
        elseif row~=8 & mod(row+col,2)==0
            row = row-1;
            col = col+1;
        else
            col = col+1;
        end
    elseif col == 8
        if row==8
            break
        end
        if mod(row+col,2)==0
            row = row+1;
        else
            row = row+1;
            col = col-1;
        end
    elseif row == 8
        if col==8
            break
        end
        if mod(row+col,2)==1
            col = col+1;
        else
            row = row-1;
            col = col+1;
        end
    else
        if mod(row+col,2)==1
            row =row+1;
            col = col-1;
        else
            row = row-1;
            col = col+1;
        end
    end
end

end