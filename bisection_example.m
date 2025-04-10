clear
clc
close all

format long

%% Example 1

f = @(x)(exp(-x)+ x.^2 - 3);
g = @(x)(exp(-x));
h = @(x)(-x.^2 + 3);

figure
fplot(g, "g", [-2 3]);
hold on
fplot(h, "r", [-2 3]);
grid on
hold off

a1 = 1;
b1 = 3;
c1 = bisection(0.02, a1, b1, f);

a2 = -2;
b2 = 0;
c2 = bisection(0.02, a2, b2, f);

wait_screen;

%% Example 2

f = @(x)(3*sin(x)- log(x));
g = @(x)(3*sin(x));
h = @(x)(log(x));

figure
fplot(g, "b", [0 25]);
hold on
fplot(h, "r", [0 25]);
grid on
hold off

a = [2 6 8 12 14];
b = [4 8 10 14 16];
e = 0.001;

for i = 1:numel(a)
    bisection(e, a(i), b(i), f);
end