function storeValues(formatTable, timestamp, id, len, data)
    for i = 1:height(formatTable)
        if string({formatTable.canId(i)}) == id

            if string({formatTable.checkStart(i)}) ~= '-1'
                value = data(formatTable.startBit(i)+1:(formatTable.endBit(i)*2)-1)

                if len == 3:
                    value = value
                
                if string({formatTable.checkValue(i)}) == data(formatTable.checkStart(i)+1:formatTable.checkEnd(i)+1)
                    %matlabVar = formatTable.matlabVar(i)
                end
            else
                matlabVar = string({formatTable.matlabVar(i)})
                startBit = str2double(formatTable.startBit(i)) +1
                endBit = str2double(formatTable.endBit(i)) +1
                
                databitsvector = hexToBinaryVector(data)
                while mod(length(databitsvector), 8) ~= 0
                    databitsvector = [0, databitsvector];
                end

                relaventBits = bi2de(databitsvector(startBit:endBit), 'left-msb')
                eval(sprintf('global %s', matlabVar))
                eval(sprintf('%s = [%s, %d]', matlabVar, matlabVar, relaventBits)) %bitsrl(uint64(hex2dec(data(startDataChar:endDataChar))),endDataChar*4-str2double(formatTable.endBit(i)))))
                
            end
        end
    end