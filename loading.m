%   load file a scelta dell'utente
function [signal]=loading(filename,ftype,variabletype)
if strcmp(ftype,'bin')==1
    [file,path]=uigetfile('*.bin','Load');
    filename=sprintf('%s%s',path,file);
    h=fopen(filename,'r');
    signal=fread(h,inf,variabletype);
    fclose(h);
end

if strcmp(ftype,'sig')==1
    [file,path]=uigetfile('*.sig','Load');
    filename=sprintf('%s%s',path,file);
    h=fopen(filename,'r');
    signal=fread(h,inf,variabletype);
    fclose(h);
end

%  load file specifico presente nella cartella
if strcmp(ftype,'mat')==1 || strcmp(ftype,'asc')==1
    signal=load(filename);
end

if strcmp(ftype,'txt')==1
    signal=importdata(filename);
end

end
