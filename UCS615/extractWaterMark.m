function [waterMark] = extractWaterMark( modifiedImage, originalImage )
	if (size(modifiedImage) ~= size(originalImage))
		fprintf('water marked image should be of same size');
		waterMark = modifiedImage;
		
	else
		waterMark = modifiedImage - 0.1 * originalImage;
	end