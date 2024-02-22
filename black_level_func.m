%function processedData = black_level_func(rawData, bitsPerSample, blackLevel)
    % Subtract black level
%    rawData = rawData - blackLevel;

    % Convert to double
%    rawData = double(rawData);

    % Normalize to [0, 1] and scale to the desired bit depth (12 bits)
%    scalingFactor = (2^bitsPerSample - 1) / max(rawData(:));
%    rawData = max(0, min(2^bitsPerSample - 1, rawData * scalingFactor));

%    processedData = rawData;
%end


function processedData = black_level_func(rawData, bitsPerSample, blackLevel)
    % Subtract black level
    rawData = rawData - blackLevel;

    % Convert to double
    rawData = double(rawData);

    % Normalize to [0, 1] and scale to the desired bit depth (16 bits for uint16)
    %scalingFactor = (2^bitsPerSample - 1) / max(rawData(:));
    %rawData = max(0, min(2^bitsPerSample - 1, rawData * scalingFactor));

    % Convert to uint16
    processedData = rawData;
    processedData = (2^(bitsPerSample) - 1) * (processedData / max(processedData(:)));
    processedData = processedData/2^(bitsPerSample);
end
