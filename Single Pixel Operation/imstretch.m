## Author: idrees
## Created: 2015-11-24

function ret = sample (img, pcut)
	if nargin == 0
		error 'You must provide an image as matrix';
	end

	if nargin == 1
		pcut = 50;
	end
	
	bend = 256 * pcut / 100
	
	multiple = (256/3) / bend
	
	ret = img;
	for r=1 : size(ret,1)
		for c=1 : size(ret,2)
			if img(r,c) < bend
				ret(r,c) = img(r,c)*multiple;
			else
				ret(r,c) = 128*(double(img(r,c))- bend+1)/(255-bend+1)+127;
			endif
		endfor
	endfor
	
endfunction
















	% ind = find(img < bend);
	% ind2 = find(img >= bend);
	% ret(ind) = img(ind)*multiple;
	% ret(ind2) = 128*(double(img(ind2))- bend+1)/(255-bend+1)+127;;
