clear on

%Programme calculant les moyenne mensuelles de concentration de glace de mer dans le bassin Eurasien
%La matrice SIC doit être chargée afin de lancer le programme.

sic_eurasie_janvier=0;
sic_eurasie_fevrier=0;
sic_eurasie_mars=0;
sic_eurasie_avril=0;
sic_eurasie_mai=0;
sic_eurasie_juin=0;
sic_eurasie_juillet=0;
sic_eurasie_aout=0;
sic_eurasie_septembre=0;
sic_eurasie_aout=0;
sic_eurasie_septembre=0;
sic_eurasie_octobre=0;
sic_eurasie_novembre=0;
sic_eurasie_decembre=0;


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


for i=1:size(SIC,1)
    if SIC(i,2)==1 
        for j=1:size(SIC,2)
              if SIC(10,j)>82 &  SIC(10,j)<90 & SIC(9,j)>0 & SIC(9,j)<140 | SIC(10,j)>78 &  SIC(10,j)<82 & SIC(9,j)>110 & SIC(9,j)<140 | SIC(10,j)>82 &  SIC(10,j)<90 & SIC(9,j)>310 & SIC(9,j)<360 | SIC(10,j)>83.5 &  SIC(10,j)<90 & SIC(9,j)>310 & SIC(9,j)<360 | SIC(10,j)>78 &  SIC(10,j)<90 & SIC(9,j)>141 & SIC(9,j)<180

                 if SIC(i,j)>0
                    s1=s1+SIC(i,j);
                    n1=n1+1;
                    sic_eurasie_janvier=s1/n1;
                 end
              end 
        end
    end
end

for i=1:size(SIC,1)
    if SIC(i,2)==2
        for j=1:size(SIC,2)
              if SIC(10,j)>82 &  SIC(10,j)<90 & SIC(9,j)>0 & SIC(9,j)<140 | SIC(10,j)>78 &  SIC(10,j)<82 & SIC(9,j)>110 & SIC(9,j)<140 | SIC(10,j)>82 &  SIC(10,j)<90 & SIC(9,j)>310 & SIC(9,j)<360 | SIC(10,j)>83.5 &  SIC(10,j)<90 & SIC(9,j)>310 & SIC(9,j)<360 | SIC(10,j)>78 &  SIC(10,j)<90 & SIC(9,j)>141 & SIC(9,j)<180
                 if SIC(i,j)>0
                    s2=s2+SIC(i,j);
                    n2=n2+1;
                    sic_eurasie_fevrier=s2/n2;
                 end
              end 
        end
    end
end

for i=1:size(SIC,1)
    if SIC(i,2)==3
        for j=1:size(SIC,2)
              if SIC(10,j)>82 &  SIC(10,j)<90 & SIC(9,j)>0 & SIC(9,j)<140 | SIC(10,j)>78 &  SIC(10,j)<82 & SIC(9,j)>110 & SIC(9,j)<140 | SIC(10,j)>82 &  SIC(10,j)<90 & SIC(9,j)>310 & SIC(9,j)<360 | SIC(10,j)>83.5 &  SIC(10,j)<90 & SIC(9,j)>310 & SIC(9,j)<360 | SIC(10,j)>78 &  SIC(10,j)<90 & SIC(9,j)>141 & SIC(9,j)<180
                 if SIC(i,j)>0
                    s3=s3+SIC(i,j);
                    n3=n3+1;
                    sic_eurasie_mars=s3/n3;
                 end
              end 
        end
    end
end

for i=1:size(SIC,1)
    if SIC(i,2)==4 
        for j=1:size(SIC,2)
              if SIC(10,j)>82 &  SIC(10,j)<90 & SIC(9,j)>0 & SIC(9,j)<140 | SIC(10,j)>78 &  SIC(10,j)<82 & SIC(9,j)>110 & SIC(9,j)<140 | SIC(10,j)>82 &  SIC(10,j)<90 & SIC(9,j)>310 & SIC(9,j)<360 | SIC(10,j)>83.5 &  SIC(10,j)<90 & SIC(9,j)>310 & SIC(9,j)<360 | SIC(10,j)>78 &  SIC(10,j)<90 & SIC(9,j)>141 & SIC(9,j)<180
                 if SIC(i,j)>0
                    s4=s4+SIC(i,j);
                    n4=n4+1;
                    sic_eurasie_avril=s4/n4;
                 end
              end 
        end
    end
end

for i=1:size(SIC,1)
    if SIC(i,2)==5
        for j=1:size(SIC,2)
              if SIC(10,j)>82 &  SIC(10,j)<90 & SIC(9,j)>0 & SIC(9,j)<140 | SIC(10,j)>78 &  SIC(10,j)<82 & SIC(9,j)>110 & SIC(9,j)<140 | SIC(10,j)>82 &  SIC(10,j)<90 & SIC(9,j)>310 & SIC(9,j)<360 | SIC(10,j)>83.5 &  SIC(10,j)<90 & SIC(9,j)>310 & SIC(9,j)<360 | SIC(10,j)>78 &  SIC(10,j)<90 & SIC(9,j)>141 & SIC(9,j)<180
                 if SIC(i,j)>0
                    s5=s5+SIC(i,j);
                    n5=n5+1;
                    sic_eurasie_mai=s5/n5;
                 end
              end 
        end
    end
end

for i=1:size(SIC,1)
    if SIC(i,2)==6
        for j=1:size(SIC,2)
              if SIC(10,j)>82 &  SIC(10,j)<90 & SIC(9,j)>0 & SIC(9,j)<140 | SIC(10,j)>78 &  SIC(10,j)<82 & SIC(9,j)>110 & SIC(9,j)<140 | SIC(10,j)>82 &  SIC(10,j)<90 & SIC(9,j)>310 & SIC(9,j)<360 | SIC(10,j)>83.5 &  SIC(10,j)<90 & SIC(9,j)>310 & SIC(9,j)<360 | SIC(10,j)>78 &  SIC(10,j)<90 & SIC(9,j)>141 & SIC(9,j)<180
                 if SIC(i,j)>0
                    s6=s6+SIC(i,j);
                    n6=n6+1;
                    sic_eurasie_juin=s6/n6;
                 end
              end 
        end
    end
end

for i=1:size(SIC,1)
    if SIC(i,2)==7
        for j=1:size(SIC,2)
              if SIC(10,j)>82 &  SIC(10,j)<90 & SIC(9,j)>0 & SIC(9,j)<140 | SIC(10,j)>78 &  SIC(10,j)<82 & SIC(9,j)>110 & SIC(9,j)<140 | SIC(10,j)>82 &  SIC(10,j)<90 & SIC(9,j)>310 & SIC(9,j)<360 | SIC(10,j)>83.5 &  SIC(10,j)<90 & SIC(9,j)>310 & SIC(9,j)<360 | SIC(10,j)>78 &  SIC(10,j)<90 & SIC(9,j)>141 & SIC(9,j)<180
                 if SIC(i,j)>0
                    s7=s7+SIC(i,j);
                    n7=n7+1;
                    sic_eurasie_juillet=s7/n7;
                 end
              end 
        end
    end
end

for i=1:size(SIC,1)
    if SIC(i,2)==8
        for j=1:size(SIC,2)
              if SIC(10,j)>82 &  SIC(10,j)<90 & SIC(9,j)>0 & SIC(9,j)<140 | SIC(10,j)>78 &  SIC(10,j)<82 & SIC(9,j)>110 & SIC(9,j)<140 | SIC(10,j)>82 &  SIC(10,j)<90 & SIC(9,j)>310 & SIC(9,j)<360 | SIC(10,j)>83.5 &  SIC(10,j)<90 & SIC(9,j)>310 & SIC(9,j)<360 | SIC(10,j)>78 &  SIC(10,j)<90 & SIC(9,j)>141 & SIC(9,j)<180
                 if SIC(i,j)>0
                    s8=s8+SIC(i,j);
                    n8=n8+1;
                    sic_eurasie_aout=s8/n8;
                 end
              end 
        end
    end
end

for i=1:size(SIC,1)
    if SIC(i,2)==9
        for j=1:size(SIC,2)
              if SIC(10,j)>82 &  SIC(10,j)<90 & SIC(9,j)>0 & SIC(9,j)<140 | SIC(10,j)>78 &  SIC(10,j)<82 & SIC(9,j)>110 & SIC(9,j)<140 | SIC(10,j)>82 &  SIC(10,j)<90 & SIC(9,j)>310 & SIC(9,j)<360 | SIC(10,j)>83.5 &  SIC(10,j)<90 & SIC(9,j)>310 & SIC(9,j)<360 | SIC(10,j)>78 &  SIC(10,j)<90 & SIC(9,j)>141 & SIC(9,j)<180
                 if SIC(i,j)>0
                    s9=s9+SIC(i,j);
                    n9=n9+1;
                    sic_eurasie_septembre=s9/n9;
                 end
              end 
        end
    end
end

for i=1:size(SIC,1)
    if SIC(i,2)==10
        for j=1:size(SIC,2)
              if SIC(10,j)>82 &  SIC(10,j)<90 & SIC(9,j)>0 & SIC(9,j)<140 | SIC(10,j)>78 &  SIC(10,j)<82 & SIC(9,j)>110 & SIC(9,j)<140 | SIC(10,j)>82 &  SIC(10,j)<90 & SIC(9,j)>310 & SIC(9,j)<360 | SIC(10,j)>83.5 &  SIC(10,j)<90 & SIC(9,j)>310 & SIC(9,j)<360 | SIC(10,j)>78 &  SIC(10,j)<90 & SIC(9,j)>141 & SIC(9,j)<180
                 if SIC(i,j)>0
                    s10=s10+SIC(i,j);
                    n10=n10+1;
                    sic_eurasie_octobre=s10/n10;
                 end
              end 
        end
    end
end

for i=1:size(SIC,1)
    if SIC(i,2)==11
        for j=1:size(SIC,2)
              if SIC(10,j)>82 &  SIC(10,j)<90 & SIC(9,j)>0 & SIC(9,j)<140 | SIC(10,j)>78 &  SIC(10,j)<82 & SIC(9,j)>110 & SIC(9,j)<140 | SIC(10,j)>82 &  SIC(10,j)<90 & SIC(9,j)>310 & SIC(9,j)<360 | SIC(10,j)>83.5 &  SIC(10,j)<90 & SIC(9,j)>310 & SIC(9,j)<360 | SIC(10,j)>78 &  SIC(10,j)<90 & SIC(9,j)>141 & SIC(9,j)<180
                 if SIC(i,j)>0
                    s11=s11+SIC(i,j);
                    n11=n11+1;
                    sic_eurasie_novembre=s11/n11;
                 end
              end 
        end
    end
end

for i=1:size(SIC,1)
    if SIC(i,2)==12
        for j=1:size(SIC,2)
              if SIC(10,j)>82 &  SIC(10,j)<90 & SIC(9,j)>0 & SIC(9,j)<140 | SIC(10,j)>78 &  SIC(10,j)<82 & SIC(9,j)>110 & SIC(9,j)<140 | SIC(10,j)>82 &  SIC(10,j)<90 & SIC(9,j)>310 & SIC(9,j)<360 | SIC(10,j)>83.5 &  SIC(10,j)<90 & SIC(9,j)>310 & SIC(9,j)<360 | SIC(10,j)>78 &  SIC(10,j)<90 & SIC(9,j)>141 & SIC(9,j)<180
                 if SIC(i,j)>0
                    s12=s12+SIC(i,j);
                    n12=n12+1;
                    sic_eurasie_decembre=s12/n12;
                 end
              end 
        end
    end
end