clear on

%Programme calculant les moyenne mensuelles de mld dans le bassin Eurasien
%La matrice BM doit être chargée afin de lancer le programme.

for p=1:size(BM,2)
     if BM(9,p)<0
        BM(9,p)=BM(9,p)+360; %On s'assure que les mesures de longitude soit supérieur à 0
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


janvier_eurasie=0;
fevrier_eurasie=0;
mars_eurasie=0;
avril_eurasie=0;
mai_eurasie=0;
juin_eurasie=0;
juillet_eurasie=0;
aout_eurasie=0;
septembre_eurasie=0;
octobre_eurasie=0;
novembre_eurasie=0;
decembre_eurasie=0;

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

x1=NaN(1,size(e1c,2));
x2=NaN(1,size(e1c,2));
x3=NaN(1,size(e1c,2));
x4=NaN(1,size(e1c,2));
x5=NaN(1,size(e1c,2));
x6=NaN(1,size(e1c,2));
x7=NaN(1,size(e1c,2));
x8=NaN(1,size(e1c,2));
x9=NaN(1,size(e1c,2));
x10=NaN(1,size(e1c,2));
x11=NaN(1,size(e1c,2));
x12=NaN(1,size(e1c,2));


for j=1:size(BM,2)
    if BM(10,j)>82 &  BM(10,j)<90 & BM(9,j)>0 & BM(9,j)<140 | BM(10,j)>78 &  BM(10,j)<82 & BM(9,j)>110 & BM(9,j)<140 | BM(10,j)>82 &  BM(10,j)<90 & BM(9,j)>310 & BM(9,j)<360
            if BM(3,j)==1
                if BM(5,j)>0
                   e1(j)=BM(5,j); % mld
                   x1(j)=BM(3,j)+(BM(2,j)*(100/31))/100; %On crée un vecteur qui servira d'abcisse pour le graphique. Chaque valeurs de mld du mois de janvier a une valeur en abcisse correspondant entre 1 et 2 selon le jour de la mesure. 
                   s1=s1+BM(5,j); % nomme des valeurs
                   n1=n1+1; % Nombre de valeurs
                   janvier_eurasie=s1/n1; %moyenne
                end
            end
    end
end

for j=1:size(BM,2)
    if BM(10,j)>82 &  BM(10,j)<90 & BM(9,j)>0 & BM(9,j)<140 | BM(10,j)>78 &  BM(10,j)<82 & BM(9,j)>110 & BM(9,j)<140 | BM(10,j)>82 &  BM(10,j)<90 & BM(9,j)>310 & BM(9,j)<360
            if BM(3,j)==2
                if BM(5,j)>0
                   e2(j)=BM(5,j);
                   x2(j)=BM(3,j)+(BM(2,j)*(100/31))/100;  
                   s2=s2+BM(5,j);
                   n2=n2+1;
                   fevrier_eurasie=s2/n2;
                end
            end
    end
end

for j=1:size(BM,2)
    if BM(10,j)>82 &  BM(10,j)<90 & BM(9,j)>0 & BM(9,j)<140 | BM(10,j)>78 &  BM(10,j)<82 & BM(9,j)>110 & BM(9,j)<140 | BM(10,j)>82 &  BM(10,j)<90 & BM(9,j)>310 & BM(9,j)<360
            if BM(3,j)==3
                if BM(5,j)>0
                   e3(j)=BM(5,j);
                   x3(j)=BM(3,j)+(BM(2,j)*(100/31))/100;                      
                   s3=s3+BM(5,j);
                   n3=n3+1;
                   mars_eurasie=s3/n3;
                end
            end
    end

end

for j=1:size(BM,2)
    if BM(10,j)>82 &  BM(10,j)<90 & BM(9,j)>0 & BM(9,j)<140 | BM(10,j)>78 &  BM(10,j)<82 & BM(9,j)>110 & BM(9,j)<140 | BM(10,j)>82 &  BM(10,j)<90 & BM(9,j)>310 & BM(9,j)<360
            if BM(3,j)==4
                if BM(5,j)>0
                   e4(j)=BM(5,j);
                   x4(j)=BM(3,j)+(BM(2,j)*(100/31))/100;                    
                   s4=s4+BM(5,j);
                   n4=n4+1;
                   avril_eurasie=s4/n4;
                end
            end
    end
end

for j=1:size(BM,2)
    if BM(10,j)>82 &  BM(10,j)<90 & BM(9,j)>0 & BM(9,j)<140 | BM(10,j)>78 &  BM(10,j)<82 & BM(9,j)>110 & BM(9,j)<140 | BM(10,j)>82 &  BM(10,j)<90 & BM(9,j)>310 & BM(9,j)<360
            if BM(3,j)==5
                if BM(5,j)>0
                   e5(j)=BM(5,j);
                   x5(j)=BM(3,j)+(BM(2,j)*(100/31))/100;                       
                   s5=s5+BM(5,j);
                   n5=n5+1;
                   mai_eurasie=s5/n5;
                end
            end
    end
end

for j=1:size(BM,2)
    if BM(10,j)>82 &  BM(10,j)<90 & BM(9,j)>0 & BM(9,j)<140 | BM(10,j)>78 &  BM(10,j)<82 & BM(9,j)>110 & BM(9,j)<140 | BM(10,j)>82 &  BM(10,j)<90 & BM(9,j)>310 & BM(9,j)<360  
            if BM(3,j)==6
                if BM(5,j)>0
                   e6(j)=BM(5,j);
                   x6(j)=BM(3,j)+(BM(2,j)*(100/31))/100;                     
                   s6=s6+BM(5,j);
                   n6=n6+1;
                   juin_eurasie=s6/n6;
                end
            end
    end
end

for j=1:size(BM,2)
    if BM(10,j)>82 &  BM(10,j)<90 & BM(9,j)>0 & BM(9,j)<140 | BM(10,j)>78 &  BM(10,j)<82 & BM(9,j)>110 & BM(9,j)<140 | BM(10,j)>82 &  BM(10,j)<90 & BM(9,j)>310 & BM(9,j)<360
            if BM(3,j)==7
                if BM(5,j)>0
                   e7(j)=BM(5,j);
                   x7(j)=BM(3,j)+(BM(2,j)*(100/31))/100;                   
                   s7=s7+BM(5,j);
                   n7=n7+1;
                   juillet_eurasie=s7/n7;
                end
            end
    end
end

for j=1:size(BM,2)
    if BM(10,j)>82 &  BM(10,j)<90 & BM(9,j)>0 & BM(9,j)<140 | BM(10,j)>78 &  BM(10,j)<82 & BM(9,j)>110 & BM(9,j)<140 | BM(10,j)>82 &  BM(10,j)<90 & BM(9,j)>310 & BM(9,j)<360
            if BM(3,j)==8
                if BM(5,j)>0
                   e8(j)=BM(5,j);
                   x8(j)=BM(3,j)+(BM(2,j)*(100/31))/100;                     
                   s8=s8+BM(5,j);
                   n8=n8+1;
                   aout_eurasie=s8/n8;
                end
            end
    end
end

for j=1:size(BM,2)
    if BM(10,j)>82 &  BM(10,j)<90 & BM(9,j)>0 & BM(9,j)<140 | BM(10,j)>78 &  BM(10,j)<82 & BM(9,j)>110 & BM(9,j)<140 | BM(10,j)>82 &  BM(10,j)<90 & BM(9,j)>310 & BM(9,j)<360
            if BM(3,j)==9
                if BM(5,j)>0
                   e9(j)=BM(5,j);
                   x9(j)=BM(3,j)+(BM(2,j)*(100/31))/100;                     
                   s9=s9+BM(5,j);
                   n9=n9+1;
                   septembre_eurasie=s9/n9;
                end
            end
    end
end

for j=1:size(BM,2)
    if BM(10,j)>82 &  BM(10,j)<90 & BM(9,j)>0 & BM(9,j)<140 | BM(10,j)>78 &  BM(10,j)<82 & BM(9,j)>110 & BM(9,j)<140 | BM(10,j)>82 &  BM(10,j)<90 & BM(9,j)>310 & BM(9,j)<360
            if BM(3,j)==10
                if BM(5,j)>0
                   e10(j)=BM(5,j);
                   x10(j)=BM(3,j)+(BM(2,j)*(100/31))/100;                    
                   s10=s10+BM(5,j);
                   n10=n10+1;
                   octobre_eurasie=s10/n10;
                end
            end
    end
end

for j=1:size(BM,2)
    if BM(10,j)>82 &  BM(10,j)<90 & BM(9,j)>0 & BM(9,j)<140 | BM(10,j)>78 &  BM(10,j)<82 & BM(9,j)>110 & BM(9,j)<140 | BM(10,j)>82 &  BM(10,j)<90 & BM(9,j)>310 & BM(9,j)<360
            if BM(3,j)==11
                if BM(5,j)>0
                   e11(j)=BM(5,j);
                   x11(j)=BM(3,j)+(BM(2,j)*(100/31))/100;                      
                   s11=s11+BM(5,j);
                   n11=n11+1;
                   novembre_eurasie=s11/n11;
                end
            end
    end
end

for j=1:size(BM,2)
    if BM(10,j)>82 &  BM(10,j)<90 & BM(9,j)>0 & BM(9,j)<140 | BM(10,j)>78 &  BM(10,j)<82 & BM(9,j)>110 & BM(9,j)<140 | BM(10,j)>82 &  BM(10,j)<90 & BM(9,j)>310 & BM(9,j)<360
            if BM(3,j)==12
                if BM(5,j)>0
                   e12(j)=BM(5,j);
                   x12(j)=BM(3,j)+(BM(2,j)*(100/31))/100;                      
                   s12=s12+BM(5,j);
                   n12=n12+1;
                   decembre_eurasie=s12/n12;
                end
            end
    end
end
