function y =fun_gen_bits(x)
%x SOS to zero after the part data compression
%y into a stream line of 0 or 1
x=int2bin(x,8);     %Using the function, but also need to remove the sign bit
x(:,1)=[];
[m,n]=size(x);
y=reshape(x.',[1 m*n]);
end



function b=int2bin(x,n)%To convert the integer 1 sign bit binary + n
% Usage: b=int2bin(x,n)
% integer to binary conversion, 0<=x <= 2^n,
% sign-magnitude representation with sign bit on the left
% b is a 1 by n vector of 0 and 1, with MSB at b(1)
% copyright 1996 by Yu Hen Hu
% Last modification: 2/23/96
%   Allow x to be a vector. Then b will be a dim(x) by n matrix
% modified 11/25/97
%   to allow n not specified!

%x=diag(diag(x)); % convert x into a column vector
b=-(sign(x)-1)*0.5.*[x~=0];  % The sign bit of x if x = 0, sign bit is 0 by default
x=abs(x); % work on magnitude only from now on.
if nargin==2, %The number of input variables
  if max(x) >= 2^n,
     error(' x must be smaller than 2^n')
  end
elseif nargin==1,
  n=max(floor(log2(abs(x)))+1); % x required for binary digits
end
idx=diag(2^(diag([n-1:-1:0])));%Development from 2 ^ (n - 1 )to 2 ^ 0, the exponential decline in turn 1
for j=1:n
   tmp = x - sign(x)*idx(j).*[x~=0];
     % if x > 0, tmp = x - 2^(n-j), if x < 0, tmp=x+2^(n-j)
   b= [b [tmp >= 0].*[x~=0]];
   x=tmp;
end

end