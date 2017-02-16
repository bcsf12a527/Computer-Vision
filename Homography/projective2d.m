function TransformedImage = projective2d (OrignalImage,TransformMatrix)
  pkg load image
  TransformMatrix = transpose(TransformMatrix);
  TransformMatrix = maketform ("projective", TransformMatrix);
  TransformedImage = imtransform(OrignalImage,TransformMatrix,"bilinear");
endfunction