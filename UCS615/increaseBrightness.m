function [ outputImage ] = increaseBrightness( inputImage , percent )
	if (inputImage + (127 * percent / 100) > 255)
		outputImage = 255;
	else
		outputImage = inputImage + (127 * percent / 100);
	end
end