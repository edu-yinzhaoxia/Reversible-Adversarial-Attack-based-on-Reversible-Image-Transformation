function psnr=PSNR(f1,f2)
if length(f1) ~= length(f2)
    errordlg('The length of input data doesnt agree!','Signal to Noise Ratio, SNR');
else
    Noise = sum( ((f1-f2).*(f1-f2)) );
    if Noise == 0
        psnr = 'inf';
    else
        psnr=10*log10( (length(f1)*255^2)/Noise );

    end
end

end