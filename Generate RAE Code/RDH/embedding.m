function [bpp psnr embedded]=embedding(I,BPP)
watermarked=embeddingonce(I,BPP/2,0);

watermarked=embeddingonce(watermarked,BPP/2,1);
embedded=watermarked;
psnr=PSNR(watermarked(:),I(:));
bpp=BPP;
end