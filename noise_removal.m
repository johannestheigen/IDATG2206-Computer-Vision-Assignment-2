% Simple MATLAB scripts that adds and removes noise from an image using built-in MATLAB
% functionality.
clc
clear all
close all

I = imread("cameraman.tif"); % Read the original image

I_salt = imnoise(I, "salt & pepper"); % Apply salt and pepper noise to the image
I_gaussian = imnoise(I, "gaussian");  % Apply gaussian noise to the image

% Denoise the images
I_salt_denoised = medfilt2(I_salt); % Denoising using median filter

I_gaussian_denoised = wiener2(I,[5,5]); % Denoising using wiener filter

% Plot the orginal image, images with noise and denoised images
figure(1);

subplot(2, 3, 1);
imshow(I);
title('Original image');

subplot(2, 3, 2);
imshow(I_salt);
title('Image with salt & pepper noise');

subplot(2, 3, 3);
imshow(I_salt_denoised);
title('Image with salt & pepper noise removed');

subplot(2, 3, 4);
imshow(I_gaussian);
title('Image with gaussian noise');

subplot(2, 3, 5);
imshow(I_gaussian_denoised);
title('Image with gaussian noise removed');