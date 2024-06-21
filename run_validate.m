
valids=[0.05,0.1,0.25,0.5,0.75,0.9,0.95];
nval=size(valids,2);
Omega=zeros(1,nval);
for i=1:nval
    valid_split=valids(1,i)
    validate;
    Omega(1,i)=pc_same;
end
