clear;
clc;

% Read data SLR from file to Ab

NameOfFile1 = 'DataSLR.txt'; 
Fpath1 = fullfile('Input',NameOfFile1); 
Ab = readmatrix(Fpath1);
format shortG
disp(Ab);

[m,n] = size(Ab);

A = Ab(:,1:n-1);
b = Ab(:,n);

pause;
clc;

% Read data from file with next structure:
% a, b, c, epsilon, Max k

NameOfFile2 = 'Data-Structure.txt'; 
Fpath2 = fullfile('Input',NameOfFile2); 
M = readmatrix(Fpath2);
format shortG
disp(M);

pause;
clc;

% Read data from file with next table:
% i, year, tempreture, size, time

NameOfFile3 = 'Data-Table.txt'; 
Fpath3 = fullfile('Input',NameOfFile3); 
T = readtable(Fpath3);
format shortG
disp(T);

t = T(2,3);
t1 = table2array(T(2,3));
disp(' ');
disp(t);
disp(' ');
disp(['Tempreture is ', num2str(t1) ,' degrees Celcius.']);