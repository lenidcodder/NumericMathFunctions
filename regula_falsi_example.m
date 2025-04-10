clc
clear
close all

format long

%% Example 1

f = @(x) x.*log(x) - 2.*x - 1;
g = @(x) log(x);
h = @(x) 2 + 1./x;

fplot(g,  'b', [6 10]);
hold on;
fplot(h,  'r', [6 10]);
grid on;
hold off;

a = 8;
b = 9;

c = regula_falsi(1e-5, a, b, f);

wait_screen;

%% Example 2

f = @(x) x.^3 - x - 2;
g = @(x) x.^3;
h = @(x) x + 2;

hold on
grid on
fplot(g, 'b', [-2 3]);
fplot(h, 'r', [-2 3]);
hold off

root = regula_falsi(1e-5, 1, 2, f);