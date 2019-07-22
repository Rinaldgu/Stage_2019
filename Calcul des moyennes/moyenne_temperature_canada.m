clear on

for p=1:size(BM,2)
     if BM(9,p)<0
        BM(9,p)=BM(9,p)+360;
     end
end

s1=0;
s2=0;
s3=0;
s4=0;
s5=0;
s6=0;
s7=0;
s8=0;
s9=0;
s10=0;
s11=0;
s12=0;
s13=0;
s14=0;
s15=0;
n1=0;
n2=0;
n3=0;
n4=0;
n5=0;
n6=0;
n7=0;
n8=0;
n9=0;
n10=0;
n11=0;
n12=0;
n13=0;
n14=0;
n15=0;

janvier_canada_temperature=0;
fevrier_canada_temperature=0;
mars_canada_temperature=0;
avril_canada_temperature=0;
mai_canada_temperature=0;
juin_canada_temperature=0;
juillet_canada_temperature=0;
aout_canada_temperature=0;
septembre_canada_temperature=0;
octobre_canada_temperature=0;
novembre_canada_temperature=0;
decembre_canada_temperature=0;

e1c=NaN(1,size(BM,2));
e2c=NaN(1,size(BM,2));
e3c=NaN(1,size(BM,2));
e4c=NaN(1,size(BM,2));
e5c=NaN(1,size(BM,2));
e6c=NaN(1,size(BM,2));
e7c=NaN(1,size(BM,2));
e8c=NaN(1,size(BM,2));
e9c=NaN(1,size(BM,2));
e10c=NaN(1,size(BM,2));
e11c=NaN(1,size(BM,2));
e12c=NaN(1,size(BM,2));

x1c=NaN(1,size(e1c,2));
x2c=NaN(1,size(e1c,2));
x3c=NaN(1,size(e1c,2));
x4c=NaN(1,size(e1c,2));
x5c=NaN(1,size(e1c,2));
x6c=NaN(1,size(e1c,2));
x7c=NaN(1,size(e1c,2));
x8c=NaN(1,size(e1c,2));
x9c=NaN(1,size(e1c,2));
x10c=NaN(1,size(e1c,2));
x11c=NaN(1,size(e1c,2));
x12c=NaN(1,size(e1c,2));


for j=1:size(BM,2)
    if BM(10,j)>72 &  BM(10,j)<84
        if BM(9,j)>205 & BM(9,j)<230
            if BM(3,j)==1
                if BM(7,j)>0
                   e1c(j)=BM(7,j);
                   x1c(j)=BM(3,j)+(BM(2,j)*(100/31))/100; 
                   s1=s1+BM(7,j);
                   n1=n1+1;
                   janvier_canada_temperature=s1/n1;
                end
            end
        end
    end
end

for j=1:size(BM,2)
    if BM(10,j)>72 &  BM(10,j)<84
        if BM(9,j)>205 & BM(9,j)<230
            if BM(3,j)==2
                if BM(7,j)>0
                   e1c(j)=BM(7,j);
                   x1c(j)=BM(3,j)+(BM(2,j)*(100/31))/100; 
                   s2=s2+BM(7,j);
                   n2=n2+1;
                   fevrier_canada_temperature=s2/n2;
                end
            end
        end
    end
end

for j=1:size(BM,2)
    if BM(10,j)>72 &  BM(10,j)<84
        if BM(9,j)>205 & BM(9,j)<230
            if BM(3,j)==3
                if BM(7,j)>0
                   e1c(j)=BM(7,j);
                   x1c(j)=BM(3,j)+(BM(2,j)*(100/31))/100; 
                   s3=s3+BM(7,j);
                   n3=n3+1;
                   mars_canada_temperature=s3/n3;
                end
            end
        end
    end
end

for j=1:size(BM,2)
    if BM(10,j)>72 &  BM(10,j)<84
        if BM(9,j)>205 & BM(9,j)<230
            if BM(3,j)==4
                if BM(7,j)>0
                   e1c(j)=BM(7,j);
                   x1c(j)=BM(3,j)+(BM(2,j)*(100/31))/100; 
                   s4=s4+BM(7,j);
                   n4=n4+1;
                   avril_canada_temperature=s4/n4;
                end
            end
        end
    end
end

for j=1:size(BM,2)
    if BM(10,j)>72 &  BM(10,j)<84
        if BM(9,j)>205 & BM(9,j)<230
            if BM(3,j)==5
                if BM(7,j)>0
                   e1c(j)=BM(7,j);
                   x1c(j)=BM(3,j)+(BM(2,j)*(100/31))/100; 
                   s5=s5+BM(7,j);
                   n5=n5+1;
                   mai_canada_temperature=s5/n5;
                end
            end
        end
    end
end

for j=1:size(BM,2)
    if BM(10,j)>72 &  BM(10,j)<84
        if BM(9,j)>205 & BM(9,j)<230
            if BM(3,j)==6
                if BM(7,j)>0
                   e1c(j)=BM(7,j);
                   x1c(j)=BM(3,j)+(BM(2,j)*(100/31))/100; 
                   s6=s6+BM(7,j);
                   n6=n6+1;
                   juin_canada_temperature=s6/n6;
                end
            end
        end
    end
end

for j=1:size(BM,2)
    if BM(10,j)>72 &  BM(10,j)<84
        if BM(9,j)>205 & BM(9,j)<230
            if BM(3,j)==7
                if BM(7,j)>0
                   e1c(j)=BM(7,j);
                   x1c(j)=BM(3,j)+(BM(2,j)*(100/31))/100; 
                   s7=s7+BM(7,j);
                   n7=n7+1;
                   juillet_canada_temperature=s7/n7;
                end
            end
        end
    end
end

for j=1:size(BM,2)
    if BM(10,j)>72 &  BM(10,j)<84
        if BM(9,j)>205 & BM(9,j)<230
            if BM(3,j)==8
                if BM(7,j)>0
                   e1c(j)=BM(7,j);
                   x1c(j)=BM(3,j)+(BM(2,j)*(100/31))/100; 
                   s8=s8+BM(7,j);
                   n8=n8+1;
                   aout_canada_temperature=s8/n8;
                end
            end
        end
    end
end

for j=1:size(BM,2)
    if BM(10,j)>72 &  BM(10,j)<84
        if BM(9,j)>205 & BM(9,j)<230
            if BM(3,j)==9
                if BM(7,j)>0
                   e1c(j)=BM(7,j);
                   x1c(j)=BM(3,j)+(BM(2,j)*(100/31))/100; 
                   s9=s9+BM(7,j);
                   n9=n9+1;
                   septembre_canada_temperature=s9/n9;
                end
            end
        end
    end
end

for j=1:size(BM,2)
    if BM(10,j)>72 &  BM(10,j)<84
        if BM(9,j)>205 & BM(9,j)<230
            if BM(3,j)==10
                if BM(7,j)>0
                   e1c(j)=BM(7,j);
                   x1c(j)=BM(3,j)+(BM(2,j)*(100/31))/100; 
                   s10=s10+BM(7,j);
                   n10=n10+1;
                   octobre_canada_temperature=s10/n10;
                end
            end
        end
    end
end

for j=1:size(BM,2)
    if BM(10,j)>72 &  BM(10,j)<84
        if BM(9,j)>205 & BM(9,j)<230
            if BM(3,j)==11
                if BM(7,j)>0
                   e1c(j)=BM(7,j);
                   x1c(j)=BM(3,j)+(BM(2,j)*(100/31))/100; 
                   s11=s11+BM(7,j);
                   n11=n11+1;
                   novembre_canada_temperature=s11/n11;
                end
            end
        end
    end
end

for j=1:size(BM,2)
    if BM(10,j)>72 &  BM(10,j)<84
        if BM(9,j)>205 & BM(9,j)<230
            if BM(3,j)==12
                if BM(7,j)>0
                   e1c(j)=BM(7,j);
                   x1c(j)=BM(3,j)+(BM(2,j)*(100/31))/100;
                   s12=s12+BM(7,j);
                   n12=n12+1;
                   decembre_canada_temperature=s12/n12;
                end
            end
        end
    end
end
