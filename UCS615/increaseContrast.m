function [ outputImage ] = increaseContrast( inputImage , percent )
	if (inputImage - (127 * percent / 100) < 0)
		outputImage = 0;
	else
		outputImage = inputImage - (127 * percent / 100);
	end
end