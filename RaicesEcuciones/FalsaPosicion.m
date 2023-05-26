%Metodo de Falsa Posicion
clear
clc
funcion = input('Dame fx: ','s');
valin = input('Dame el valor inicial: ');
valfin = input('Dame el valor final: ');
erresp = input('Dame el error esperado: ');
ctrl = false;
errob =  1;
func = inline(funcion);
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
  fprintf('%s %f \n',"b = ",b);
  fprintf('%s \n',"i         a          b        f(a)        f(b)         Xnew      f(xnew)      error");
  i = 0;
  xnewante = 0;
  xnew = 0;
  while(errob >= erresp)
    i++;
    funciona = func(a);
    funcionb = func(b);
    xnewante = xnew;
    xnew = (a*funcionb - b*funciona)/(funcionb - funciona);
    funcionxnew = func(xnew);
    fprintf('%2.0f  %2.7f  %2.7f  %2.7f  %2.7f  %2.7f  %2.7f  ',i,a,b,funciona,funcionb,xnew,funcionxnew);
    if(i==1)
      fprintf('%s \n'," ----");
    else
      errob = abs(xnew - xnewante);
      fprintf('%2.7f \n',errob);
    endif
    if(funciona*funcionxnew>0)
      a = xnew;
    endif
    if(funcionb*funcionxnew>0)
      b = xnew;
    endif
  endwhile
  fprintf('%s %2.7f \n',"Xnew: ",xnew);
endif
