format short g;

load("a.dat");
load("b.dat");

n = columns(A);
C = [A, B];
R = zeros(n,1);

for i = 1:n
  for j = i+1:n
    multipler = C(j,i) / C(i,i);
    C(j,1:n+1) = C(j,1:n+1) - C(i, 1:n+1) * multipler;
  endfor;
endfor;

for i = n:-1:1
  multipler = C(i,n+1) / C(i,i);
  R(i,1) = multipler;
  C(1:i,i) = C(1:i,i) * multipler;
  C(1:i,n+1) = C(1:i,n+1) - C(1:i,i);
endfor;

R