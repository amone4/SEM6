function [zoomed] = twoX(original)
	originalSize = size(original);
	
	% initializing the zoomed image
	for i = 1 : originalSize(1)
		for j = 1 : originalSize(2)
			zoomed(2*i - 1, 2*j - 1) = original(i, j);
			zoomed(2*i, 2*j - 1) = 0;
			zoomed(2*i - 1, 2*j) = 0;
			zoomed(2*i, 2*j) = 0;
		end
	end

	% copying the columns
	for i = 1 : originalSize(1)
		for j = 1 : originalSize(2)
			if (j ~= originalSize(2))
				zoomed(2*i - 1, 2*j) = (zoomed(2*i - 1, 2*j - 1) / 2) + (zoomed(2*i - 1, 2*j + 1) / 2);
			else
				zoomed(2*i - 1, 2*j) = zoomed(2*i - 1, 2*j - 1) / 2;
			end
		end
	end

	% copying the rows
	for i = 1 : originalSize(1)
		if (i ~= originalSize(1))
			for j = 1 : originalSize(2)
				zoomed(2*i, 2*j - 1) = (zoomed(2*i - 1, 2*j - 1) / 2) + (zoomed(2*i + 1, 2*j - 1) / 2);
				zoomed(2*i, 2*j) = (zoomed(2*i - 1, 2*j) / 2) + (zoomed(2*i + 1, 2*j) / 2);
			end
		else
			for j = 1 : originalSize(2)
				zoomed(2*i, 2*j - 1) = zoomed(2*i - 1, 2*j - 1) / 2;
				zoomed(2*i, 2*j) = zoomed(2*i - 1, 2*j) / 2;
			end
		end
	end