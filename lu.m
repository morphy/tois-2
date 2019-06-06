format short g;

load("a.dat");
load("b.dat");

U = eye(columns(A));
L = zeros(columns(A));
Q = zeros(columns(A));

n = columns(A);

for i = 1:n
  L(i,1) = A(i,1);
endfor;

for i = 1:n-1
  for j = i+1:n
    U(i,j) = (A(i,j) - L(j-1,1:i-1)*U(1:i-1,j)) / L(i,i);
  endfor;
  
  
  for j = i+1:n
    L(j, i+1) = A(j, i+1) - L(j,1:i)*U(1:i,i+1);
  endfor;
endfor;

Y = inv(L)*B;
X = inv(U)*Y