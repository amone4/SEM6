clear all;

image = imread('sample.jpg');
grey = rgb2gray(image);
%{
subplot(2,2,1);
imshow(image);
title('regular');
subplot(2,2,2);
imshow(grey);
title('grey');

flipped = flipImage(grey);
subplot(2,2,3);
imshow(flipped);
title('flipped');

binary = grey > 127;
subplot(2,2,4);
imshow(binary);
title('binary');
figure;

rows = input('enter the number of rows: ');
cols = input('enter the number of columns: ');
cropped = cropImage(grey,rows,cols);
imshow(cropped);

temp = [3,4,5;1,2,3;7,8,9;5,6,7;9,8,10];
zoomed = twoX(temp);
subplot(2,1,1);
title('zoomed');
imshow(zoomed);
subplot(2,1,2);
title('original');
imshow(grey);
%}

subplot(2,2,3);
imshow(grey);
title('grey');

contrast = increaseContrast(grey, 100);
subplot(2,2,1);
imshow(contrast);
title('contrast');

bright = increaseBrightness(grey, 100);
subplot(2,2,2);
imshow(bright);
title('bright');

greyStretched = greyStretch(grey, 100, 200, 50, 250);
subplot(2,2,4);
imshow(greyStretched);
title('grey stretched');
