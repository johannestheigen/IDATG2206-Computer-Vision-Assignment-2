% Simple MATLAB script that segments an image using built-in
% functionality for k-means segmentation
clc
close all
clear all

img = "/images/Task1_CV.bmp";

I = imread(img);

% Segment the image using K-means
[L,Centers] = imsegkmeans(I,3);
I_segmented = labeloverlay(I,L);

% Plot the orginal image and the segmented version
figure(1);

subplot(1, 2, 1);
imshow(I);
title('Original image');

subplot(1, 2, 2);
imshow(I_segmented);
title('Segmented image using K-means');