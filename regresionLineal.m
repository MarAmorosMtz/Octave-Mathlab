clear
clc
x = input("Ingresa el vector x (separar los numeros por comas o espacio): ", "s");
x = str2num(x);
if !isvector(x)
  error("No se ingresó un vector de números");
endif
y = input("Ingresa el vector y (separar los numeros por comas o espacio): ", "s");
y = str2num(y);
if !isvector(y)
  error("No se ingresó un vector de números");
endif

n = length(x);
x_bar = mean(x);
y_bar = mean(y);
sp = sum((x-x_bar).*(y-y_bar));
ssx = sum((x-x_bar).^2);
ssy = sum((y-y_bar).^2);
m = sp/ssx;
b = y_bar - m*x_bar;
r = sp/sqrt(ssx*ssy);
printf("Pendiente: %f\n", m);
printf("Ordenada al origen: %f\n", b);
printf("Coeficiente de correlación: %f\n", r);

