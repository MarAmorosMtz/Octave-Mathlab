clear
clc
% Puntos de interpolación
n = input('Indique el tamaño de la matriz de puntos: ');
x = zeros(n,1);
y = zeros(n,1);
for i = 1:n
    x(i) = input(['x(' num2str(i) '): ']);
 endfor
 for i = 1:n
    y(i) = input(['y(' num2str(i) '): ']);
  endfor

% Número de puntos
n = length(x);

% Coeficientes del polinomio de interpolación
c = y;
for j = 2:n
  for i = n:-1:j
    c(i) = (c(i) - c(i-1)) / (x(i) - x(i-j+1));
  endfor
endfor

% Puntos de evaluación
xeval = linspace(0, 4, 101);
yeval = zeros(size(xeval));

% Evaluación del polinomio de interpolación en los puntos de evaluación
for i = 1:length(xeval)
  yeval(i) = c(n);
  for j = n-1:-1:1
    yeval(i) = c(j) + (xeval(i) - x(j)) * yeval(i);
  endfor
endfor

% Gráfica de los puntos de interpolación y del polinomio de interpolación
plot(x, y, 'o', xeval, yeval);
legend('Puntos de interpolación', 'Polinomio de interpolación');

