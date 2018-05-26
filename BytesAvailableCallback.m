function BytesAvailableCallback(s,event)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    switch nargin
    case 0
       error(message('instrument:instrument:instrcallback:invalidSyntaxArgv'));
    case 1
       error(message('instrument:instrument:instrcallback:invalidSyntax'));
    case 2
       if ~isa(s, 'instrument') || ~isa(event, 'struct')
          error(message('instrument:instrument:instrcallback:invalidSyntax'));
       end   
       if ~(isfield(event, 'Type') && isfield(event, 'Data'))
          error(message('instrument:instrument:instrcallback:invalidSyntax'));
       end
    end  
    if strcmpi(event.Type,'BytesAvailable')
        testtt = fscanf(s);
       	switch lower(testtt(1:1))
            case 't'
                %we got a message
                messageid = testtt(2:4);
                messagelength = hex2dec(testtt(5:1))*2;
                messagedata = testtt(6:end-1);
                %disp(messageid)
                %disp(messagedata)
                switch messageid
                    case '210'
                        %pdu to mc
                        regid = messagedata(1:2);
                        switch regid
                            case '90'
                                torquecmd = hex2dec(messagedata(3:end-1));
                                torquepct = torquecmd/32768;
                                %disp(torquepct)
                        end
                    case '501'
                        %pedalbox
                    case '200'
                        %pdu status
                        if messagedata(4) == '1'
                            disp('PCHG Complete')
                        end
                        if messagedata(2) == '1'
                            disp('Ready to drive')
                        else
                            disp('Init')
                        end
                end
                        
            case 'v'
                %% we got a version
                disp(testtt)
        end
    end
end

