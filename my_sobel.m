function [] = my_sobel(imagePath)

    % load image
    originalImage = im2double(imread(imagePath, 'bmp'));
    
    % show original image
    figure(1)
    imshow(originalImage);
    pause;

    % to grey
    greyImage = rgb2gray(originalImage);
    
    %show grayscale image
    figure(2)
    imshow(greyImage); 
    pause;

    % Sobel horizontal filter
    horK = [1 0 -1; 2 0 -2; 1 0 -1];

    % Sobel vertical filter
    verK = horK';

    imH = my_convolution(greyImage, horK);

    imV = my_convolution(greyImage, verK);

    % show filtered images
    figure(3)
    imshow(imH);
    pause;

    figure(4)
    imshow(imV); 
    pause;

    % compute magnitude
    magnitude = sqrt(double((imH.^2) + (imV.^2)));

    figure(5)
    imshow(magnitude);
    pause;

    % compute normalized magnitude
    magnitude = uint8(255 * mat2gray(sqrt(double((imH.^2) + (imV.^2)))));

    figure(6)
    imshow(magnitude);
    pause;

    h = fspecial('sobel');
    ih = imfilter(greyImage, h', 'replicate');
    iv = imfilter(greyImage, h, 'replicate');
    sobel = uint8(255 * mat2gray(sqrt(double((ih.^2) + (iv.^2)))));

    figure(7)
    imshow(sobel);
end
