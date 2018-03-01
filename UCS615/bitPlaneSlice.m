function [ outputImage ] = bitPlaneSlice ( inputImage )
	imageSize = size(inputImage);
	for i = 1 : imageSize(1)
		for j = 1 : imageSize(2)
			for k = 1 : 8
				outputImage(i,j,k) = logical(mod(inputImage(i,j), 2));
				inputImage(i,j) = inputImage(i,j) / 2;
			end
		end
	end
end