function gammaCorrected = Gamma_correction(balancedImage, gamma,bitsPerSample)

    % Apply gamma correction without using imadjust
    gammaCorrected = balancedImage .^ gamma;

    % Normalize the pixel values to [0, 2^BitsPerSample - 1]
    gammaCorrected = (2^(bitsPerSample) - 1) * (gammaCorrected / max(gammaCorrected(:)));
    gammaCorrected = gammaCorrected/2^(bitsPerSample);
end
