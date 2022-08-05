function [m]=main(OriginalPath,TargetPath)
    
    Block.w=1;
    Block.h=1;
    DT=6;
    ss=imread(OriginalPath);
    cc=imread(TargetPath);

    ss=double(ss);
    cc=double(cc);
    % err_rot=retotate(ss(:,:,2));
    % addpath arith_encoder\;
    % compressfun(err_rot)/length(err_rot)
    % hist(err_rot,0:3)
%      [transformed_rmse,stego_rmse,bpp,smo]=transform(ss,cc,DT,Block)
     [transformed_rmse,stego_rmse,res,bpp,smo]=transform(ss,cc,DT,Block);
     m=res;
     %m=res
     

