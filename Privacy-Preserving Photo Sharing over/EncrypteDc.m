function y = EncrypteDc(DCcoe,k)
%% 根据置乱-扩散思想进行DC系数加密
[row,col] = size(DCcoe);
i = min(row,col);
for j = 2:i
    Ary = DCcoe(1:j,1:j);
    Ary = circshift(Ary,[k,k]);
    DCcoe(1:j,1:j) = Ary;
end
y = DCcoe;

end