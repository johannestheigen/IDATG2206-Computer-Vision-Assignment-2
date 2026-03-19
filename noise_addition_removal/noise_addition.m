% Simple MATLAB scripts that adds noise to an image using built-in MATLAB
% functionality.
clc
clear all
close all

I = imread("images/Task1a_CV.bmp"); % Read the original image
I_gray = rgb2gray(I); % Convert the image to gray scale

I_salt_pepper = imnoise(I_gray, "salt & pepper"); % Apply salt and pepper noise to the image
I_gaussian = imnoise(I_gray, "gaussian");  % Apply gaussian noise to the image

% Plot the original image and its noisy versions
figure(1);

subplot(1, 3, 1);
imshow(I_gray);
title('Original Image in gray scale');

subplot(1, 3, 2);
imshow(I_salt_pepper);
title('Image with salt & pepper noise');

subplot(1, 3, 3);
imshow(I_gaussian);
title('Image with gaussian noise');