clear;
clc;
w = 1;

% Write first result:

NameOfFile1 = ['ExampleOut-',num2str(w),'.txt']; 
Fpath1 = fullfile('Output',NameOfFile1); 
fileID1 = fopen(Fpath1,'w','n','UTF-8'); 

% 'r'  - Open file for reading.
% 'w'  - Open or create new file for writing. Discard existing contents, if any.
% 'a'  - Open or create new file for writing. Append data to the end of the file.
% 'r+' - Open file for reading and writing.
% 'w+' - Open or create new file for reading and writing. Discard existing contents, if any.
% 'a+' - Open or create new file for reading and writing. Append data to the end of the file.

A = [1 22 175 77;2 21 188 93;3 23 166 54;4 22 171 63;5 20 193 105];

disp('Writing to file.');

fprintf(fileID1,'%5s \r\n','Data about students: ');
fprintf(fileID1,'%5s \r\n','---------------------------------------');
fprintf(fileID1,'%1s %6s %10s %10s \n','i','Age','Height','Weight');
FormatSpec1 = '%d \t %d \t %4.1f \t %8.1f \r\n';
fprintf(fileID1,FormatSpec1,A');
fprintf(fileID1,'%5s \r\n','---------------------------------------');
fprintf(fileID1,'%1s \r\n',' ');
fclose(fileID1);

% '' - Single quotation mark
% %% - Percent character
% \\ - Backslash
% \a - Alarm
% \b - Backspace
% \f - Form feed
% \n - New line
% \r - Carriage return
% \t - Horizontal tab
% \v - Vertical tab

type(Fpath1);

pause;

clc;
w = 2;

% Write second result:

NameOfFile2 = ['ExampleOut-',num2str(w),'.txt']; 
Fpath2 = fullfile('Output',NameOfFile2); 
fileID2 = fopen(Fpath2,'a','n','UTF-8'); 

A = [1 22 175 77;2 21 188 93;3 23 166 54;4 22 171 63;5 20 193 105];

disp('Writing to file.');

FormatOut = 'dd-mmm-yyyy';
fprintf(fileID2,'%5s %3s \r\n','Data about students on: ',datestr(today,FormatOut));
fprintf(fileID2,'%5s \r\n',' ');
FormatSpec1 = 'Student id %d is %d years old, %4.1f cm high and %4.1f kg. \r\n';
fprintf(fileID2,FormatSpec1,A');
fprintf(fileID2,'Ended: %5s \r\n',datestr(now,FormatOut));
fprintf(fileID2,'%1s \r\n',' ');
fclose(fileID2);

type(Fpath2);
