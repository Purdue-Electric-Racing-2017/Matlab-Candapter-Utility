%function [] = parse_csv_can(raw_file)

%global formatTable
formatTable = readtable('format.csv', 'Delimiter',',','Format','%s%s%s%s%s%s%s');

fptr = fopen('whatisthis.txt');
status = feof(fptr);

for i = 1:height(formatTable)
    eval(sprintf('global %s',string({formatTable.matlabVar(i)})));
    eval(sprintf('%s = []',string({formatTable.matlabVar(i)})))
end

i = 0;
while status == 0
    try
% read 1 line from the file
line = fgetl(fptr);
% disp(line);

% parse line to an array of datas
data = strsplit(line, ',');
% disp(data)

% convert data to correct data type for storeValues function
timestamp = str2double(data(1));
id = string(data(2));

length = hex2dec(data(3));
bytes = string(data(4));
% disp(timestamp)
% disp(id)
% disp(length)
% disp(bytes)
byte = hexToBinaryVector(bytes);
%disp(byte);

% store value from external function


storeValues(formatTable, timestamp, id, length, bytes);
    catch
        fprintf("%d\n", timestamp);

    end

status = feof(fptr);
end
fclose(fptr);
