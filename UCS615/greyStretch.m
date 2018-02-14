function [outputImage] = greyStretch (inputImage, Rmin, Rmax, Smin, Smax)
	greyStretchSize = size(inputImage);
	for i = 1 : greyStretchSize(1)
		for j = 1 : greyStretchSize(2)
			if (inputImage(i,j) < Rmax && inputImage(i,j) > Rmin)
				outputImage(i,j) = Smin + ((Smax - Smin) / (Rmax - Rmin)) * (inputImage(i,j) - Rmin);
			else
				outputImage(i,j) = 0;
			end
		end
	end
end