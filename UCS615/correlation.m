function [outputImage] = correlation (inputImage, weightMask)
	% mask size is 3
	imageSize = size(inputImage);
	outputImage = inputImage;

	for i = 1 : imageSize(1)
		for j = 1 : imageSize(2)
			weightSum = 0;

			if (i == 1)
				if (j == 1)
					% top left corner
					kstart = 2; kend = 3;
					lstart = 2; lend = 3;

				elseif (j == imageSize(2))
					% top right corner
					kstart = 2; kend = 3;
					lstart = 1; lend = 2;

				else
					% top edge
					kstart = 2; kend = 3;
					lstart = 1; lend = 3;

				end

			elseif (i == imageSize(1))
				if (j == 1)
					% bottom left corner
					kstart = 1; kend = 2;
					lstart = 2; lend = 3;

				elseif (j == imageSize(2))
					% bottom right corner
					kstart = 1; kend = 2;
					lstart = 1; lend = 2;

				else
					% bottom edge
					kstart = 1; kend = 2;
					lstart = 1; lend = 3;

				end

			elseif (j == 1)
				% left edge
				kstart = 1; kend = 3;
				lstart = 2; lend = 3;

			elseif (j == imageSize(2))
				% right edge
				kstart = 1; kend = 3;
				lstart = 1; lend = 2;

			else
				% normal
				kstart = 1; kend = 3;
				lstart = 1; lend = 3;

			end

			temp = 0;
			for k = kstart : kend
				for l = lstart : lend
					weightSum = weightSum + weightMask(k,l);
					temp = temp + (weightMask(k,l) * inputImage(i+k-2,j+l-2));
				end
			end
			temp = temp / weightSum;
			outputImage(i,j) = round(temp);

		end
	end
end