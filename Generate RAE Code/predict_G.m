function pred_value=predict_G(X)
u=X(1);
v=X(2);
w=X(3);
if w>=max(u,v)
    pred_value=min(u,v);
elseif w<=min(u,v)
    pred_value=max(u,v);
else
    pred_value=u+v-w;
end