function balancedImage = Automatic_white_balance(demosaicedImage, bitsPerSample)
    avgRed = mean2(demosaicedImage(:, :, 1));
    avgGreen = mean2(demosaicedImage(:, :, 2));
    avgBlue = mean2(demosaicedImage(:, :, 3));

    gainR = avgGreen/ avgRed;
    gainB = avgGreen/ avgBlue;

    balancedImage = demosaicedImage;
    balancedImage(:, :, 1) = (balancedImage(:, :, 1) * gainRed);
    balancedImage(:, :, 3) = (balancedImage(:, :, 3) * gainBlue);

   
   %balancedImage = uint16(min(max(balancedImage, 0), (2^bitsPerSample - 1)));

   balancedImage = balancedImage/2^(bitsPerSample);


end 
