% MATLAB program that manually adds salt & pepper noise to an image
% and removes it using a manually implemented median filter. It also 
% calculates the mean squared error (mse) to determine the similarity
% between the original image and the denoised version.
clc
clear all
close all

img = "images/Task1a_CV.bmp"; % The file path of the image to read
I = imread(img); % Read the original image

I_gray = double(rgb2gray(I)); % Convert the image from RGB to grayscale           

I_salt_pepper = I_gray; % Copy the original grayscale image to preserve original values
salt_pepper_noise = rand(size(I_gray)); % Generate random noise map for salt and pepper
I_salt_pepper(salt_pepper_noise < 0.05) = 0; % Set 5% of pixels to black (pepper)
I_salt_pepper(salt_pepper_noise > 0.95) = 255; % Set 5% of pixels to white (salt)

I_padded = padarray(I_salt_pepper, [1 1], 'replicate', 'both'); % Pad the image to handle border pixels for 3x3 neighbourhood

[i, j] = size(I_padded); % Get padded image dimensions for loop bounds

I_denoised = zeros(size(I_salt_pepper)); % Initialise output image with same dimensions as input

% Apply median filter to remove the noise
for row = 2:(i-1)
    for col = 2:(j-1)
        sub = I_padded(row-1:row+1, col-1:col+1); % Extract 3x3 neighbourhood around current pixel
        I_denoised(row-1, col-1) = median(sub(:)); % Store median value in output image 
    end
end

% Calculate the mean squared error (MSE) to compare the original grayscale image and the denoised version. 
[m, n] = size(I_gray);
sum  = 0;
for row = 1:m
    for col = 1:n
        sum = sum + (I_gray(row, col) - I_denoised(row, col))^2;
    end
end
mse = sum  * ( 1/ (m*n) );
fprintf('\nThe mean squared error for the denoised image with salt and pepper noise is %0.4f\n', mse);

% Plot original, noisy and denoised images
figure(1);

subplot(1, 3, 1);
imshow(uint8(I_gray));
title('Original Image in gray scale');

subplot(1, 3, 2);
imshow(uint8(I_salt_pepper));
title('Image with salt and pepper noise');

subplot(1, 3, 3);
imshow(uint8(I_denoised));
title('Image denoised using median filter');