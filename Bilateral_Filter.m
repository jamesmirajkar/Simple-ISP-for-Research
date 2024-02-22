function outputImage = Bilateral_Filter(inputImage, d, sigmaColor, sigmaSpace)
    [rows, cols, ~] = size(inputImage);
    outputImage = zeros(size(inputImage));

    for i = 1:rows
        for j = 1:cols
            % Define the neighborhood
            iMin = max(i - d, 1);
            iMax = min(i + d, rows);
            jMin = max(j - d, 1);
            jMax = min(j + d, cols);

            % Extract the local region
            localRegion = inputImage(iMin:iMax, jMin:jMax, :);

            % Compute Gaussian weights
            spatialWeights = exp(-((i - iMin).^2 + (j - jMin).^2) / (2 * sigmaSpace^2));
            intensityWeights = exp(-sum((inputImage(i, j, :) - localRegion).^2, 3) / (2 * sigmaColor^2));

            % Compute the normalized weights
            weights = spatialWeights .* intensityWeights;
            weights = weights / sum(weights(:));

            % Apply the filter
            outputImage(i, j, :) = sum(sum(bsxfun(@times, localRegion, weights)));
        end
    end
end