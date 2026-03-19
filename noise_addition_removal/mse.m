% Simple MATLAB script that adds and removes noise from an image and
% compares the results using the Mean Squared Error (MSE) with built-in MATLAB
% functionality.
clc
clear all
close all

I = imread("cameraman.tif"); % Read the original image

I_salt = imnoise(I, "salt & pepper"); % Apply salt and pepper noise to the image
I_gaussian = imnoise(I, "gaussian");  % Apply gaussian noise to the image

I_salt_denoised = medfilt2(I_salt); % Denoising using median filter

I_gaussian_denoised = wiener2(I,[4,4]); % Denoising using wiener filter

% Compare the results using Mean Squared Error (MSE)
err_salt_pepper = immse(im2double(I), im2double(I_salt_denoised)); 
fprintf('\nThe mean squared error for the denoised image with salt and pepper noise is %0.4f\n', err_salt_pepper);

err_gaussian = immse(im2double(I), im2double(I_gaussian_denoised)); 
fprintf('\nThe mean squared error for the denoised image with Gaussian noise is %0.4f\n', err_gaussian);