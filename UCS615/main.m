clear all;

image = imread('sample1.jpg');
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
zoomed = twoX(grey);
subplot(2,1,1);
title('zoomed');
imshow(zoomed);
subplot(2,1,2);
title('original');
imshow(grey);
%}

% adjusting constrast
%{
contrast1 = adjustContrast(grey, -50);
contrast2 = adjustContrast(grey, 50);
subplot(2,2,1);
imshow(contrast1);
title('contrast1');
subplot(2,2,2);
imshow(contrast2);
title('contrast2');
subplot(2,2,3);
imshow(grey);
title('original');
%}

% adjusting brightness
%{
brighten1 = adjustBrightness(grey, -50);
brighten2 = adjustBrightness(grey, 50);
subplot(2,2,1);
imshow(brighten1);
title('brighten1');
subplot(2,2,2);
imshow(brighten2);
title('brighten2');
subplot(2,2,3);
imshow(grey);
title('original');
%}

% grey stretching
%{
greyStretched = greyStretch(grey, 100, 200, 50, 250);
subplot(2,1,1);
imshow(greyStretched);
title('grey stretched');
subplot(2,1,2);
imshow(grey);
title('original');
%}

% histogram equalization
%{
outputImage = histEqualize(grey);
subplot(2,1,1);
imhist(outputImage);
subplot(2,1,2);
imhist(grey);
%}

% correlation
%{
correlated = correlation(grey, [1,4,1; 4,16,4; 1,4,1]);
subplot(1,2,1);
imshow(correlated);
title('correlation');
subplot(1,2,2);
imshow(grey);
title('grey');
%}

% convolution
%{
convoluted = convolution(grey, [1,4,1; 4,16,4; 1,4,1]);
subplot(1,2,1);
imshow(convoluted);
title('convolution');
subplot(1,2,2);
imshow(grey);
title('grey');
%}

% bit plane slicing
%{
sliced = bitPlaneSlice(grey);
subplot(3,3,1);
imshow(grey);
title('grey');
for i = 1 : 8
	subplot(3,3,i+1);
	imshow(sliced(:,:,i));
	title('bit plane');
end
%}

% water marking image
waterMarkImage = rgb2gray(imread('sample2.jpg'));
waterMarked = waterMark(grey, waterMarkImage);

subplot(2,2,1);
imshow(waterMarked);
title('water marked');
subplot(2,2,2);
imshow(grey);
title('original');

% extract water mark
extractedWaterMark = extractWaterMark(waterMarked, grey);
subplot(2,2,3);
imshow(extractedWaterMark);
title('extracted water mark');
subplot(2,2,4);
imshow(waterMarkImage);
title('original');

