function [ outputImage ] = histEqualize( inputImage )
	imageSize = size(inputImage);
	
	% initializing frequency array
	for i = 1 : 256
		frequencyArray(i) = 0;
	end

	% making the frequency array
	for i = 1 : imageSize(1)
		for j = 1 : imageSize(2)
			frequencyArray(inputImage(i,j) + 1) = frequencyArray(inputImage(i,j) + 1) + 1;
		end
	end

	% making the pdf array
	totalPixels = imageSize(1) * imageSize(2);
	for i = 1 : 256
		pdfArray(i) = frequencyArray(i) / totalPixels;
	end

	% making the cdf array
	cdfArray(1) = pdfArray(1);
	for i = 2 : 256
		cdfArray(i) = cdfArray(i-1) + pdfArray(i);
	end

	for i = 1 : 256
		outputArray(i) = round(cdfArray(i) * 255);
	end
	
	outputImage = inputImage;
	for i = 1 : imageSize(1)
		for j = 1 : imageSize(2)
			outputImage(i,j) = outputArray(inputImage(i,j) + 1);
		end
	end
end