%draw rect
im_size = 128;
frag = 0.707;
I = zeros(im_size,im_size);
I((im_size*(1-frag)/2:im_size*(1+frag)/2),(im_size*(1-frag)/2:im_size*(1+frag)/2)) = 1;
for i = 1:im_size
    for j = 1:im_size
        if( i+j>(im_size*(1+frag/2)) || i+j<(im_size*(1-frag/2)) || i-j>(im_size*(frag/2)) || i-j<-(im_size*(frag/2)) )
            I(i,j)=0;
        end
    end
end
imshow(I)