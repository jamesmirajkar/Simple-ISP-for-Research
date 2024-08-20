function result_image = tone_mapping(input_image)
% Convert input image to double and reshape for vectorized operations
input_image = reshape(double(input_image), [], 3);

% Parameters
delta = 1e-6;
a = 0.0079;
L_white = max(input_image(:));

% Vectorized luminance calculation
luminance = input_image * [0.2126; 0.7152; 0.0722];

% Logarithmic mean luminance (vectorized)
Lw1 = exp(mean(log(delta + luminance)));

% Scaled luminance (vectorized)
L = (a / Lw1) * input_image;

% Tone mapping operator (vectorized)
Ld = L .* (1 + L / (L_white^2)) ./ (1 + L);

% Reshape output to original dimensions
result_image = reshape(Ld, size(input_image, 1), size(input_image, 2), 3);
end
