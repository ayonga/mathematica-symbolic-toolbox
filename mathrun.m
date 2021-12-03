clc;
clear 

%%

% path2toolbox = '/usr/local/Wolfram/Mathematica/12.3/SystemFiles/Links/WSTP/DeveloperKit/Linux-x86-64/CompilerAdditions'; % Fill in: e.g. C:\Users\Spece\OneDrive\Code\MATLAB\SysUtils\mathematica_for_matlab

MATH_VER = '12.3';  % change it to currently installed Wolfram Mathematica version
if ismac
    wstp_dir = '/Applications/Mathematica.app/Contents/SystemFiles/Links/WSTP/DeveloperKit/MacOSX-x86-64/CompilerAdditions';
    mllib=fullfile(wstp_dir, 'wstp.framework');%'libWSTPi4.a');
elseif isunix
    wstp_dir = fullfile('/usr/local/Wolfram/Mathematica/',MATH_VER,'SystemFiles/Links/WSTP/DeveloperKit/Linux-x86-64/CompilerAdditions');
    mllib=fullfile(wstp_dir, 'libWSTP64i4.so');
elseif ispc 
    wstp_dir = fullfile('C:∖Program Files∖Wolfram Research∖Mathematica∖',MATH_VER,'SystemFiles\Links\WSTP\DeveloperKit\Windows-x86-64\CompilerAdditions');
    mllib=fullfile(wstp_dir, 'libWSTP64i4.lib');
else
    error('architecture not supported');
end


%%
 % Copy wstp64i4.lib into toolbox directory or replace wstp64i4 with the appropriate library for your version of Mathematica

%make command
command=sprintf('mex -v -I%s %s %s', wstp_dir, 'math.c', mllib);
%compile
eval(command)  

%%

testscript