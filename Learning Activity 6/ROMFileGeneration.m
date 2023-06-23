clear;

MemorySize = 40959+1; % 0x9fff
MemoryImage = strings(MemorySize,1);
ROMUpperAddressLimit = 32767; % 0x7fff

InputFileName = 'add.txt';
InputFile = fopen(InputFileName);

% Define output files
Byte3FileName = 'byte3_romfile';
Byte2FileName = 'byte2_romfile';
Byte1FileName = 'byte1_romfile';
Byte0FileName = 'byte0_romfile';
Byte3File = fopen(Byte3FileName,'w');
Byte2File = fopen(Byte2FileName,'w');
Byte1File = fopen(Byte1FileName,'w');
Byte0File = fopen(Byte0FileName,'w');

% Write comments in file to explain file content.
fprintf(Byte3File,'#Byte 3 ROM file. Automatically generated on %s\n',date);
fprintf(Byte3File,'#Input file:%s\n\n',InputFileName);
fprintf(Byte3File,'#address / data ;\n#----------------\n');

fprintf(Byte2File,'#Byte 2 ROM file. Automatically generated on %s\n',date);
fprintf(Byte2File,'#Input file:%s\n\n',InputFileName);
fprintf(Byte2File,'#address / data ;\n#----------------\n');

fprintf(Byte1File,'#Byte 1 ROM file. Automatically generated on %s\n',date);
fprintf(Byte1File,'#Input file:%s\n\n',InputFileName);
fprintf(Byte1File,'#address / data ;\n#----------------\n');

fprintf(Byte0File,'#Byte 0 ROM file. Automatically generated on %s\n',date);
fprintf(Byte0File,'#Input file:%s\n\n',InputFileName);
fprintf(Byte0File,'#address / data ;\n#----------------\n');

% Now, parse the input file, and generate the output files.
while (feof(InputFile) == 0)
    CurrentLine = fgetl(InputFile);
    %     CurrentLine = strrep(CurrentLine,' ','0');
    CurrentData = sscanf(CurrentLine,'%s %s');
    MemoryAddress = CurrentData(1:8);
    MemoryAddressHex = sscanf(MemoryAddress,'%x');
    MemoryImageIndex = MemoryAddressHex+1;
    
    % Determine number of bytes that are listed.
    LengthOfCurrentData = length(CurrentData);
    BytesOfCurrentData = CurrentData(9:LengthOfCurrentData);
    NumberOfBytes = length(BytesOfCurrentData)/2;
    if (NumberOfBytes == 1)
        MemoryImage(MemoryImageIndex) = BytesOfCurrentData(1:2);
    elseif (NumberOfBytes == 2)
        MemoryImage(MemoryImageIndex) = BytesOfCurrentData(1:2);
        MemoryImage(MemoryImageIndex+1) = BytesOfCurrentData(3:4);
    elseif (NumberOfBytes == 3)
        MemoryImage(MemoryImageIndex) = BytesOfCurrentData(1:2);
        MemoryImage(MemoryImageIndex+1) = BytesOfCurrentData(3:4);
        MemoryImage(MemoryImageIndex+2) = BytesOfCurrentData(5:6);
    elseif (NumberOfBytes == 4)
        MemoryImage(MemoryImageIndex) = BytesOfCurrentData(1:2);
        MemoryImage(MemoryImageIndex+1) = BytesOfCurrentData(3:4);
        MemoryImage(MemoryImageIndex+2) = BytesOfCurrentData(5:6);
        MemoryImage(MemoryImageIndex+3) = BytesOfCurrentData(7:8);
    else
        fprintf('Error in file!\n');
    end
    
end

for i = 1:MemorySize
    if (i <= ROMUpperAddressLimit)
        
        if (strlength(MemoryImage(i)) == 2)
            
            % Check to see if current location on a 4-byte boundary
            BoundaryOffset = mod(i-1,4);
            
            % Divide by 4 to account for 4-byte memory organization
            MemoryAddressHex = (i-1-BoundaryOffset)/4;
            
            if (BoundaryOffset == 0)
                fprintf(Byte3File,'%x/%s;\n',MemoryAddressHex,MemoryImage(i));
            elseif (BoundaryOffset == 1)
                fprintf(Byte2File,'%x/%s;\n',MemoryAddressHex,MemoryImage(i));
            elseif (BoundaryOffset == 2)
                fprintf(Byte1File,'%x/%s;\n',MemoryAddressHex,MemoryImage(i));
            else
                fprintf(Byte0File,'%x/%s;\n',MemoryAddressHex,MemoryImage(i));
            end
        end   
    end
end

fclose(Byte0File);
fclose(Byte1File);
fclose(Byte2File);
fclose(Byte3File);
