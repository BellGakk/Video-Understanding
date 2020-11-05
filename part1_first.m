img = eye(512);
[m,n] = size(img);
for i=1:m
    for j=1:n
        img(i,j) = sin(0.2*i) + sin(0.3*i) + cos(0.4*i) + sin(0.15*sqrt(i^2 + j^2)) + sin(0.35*sqrt(i^2+j^2));
    end
end

f=fft2(img);        
f=fftshift(f);             
magnitude=abs(f);      
phase=angle(f)*180/pi; 
subplot(2,2,1),imshow(img),title('Original Image');
subplot(2,2,2),imshow(log(magnitude),[]),title('Magnitude');
subplot(2,2,3),imshow(log(phase),[]),title('Phase');

Inverse = ifft2(ifftshift(2*magnitude));
subplot(2,2,4);imshow(Inverse),title('Inverse');
