clc; 
clear all;
close all;

%Extraccion de la imagen
img1=imread('IMG\1.jpg');
img2=imread('IMG\2.jpg');

%Redimension
[f1 c1]=size(img1);
[f2 c2]=size(img2);

[imgRes1 imgRes2]=Comp(f1,c1,f2,c2,img1,img2);
figure()
subplot(1,2,1)
imshow(imgRes1)
title('Img1 - Img2')
subplot(1,2,2)
imshow(imgRes2)
title('Img2 - Img1')

%Con la funcion 
[imgRes3 imgRes4]=Comp2(f1,c1,f2,c2,img1,img2);
figure()
subplot(1,2,1)
imshow(imgRes3)
title('imsubstract(img1,img2)')
subplot(1,2,2)
imshow(imgRes4)
title('imsubstract(img2,img1)')

function [imgRes1 imgRes2]=Comp(f1,c1,f2,c2,img1,img2)
    if (f1<f2) || (c1<c2/3)
        imgr=imresize(img1,[f2 c2/3]);
        imgRes1=imgr-img2;
        imgRes2=img2-imgr;
    else
        imgr=imresize(img2,[f1 c1/3]);
        imgRes1=imgr-img1;
        imgRes2=img1-imgr;
    end
end

function [imgRes3 imgRes4]=Comp2(f1,c1,f2,c2,img1,img2)
    if (f1<f2) || (c1<c2/3)
        imgr=imresize(img1,[f2 c2/3]);
        imgRes3=imsubtract(imgr,img2);
        imgRes4=imsubtract(img2,imgr);
    else
        imgr=imresize(img2,[f1 c1/3]);
        imgRes3=imsubtract(img1,imgr);
        imgRes4=imsubtract(imgr,img1);
    end
end