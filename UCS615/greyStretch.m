function [outputImage] = greyStretch (inputImage, Rmin, Rmax, Smin, Smax)
	imageSize = size(inputImage);
	for i = 1 : imageSize(1)
		for j = 1 : imageSize(2)
			if (inputImage(i,j) < Rmax && inputImage(i,j) > Rmin)
				outputImage(i,j) = Smin + ((Smax - Smin) / (Rmax - Rmin)) * (inputImage(i,j) - Rmin);
			else
				outputImage(i,j) = inputImage(i,j);
			end
		end
	end
end