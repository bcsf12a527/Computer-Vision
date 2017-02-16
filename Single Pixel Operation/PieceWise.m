function re_img = PieceWise (img, k, per)
	if nargin < 2
		error 'You must provide an image and no of bits';
	end

	if nargin == 2
		per = 50;
	end
	
	s = size(img);
	re_img = zeros(s(1),s(2), "double");

	x1 = round( 2^k * per / 100 );
	x2 = round( 2^k * (100-per) / 100 );

	y1 = round( (2^k/3) );
	y2 = round( (2^k)-(2^k/3) );
	p = zeros(4,2);
	p(1,:) = [0 0];
	p(2,:) = [x1 y1];
	p(3,:) = [x2 y2];
	p(4,:) = [(2^k)-1 (2^k)-1];

  figure
	plot(p(:,1),p(:,2));

	m1 = ( p(2,2) - p(1,2) ) / ( p(2,1) - p(1,1) );
	m2 = ( p(3,2) - p(2,2) ) / ( p(3,1) - p(2,1) );
	m3 = ( p(4,2) - p(3,2) ) / ( p(4,1) - p(3,1) );

	c1 = p(1,2) - ( m1*p(1,1) );
	c2 = p(2,2) - ( m2*p(2,1) );
	c3 = p(3,2) - ( m2*p(3,1) );

	for i = 1:s(1)
		for j = 1:s(2)
			if img(i,j) < x1
				re_img(i,j) = ( m1*img(i,j) ) + c1;
			else
				if img(i,j) > x2
					re_img(i,j) = ( m3*img(i,j) ) + c3;
				else
					re_img(i,j) = ( m2*img(i,j) ) + c2;
				endif
			endif
		endfor
	endfor
	
	re_img = uint8(re_img);
endfunction