clear on
clear off
addpath('/home/rinaldi/Documents/MATLAB/m_map')
addpath('/home/rinaldi/Documents/Fwd_mapping')
addpath('/home/rinaldi/Documents/Divers')


% Ce programme regroupe les données de concentration de glace de mer
% (données CERSAT de résolution 12 km) dans une matrice nommé "SIC" avec
% Ligne 1: longitude
% Ligne 2: latitude 
% Colonne 1: Année (de 2004 à 2018)
% Colonne 2: Mois (de janvier 2004 à juin 2018)
% Les données sont accesible en suivant le chemin --> /net/alpha/exports/sciences/data/REFERENCE_DATA/SEA_ICE/CERSAT_SIC/arctic/2017/20170101-20170131.nc

SIC=NaN(182,544770);


lat=ncread('/home/rinaldi/Documents/Grille/grille_12km/grid_north_12km.nc','latitude');
long=ncread('/home/rinaldi/Documents/Grille/grille_12km/grid_north_12km.nc','longitude');
sea_ice=ncread('/net/alpha/exports/sciences/data/REFERENCE_DATA/SEA_ICE/CERSAT_SIC/arctic/2017/20170101-20170131.nc', 'concentration');



           j=3 ;          
         while j< (size(lat,1)* size(lat,2) +3)
             for l=1:size(lat,2)
                 for k=1:size(lat,1)                   
                         SIC(2,j)=lat(k,l);
                         j=j+1;
                 end
             end
         end
         
         j=3 ;          
         while j< (size(long,1)* size(long,2) +3)
             for l=1:size(long,2)
                  for k=1:size(long,1)
                         SIC(1,j)=long(k,l);
                         j=j+1;
                  end
             end
         end


k=3;
while k<15
for annee=2004
 for annee_mois=200401:200412
   for s=1:16965
       annee_mois_jour=PAS(1,s);

      if  exist(['/net/alpha/exports/sciences/data/REFERENCE_DATA/SEA_ICE/CERSAT_SIC/arctic/' num2str(annee) '/' num2str(annee_mois) '01-' num2str(annee_mois_jour) '.nc']);
                     file=['/net/alpha/exports/sciences/data/REFERENCE_DATA/SEA_ICE/CERSAT_SIC/arctic/' num2str(annee) '/' num2str(annee_mois) '01-' num2str(annee_mois_jour) '.nc'];
                     sea_ice=ncread(file,'concentration');

                     SIC(k,1)=annee;
          i=3;
          while i< (size(long,1)* size(long,2) +3)
             for m=1:size(long,2)
                  for n=1:size(long,1)
                         SIC(k,i)=sea_ice(n,m);
                         i=i+1;
                  end
             end
          end
         
if annee_mois-1==annee*100
SIC(k,2)=1;
else
if annee_mois-2==annee*100
SIC(k,2)=2;
else
if annee_mois-3==annee*100
SIC(k,2)=3;
else
if annee_mois-4==annee*100
SIC(k,2)=4;
else
if annee_mois-5==annee*100
SIC(k,2)=5;
else
if annee_mois-6==annee*100
SIC(k,2)=6;
else
if annee_mois-7==annee*100
SIC(k,2)=7;
else
if annee_mois-8==annee*100
SIC(k,2)=8;
else
if annee_mois-9==annee*100
SIC(k,2)=9;
else
if annee_mois-10==annee*100
SIC(k,2)=10;
else
if annee_mois-11==annee*100
SIC(k,2)=11;
else
if annee_mois-12==annee*100
SIC(k,2)=12;
end
end
end
end
end
end
end
end
end
end
end
end
k=k+1

end
end
end
end
end

k=15;
while k<27
for annee=2005
 for annee_mois=200501:200512
   for s=1:16965
       annee_mois_jour=PAS(1,s);

      if  exist(['/net/alpha/exports/sciences/data/REFERENCE_DATA/SEA_ICE/CERSAT_SIC/arctic/' num2str(annee) '/' num2str(annee_mois) '01-' num2str(annee_mois_jour) '.nc']);
                     file=['/net/alpha/exports/sciences/data/REFERENCE_DATA/SEA_ICE/CERSAT_SIC/arctic/' num2str(annee) '/' num2str(annee_mois) '01-' num2str(annee_mois_jour) '.nc'];
                     sea_ice=ncread(file,'concentration');

                     SIC(k,1)=annee;
          i=3;
          while i< (size(long,1)* size(long,2) +3)
             for m=1:size(long,2)
                  for n=1:size(long,1)
                         SIC(k,i)=sea_ice(n,m);
                         i=i+1;
                  end
             end
          end
         
if annee_mois-1==annee*100
SIC(k,2)=1;
else
if annee_mois-2==annee*100
SIC(k,2)=2;
else
if annee_mois-3==annee*100
SIC(k,2)=3;
else
if annee_mois-4==annee*100
SIC(k,2)=4;
else
if annee_mois-5==annee*100
SIC(k,2)=5;
else
if annee_mois-6==annee*100
SIC(k,2)=6;
else
if annee_mois-7==annee*100
SIC(k,2)=7;
else
if annee_mois-8==annee*100
SIC(k,2)=8;
else
if annee_mois-9==annee*100
SIC(k,2)=9;
else
if annee_mois-10==annee*100
SIC(k,2)=10;
else
if annee_mois-11==annee*100
SIC(k,2)=11;
else
if annee_mois-12==annee*100
SIC(k,2)=12;
end
end
end
end
end
end
end
end
end
end
end
end
k=k+1

end
end
end
end
end

k=27;
while k<39
for annee=2006
 for annee_mois=200601:200612
   for s=1:16965
       annee_mois_jour=PAS(1,s);

      if  exist(['/net/alpha/exports/sciences/data/REFERENCE_DATA/SEA_ICE/CERSAT_SIC/arctic/' num2str(annee) '/' num2str(annee_mois) '01-' num2str(annee_mois_jour) '.nc']);
                     file=['/net/alpha/exports/sciences/data/REFERENCE_DATA/SEA_ICE/CERSAT_SIC/arctic/' num2str(annee) '/' num2str(annee_mois) '01-' num2str(annee_mois_jour) '.nc'];
                     sea_ice=ncread(file,'concentration');

                     SIC(k,1)=annee;
          i=3;
          while i< (size(long,1)* size(long,2) +3)
             for m=1:size(long,2)
                  for n=1:size(long,1)
                         SIC(k,i)=sea_ice(n,m);
                         i=i+1;
                  end
             end
          end
         
if annee_mois-1==annee*100
SIC(k,2)=1;
else
if annee_mois-2==annee*100
SIC(k,2)=2;
else
if annee_mois-3==annee*100
SIC(k,2)=3;
else
if annee_mois-4==annee*100
SIC(k,2)=4;
else
if annee_mois-5==annee*100
SIC(k,2)=5;
else
if annee_mois-6==annee*100
SIC(k,2)=6;
else
if annee_mois-7==annee*100
SIC(k,2)=7;
else
if annee_mois-8==annee*100
SIC(k,2)=8;
else
if annee_mois-9==annee*100
SIC(k,2)=9;
else
if annee_mois-10==annee*100
SIC(k,2)=10;
else
if annee_mois-11==annee*100
SIC(k,2)=11;
else
if annee_mois-12==annee*100
SIC(k,2)=12;
end
end
end
end
end
end
end
end
end
end
end
end
k=k+1

end
end
end
end
end

k=39;
while k<51
for annee=2007
 for annee_mois=200701:200712
   for s=1:16965
       annee_mois_jour=PAS(1,s);

      if  exist(['/net/alpha/exports/sciences/data/REFERENCE_DATA/SEA_ICE/CERSAT_SIC/arctic/' num2str(annee) '/' num2str(annee_mois) '01-' num2str(annee_mois_jour) '.nc']);
                     file=['/net/alpha/exports/sciences/data/REFERENCE_DATA/SEA_ICE/CERSAT_SIC/arctic/' num2str(annee) '/' num2str(annee_mois) '01-' num2str(annee_mois_jour) '.nc'];
                     sea_ice=ncread(file,'concentration');

                     SIC(k,1)=annee;
          i=3;
          while i< (size(long,1)* size(long,2) +3)
             for m=1:size(long,2)
                  for n=1:size(long,1)
                         SIC(k,i)=sea_ice(n,m);
                         i=i+1;
                  end
             end
          end
         
if annee_mois-1==annee*100
SIC(k,2)=1;
else
if annee_mois-2==annee*100
SIC(k,2)=2;
else
if annee_mois-3==annee*100
SIC(k,2)=3;
else
if annee_mois-4==annee*100
SIC(k,2)=4;
else
if annee_mois-5==annee*100
SIC(k,2)=5;
else
if annee_mois-6==annee*100
SIC(k,2)=6;
else
if annee_mois-7==annee*100
SIC(k,2)=7;
else
if annee_mois-8==annee*100
SIC(k,2)=8;
else
if annee_mois-9==annee*100
SIC(k,2)=9;
else
if annee_mois-10==annee*100
SIC(k,2)=10;
else
if annee_mois-11==annee*100
SIC(k,2)=11;
else
if annee_mois-12==annee*100
SIC(k,2)=12;
end
end
end
end
end
end
end
end
end
end
end
end
k=k+1

end
end
end
end
end

k=51;
while k<63
for annee=2008
 for annee_mois=200801:200812
   for s=1:16965
       annee_mois_jour=PAS(1,s);

      if  exist(['/net/alpha/exports/sciences/data/REFERENCE_DATA/SEA_ICE/CERSAT_SIC/arctic/' num2str(annee) '/' num2str(annee_mois) '01-' num2str(annee_mois_jour) '.nc']);
                     file=['/net/alpha/exports/sciences/data/REFERENCE_DATA/SEA_ICE/CERSAT_SIC/arctic/' num2str(annee) '/' num2str(annee_mois) '01-' num2str(annee_mois_jour) '.nc'];
                     sea_ice=ncread(file,'concentration');

                     SIC(k,1)=annee;
          i=3;
          while i< (size(long,1)* size(long,2) +3)
             for m=1:size(long,2)
                  for n=1:size(long,1)
                         SIC(k,i)=sea_ice(n,m);
                         i=i+1;
                  end
             end
          end
         
if annee_mois-1==annee*100
SIC(k,2)=1;
else
if annee_mois-2==annee*100
SIC(k,2)=2;
else
if annee_mois-3==annee*100
SIC(k,2)=3;
else
if annee_mois-4==annee*100
SIC(k,2)=4;
else
if annee_mois-5==annee*100
SIC(k,2)=5;
else
if annee_mois-6==annee*100
SIC(k,2)=6;
else
if annee_mois-7==annee*100
SIC(k,2)=7;
else
if annee_mois-8==annee*100
SIC(k,2)=8;
else
if annee_mois-9==annee*100
SIC(k,2)=9;
else
if annee_mois-10==annee*100
SIC(k,2)=10;
else
if annee_mois-11==annee*100
SIC(k,2)=11;
else
if annee_mois-12==annee*100
SIC(k,2)=12;
end
end
end
end
end
end
end
end
end
end
end
end
k=k+1

end
end
end
end
end

k=63;
while k<75
for annee=2009
 for annee_mois=200901:200912
   for s=1:16965
       annee_mois_jour=PAS(1,s);

      if  exist(['/net/alpha/exports/sciences/data/REFERENCE_DATA/SEA_ICE/CERSAT_SIC/arctic/' num2str(annee) '/' num2str(annee_mois) '01-' num2str(annee_mois_jour) '.nc']);
                     file=['/net/alpha/exports/sciences/data/REFERENCE_DATA/SEA_ICE/CERSAT_SIC/arctic/' num2str(annee) '/' num2str(annee_mois) '01-' num2str(annee_mois_jour) '.nc'];
                     sea_ice=ncread(file,'concentration');

                     SIC(k,1)=annee;
          i=3;
          while i< (size(long,1)* size(long,2) +3)
             for m=1:size(long,2)
                  for n=1:size(long,1)
                         SIC(k,i)=sea_ice(n,m);
                         i=i+1;
                  end
             end
          end
         
if annee_mois-1==annee*100
SIC(k,2)=1;
else
if annee_mois-2==annee*100
SIC(k,2)=2;
else
if annee_mois-3==annee*100
SIC(k,2)=3;
else
if annee_mois-4==annee*100
SIC(k,2)=4;
else
if annee_mois-5==annee*100
SIC(k,2)=5;
else
if annee_mois-6==annee*100
SIC(k,2)=6;
else
if annee_mois-7==annee*100
SIC(k,2)=7;
else
if annee_mois-8==annee*100
SIC(k,2)=8;
else
if annee_mois-9==annee*100
SIC(k,2)=9;
else
if annee_mois-10==annee*100
SIC(k,2)=10;
else
if annee_mois-11==annee*100
SIC(k,2)=11;
else
if annee_mois-12==annee*100
SIC(k,2)=12;
end
end
end
end
end
end
end
end
end
end
end
end
k=k+1

end
end
end
end
end

k=75;
while k<87
for annee=2010
 for annee_mois=201001:201012
   for s=1:16965
       annee_mois_jour=PAS(1,s);

      if  exist(['/net/alpha/exports/sciences/data/REFERENCE_DATA/SEA_ICE/CERSAT_SIC/arctic/' num2str(annee) '/' num2str(annee_mois) '01-' num2str(annee_mois_jour) '.nc']);
                     file=['/net/alpha/exports/sciences/data/REFERENCE_DATA/SEA_ICE/CERSAT_SIC/arctic/' num2str(annee) '/' num2str(annee_mois) '01-' num2str(annee_mois_jour) '.nc'];
                     sea_ice=ncread(file,'concentration');

                     SIC(k,1)=annee;
          i=3;
          while i< (size(long,1)* size(long,2) +3)
             for m=1:size(long,2)
                  for n=1:size(long,1)
                         SIC(k,i)=sea_ice(n,m);
                         i=i+1;
                  end
             end
          end
         
if annee_mois-1==annee*100
SIC(k,2)=1;
else
if annee_mois-2==annee*100
SIC(k,2)=2;
else
if annee_mois-3==annee*100
SIC(k,2)=3;
else
if annee_mois-4==annee*100
SIC(k,2)=4;
else
if annee_mois-5==annee*100
SIC(k,2)=5;
else
if annee_mois-6==annee*100
SIC(k,2)=6;
else
if annee_mois-7==annee*100
SIC(k,2)=7;
else
if annee_mois-8==annee*100
SIC(k,2)=8;
else
if annee_mois-9==annee*100
SIC(k,2)=9;
else
if annee_mois-10==annee*100
SIC(k,2)=10;
else
if annee_mois-11==annee*100
SIC(k,2)=11;
else
if annee_mois-12==annee*100
SIC(k,2)=12;
end
end
end
end
end
end
end
end
end
end
end
end
k=k+1

end
end
end
end
end

k=87;
while k<99
for annee=2011
 for annee_mois=201101:201112
   for s=1:16965
       annee_mois_jour=PAS(1,s);

      if  exist(['/net/alpha/exports/sciences/data/REFERENCE_DATA/SEA_ICE/CERSAT_SIC/arctic/' num2str(annee) '/' num2str(annee_mois) '01-' num2str(annee_mois_jour) '.nc']);
                     file=['/net/alpha/exports/sciences/data/REFERENCE_DATA/SEA_ICE/CERSAT_SIC/arctic/' num2str(annee) '/' num2str(annee_mois) '01-' num2str(annee_mois_jour) '.nc'];
                     sea_ice=ncread(file,'concentration');

                     SIC(k,1)=annee;
          i=3;
          while i< (size(long,1)* size(long,2) +3)
             for m=1:size(long,2)
                  for n=1:size(long,1)
                         SIC(k,i)=sea_ice(n,m);
                         i=i+1;
                  end
             end
          end
         
if annee_mois-1==annee*100
SIC(k,2)=1;
else
if annee_mois-2==annee*100
SIC(k,2)=2;
else
if annee_mois-3==annee*100
SIC(k,2)=3;
else
if annee_mois-4==annee*100
SIC(k,2)=4;
else
if annee_mois-5==annee*100
SIC(k,2)=5;
else
if annee_mois-6==annee*100
SIC(k,2)=6;
else
if annee_mois-7==annee*100
SIC(k,2)=7;
else
if annee_mois-8==annee*100
SIC(k,2)=8;
else
if annee_mois-9==annee*100
SIC(k,2)=9;
else
if annee_mois-10==annee*100
SIC(k,2)=10;
else
if annee_mois-11==annee*100
SIC(k,2)=11;
else
if annee_mois-12==annee*100
SIC(k,2)=12;
end
end
end
end
end
end
end
end
end
end
end
end
k=k+1

end
end
end
end
end

k=99;
while k<111
for annee=2012
 for annee_mois=201201:201212
   for s=1:16965
       annee_mois_jour=PAS(1,s);

      if  exist(['/net/alpha/exports/sciences/data/REFERENCE_DATA/SEA_ICE/CERSAT_SIC/arctic/' num2str(annee) '/' num2str(annee_mois) '01-' num2str(annee_mois_jour) '.nc']);
                     file=['/net/alpha/exports/sciences/data/REFERENCE_DATA/SEA_ICE/CERSAT_SIC/arctic/' num2str(annee) '/' num2str(annee_mois) '01-' num2str(annee_mois_jour) '.nc'];
                     sea_ice=ncread(file,'concentration');

                     SIC(k,1)=annee;
          i=3;
          while i< (size(long,1)* size(long,2) +3)
             for m=1:size(long,2)
                  for n=1:size(long,1)
                         SIC(k,i)=sea_ice(n,m);
                         i=i+1;
                  end
             end
          end
         
if annee_mois-1==annee*100
SIC(k,2)=1;
else
if annee_mois-2==annee*100
SIC(k,2)=2;
else
if annee_mois-3==annee*100
SIC(k,2)=3;
else
if annee_mois-4==annee*100
SIC(k,2)=4;
else
if annee_mois-5==annee*100
SIC(k,2)=5;
else
if annee_mois-6==annee*100
SIC(k,2)=6;
else
if annee_mois-7==annee*100
SIC(k,2)=7;
else
if annee_mois-8==annee*100
SIC(k,2)=8;
else
if annee_mois-9==annee*100
SIC(k,2)=9;
else
if annee_mois-10==annee*100
SIC(k,2)=10;
else
if annee_mois-11==annee*100
SIC(k,2)=11;
else
if annee_mois-12==annee*100
SIC(k,2)=12;
end
end
end
end
end
end
end
end
end
end
end
end
k=k+1

end
end
end
end
end

k=111;
while k<123
for annee=2013
 for annee_mois=201301:201312
   for s=1:16965
       annee_mois_jour=PAS(1,s);

      if  exist(['/net/alpha/exports/sciences/data/REFERENCE_DATA/SEA_ICE/CERSAT_SIC/arctic/' num2str(annee) '/' num2str(annee_mois) '01-' num2str(annee_mois_jour) '.nc']);
                     file=['/net/alpha/exports/sciences/data/REFERENCE_DATA/SEA_ICE/CERSAT_SIC/arctic/' num2str(annee) '/' num2str(annee_mois) '01-' num2str(annee_mois_jour) '.nc'];
                     sea_ice=ncread(file,'concentration');

                     SIC(k,1)=annee;
          i=3;
          while i< (size(long,1)* size(long,2) +3)
             for m=1:size(long,2)
                  for n=1:size(long,1)
                         SIC(k,i)=sea_ice(n,m);
                         i=i+1;
                  end
             end
          end
         
if annee_mois-1==annee*100
SIC(k,2)=1;
else
if annee_mois-2==annee*100
SIC(k,2)=2;
else
if annee_mois-3==annee*100
SIC(k,2)=3;
else
if annee_mois-4==annee*100
SIC(k,2)=4;
else
if annee_mois-5==annee*100
SIC(k,2)=5;
else
if annee_mois-6==annee*100
SIC(k,2)=6;
else
if annee_mois-7==annee*100
SIC(k,2)=7;
else
if annee_mois-8==annee*100
SIC(k,2)=8;
else
if annee_mois-9==annee*100
SIC(k,2)=9;
else
if annee_mois-10==annee*100
SIC(k,2)=10;
else
if annee_mois-11==annee*100
SIC(k,2)=11;
else
if annee_mois-12==annee*100
SIC(k,2)=12;
end
end
end
end
end
end
end
end
end
end
end
end
k=k+1

end
end
end
end
end

k=123;
while k<135
for annee=2014
 for annee_mois=201401:201412
   for s=1:16965
       annee_mois_jour=PAS(1,s);

      if  exist(['/net/alpha/exports/sciences/data/REFERENCE_DATA/SEA_ICE/CERSAT_SIC/arctic/' num2str(annee) '/' num2str(annee_mois) '01-' num2str(annee_mois_jour) '.nc']);
                     file=['/net/alpha/exports/sciences/data/REFERENCE_DATA/SEA_ICE/CERSAT_SIC/arctic/' num2str(annee) '/' num2str(annee_mois) '01-' num2str(annee_mois_jour) '.nc'];
                     sea_ice=ncread(file,'concentration');

                     SIC(k,1)=annee;
          i=3;
          while i< (size(long,1)* size(long,2) +3)
             for m=1:size(long,2)
                  for n=1:size(long,1)
                         SIC(k,i)=sea_ice(n,m);
                         i=i+1;
                  end
             end
          end
         
if annee_mois-1==annee*100
SIC(k,2)=1;
else
if annee_mois-2==annee*100
SIC(k,2)=2;
else
if annee_mois-3==annee*100
SIC(k,2)=3;
else
if annee_mois-4==annee*100
SIC(k,2)=4;
else
if annee_mois-5==annee*100
SIC(k,2)=5;
else
if annee_mois-6==annee*100
SIC(k,2)=6;
else
if annee_mois-7==annee*100
SIC(k,2)=7;
else
if annee_mois-8==annee*100
SIC(k,2)=8;
else
if annee_mois-9==annee*100
SIC(k,2)=9;
else
if annee_mois-10==annee*100
SIC(k,2)=10;
else
if annee_mois-11==annee*100
SIC(k,2)=11;
else
if annee_mois-12==annee*100
SIC(k,2)=12;
end
end
end
end
end
end
end
end
end
end
end
end
k=k+1

end
end
end
end
end

k=135;
while k<147
for annee=2015
 for annee_mois=201501:201512
   for s=1:16965
       annee_mois_jour=PAS(1,s);

      if  exist(['/net/alpha/exports/sciences/data/REFERENCE_DATA/SEA_ICE/CERSAT_SIC/arctic/' num2str(annee) '/' num2str(annee_mois) '01-' num2str(annee_mois_jour) '.nc']);
                     file=['/net/alpha/exports/sciences/data/REFERENCE_DATA/SEA_ICE/CERSAT_SIC/arctic/' num2str(annee) '/' num2str(annee_mois) '01-' num2str(annee_mois_jour) '.nc'];
                     sea_ice=ncread(file,'concentration');

                     SIC(k,1)=annee;
          i=3;
          while i< (size(long,1)* size(long,2) +3)
             for m=1:size(long,2)
                  for n=1:size(long,1)
                         SIC(k,i)=sea_ice(n,m);
                         i=i+1;
                  end
             end
          end
         
if annee_mois-1==annee*100
SIC(k,2)=1;
else
if annee_mois-2==annee*100
SIC(k,2)=2;
else
if annee_mois-3==annee*100
SIC(k,2)=3;
else
if annee_mois-4==annee*100
SIC(k,2)=4;
else
if annee_mois-5==annee*100
SIC(k,2)=5;
else
if annee_mois-6==annee*100
SIC(k,2)=6;
else
if annee_mois-7==annee*100
SIC(k,2)=7;
else
if annee_mois-8==annee*100
SIC(k,2)=8;
else
if annee_mois-9==annee*100
SIC(k,2)=9;
else
if annee_mois-10==annee*100
SIC(k,2)=10;
else
if annee_mois-11==annee*100
SIC(k,2)=11;
else
if annee_mois-12==annee*100
SIC(k,2)=12;
end
end
end
end
end
end
end
end
end
end
end
end
k=k+1

end
end
end
end
end

k=147;
while k<159
for annee=2016
 for annee_mois=201601:201612
   for s=1:16965
       annee_mois_jour=PAS(1,s);

      if  exist(['/net/alpha/exports/sciences/data/REFERENCE_DATA/SEA_ICE/CERSAT_SIC/arctic/' num2str(annee) '/' num2str(annee_mois) '01-' num2str(annee_mois_jour) '.nc']);
                     file=['/net/alpha/exports/sciences/data/REFERENCE_DATA/SEA_ICE/CERSAT_SIC/arctic/' num2str(annee) '/' num2str(annee_mois) '01-' num2str(annee_mois_jour) '.nc'];
                     sea_ice=ncread(file,'concentration');

                     SIC(k,1)=annee;
          i=3;
          while i< (size(long,1)* size(long,2) +3)
             for m=1:size(long,2)
                  for n=1:size(long,1)
                         SIC(k,i)=sea_ice(n,m);
                         i=i+1;
                  end
             end
          end
         
if annee_mois-1==annee*100
SIC(k,2)=1;
else
if annee_mois-2==annee*100
SIC(k,2)=2;
else
if annee_mois-3==annee*100
SIC(k,2)=3;
else
if annee_mois-4==annee*100
SIC(k,2)=4;
else
if annee_mois-5==annee*100
SIC(k,2)=5;
else
if annee_mois-6==annee*100
SIC(k,2)=6;
else
if annee_mois-7==annee*100
SIC(k,2)=7;
else
if annee_mois-8==annee*100
SIC(k,2)=8;
else
if annee_mois-9==annee*100
SIC(k,2)=9;
else
if annee_mois-10==annee*100
SIC(k,2)=10;
else
if annee_mois-11==annee*100
SIC(k,2)=11;
else
if annee_mois-12==annee*100
SIC(k,2)=12;
end
end
end
end
end
end
end
end
end
end
end
end
k=k+1

end
end
end
end
end

k=159;
while k<171
for annee=2017
 for annee_mois=201701:201712
   for s=1:16965
       annee_mois_jour=PAS(1,s);

      if  exist(['/net/alpha/exports/sciences/data/REFERENCE_DATA/SEA_ICE/CERSAT_SIC/arctic/' num2str(annee) '/' num2str(annee_mois) '01-' num2str(annee_mois_jour) '.nc']);
                     file=['/net/alpha/exports/sciences/data/REFERENCE_DATA/SEA_ICE/CERSAT_SIC/arctic/' num2str(annee) '/' num2str(annee_mois) '01-' num2str(annee_mois_jour) '.nc'];
                     sea_ice=ncread(file,'concentration');

                     SIC(k,1)=annee;
          i=3;
          while i< (size(long,1)* size(long,2) +3)
             for m=1:size(long,2)
                  for n=1:size(long,1)
                         SIC(k,i)=sea_ice(n,m);
                         i=i+1;
                  end
             end
          end
         
if annee_mois-1==annee*100
SIC(k,2)=1;
else
if annee_mois-2==annee*100
SIC(k,2)=2;
else
if annee_mois-3==annee*100
SIC(k,2)=3;
else
if annee_mois-4==annee*100
SIC(k,2)=4;
else
if annee_mois-5==annee*100
SIC(k,2)=5;
else
if annee_mois-6==annee*100
SIC(k,2)=6;
else
if annee_mois-7==annee*100
SIC(k,2)=7;
else
if annee_mois-8==annee*100
SIC(k,2)=8;
else
if annee_mois-9==annee*100
SIC(k,2)=9;
else
if annee_mois-10==annee*100
SIC(k,2)=10;
else
if annee_mois-11==annee*100
SIC(k,2)=11;
else
if annee_mois-12==annee*100
SIC(k,2)=12;
end
end
end
end
end
end
end
end
end
end
end
end
k=k+1

end
end
end
end
end

k=171;
while k<183
for annee=2018
 for annee_mois=201801:201812
   for s=1:16965
       annee_mois_jour=PAS(1,s);

      if  exist(['/net/alpha/exports/sciences/data/REFERENCE_DATA/SEA_ICE/CERSAT_SIC/arctic/' num2str(annee) '/' num2str(annee_mois) '01-' num2str(annee_mois_jour) '.nc']);
                     file=['/net/alpha/exports/sciences/data/REFERENCE_DATA/SEA_ICE/CERSAT_SIC/arctic/' num2str(annee) '/' num2str(annee_mois) '01-' num2str(annee_mois_jour) '.nc'];
                     sea_ice=ncread(file,'concentration');

                     SIC(k,1)=annee;
          i=3;
          while i< (size(long,1)* size(long,2) +3)
             for m=1:size(long,2)
                  for n=1:size(long,1)
                         SIC(k,i)=sea_ice(n,m);
                         i=i+1;
                  end
             end
          end
         
if annee_mois-1==annee*100
SIC(k,2)=1;
else
if annee_mois-2==annee*100
SIC(k,2)=2;
else
if annee_mois-3==annee*100
SIC(k,2)=3;
else
if annee_mois-4==annee*100
SIC(k,2)=4;
else
if annee_mois-5==annee*100
SIC(k,2)=5;
else
if annee_mois-6==annee*100
SIC(k,2)=6;
else
if annee_mois-7==annee*100
SIC(k,2)=7;
else
if annee_mois-8==annee*100
SIC(k,2)=8;
else
if annee_mois-9==annee*100
SIC(k,2)=9;
else
if annee_mois-10==annee*100
SIC(k,2)=10;
else
if annee_mois-11==annee*100
SIC(k,2)=11;
else
if annee_mois-12==annee*100
SIC(k,2)=12;
end
end
end
end
end
end
end
end
end
end
end
end
k=k+1

end
end
end
end
end