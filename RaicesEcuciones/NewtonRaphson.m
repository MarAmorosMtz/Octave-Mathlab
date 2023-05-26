%Metodo de Newton - Raphson
clear
clc
pkg load symbolic
syms x
funcion = input('Dame fx: ','s');
valin = input('Dame el valor inicial: ');
valfin = input('Dame el valor final: ');
erresp = input('Dame el error esperado: ');
ctrl = false;
errob =  1;
func = inline(funcion);
derivfunc = diff(funcion,x);
cderiv = char(derivfunc);
deriv = inline(cderiv);
disp("--- Tabulacion --- ");
disp(" X             Y ");
for i=valin:1:valfin
   fprintf('%f  %f \n',i,func(i));
   if(func(i)*func(i+1)<0 && i<valfin && ctrl==false)
    a = i;
    b = i+1;
    ctrl = true;
  elseif(func(i)==0 && func(i+1)<0 && i<valfin)
    a = i;
    b = i+1;
    ctrl = true;
  elseif(func(i+1)==0 && func(i)<0 && i<valfin)
    a = i;
    b = i+1;
    ctrl = true;
  endif
endfor
if(ctrl==true)
  fprintf('%s %f \n',"a = ",a);
  fprintf('%s \n',"i         a        f(a)        f'(a)         Xnew       error");
  i = 0;
  xante = 0;
  xnew = 0;
while(errob >= erresp)
i++;
funciona = func(a);
deriva = deriv(a);
xnewante = xnew;
xnew = a-(funciona/deriva);
fprintf('%2.0f | %2.7f | %2.7f | %2.7f | %2.7f | ',i,a,funciona,deriva,xnew);
if(i==1)
fprintf('%s \n'," ----");
else
errob = abs(xnew - xnewante);
fprintf('%2.7f \n',errob);
endif
a = xnew;
endwhile
endif
fprintf('%s %2.7f \n',"Xnew: ",xnew);
