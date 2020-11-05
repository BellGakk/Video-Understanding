img = im2double(imread('moonlanding.png'));
img = imresize(img, [64,64]);

f = fftshift(fft2(img));
subplot(2,2,1),imshow(f),title('0');
for i=1:3
    [m,n] = size(img);
    A = zeros(m,n);
    img = [img, A];
    B = zeros(m,2*n);
    img = [img; B];
    f = fftshift(fft2(img));
    subplot(2,2,i+1),imshow(f),title('%d',i);
end
