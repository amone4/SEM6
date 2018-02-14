% function flips a grey image
function [flipped] = flipImage(grey)
	rows = size(grey, 1);
	cols = size(grey, 2);
	for i = 1 : rows
		for j = 1 : cols
			flipped(rows-i+1,cols-j+1) = grey(i,j);
		end
	end