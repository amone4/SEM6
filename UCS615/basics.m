clear all;

image = imread('sample.jpg');
grey = rgb2gray(image);

% basics
%{
subplot(2,2,1);
imshow(image);
title('regular');
subplot(2,2,2);
imshow(grey);
title('grey');

% fliping an image
flipped = flipImage(grey);
subplot(2,2,3);
imshow(flipped);
title('flipped');

% binary equivalent of image
binary = grey > 127;
subplot(2,2,4);
imshow(binary);
title('binary');
figure;
%}

% cropping an image to a specific size
%{
rows = input('enter the number of rows: ');
cols = input('enter the number of columns: ');
cropped = cropImage(grey,rows,cols);
imshow(cropped);
%}

% zooming an image
%{
temp = [3,4,5;1,2,3;7,8,9;5,6,7;9,8,10];
zoomed = twoX(temp);
subplot(2,1,1);
title('zoomed');
imshow(zoomed);
subplot(2,1,2);
title('original');
imshow(grey);
%}

% adjusting constrast
%{
contrast = increaseContrast(grey, 50);
imshow(contrast);
title('contrast');
%}

% adjusting brightness
%{
bright = increaseBrightness(grey, 100);
imshow(bright);
title('bright');
%}

% grey stretching
%{
greyStretched = greyStretch(grey, 100, 200, 50, 250);
imshow(greyStretched);
title('grey stretched');
%}