clc;
clear 


MATH_VER = '12.3';  % change it to currently installed Wolfram Mathematica version
                    
%%

if ismac      % add `ws_dir` (get below) to your system path
    ws_dir = '/Applications/Mathematica.app/Contents/SystemFiles/Links/WSTP/DeveloperKit/MacOSX-x86-64/CompilerAdditions';
    wslib=fullfile(ws_dir, 'wstp.framework');%'libWSTPi4.a');

elseif isunix % add `ws_dir` (get below) to your system path
    ws_dir = fullfile('/usr/local/Wolfram/Mathematica/',MATH_VER,'SystemFiles/Links/WSTP/DeveloperKit/Linux-x86-64/CompilerAdditions');
    wslib=fullfile(ws_dir, 'libWSTP64i4.so');

elseif ispc % add `ws_sys_dir` (get below) and the directory fullfile('C:\Program Files\Wolfram Research\Mathematica\',MATH_VER) to your use path
    ws_sys_dir = fullfile('C:\Program Files\Wolfram Research\Mathematica\',MATH_VER,'\SystemFiles\Links\WSTP\DeveloperKit\Windows-x86-64\SystemAdditions\');
    ws_dir = fullfile('C:\Program Files\Wolfram Research\Mathematica\',MATH_VER,'\SystemFiles\Links\WSTP\DeveloperKit\Windows-x86-64\CompilerAdditions');
    wslib=['"',fullfile(ws_dir,'wstp64i4.lib'),'"'];  % windows does not recognize the space in the path
    ws_dir = ['"', ws_dir, '"'];                      % windows does not recognize the space in the path
else
    error('architecture not supported');
end


%%
 % Copy wstp64i4.lib into toolbox directory or replace wstp64i4 with the appropriate library for your version of Mathematica

%make command
command=sprintf('mex -D__STDC__ -v -I%s %s %s', ws_dir, 'math.c', wslib);
%compile
eval(command)  

%%

testscript