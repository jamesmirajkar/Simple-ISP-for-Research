function balancedImage = Automatic_white_balance(demosaicedImage, bitsPerSample)
    avgR = mean2(demosaicedImage(:, :, 1));
    avgG = mean2(demosaicedImage(:, :, 2));
    avgB = mean2(demosaicedImage(:, :, 3));

    gainR = avgG/ avgR;
    gainB = avgG/ avgB;

    balancedImage = demosaicedImage;
    balancedImage(:, :, 1) = (balancedImage(:, :, 1) * gainR);
    balancedImage(:, :, 3) = (balancedImage(:, :, 3) * gainB);

   
   %balancedImage = uint16(min(max(balancedImage, 0), (2^bitsPerSample - 1)));

   balancedImage = balancedImage/2^(bitsPerSample);


end 