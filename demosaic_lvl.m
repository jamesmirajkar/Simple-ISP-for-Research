function output = demosaic_lvl(rawImage, bitsPerSample)

    % Convert the raw image to double
    rawImage = double(rawImage);

    % Demosaic the image using the 'bilinear' method 
    S = rawImage;
    
    % Create CFA filter for each of the three colors in RGGB format
    Rcfa = repmat([1 0; 0 0], size(S)/2);
    Gcfa = repmat([0 1; 1 0], size(S)/2);
    Bcfa = repmat([0 0; 0 1], size(S)/2);
    
    % Split data into 'hat' variables
    Rh = S .* Rcfa;
    Gh = S .* Gcfa;
    Bh = S .* Bcfa;
    
    R = conv2(Rh, [1 2 1; 2 4 2; 1 2 1]/8, 'same');
    G = conv2(Gh, [0 1 0; 1 4 1; 0 1 0]/8, 'same');
    B = conv2(Bh, [1 2 1; 2 4 2; 1 2 1]/8, 'same');
    
    output(:,:,1) = R;
    output(:,:,2) = G;
    output(:,:,3) = B;
    
    
    % Adjust scaling for n bits
    %demosaicedImage = output;
    %maxPixelValue = max(demosaicedImage(:));
    
    % Adjust scaling for uint16
    %scalingFactor = (2^bitsPerSample - 1) / maxPixelValue;
    %scaledImage = demosaicedImage * scalingFactor;
    
    % Convert to uint16
   % scaledImage = uint16(scaledImage);
    
    % Rotate the image if needed
    %scaledImage = imrotate(output, -90);
    
    %output = scaledImage;
    %output = output/2^(bitsPerSample);
    output = (2^(bitsPerSample) - 1) * (output / max(output(:)));
    output = output/2^(bitsPerSample);

end



