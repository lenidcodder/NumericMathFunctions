clc
clear
close all

format long

%% Example 1
func = @(x) x.^3 - x - 2;
g = @(x) x.^3;
h = @(x) x + 2;

a = 1;
b = 2;

hold on
grid on
fplot(g, [a b], 'r', 'LineWidth', 2);
fplot(h, [a b], 'b', 'LineWidth', 2);
hold off

secant_method(1e-6, a, b, func);

wait_screen;

%% Example 2
func = @(x) log(x + 2) - sin(x);
g = @(x) log(x + 2);
h = @(x) sin(x);

a = -1.8;
b = -1;

hold on
grid on
fplot(g, [a b], 'r', 'LineWidth', 2);
fplot(h, [a b], 'b', 'LineWidth', 2);
hold off

secant_method(1e-6, a, b, func);