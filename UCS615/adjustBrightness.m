function [ outputImage ] = adjustBrightness( inputImage , percent )
	imageSize = size(inputImage);
	if (percent > -101 && percent < 101)
		for i = 1 : imageSize(1)
			for j = 1 : imageSize(2)
				outputImage(i,j) = inputImage(i,j) + round(percent * log(1 + double(inputImage(i,j))) / 10);
			end
		end
	end
end