%==========================================================================
%     Recostruction of Lena's image using 2D SCSA formula  using
% separation of variables for $h = ...$ and $\gamma=1$
%
% http://sipi.usc.edu/database/database
%
%   Author: Zineb Kaisserli and Meriem Laleg
%    December 20th, 2014
%==========================================================================

clear all
close all
clc
addpath Function
tic

load ./input_data/lena512.mat;
img = lena512(220:290, 220:290);
% img = lena512;img = imresize(img,[70 70]);

%% = = = = = =   The SCSA 2D Method
% input parameters
h = 0.2550; 
gm = 4;fe = 1; 

% Apply SCSA
img_scsa=SCSA_2D1D(img,h,fe,gm);

%% = = = = = =   Reconstruction performnace  
ERR =(abs(img-img_scsa))./max(max(img)).*100;
MSE = mean2((img - img_scsa).^2);
PSNR = 10*log10(1/MSE);
fprintf('Obtained results : \n PSNR=%f , MSE=%f \n',PSNR, MSE)

%% = = = = = =   Plot results
figure(1)
subplot(1,2,1), imshow(img), title('Original'); 
subplot(1,2,2), imshow(img_scsa), title('Reconstructed')
