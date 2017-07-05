function img = floyd_steinberg_dither_uniform_distribution(input)
%=================================================
% UNIVERSITY OF CALIFORNIA, SANTA BARBARA
% ECE160 - SPRING 2015
% MADE BY: RAPHAEL RUSCHEL DOS SANTOS
% INPUT = GRAYSCALE IMAGE
% OUTPUT = IMAGE AFTER DITHERING HAS BEEN APPLIED
%=================================================

img = input;
img = double(img);
[X,Y,~] = size(img);

for x=1:X
    for y=1:Y
        old = img(x,y);
        
        if(old >= 128) %Apply the thresholding
            new = 255;
        else
            new = 0;
        end
        
        img(x,y) = new;
        error = old - new;
        
        if(x < X)
            img(x+1,y) = img(x+1,y) + error*(7/16);
            if(y > 1)
                img(x+1,y-1) = img(x+1,y-1) + error*(1/16);
            end
            if(y < Y)
                img(x+1,y+1) = img(x+1,y+1) + error*(5/16);
            end
        end
        if(y < Y)
            img(x,y+1) = img(x,y+1) + error*(3/16);
        end
        
    end
end
end






