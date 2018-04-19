function [ outputImage ] = JEPGCompression ( inputImage )

	imageSize = size(inputImage);

	% breaking into blocks
	for i = 1 : imageSize(1)
		for j = 1 : imageSize(2)
			% copying content
			for k = i : min(i+8, imageSize(1))
				for l = j : min(j+8, imageSize(2))
					imageBlock(k-i+1, l-j+1) = inputImage(k, l);
				end
			end
			% adding padding
			for x = k : i + 8
				for y = l : i + 8
					imageBlock(x-i+1, y-j+1) = 0;
				end
			end
			% updating i and j
			i = k;
			j = l;

			% processing of each block

		end
	end