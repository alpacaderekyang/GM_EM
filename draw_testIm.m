im_size = 128;
I2 = zeros(im_size,im_size);

%draw first rect
I2(floor(im_size*0.2):floor(im_size*0.7),floor(im_size*0.25):floor(im_size*0.45)) = 1;

%draw second rect
I2(floor(im_size*0.3):floor(im_size*0.6),floor(im_size*0.65):floor(im_size)*0.9) = 1;

%rotate
I2 = imrotate(I2,-45);

center = size(I2,1)/2;
I2 = I2(center-im_size/2+1:center+im_size/2,center-im_size/2+1:center+im_size/2);

imshow(I2);