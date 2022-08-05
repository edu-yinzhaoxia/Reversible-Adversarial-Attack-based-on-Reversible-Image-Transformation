function y=modifiable(l,h,Tn,Tp)


if h<=Tp && h >=Tn
    y=0;
    if h>=0
        h=2*h+1;
    else
        h=2*h+0;
    end
    if l+h>=0 && l+h <= 255
        y=y+1;
    end

    if y>0
        if h<=Tp && h >=Tn
            if h>=0
                h=2*h+1;
            else
                h=2*h+0;
            end
            if l+h>=0 && l+h <= 255
                y=y+1;
            end
        elseif h>Tp
            if l+h+Tp+1<=255
                y=y+1;
            end
        elseif h<Tn
            if l+h+Tn>=0
                y=y+1;
            end
        end
    end
else
    y=0;
    if h>Tp
        if l+h+Tp+1<=255
            y=-1;
            if l+h+2*(Tp+1)<=255
                y=-2;
            end
        end
    else
        if l+h+Tn>=0
            y=-1;
            if l+h+2*Tn>=0
                y=-2;
            end
        end
    end
end






end