%%Initiinstalize CANDapter
% lastCOMport = port;
% port = input(sprintf('COM Port: [COM%s] COM',port));
% if isempty(port)
%     port = lastCOMport;
% end
instrreset
s = serial('COM5', ...
        'BAUD',115200, ...
        'Terminator',13, ...
        'BytesAvailableFcnMode','terminator', ...
        'BytesAvailableFcn',@BytesAvailableCallback ...
    );
fopen(s);
fprintf(s,'V');
fprintf(s,'S6');
fprintf(s,'O');

