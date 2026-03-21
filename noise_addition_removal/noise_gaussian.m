% MATLAB program that manually adds gaussian noise to an image
% and removes it using a manually implemented median filter.It also 
% calculates the mean squared error (mse) to determine the similarity
% between the original image and the denoised version.
clc
clear all
close all

img = "images/Task1a_CV.bmp";
I = imread(img); % Read the original image

I_gray = double(rgb2gray(I)); % Convert the image from rgb grayscale      

% Add Gaussian noise manually to the image (AI assisted code)
gaussian_noise = randn(size(I_gray)) * 25; 
I_gaussian = I_gray + gaussian_noise;

I_padded = padarray(I_gaussian, [2 2], 'replicate', 'both');

[i, j] = size(I_padded); 

I_denoised = zeros(size(I_gaussian)); 

% Apply arithmetic mean filter to remove the noise (AI assisted this part of the code by explaining of to use flatten to convert a matrix to a vector)
for row = 3:(i-2)
    for col = 3:(j-2)
        sub = I_padded(row-2:row+2, col-2:col+2);
        [m, n] = size(sub); 
        I_denoised(row-2, col-2) = (1/(m*n)) * sum(sub(:));
    end
end

% Calculate the mean squared error (MSE) to compare the original grayscale image and the denoised version. 
mse = immse(I_gray, I_denoised);
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