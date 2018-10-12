function storeValues(formatTable, timestamp, id, len, data)
    for i = 1:height(formatTable)
        if string({formatTable.canId(i)}) == id
            if timestamp == 17888 % || id == '210'
                disp('210')
            end
            startBit = str2double(formatTable.startBit(i)) +1;
            endBit = str2double(formatTable.endBit(i)) +1;
                
            databitsvector = hexToBinaryVector(data);
            while mod(length(databitsvector), 8) ~= 0
                databitsvector = [0, databitsvector];
            end
            
            
            if string({formatTable.checkValue(i)}) ~= '-1'
                
                value = databitsvector(startBit:endBit);
                relaventBits = swapbytes(uint16(binvec2dec(value)));

                
                if data.startsWith(string({formatTable.checkValue(i)}))
                    matlabVar = string(formatTable.matlabVar(i));
                    eval(sprintf('global %s;', matlabVar));
                    eval(sprintf('%s = [%s, [%d; %d]];', matlabVar, matlabVar, relaventBits, timestamp)); %bitsrl(uint64(hex2dec(data(startDataChar:endDataChar))),endDataChar*4-str2double(formatTable.endBit(i)))))
    
                end
            else
                matlabVar = string({formatTable.matlabVar(i)});
                relaventBits = bi2de(databitsvector(startBit:endBit), 'left-msb');
                eval(sprintf('global %s;', matlabVar));
                eval(sprintf('%s = [%s, [%d; %d]];', matlabVar, matlabVar, relaventBits, timestamp)); %bitsrl(uint64(hex2dec(data(startDataChar:endDataChar))),endDataChar*4-str2double(formatTable.endBit(i)))))
                
            end
        end
    end
    
end