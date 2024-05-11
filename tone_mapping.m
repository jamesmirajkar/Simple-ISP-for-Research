function result_image = tone_mapping(input_image)
%% Convert input image to double
input_image = double(input_image);

%% Parameters
delta = 1e-6;
a = 0.0079;
L_white = max(input_image(:));

%% Logarithmic mean luminance
luminance = 0.2126 * input_image(:,:,1) + 0.7152 * input_image(:,:,2) + 0.0722 * input_image(:,:,3);
log_luminance = log(delta + luminance);
Lw = sum(log_luminance(:)) / numel(input_image);
Lw1 = exp(Lw);

%% Scaled luminance
L = (a / Lw1) * input_image;

%% Tone mapping operator
Ld = L .* (1 + L / (L_white^2)) ./ (1 + L);

%% Output
result_image = Ld;
end
