% Simple MATLAB script that segments an image using built-in
% functionality for k-means segmentation
clc
close all
clear all

img = "/images/Task1_CV.bmp";

I = imread(img); % Read the original image
I_noise = imnoise(I, "gaussian"); % Apply gaussian noise to the image

% Segment the image using K-means
[L,Centers] = imsegkmeans(I_noise,2);
I_segmented = labeloverlay(I_noise,L);

% Plot the orginal image and the segmented version
figure(1);

subplot(1, 2, 1);
imshow(I_noise);
title('Image affected by gaussian noise');

subplot(1, 2, 2);
imshow(I_segmented);
title('Segmented image using K-means');