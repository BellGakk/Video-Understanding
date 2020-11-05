img = eye(512);
for i=1:512
    for j=1:512
        img(i,j) = sin(0.2*i) + sin(0.3*i) + cos(0.4*i) + sin(0.15*sqrt(i^2 + j^2)) + sin(0.35*sqrt(i^2+j^2));
    end
end

[M,N]=size(img); % get the image size
T=zeros(M,N);
tic % start counting
for x = 1:M % for every row
    for y = 1:N % for every column
        for u =1:M
            for v = 1:N
                E = exp(-1i*2*pi*(((u-1)*(x-1)/M)+((v-1)*(y-1)/N))); % get exp kernel
                T(x,y) = T(x,y) + img(u,v)*E;
            end
        end
    end
end
toc % stop counting
subplot(1,2,1),imshow(img),title('raw');
subplot(1,2,2),imshow(T),title('2D-DFT');