function y = EncrypteDc(DCcoe,k)
%% ��������-��ɢ˼�����DCϵ������
[row,col] = size(DCcoe);
i = min(row,col);
for j = 2:i
    Ary = DCcoe(1:j,1:j);
    Ary = circshift(Ary,[k,k]);
    DCcoe(1:j,1:j) = Ary;
end
y = DCcoe;

end