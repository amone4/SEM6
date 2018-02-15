function [ outputImage ] = increaseContrast( inputImage , percent )
	maxIntensity = 255;
	imageSize = size(inputImage);
	for i = 1 : imageSize(1)
		for j = 1 : imageSize(2)
			if (inputImage(i,j) < percent * maxIntensity / 200)
				if (inputImage(i,j) - percent * maxIntensity / 400 < 0)
					outputImage(i,j) = 0;
				else
					outputImage(i,j) = inputImage(i,j) - percent * maxIntensity / 400;
				end
			elseif (inputImage(i,j) > maxIntensity - percent * maxIntensity / 200)
				if (inputImage(i,j) + percent * maxIntensity / 400 > maxIntensity)
					outputImage(i,j) = maxIntensity;
				else
					outputImage(i,j) = inputImage(i,j) + percent * maxIntensity / 400;
				end
			else
				outputImage(i,j) = inputImage(i,j);
			end
		end
	end
end