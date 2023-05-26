clc
clear

function [x] = gauss(A, b)
  n = length(b);
  for k = 1:n-1
    for i = k+1:n
      factor = A(i,k) / A(k,k);
      for j = k+1:n
        A(i,j) = A(i,j) - factor * A(k,j);
      end
      b(i) = b(i) - factor * b(k);
    end
  end
  x = zeros(n,1);
  x(n) = b(n) / A(n,n);
  for i = n-1:-1:1
    sum = b(i);
    for j = i+1:n
      sum = sum - A(i,j) * x(j);
    end
    x(i) = sum / A(i,i);
  end
end

function [x] = gaussJordan(A, b)
  n = length(b);
  Ab = [A b];
  for k = 1:n
    pivot = Ab(k,k);
    Ab(k,:) = Ab(k,:) / pivot;
    for i = 1:n
      if i ~= k
        factor = Ab(i,k);
        Ab(i,:) = Ab(i,:) - factor * Ab(k,:);
      end
    end
  end
  x = Ab(:,n+1);
end

function [L, U] = luFactor(A)
  n = size(A,1);
  L = eye(n);
  for k = 1:n-1
    for i = k+1:n
      factor = A(i,k) / A(k,k);
      L(i,k) = factor;
      for j = k+1:n
        A(i,j) = A(i,j) - factor * A(k,j);
      end
    end
  end
  U = A;
end

function [x] = solveLU(L, U, b)
  y = zeros(size(L,1),1);
  n = length(b);
  y(1) = b(1);
  for i = 2:n
    sum = 0;
    for j = 1:i-1
      sum = sum + L(i,j) * y(j);
    end
    y(i) = b(i) - sum;
  end
  x = zeros(size(U,1),1);
  x(n) = y(n) / U(n,n);
  for i = n-1:-1:1
    sum = 0;
    for j = i+1:n
      sum = sum + U(i,j) * x(j);
    end
    x(i) = (y(i) - sum) / U(i,i);
  end
end

function [x] = gaussSeidel(A, b, tol)
  n = length(b);
  x = zeros(n,1);
  err = tol+1;
  while err > tol
    xOld = x;
    for i = 1:n
      sum = 0;
      for j = 1:n
        if j ~= i
          sum = sum + A(i,j) * x(j);
        end
      end
      x(i) = (b(i) - sum) / A(i,i);
    end
    err = norm(x-xOld) / norm(x);
  end
end

while true
  disp("---- Menu de opciones ----");
  disp("1. Gauss");
  disp("2. Gauss-Jordan");
  disp("3. LU");
  disp("4. Gauss-Seidel");
  disp("5. Limpiar pantalla");
  disp("6. Salir");
  disp("--------------------------");
  choice = input("Indique su opcion: ");
  if(choice < 5 && choice > 0)
    n = input('Ingrese el tamaño de la matriz de coeficientes: ');
  A = zeros(n);
  b = zeros(n, 1);
  disp('Ingrese la matriz de coeficientes:')
  for i = 1:n
    for j = 1:n
      A(i,j) = input(['A(' num2str(i) ',' num2str(j) '): ']);
    end
  end
  disp('Ingrese el vector de términos independientes:')
  for i = 1:n
    b(i) = input(['b(' num2str(i) '): ']);
  end
  endif
  if choice == 1
    x = gauss(A, b);
    disp('El resultado es: ');
    disp(x);
  elseif choice == 2
    x = gaussJordan(A, b);
    disp(x);
  elseif choice == 3
    [L, U] = luFactor(A);
    x = solveLU(L, U, b);
    disp(x);
  elseif choice == 4
    tol = input('Ingrese la tolerancia: ');
    x = gaussSeidel(A, b, tol);
    disp(x);
  elseif choice == 5
    clc;
  elseif choice == 6
    break;
    else
    disp("Opción inválida");
  end
end
