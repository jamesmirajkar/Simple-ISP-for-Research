function balancedImage = manual_White_balance(demosaicedImage, redGain, blueGain,bitsPerSample)

    % Apply red and blue gains
    balancedImage = demosaicedImage;
    balancedImage(:, :, 1) = balancedImage(:, :, 1) * redGain;
    balancedImage(:, :, 3) = balancedImage(:, :, 3) * blueGain;

   
    %balancedImage = min(max(balancedImage, 0), (2^bitsPerSample - 1));
    %balancedImage = max(0, min(balancedImage, ((2^bitsPerSample)-1)));
    %balancedImage = balancedImage/2^(bitsPerSample);
    balancedImage = (2^(bitsPerSample) - 1) * (balancedImage / max(balancedImage(:)));
    balancedImage = balancedImage/2^(bitsPerSample);
    

end