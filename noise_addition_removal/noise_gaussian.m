% MATLAB program that manually adds gaussian noise to an image
% and removes it using a manually implemented median filter.It also 
% calculates the mean squared error (mse) to determine the similarity
% between the original image and the denoised version.
clc
clear all
close all

img = "images/Task1a_CV.bmp"; % The file path of the image to read
I = imread(img); % Read the original image

I_gray = double(rgb2gray(I)); % Convert the image from rgb grayscale      

gaussian_noise = randn(size(I_gray)) * 25; % Generate Gaussian noise, standard deviation = 15 controls noise strength
I_gaussian = I_gray + gaussian_noise;      % Add Gaussian noise to the grayscale image

I_padded = padarray(I_gaussian, [2 2], 'replicate', 'both'); % Pad the image to handle border pixels for 3x3 neighbourhood

[i, j] = size(I_padded); % Get padded image dimensions for loop bounds

I_denoised = zeros(size(I_gaussian)); % Initialise output image with same dimensions as input

% Apply arithmetic mean filter to remove the noise
for row = 3:(i-2)
    for col = 3:(j-2)
        sub = I_padded(row-2:row+2, col-2:col+2); % Extract 5x5 neighbourhood around current pixel
        [m, n] = size(sub); % Retrieve the dimensions of the neighbourhood for mean calculation
        I_denoised(row-2, col-2) = (1/(m*n)) * sum(sub(:)); % Compute the arithmetic mean of the neighbourhood and store in output image
    end
end

% Calculate the mean squared error (MSE) to compare the original grayscale image and the denoised version. 
[m, n] = size(I_gray);
sum  = 0;
for row = 1:m
    for col = 1:n
        sum = sum + (double(I_gray(row, col)) - double(I_denoised(row, col)))^2;
    end
end
mse = sum  * ( 1/ (m*n) );
fprintf('\nThe mean squared error for the denoised image with gaussian noise is %0.4f\n', mse);

% Plot original, noisy and denoised images
figure(1);

subplot(1, 3, 1);
imshow(uint8(I_gray));
title('Original Image in gray scale');

subplot(1, 3, 2);
imshow(uint8(I_gaussian));
title('Image with gaussian noise');

subplot(1, 3, 3);
imshow(uint8(I_denoised));
title('Image denoised using arithmetic mean filter');