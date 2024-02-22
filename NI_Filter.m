function denoisedImage = NI_Filter(inputImage, h, windowSize, searchWindowSize)
    [rows, cols, channels] = size(inputImage);
    denoisedImage = zeros(rows, cols, channels);

    padSize = (searchWindowSize - 1) / 2;
    paddedImage = padarray(inputImage, [padSize, padSize], 'symmetric');

    for i = 1:rows
        for j = 1:cols
            patch = paddedImage(i:i+windowSize-1, j:j+windowSize-1, :);

            rowStart = max(i - padSize, 1);
            rowEnd = min(i + padSize, rows);
            colStart = max(j - padSize, 1);
            colEnd = min(j + padSize, cols);

            bestMatch = zeros(1, channels);
            weightedSum = zeros(1, channels);

            for m = rowStart:rowEnd
                for n = colStart:colEnd
                    searchPatch = paddedImage(m:m+windowSize-1, n:n+windowSize-1, :);

                    diff = patch - searchPatch;
                    similarity = exp(-sum(diff(:).^2) / (h^2));

                    weightedSum = weightedSum + similarity * squeeze(paddedImage(m, n, :));
                    bestMatch = bestMatch + similarity;
                end
            end

            denoisedImage(i, j, :) = max(0, min(1, weightedSum / bestMatch));
        end
    end
end