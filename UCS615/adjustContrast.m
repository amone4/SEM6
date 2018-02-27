function [ outputImage ] = adjustContrast( inputImage , percent )
	maxIntensity = 255;
	imageSize = size(inputImage);
	averageIntensity = round(sum(sum(inputImage)) / (imageSize(1) * imageSize(2)));

	if (percent >= 0 && percent <= 100)
		for i = 1 : imageSize(1)
			for j = 1 : imageSize(2)
				if (inputImage(i,j) < averageIntensity)
					if (inputImage(i,j) - percent * averageIntensity / 200 < 0)
						outputImage(i,j) = 0;
					else
						outputImage(i,j) = inputImage(i,j) - percent * averageIntensity / 200;
					end
				elseif (inputImage(i,j) > averageIntensity)
					if (inputImage(i,j) + percent * averageIntensity / 200 > maxIntensity)
						outputImage(i,j) = maxIntensity;
					else
						outputImage(i,j) = inputImage(i,j) + percent * averageIntensity / 200;
					end
				else
					outputImage(i,j) = inputImage(i,j);
				end
			end
		end

	elseif (percent >= -100)
		percent = -1 * percent;
		for i = 1 : imageSize(1)
			for j = 1 : imageSize(2)
				if (inputImage(i,j) < averageIntensity)
					if (inputImage(i,j) + percent * averageIntensity / 200 > averageIntensity)
						outputImage(i,j) = averageIntensity;
					else
						outputImage(i,j) = inputImage(i,j) + percent * averageIntensity / 200;
					end
				elseif (inputImage(i,j) > averageIntensity)
					if (inputImage(i,j) - percent * averageIntensity / 200 < averageIntensity)
						outputImage(i,j) = averageIntensity;
					else
						outputImage(i,j) = inputImage(i,j) - percent * averageIntensity / 200;
					end
				else
					outputImage(i,j) = inputImage(i,j);
				end
			end
		end
	end
end