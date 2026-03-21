% MATLAB program that manually adds salt & pepper noise to an image
% and removes it using a manually implemented median filter. It also 
% calculates the mean squared error (mse) to determine the similarity
% between the original image and the denoised version.
clc
clear all
close all

img = "images/Task1a_CV.bmp";
 
I = imread(img); % Read the original image

I_gray = double(rgb2gray(I)); % Convert the image from RGB to grayscale           

% Add salt and pepper noise manually to the image (AI assisted code)
I_salt_pepper = I_gray;
salt_pepper_noise = rand(size(I_gray)); 
I_salt_pepper(salt_pepper_noise < 0.05) = 0;
I_salt_pepper(salt_pepper_noise > 0.95) = 255; 

% Apply median filter to remove the noise (AI assisted this part of the code by explaining of to use flatten to convert a matrix to a vector)
I_padded = padarray(I_salt_pepper, [1 1], 'replicate', 'both');
[i, j] = size(I_padded);
I_denoised = zeros(size(I_salt_pepper));

for row = 2:(i-1)
    for col = 2:(j-1)
        sub = I_padded(row-1:row+1, col-1:col+1); 
        I_denoised(row-1, col-1) = median(sub(:)); % AI assisted this part of the code by explaining of to use flatten to convert a matrix to a vector
    end
end

% Calculate the mean squared error (MSE) to compare the original grayscale image and the denoised version. 
mse = immse(I_gray, I_denoised);
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