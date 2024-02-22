function corrected_image = color_correction_matrix(image,color_correction_matrix)
    % Convert to linear RGB

    linear_image = rgb2lin(image);

    % Apply color correction
    linear_corrected_image = imapplymatrix(color_correction_matrix', linear_image);

    % Convert back to sRGB
    corrected_image = lin2rgb(linear_corrected_image);
end

