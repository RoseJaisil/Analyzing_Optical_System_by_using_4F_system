clc; 
clear all; 
close all; 
a=rgb2gray(imread('\\homes.mtu.edu\home\Desktop\target.jpg')); figure;imshow(a,[]) 
%2D fft 
t = fft2(a); 
D=100; 
[M N]=size(a); 
%defing the filter, high pass filter 
 Y = fftshift(fft2(a)); 
[rows, columns] = size(Y); 
B= Y; 
centerX = round(N / 2); 
centerY = round(M / 2); 
% Filter: Erase center spike. 
filterWidth = 100; 
% zeroing out the high frquencies in the middle 
B(centerY-filterWidth:centerY+filterWidth, centerX-filterWidth :  centerX+filterWidth) = 0; 
%applying filter to the freqencey domian 
filteredImage = abs(ifft2(ifftshift(B))); 
max(filteredImage(:)) 
min(filteredImage(:)) 
figure; 
imshow(filteredImage, []) 
axis on; 

