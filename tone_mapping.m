function result_image = tone_mapping(inputImage)
    % Convert input image to double
    inputImage = double(inputImage);

    % Parameters
    delta = 1e-6;
    a =.0079;
    L_white = max(inputImage(:)); 
    Lw = sum(log(delta +( 0.2126 * inputImage(:,:,1) + 0.7152 * inputImage(:,:,2) + 0.0722 * inputImage(:,:,3)))) / numel(inputImage);
    Lw1 = exp(Lw);
    % Scaled luminance
    L = (a ./ Lw1) .* inputImage;
    % Tone mapping operator
    Ld = (L .* (1 + L ./ (L_white^2))) ./ (1 + L);
    result_image = Ld;
   
end