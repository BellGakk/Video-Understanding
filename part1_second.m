img = im2double(rgb2gray(imread('Cross.jpg')));

f = fftshift(fft2(img));

subplot(1,3,1),imshow(img),title('Original Image');
subplot(1,3,2),imshow(log(abs(f)),[]),title('Magnitude');
subplot(1,3,3),imshow(log(angle(f) * 180/pi),[]),title('Phase');
