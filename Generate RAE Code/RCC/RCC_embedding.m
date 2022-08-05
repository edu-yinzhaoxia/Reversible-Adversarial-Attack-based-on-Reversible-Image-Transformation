function embedded =RCC_embedding(img,bpp)
%EMBEDDING Summary of this function goes here
%   Detailed explanation goes here
img=double(img);
waterMark = imageEmbed(img,bpp,0);
waterMark = imageEmbed(waterMark,bpp,1);
embedded = waterMark;

end

