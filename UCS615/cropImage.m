function [cropped] = cropImage(image, rows, cols)
	for i = 1 : rows
		for j = 1 : cols
			cropped(i,j) = image(i,j);
		end
	end