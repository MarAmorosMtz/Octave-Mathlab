clear
clc
pkg load symbolic
syms x
funcion = input('ingrese la funcion a operar: ','s');
f = inline(funcion);
while true
disp("---- Menu de opciones ----");
disp("1. Derivar");
disp("2. Integrar");
disp("3. Salir");
disp("--------------------------");
choice = input("Indique su opcion: ");
if choice == 3
  break;
else
if choice == 1
  disp("---- Menu de opciones ----");
  disp("1. Primera derivada");
  disp("2. Segunda derivada");
  disp("3. Tercera derivada");
  disp("4. Cuarta derivada");
  disp("--------------------------");
  choice2 = input("Su opcion: ");
  h = input('ingrese el valor de h: ');
  x = input('ingrese el valor de x: ');
if choice2 == 1
    disp("---- Menu de opciones ----");
    disp("1. Diferencias hacia adelante");
    disp("2. Diferencias hacia atras");
    disp("3. Diferencias centrales");
    disp("4. Formula general");
    disp("--------------------------");
    choice3 = input("Su opcion: ");
    if choice3 == 1
      devf = (f(x+h)-f(x))/h;
    endif
    if choice3 == 2
      devf = (f(x)-f(x-h))/h;
    endif
    if choice3 == 3
      devf = (f(x+h)-f(x-h))/(2*h);
    endif
    if choice3 == 4
      devf = (-f(x+(2*h))+8*f(x+h)-8*f(x-h)+f(x-(2*h)))/(12*h);
    endif
 endif
 if choice2 == 2
      devf = (f(x+h)-2*f(x)+f(x-h))/(h^2);
 endif
 if choice2 == 3
   devf = (f(x+(2*h))-2*f(x+h)+2*f(x-h)-f(x-(2*h)))/(2*(h^3));
 endif
 if choice2 == 4
   devf = (f(x+(2*h))-4*f(x+h)+6*f(x)-4*f(x-h)+f(x-(2*h)))/(h^4);
 endif
endif
if choice  == 2
  disp("---- Menu de opciones ----");
  disp("1. Metodo del trapecio");
  disp("2. Metodo de simpson 1/3");
  disp("3. Metodo de simpson 3/8");
  disp("--------------------------");
  choice2 = input("Su opcion: ");
  a = input("Ingrese el limite inferior (a): ");
  b = input("Ingrese el limite superior (b): ");
  n = input("Numero de intervalos (n): ");
  h = b-a;
  if choice2 == 1 & n == 1
    devf = (b - a)*((f(a)+f(b))/2);
  endif
  if choice2 == 1 & n>1
    h = h/n;
    suma = 0;
    paso = a;
    for i=1:n-1
      paso = paso + h;
      suma += f(paso);
    endfor
    devf = (h/2)*(f(a)+2*suma+f(b));
  endif
  if choice2 == 2
    h = h/n;
    suma1 = 0;
    suma2 = 0;
    for i=1:n-1
      xi = a+i*h;
      if mod(i,2)==0
        suma1 =f(xi)+suma1;
      else
        suma2=f(xi)+suma2;
      endif
    endfor
    devf = (h/3)*(f(a)+4*suma2+2*suma1*f(b));
  endif
  if choice2 == 3
    paso = n;
    n=3*paso;
    h= h/n;
    devf = 0;
    for i=1:paso
      devf=devf+(3*h/8)*(f(a)+3*f(a+h)+3*f(a+2*h)+f(a+3*h));
      a=a+3*h;
endfor
endif
endif
endif
clc
disp("--------------------------");
disp("El resultado es: ");
disp(devf);
disp("--------------------------");
endwhile
