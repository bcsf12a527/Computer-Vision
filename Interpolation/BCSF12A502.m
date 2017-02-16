close all;
%read the image
img = imread('ab-small.pgm');

imgrows = size(img, 1);
imgcols = size(img, 2);
#dimg = zeros(imgrows*2, imgcols*2, 'uint8');
dimg = zeros(imgrows*2, imgcols*2);

[r,c]=size(img);
%zooming factor
n=2;
% Copy the original values
    for i=1:r
        for j=1:c
            dimg(i*n-n+1,j*n-n+1)=img(i,j);            
        end
    end

%find values in rows
[dimgrows,dimgcols]=size(dimg);
for r=1:2:dimgrows
    for c=1:2:dimgcols
		if c == (dimgcols-1),
			dimg(r, c+1) = dimg(r, c);
		else,
        dimg(r, c+1)=(dimg(r, c) * (0.5)) + (dimg(r, c+2) * (0.5));  
		end;
    end
end
dimg(dimgrows,:) = dimg(dimgrows-1,:);
%find values in cols
for r=1:2:dimgrows
    for c=1:2:dimgcols
		if r == (dimgrows-1),
			dimg(r+1, c) = dimg(r, c);
		else,
        dimg(r+1, c)=(dimg(r, c) * (0.5)) + (dimg(r+2, c) * (0.5)); 
		end;
    end
end
dimg(:,dimgcols) = dimg(:,dimgcols-1);

for r=2:2:dimgrows-1
    for c=2:2:dimgcols-1
		dimg(r, c)= 0.25 * (dimg(r-1, c) + dimg(r, c-1) + dimg(r, c+1) + dimg(r+1, c));
    end
end
imwrite(uint8(dimg), 'ab-zoomed-2.pgm');
%dimg