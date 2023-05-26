clear
clc
pkg load symbolic
syms t
f=t^2*sinh(t);
F = laplace(f)
