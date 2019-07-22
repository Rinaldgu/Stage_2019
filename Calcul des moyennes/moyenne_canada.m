clear on

%Programme calculant les moyennes mensuelles de mld dans le bassin Canadien
%La matrice BM doit être chargée afin de lancer le programme.

for p=1:size(BM,2)
     if BM(9,p)<0
        BM(9,p)=BM(9,p)+360; %On s'assure que les mesure de longitude soit supérieur à 0
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

janvier_canada=0;
fevrier_canada=0;
mars_canada=0;
avril_canada=0;
mai_canada=0;
juin_canada=0;
juillet_canada=0;
aout_canada=0;
septembre_canada=0;
octobre_canada=0;
novembre_canada=0;
decembre_canada=0;

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
    if BM(10,j)>70 &  BM(10,j)<83.5
        if BM(9,j)>180 & BM(9,j)<240
            if BM(3,j)==1
                if BM(5,j)>0
                   e1c(j)=BM(5,j);
                   x1c(j)=BM(3,j)+(BM(2,j)*(100/31))/100; 
                   s1=s1+BM(5,j);
                   n1=n1+1;
                   janvier_canada=s1/n1;
                end
            end
        end
    end
end

for j=1:size(BM,2)
    if BM(10,j)>70 &  BM(10,j)<83.5
        if BM(9,j)>180 & BM(9,j)<240
            if BM(3,j)==2
                if BM(5,j)>0
                   e2c(j)=BM(5,j);
                   x2c(j)=BM(3,j)+(BM(2,j)*(100/31))/100;  
                   s2=s2+BM(5,j);
                   n2=n2+1;
                   fevrier_canada=s2/n2;
                end
            end
        end
    end
end

for j=1:size(BM,2)
    if BM(10,j)>70 &  BM(10,j)<83.5
        if BM(9,j)>180 & BM(9,j)<240
            if BM(3,j)==3
                if BM(5,j)>0
                   e3c(j)=BM(5,j);
                   x3c(j)=BM(3,j)+(BM(2,j)*(100/31))/100;                      
                   s3=s3+BM(5,j);
                   n3=n3+1;
                   mars_canada=s3/n3;
                end
            end
        end
    end
end

for j=1:size(BM,2)
    if BM(10,j)>70 &  BM(10,j)<83.5
        if BM(9,j)>180 & BM(9,j)<240
            if BM(3,j)==4
                if BM(5,j)>0
                   e4c(j)=BM(5,j);
                   x4c(j)=BM(3,j)+(BM(2,j)*(100/31))/100;                      
                   s4=s4+BM(5,j);
                   n4=n4+1;
                   avril_canada=s4/n4;
                end
            end
        end
    end
end

for j=1:size(BM,2)
    if BM(10,j)>70 &  BM(10,j)<83.5
        if BM(9,j)>180 & BM(9,j)<240
            if BM(3,j)==5
                if BM(5,j)>0
                   e5c(j)=BM(5,j);
                   x5c(j)=BM(3,j)+(BM(2,j)*(100/31))/100;                      
                   s5=s5+BM(5,j);
                   n5=n5+1;
                   mai_canada=s5/n5;
                end
            end
        end
    end
end

for j=1:size(BM,2)
    if BM(10,j)>70 &  BM(10,j)<83.5
        if BM(9,j)>180 & BM(9,j)<240
            if BM(3,j)==6
                if BM(5,j)>0
                   e6c(j)=BM(5,j);
                   x6c(j)=BM(3,j)+(BM(2,j)*(100/31))/100;                      
                   s6=s6+BM(5,j);
                   n6=n6+1;
                   juin_canada=s6/n6;
                end
            end
        end
    end
end

for j=1:size(BM,2)
    if BM(10,j)>70 &  BM(10,j)<83.5
        if BM(9,j)>180 & BM(9,j)<240
            if BM(3,j)==7
                if BM(5,j)>0
                   e7c(j)=BM(5,j);
                   x7c(j)=BM(3,j)+(BM(2,j)*(100/31))/100;                      
                   s7=s7+BM(5,j);
                   n7=n7+1;
                   juillet_canada=s7/n7;
                end
            end
        end
    end
end

for j=1:size(BM,2)
    if BM(10,j)>70 &  BM(10,j)<83.5
        if BM(9,j)>180 & BM(9,j)<240
            if BM(3,j)==8
                if BM(5,j)>0
                   e8c(j)=BM(5,j);
                   x8c(j)=BM(3,j)+(BM(2,j)*(100/31))/100;                      
                   s8=s8+BM(5,j);
                   n8=n8+1;
                   aout_canada=s8/n8;
                end
            end
        end
    end
end

for j=1:size(BM,2)
    if BM(10,j)>70 &  BM(10,j)<83.5
        if BM(9,j)>180 & BM(9,j)<240
            if BM(3,j)==9
                if BM(5,j)>0
                   e9c(j)=BM(5,j);
                   x9c(j)=BM(3,j)+(BM(2,j)*(100/31))/100;                      
                   s9=s9+BM(5,j);
                   n9=n9+1;
                   septembre_canada=s9/n9;
                end
            end
        end
    end
end

for j=1:size(BM,2)
    if BM(10,j)>70 &  BM(10,j)<83.5
        if BM(9,j)>180 & BM(9,j)<240
            if BM(3,j)==10
                if BM(5,j)>0
                   e10c(j)=BM(5,j);
                   x10c(j)=BM(3,j)+(BM(2,j)*(100/31))/100;                      
                   s10=s10+BM(5,j);
                   n10=n10+1;
                   octobre_canada=s10/n10;
                end
            end
        end
    end
end

for j=1:size(BM,2)
    if BM(10,j)>70 &  BM(10,j)<83.5
        if BM(9,j)>180 & BM(9,j)<240
            if BM(3,j)==11
                if BM(5,j)>0
                   e11c(j)=BM(5,j);
                   x11c(j)=BM(3,j)+(BM(2,j)*(100/31))/100;                      
                   s11=s11+BM(5,j);
                   n11=n11+1;
                   novembre_canada=s11/n11;
                end
            end
        end
    end
end

for j=1:size(BM,2)
    if BM(10,j)>70 &  BM(10,j)<83.5
        if BM(9,j)>180 & BM(9,j)<240
            if BM(3,j)==12
                if BM(5,j)>0
                   e12c(j)=BM(5,j);
                   x12c(j)=BM(3,j)+(BM(2,j)*(100/31))/100;                      
                   s12=s12+BM(5,j);
                   n12=n12+1;
                   decembre_canada=s12/n12;
                end
            end
        end
    end
end


