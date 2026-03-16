% Simple MATLAB scripts that adds noise to an image using built-in MATLAB
% functionality.
clc
clear all
close all

I = imread("cameraman.tif"); % Read the original image

I_salt = imnoise(I, "salt & pepper"); % Apply salt and pepper noise to the image
I_gaussian = imnoise(I, "gaussian");  % Apply gaussian noise to the image

% Plot the original image and its noisy versions
figure(1);

subplot(1, 3, 1);
imshow(I);
title('Original Image');

subplot(1, 3, 2);
imshow(I_salt);
title('Image with salt & pepper noise');

subplot(1, 3, 3);
imshow(I_gaussian);
title('Image with gaussian noise');