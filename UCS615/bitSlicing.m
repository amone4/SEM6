function [outputImage] = bitSlicing (inputImage, bitPosition, bit)
	if (bit == 1)
		outputImage = bitand(bitshift(1, bitPosition - 1), inputImage);
	end
end
