function [waterMarked] = waterMark( originalImage, waterMarkImage )
	waterMarkSize = size(waterMarkImage);
	originalSize = size(originalImage);

	if (waterMarkSize(2) > originalSize(2) || waterMarkSize(1) > originalSize(1))
		fprintf('water mark image should be of a smaller size');
		waterMarked = originalImage;

	else
		offset = originalSize - waterMarkSize;
		waterMarked = originalImage;
		for i = (round(offset(1)/2) + 1) : (originalSize(1) - round(offset(1)/2))
			for j = (round(offset(2)/2) + 1) : (originalSize(2) - round(offset(2)/2))
				waterMarked(i,j) = ((originalImage(i,j)) + 0.1 * (waterMarkImage(i - round(offset(1)/2), j - round(offset(2)/2))));
			end
		end
	end