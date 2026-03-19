clc
clear all
close all

I = imread("images/Task1a_CV.bmp"); % Read the original image
I_gray = double(rgb2gray(I)); % Convert the image to gray scale     

gaussian_noise = randn(size(I_gray)) * 25; % Generate Gaussian noise with standard deviation of 25
I_gaussian = I_gray + gaussian_noise; % Add Gaussian noise to the grayscale image

I_padded = padarray(I_gaussian, [1 1], 0, 'both'); % Zero pad by 1 to handle border pixels for 3x3 kernel

[i, j] = size(I_padded); % Get padded image dimensions for loop bounds

I_denoised = zeros(size(I_gaussian)); % Initialise output image with same dimensions as input

% Apply median filter to remove the noise
for row = 2:(i-1)
    for col = 2:(j-1)
        sub = I_padded(row-1:row+1, col-1:col+1);   
        I_denoised(row-1, col-1) = median(sub(:)); 
    end
end

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
title('Image denoised using median filter');