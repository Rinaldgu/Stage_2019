clear on
addpath('/home/rinaldi/Documents/seawater_ver3_3.1/')
addpath('/home/clique/matlab/utils')


% Les données ITP se trouvent dans le répertoire: /net/krypton/data0/project/drakkar/REFERENCE_DATA/ITP/itp_isas17
% Cet algorithme lit les données des différents ITP et calcul les valeurs de MLD et de température/salinité/densité moyenne au sein de la couche de mélange.
% Ces informations sont stockées dans la matrice "BM" où chaque ligne 
% (de 1 à 10) contient respectivement les informations suivantes:(Numéro instru, Jours, Mois, Annee, MLD, Salinité,Température,Densité,Long,lat)

% Plusiers critères éliminent les profils de mld non pertinents. 
% critere 3 "La salinité doit être inférieur à 35 psu élimine"
% critere 4 "La première mesure de pression doit commencer avant 10 mètres de profondeur" 
% critere 5 "La MLD calculée ne doit pas correspondre aux trois premières mesures de pression" 
% critere 6 "La MLD calculée ne doit pas se situer à moins de 2 mètres du premier point de mesure"
% critere 8 "Les profils doivent contenir au moins 10 mesures" " 
% critere 9 "La première mesure de densité doit commencer avant 10 mètres de profondeur"
% critere 10 "Suprpession ittérative des outliers" " 

% L'algorithme possède plusieurs conditions afin de pouvoir lire de manière générique les données des différents instruments ITP.
% Les différents variables (Long,lat,mld,densité,température,salinité) sont stockées dans un ficher 'filename.mat'.
% En lançant l'algorithme pour tout les instruments (1:110) on peut
% connaître le nombre de profils total récolté par les ITP (variable "cn"),
% le nombre de profils post-traitement (variable "Nb_profil") et le nombre
% de profils supprimé par l'ensemble des critères (Nb_profil_sup)

% Initialisation des compteurs compatibilisant le nombre de profil total supprimé par chaque critère
c3=0; 
c4=0;
c5=0;
c6=0;
c8=0;
c10=0;
cn=0; % Nombre de profil total récolté par l'ITP
Nb_profil=0; % Nombre de profil total validé par l'algorithme 
Nb_profil_sup % Nombre de profil supprimé par l'ensemble des critères 
%BM=NaN(10,85390); % Matrice stockant toutes les informations (déjà enregistré dans le fichier "filename.mat")



%%%%B%%%%%%%%%%%%%%%%%%% Choisir le/les instrument(s) dont on veut calculer les données %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for inditp=82
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
          for indL=2:3 
              
              ind_RT_DM=['RT'];
              ind_grid_final=['final'];
              
                 if  exist(['/net/krypton/data0/project/drakkar/REFERENCE_DATA/ITP/itp_isas17/ITP_' num2str(inditp) '_L' num2str(indL) '_' num2str(ind_RT_DM)  '_' num2str(ind_grid_final) '.nc']);
                     file=['/net/krypton/data0/project/drakkar/REFERENCE_DATA/ITP/itp_isas17/ITP_' num2str(inditp) '_L' num2str(indL) '_' num2str(ind_RT_DM) '_' num2str(ind_grid_final) '.nc'];
                     s=ncread(file,'PSAL'); %Salinité
                     evalc(['Salinity_' num2str(inditp) ' = s']);
                     t= ncread(file,'TEMP'); %Température 
                     evalc(['Temperature_' num2str(inditp) ' = t']);
                     p= ncread(file,'PRES'); %Pression
                     evalc(['Pression_' num2str(inditp) ' = p']);
                     j=ncread(file,'JULD'); %Jours
                     evalc(['JULD_' num2str(inditp) ' = j']);
                     
      %%%%%%% On converti la date dans un format lisible %%%%%%%%%%%                     
date=zeros(size(j,1),6);
di=zeros(1,6);
for i=1:size(j,1)
    k=i;
    if j(i)>0 
        di=datevec(datestr(j(i) + datenum('01-01-1950','dd-mm-yyyy')));
        di;
        date(i,1:6)=di;
    else
        while j(k)>0==0
              k=k+1;
        end
        j(i)=j(k);
        di=datevec(datestr(j(i) + datenum('01-01-1950','dd-mm-yyyy')));
        di;
        date(i,1:6)=di;
                 
    end
end
                     evalc(['Date_' num2str(inditp) ' = date']);
                     A = repmat(datenum(date)',size(t,1),1);
                     
       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                     
                     
                     
                     d= sw_dens(s,t,p); %On utilise une fonction d'état pour calculer la densité
                     evalc(['Density_' num2str(inditp) ' = d']);
                     lg=ncread(file,'LONGITUDE'); % Longitude
                     evalc(['Longitude_' num2str(inditp) ' = lg']);
                     lt=ncread(file,'LATITUDE'); % Latitude
                     evalc(['Latitude_' num2str(inditp) ' = lt']);
                     
%Initialisation des compteurs de profils supprimés par chaque critère  

Compteur_Critere_3=0;
Compteur_Critere_4=0;
Compteur_Critere_5=0;
Compteur_Critere_6=0;
Compteur_Critere_8=0;
Compteur_Critere_9=0;
Compteur_Critere_10=0;
Compteur_Critere_3_stockage=zeros(1,size(A,2)); %stocke les profils supprimé par le critère 3



    
%% Critère 2: La résolution verticale doit être inférieur à 5m
for j=1:size(p,2)
  for i=2:size(p,1)
     if p(i,j)-p(i-1,j)>5 % Différence entre deux niveaux de pressions
        p(1:size(p,1),j)=NaN(size(p,1),1);
     end


  end
end


mld=NaN(1,size(A,2)); % MLD=Mixed Layer Depth | Création d'un vecteur vide ayant un nombre de colonne corespondant un nombre de pas de temps.
evalc(['MLD_' num2str(inditp) ' = mld']);

md=NaN(1,size(A,2)); % Vecteur vide | Moyenne de la densité sur la couche de mélange 

ms=NaN(1,size(A,2)); % Vecteur vide | Moyenne de la salinité sur la couche de mélange 

mt=NaN(1,size(A,2)); % Vecteur vide | Moyenne de la température sur la couche de mélange

Ind=NaN(1,size(A,2));

%%%%%%%%%%%%%%%%%%%%%%%%% Détermination de la mld par la méthode du gradient maximal %%%%%%%%%%%%%%%%%%%%%%%%%%%

     for j=1:size(d,2)
                   if max(gradient(d(:,j)))> 0
                      Ind(j)=max(find(gradient(d(:,j))==max(gradient(d(:,j)))));
                      mld(j)=p(Ind(j),j);
                   else
                      mld(j)=NaN;

        end    
 %% Critère 8: Les profils doivent contenir au moins 10 mesures.

if(length(find(isnan(d(:,j))==0))<2) || (length(find(isnan(p(:,j))==0))<2)
   mld(j)=NaN;
   Compteur_Critere_8=Compteur_Critere_8+1;
else
end      
       
    %% Critère 4: La première mesure de pression doit commencer avant 10 mètres de profondeur %%
    
c=1;

    if p(c,j)>0
          if p(c,j)>10 
          mld(j)=NaN;
          Compteur_Critere_4= Compteur_Critere_4+1;
          j
          end
    else
        
           while p(c,j)>0==0 & c<size(p,1)%On continu jusqu'à ce que la première mesure ne soit plus un NaN
              c=c+1;
              if p(c,j)>10
                 mld(j)=NaN;
                 Compteur_Critere_4= Compteur_Critere_4+1;
                 j
              end
           end
        
    end
    
        %% Critère 9: La première mesure de densité doit commencer avant 10 mètres de profondeur %%
    
    c=1;

    if d(c,j)>0
          if p(c,j)>10 
          mld(j)=NaN;
          Compteur_Critere_9= Compteur_Critere_9+1;
          end
    else
        
           while d(c,j)>0==0 & c<size(d,1)
              c=c+1;
           end
              if p(c,j)>10
                 mld(j)=NaN;
                 Compteur_Critere_9= Compteur_Critere_9+1;
              end
        
    end
    
 

          
    
    %% Critère 5: La MLD calculée ne doit pas correspondre aux trois premières mesures de pression %%
    
         k=1;
         while p(k,j)>0==0 & k<size(p,1)
             k=k+1;
         end
             if  mld(j)==p(k,j)
                 mld(j)=NaN;
                 Compteur_Critere_5=Compteur_Critere_5+1;
                 
             else 
                 if k<(size(p,1)-3)
                 k=k+1;
                 end
         while p(k,j)>0==0 & k<size(p,1)
               k=k+1;
         end
             if  mld(j)==p(k,j) 
                 mld(j)=NaN;
                 Compteur_Critere_5=Compteur_Critere_5+1;
                 if k<(size(p,1)-3)
                 k=k+1;
                 end
         while p(k,j)>0==0 & k<size(p,1)
               k=k+1;
         end
             if mld(j)==p(k,j)
                mld(j)=NaN;
                Compteur_Critere_5=Compteur_Critere_5+1;
             end
             end
             end
             
 
    %% Critère 6: La MLD calculée ne doit pas se situer à moins de 2 mètres du premier point de mesure %%
    
          if mld(j)-p(1,j)<2
          mld(j)=NaN;
          Compteur_Critere_6=Compteur_Critere_6+1;
          end   
          

          
              %% Critère 10: Suppression ittérative des outliers (deux mesures de mld à 18heures d'intervalles ne doivent pas excéder deux fois l'écart-type de la série temporelle). %%
    sigma= std(mld,'omitnan');
if j>1
            if mld(j-1)>0 & mld(j)>0
                    if abs(mld(j)-mld(j-1))>2*sigma
                       mld(j)=NaN;
                       Compteur_Critere_10=Compteur_Critere_10+1;
                    else 
                    
                    end
            end
end   

if j>2
            if mld(j-2)>0 & mld(j)>0
                    if abs(mld(j)-mld(j-2))>2*sigma
                       mld(j)=NaN;
                       Compteur_Critere_10=Compteur_Critere_10+1;
                    else 
                    
                    end
            end
end   
if j>3
            if mld(j-3)>0 & mld(j)>0
                    if abs(mld(j)-mld(j-3))>2*sigma
                       mld(j)=NaN;
                       Compteur_Critere_10=Compteur_Critere_10+1;
                    else 
                    
                    end
            end
end  
              %% Critère 11: L'instrument doit se trouver en Arctique %%
              
             if min(lt)<60
                mld=NaN(1,size(A,2))
                disp('l instrument ne se trouve pas en Arctique')
             end


 

    if mld(j)>0
       md(j)=nansum(d(1:Ind(j),j))/(size(find(d(1:Ind(j),j)>0),1)*1000);
       ms(j)=nansum(s(1:Ind(j),j))/size(find(s(1:Ind(j),j)>0),1);
       mt(j)=nansum(t(1:Ind(j),j))/size(find(t(1:Ind(j),j)>-3),1);
    end

%% Critère 3: La Salinité doit être inférieur à 35 psu  
for i=1:size(p,1)
     if  s(i,j)>36
         mld(j)=NaN;
         Compteur_Critere_3_stockage(j)=1
         
     end
end
  Compteur_Critere_3=sum(Compteur_Critere_3_stockage);  
    




     end
evalc(['MLD_' num2str(inditp) ' = mld']);
evalc(['Mean_Density_' num2str(inditp) ' = md']);
evalc(['Mean_Salinity_' num2str(inditp) ' = ms']);
evalc(['Mean_Temperature_' num2str(inditp) ' = mt']);    

disp(['Le critere 3 "La salinité doit être inférieur à 35 psu" élimine ' num2str(Compteur_Critere_3) ' valeurs.'])
disp(['Le critere 4 "La première mesure de pression doit commencer avant 10 mètres de profondeur" élimine ' num2str(Compteur_Critere_4) ' valeurs.'])
disp(['Le critere 5 "La MLD calculée ne doit pas correspondre aux trois premières mesures de pression" élimine ' num2str(Compteur_Critere_5) ' valeurs.'])
disp(['Le critere 6 "La MLD calculée ne doit pas se situer à moins de 2 mètres du premier point de mesure" élimine ' num2str(Compteur_Critere_6) ' valeurs.'])
disp(['Le critere 8 "Les profils doivent contenir au moins 10 mesures" " élimine ' num2str(Compteur_Critere_8) ' valeurs.'])
disp(['Le critere 9 "La première mesure de densité doit commencer avant 10 mètres de profondeur" élimine ' num2str(Compteur_Critere_9) ' valeurs.'])
disp(['Le critere 10 "Suprpession ittérative des outliers" " élimine ' num2str(Compteur_Critere_10) ' valeurs.'])  
                             
 save('filename.mat', ['MLD_' num2str(inditp)],'-append' );     
 save('filename.mat', ['Mean_Density_' num2str(inditp)],'-append' );
 save('filename.mat', ['Mean_Salinity_' num2str(inditp)],'-append' );
 save('filename.mat', ['Mean_Temperature_' num2str(inditp)],'-append' );     
 save('filename.mat', ['Date_' num2str(inditp)],'-append' );
 save('filename.mat', ['Longitude_' num2str(inditp)],'-append' );
 save('filename.mat', ['Latitude_' num2str(inditp)],'-append' );
                 else   
                     
 
                     ind_RT_DM=['RT'];
                     ind_grid_final=['grid'];
            
                         if  exist(['/net/krypton/data0/project/drakkar/REFERENCE_DATA/ITP/itp_isas17/ITP_' num2str(inditp) '_L' num2str(indL) '_' num2str(ind_RT_DM)  '_' num2str(ind_grid_final) '.nc']);
                             file=['/net/krypton/data0/project/drakkar/REFERENCE_DATA/ITP/itp_isas17/ITP_' num2str(inditp) '_L' num2str(indL) '_' num2str(ind_RT_DM) '_' num2str(ind_grid_final) '.nc'];
                             s=ncread(file,'PSAL');
                             evalc(['Salinity_' num2str(inditp) ' = s']);
                             t= ncread(file,'TEMP');
                             evalc(['Temperature_' num2str(inditp) ' = t']);
                             p= ncread(file,'PRES');
                             evalc(['Pression_' num2str(inditp) ' = p']);
                             j=ncread(file,'JULD');
                             evalc(['JULD_' num2str(inditp) ' = j']);
   
                      
      %%%%%%% On converti la date dans un format lisible %%%%%%%%%%%                                
                             
date=zeros(size(j,1),6);
di=zeros(1,6);

for i=1:size(j,1)
    k=i;
    if j(i)>0 
        di=datevec(datestr(j(i) + datenum('01-01-1950','dd-mm-yyyy')));
        di;
        date(i,1:6)=di;
    else
        while j(k)>0==0
              k=k+1;
        end
        j(i)=j(k);
        di=datevec(datestr(j(i) + datenum('01-01-1950','dd-mm-yyyy')));
        di;
        date(i,1:6)=di;
                 
    end
end
                             evalc(['Date_' num2str(inditp) ' = date']);
                             A = repmat(datenum(date)',size(t,1),1);
                             
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                      
                             
                             d = sw_dens(s,t,p);
                             evalc(['Density_' num2str(inditp) ' = d']);
                             lg=ncread(file,'LONGITUDE');
                             evalc(['Longitude_' num2str(inditp) ' = lg']);
                             lt=ncread(file,'LATITUDE');
                             evalc(['Latitude_' num2str(inditp) ' = lt']);
                             
                             
%Initialisation des compteurs de profils supprimés par chaque critère  

Compteur_Critere_3=0;
Compteur_Critere_4=0;
Compteur_Critere_5=0;
Compteur_Critere_6=0;
Compteur_Critere_8=0;
Compteur_Critere_9=0;
Compteur_Critere_10=0;
Compteur_Critere_3_stockage=zeros(1,size(A,2)); %stocke les profils supprimé par le critère 3



    
%% Critère 2: La résolution verticale doit être inférieur à 5m
for j=1:size(p,2)
  for i=2:size(p,1)
     if p(i,j)-p(i-1,j)>5
        p(1:size(p,1),j)=NaN(size(p,1),1);
     end

  end
end


mld=NaN(1,size(A,2)); % MLD=Mixed Layer Depth | Création d'un vecteur vide ayant un nombre de colonne corespondant un nombre de pas de temps.
evalc(['MLD_' num2str(inditp) ' = mld']);

md=NaN(1,size(A,2)); % Vecteur vide | Moyenne de la densité sur la couche de mélange 

ms=NaN(1,size(A,2));

mt=NaN(1,size(A,2));

Ind=NaN(1,size(A,2));

     for j=1:size(d,2)
                   if max(gradient(d(:,j)))> 0
                      Ind(j)=max(find(gradient(d(:,j))==max(gradient(d(:,j)))));
                      mld(j)=p(Ind(j),j);
                   else
                      mld(j)=NaN;

        end      
 %% Critère 8: Les profils doivent contenir au moins 10 mesures.

if(length(find(isnan(d(:,j))==0))<2) || (length(find(isnan(p(:,j))==0))<2)
   mld(j)=NaN;
   Compteur_Critere_8=Compteur_Critere_8+1;
else
end      
       
    %% Critère 4: La première mesure de pression doit commencer avant 10 mètres de profondeur %%
    
c=1;

    if p(c,j)>0
          if p(c,j)>10 
          mld(j)=NaN;
          Compteur_Critere_4= Compteur_Critere_4+1;
          j
          end
    else
        
           while p(c,j)>0==0 & c<size(p,1)
              c=c+1;
              if p(c,j)>10
                 mld(j)=NaN;
                 Compteur_Critere_4= Compteur_Critere_4+1;
                 j
              end
           end
        
    end
    
    %% Critère 9: La première mesure de densité doit commencer avant 10 mètres de profondeur %%
    
    c=1;

    if d(c,j)>0
          if p(c,j)>10 
          mld(j)=NaN;
          Compteur_Critere_9= Compteur_Critere_9+1;
          end
    else
        
           while d(c,j)>0==0 & c<size(d,1)
              c=c+1;
           end
              if p(c,j)>10
                 mld(j)=NaN;
                 Compteur_Critere_9= Compteur_Critere_9+1;
              end
        
    end

                      %% Critère 11: L'instrument doit se trouver en Arctique %%
              
             if min(lt)<60
                mld=NaN(1,size(A,2))
             end
    
          
    
   %% Critère 5: La MLD calculée ne doit pas correspondre aux trois premières mesures de pression %%
    
         k=1;
         while p(k,j)>0==0 & k<size(p,1)
             k=k+1;
         end
             if  mld(j)==p(k,j)
                 mld(j)=NaN;
                 Compteur_Critere_5=Compteur_Critere_5+1;
                 
             else 
                 if k<(size(p,1)-3)
                 k=k+1;
                 end
         while p(k,j)>0==0 & k<size(p,1)
               k=k+1;
         end
             if  mld(j)==p(k,j) 
                 mld(j)=NaN;
                 Compteur_Critere_5=Compteur_Critere_5+1;
                 if k<(size(p,1)-3)
                 k=k+1;
                 end
         while p(k,j)>0==0 & k<size(p,1)
               k=k+1;
         end
             if mld(j)==p(k,j)
                mld(j)=NaN;
                Compteur_Critere_5=Compteur_Critere_5+1;
             end
             end
             end
 
    %% Critère 6: La MLD calculée ne doit pas se situer à moins de 2 mètres du premier point de mesure %%
    
          if mld(j)-p(1,j)<2
          mld(j)=NaN;
          Compteur_Critere_6=Compteur_Critere_6+1;
          end   
          
  
          
              %% Critère 10: La densité doit croître avec la profondeur %%
    sigma= std(mld,'omitnan');
if j>1
            if mld(j-1)>0 & mld(j)>0
                    if abs(mld(j)-mld(j-1))>2*sigma
                       mld(j)=NaN;
                       Compteur_Critere_10=Compteur_Critere_10+1;
                    else 
                    
                    end
            end
end   

if j>2
            if mld(j-2)>0 & mld(j)>0
                    if abs(mld(j)-mld(j-2))>2*sigma
                       mld(j)=NaN;
                       Compteur_Critere_10=Compteur_Critere_10+1;
                    else 
                    
                    end
            end
end   
if j>3
            if mld(j-3)>0 & mld(j)>0
                    if abs(mld(j)-mld(j-3))>2*sigma
                       mld(j)=NaN;
                       Compteur_Critere_10=Compteur_Critere_10+1;
                    else 
                    
                    end
            end
end  
              %% Critère 11: L'instrument doit se trouver en Arctique %%
              
             if min(lt)<60
                mld=NaN(1,size(A,2))
                disp('l instrument ne se trouve pas en Arctique')
                
             end


 


    if mld(j)>0
       md(j)=nansum(d(1:Ind(j),j))/(size(find(d(1:Ind(j),j)>0),1)*1000);
       ms(j)=nansum(s(1:Ind(j),j))/size(find(s(1:Ind(j),j)>0),1);
       mt(j)=nansum(t(1:Ind(j),j))/size(find(t(1:Ind(j),j)>-3),1);
    end

%% Critère 3: La Salinité doit être inférieur à 35 psu  
for i=1:size(p,1)
     if  s(i,j)>36
         mld(j)=NaN;
         Compteur_Critere_3_stockage(j)=1
         
     end
end  
 Compteur_Critere_3=sum(Compteur_Critere_3_stockage);  




     end
evalc(['MLD_' num2str(inditp) ' = mld']);
evalc(['Mean_Density_' num2str(inditp) ' = md']);
evalc(['Mean_Salinity_' num2str(inditp) ' = ms']);
evalc(['Mean_Temperature_' num2str(inditp) ' = mt']);    

disp(['Le critere 3 "La salinité doit être inférieur à 35 psu élimine" ' num2str(Compteur_Critere_3) ' valeurs.'])
disp(['Le critere 4 "La première mesure de pression doit commencer avant 10 mètres de profondeur" élimine ' num2str(Compteur_Critere_4) ' valeurs.'])
disp(['Le critere 5 "La MLD calculée ne doit pas correspondre aux trois premières mesures de pression" élimine ' num2str(Compteur_Critere_5) ' valeurs.'])
disp(['Le critere 6 "La MLD calculée ne doit pas se situer à moins de 2 mètres du premier point de mesure" élimine ' num2str(Compteur_Critere_6) ' valeurs.'])
disp(['Le critere 8 "Les profils doivent contenir au moins 10 mesures" " élimine ' num2str(Compteur_Critere_8) ' valeurs.'])
disp(['Le critere 9 "La première mesure de densité doit commencer avant 10 mètres de profondeur" élimine ' num2str(Compteur_Critere_9) ' valeurs.'])
disp(['Le critere 10 "Suprpession ittérative des outliers" " élimine ' num2str(Compteur_Critere_10) ' valeurs.'])    

 save('filename.mat', ['MLD_' num2str(inditp)],'-append' );     
 save('filename.mat', ['Mean_Density_' num2str(inditp)],'-append' );
 save('filename.mat', ['Mean_Salinity_' num2str(inditp)],'-append' );
 save('filename.mat', ['Mean_Temperature_' num2str(inditp)],'-append' );     
 save('filename.mat', ['Date_' num2str(inditp)],'-append' );
 save('filename.mat', ['Longitude_' num2str(inditp)],'-append' );
 save('filename.mat', ['Latitude_' num2str(inditp)],'-append' );
 
 
                         
                         else
                             ind_RT_DM=['DM'];
                             ind_grid_final=['final'];
                             
                                if  exist(['/net/krypton/data0/project/drakkar/REFERENCE_DATA/ITP/itp_isas17/ITP_' num2str(inditp) '_L' num2str(indL) '_' num2str(ind_RT_DM)  '_' num2str(ind_grid_final) '.nc']);
                                    file=['/net/krypton/data0/project/drakkar/REFERENCE_DATA/ITP/itp_isas17/ITP_' num2str(inditp) '_L' num2str(indL) '_' num2str(ind_RT_DM) '_' num2str(ind_grid_final) '.nc'];
                                    s=ncread(file,'PSAL');
                                    evalc(['Salinity_' num2str(inditp) ' = s']);
                                    t= ncread(file,'TEMP');
                                    evalc(['Temperature_' num2str(inditp) ' = t']);
                                    p= ncread(file,'PRES');
                                    evalc(['Pression_' num2str(inditp) ' = p']);
                                    j=ncread(file,'JULD');
                                    evalc(['JULD_' num2str(inditp) ' = j']);
                              
                                       
      %%%%%%% On converti la date dans un format lisible %%%%%%%%%%%                      
                                    
date=zeros(size(j,1),6);
di=zeros(1,6);

for i=1:size(j,1)
    k=i;
    if j(i)>0 
        di=datevec(datestr(j(i) + datenum('01-01-1950','dd-mm-yyyy')));
        di;
        date(i,1:6)=di;
    else
        while j(k)>0==0
              k=k+1;
        end
        j(i)=j(k);
        di=datevec(datestr(j(i) + datenum('01-01-1950','dd-mm-yyyy')));
        di;
        date(i,1:6)=di;
                 
    end
end
                                    
                                    evalc(['Date_' num2str(inditp) ' = date']);
                                    A = repmat(datenum(date)',size(t,1),1);
                                    
      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      
                                    d = sw_dens(s,t,p);
                                    evalc(['Density_' num2str(inditp) ' = d']);
                                    lg=ncread(file,'LONGITUDE');
                                    evalc(['Longitude_' num2str(inditp) ' = lg']);
                                    lt=ncread(file,'LATITUDE');
                                    evalc(['Latitude_' num2str(inditp) ' = lt']);
                                    
                                    
%Initialisation des compteurs de profils supprimés par chaque critère  

Compteur_Critere_3=0;
Compteur_Critere_4=0;
Compteur_Critere_5=0;
Compteur_Critere_6=0;
Compteur_Critere_8=0;
Compteur_Critere_9=0;
Compteur_Critere_10=0;
Compteur_Critere_3_stockage=zeros(1,size(A,2)); %stocke les profils supprimé par le critère 3


    
%% Critère 2: La résolution verticale doit être inférieur à 5m
for j=1:size(p,2)
  for i=2:size(p,1)
     if p(i,j)-p(i-1,j)>5
        p(1:size(p,1),j)=NaN(size(p,1),1);
     end

  end
end


mld=NaN(1,size(A,2)); % MLD=Mixed Layer Depth | Création d'un vecteur vide ayant un nombre de colonne corespondant un nombre de pas de temps.
evalc(['MLD_' num2str(inditp) ' = mld']);

md=NaN(1,size(A,2)); % Vecteur vide | Moyenne de la densité sur la couche de mélange 

ms=NaN(1,size(A,2));

mt=NaN(1,size(A,2));

Ind=NaN(1,size(A,2));

     for j=1:size(d,2)
                   if max(gradient(d(:,j)))> 0
                      Ind(j)=max(find(gradient(d(:,j))==max(gradient(d(:,j)))));
                      mld(j)=p(Ind(j),j);
                   else
                      mld(j)=NaN;

        end         
 %% Critère 8: Les profils doivent contenir au moins 10 mesures.

if(length(find(isnan(d(:,j))==0))<2) || (length(find(isnan(p(:,j))==0))<2)
   mld(j)=NaN;
   Compteur_Critere_8=Compteur_Critere_8+1;
else
end      
       
    %% Critère 4: La première mesure de pression doit commencer avant 10 mètres de profondeur %%
    
c=1;

    if p(c,j)>0
          if p(c,j)>10 
          mld(j)=NaN;
          Compteur_Critere_4= Compteur_Critere_4+1;
          j
          end
    else
        
           while p(c,j)>0==0 & c<size(p,1)
              c=c+1;
              if p(c,j)>10
                 mld(j)=NaN;
                 Compteur_Critere_4= Compteur_Critere_4+1;
                 j
              end
           end
        
    end
    
    %% Critère 9: La première mesure de densité doit commencer avant 10 mètres de profondeur %%
    
    c=1;

    if d(c,j)>0
          if p(c,j)>10 
          mld(j)=NaN;
          j
          Compteur_Critere_9= Compteur_Critere_9+1;
          end
    else
        
           while d(c,j)>0==0 & c<size(d,1)
              c=c+1;
           end
              if p(c,j)>10
                 mld(j)=NaN;
                 Compteur_Critere_9= Compteur_Critere_9+1;
              end
        
    end
          
    
   %% Critère 5: La MLD calculée ne doit pas correspondre aux trois premières mesures de pression %%
    
         k=1;
         while p(k,j)>0==0 & k<size(p,1)
             k=k+1;
         end
             if  mld(j)==p(k,j)
                 mld(j)=NaN;
                 Compteur_Critere_5=Compteur_Critere_5+1;
                 
             else 
                 if k<(size(p,1)-3)
                 k=k+1;
                 end
         while p(k,j)>0==0 & k<size(p,1)
               k=k+1;
         end
             if  mld(j)==p(k,j) 
                 mld(j)=NaN;
                 Compteur_Critere_5=Compteur_Critere_5+1;
                 if k<(size(p,1)-3)
                 k=k+1;
                 end
         while p(k,j)>0==0 & k<size(p,1)
               k=k+1;
         end
             if mld(j)==p(k,j)
                mld(j)=NaN;
                Compteur_Critere_5=Compteur_Critere_5+1;
             end
             end
             end
 
    %% Critère 6: La MLD calculée ne doit pas se situer à moins de 2 mètres du premier point de mesure %%
    
          if mld(j)-p(1,j)<2
          mld(j)=NaN;
          Compteur_Critere_6=Compteur_Critere_6+1;
          end   
          
          
              %% Critère 10: Iterative method %%
    sigma= std(mld,'omitnan');
if j>1
            if mld(j-1)>0 & mld(j)>0
                    if abs(mld(j)-mld(j-1))>2*sigma
                       mld(j)=NaN;
                       Compteur_Critere_10=Compteur_Critere_10+1;
                    else 
                    
                    end
            end
end   

if j>2
            if mld(j-2)>0 & mld(j)>0
                    if abs(mld(j)-mld(j-2))>2*sigma
                       mld(j)=NaN;
                       Compteur_Critere_10=Compteur_Critere_10+1;
                    else 
                    
                    end
            end
end   
if j>3
            if mld(j-3)>0 & mld(j)>0
                    if abs(mld(j)-mld(j-3))>2*sigma
                       mld(j)=NaN;
                       Compteur_Critere_10=Compteur_Critere_10+1;
                    else 
                    
                    end
            end
end 
              %% Critère 11: L'instrument doit se trouver en Arctique %%
              
             if min(lt)<60
                mld=NaN(1,size(A,2))
                disp('l instrument ne se trouve pas en Arctique')
             end


 

    if mld(j)>0
       md(j)=nansum(d(1:Ind(j),j))/(size(find(d(1:Ind(j),j)>0),1)*1000);
       ms(j)=nansum(s(1:Ind(j),j))/size(find(s(1:Ind(j),j)>0),1);
       mt(j)=nansum(t(1:Ind(j),j))/size(find(t(1:Ind(j),j)>-3),1);
    end

  
%% Critère 3: La Salinité doit être inférieur à 35 psu  
for i=1:size(p,1)
     if  s(i,j)>36
         mld(j)=NaN;
         Compteur_Critere_3_stockage(j)=1;
         
     end
end
Compteur_Critere_3=sum(Compteur_Critere_3_stockage);
    
    




     end
evalc(['MLD_' num2str(inditp) ' = mld']);
evalc(['Mean_Density_' num2str(inditp) ' = md']);
evalc(['Mean_Salinity_' num2str(inditp) ' = ms']);
evalc(['Mean_Temperature_' num2str(inditp) ' = mt']);    

disp(['Le critere 3 "La salinité doit être inférieur à 35 psu élimine" ' num2str(Compteur_Critere_3) ' valeurs.'])
disp(['Le critere 4 "La première mesure de pression doit commencer avant 10 mètres de profondeur" élimine ' num2str(Compteur_Critere_4) ' valeurs.'])
disp(['Le critere 5 "La MLD calculée ne doit pas correspondre aux trois premières mesures de pression" élimine ' num2str(Compteur_Critere_5) ' valeurs.'])
disp(['Le critere 6 "La MLD calculée ne doit pas se situer à moins de 2 mètres du premier point de mesure" élimine ' num2str(Compteur_Critere_6) ' valeurs.'])
disp(['Le critere 8 "Les profils doivent contenir au moins 10 mesures" " élimine ' num2str(Compteur_Critere_8) ' valeurs.'])
disp(['Le critere 9 "La première mesure de densité doit commencer avant 10 mètres de profondeur" élimine ' num2str(Compteur_Critere_9) ' valeurs.'])
disp(['Le critere 10 "Suprpession ittérative des outliers" " élimine ' num2str(Compteur_Critere_10) ' valeurs.'])    
                             
 save('filename.mat', ['MLD_' num2str(inditp)],'-append' );     
 save('filename.mat', ['Mean_Density_' num2str(inditp)],'-append' );
 save('filename.mat', ['Mean_Salinity_' num2str(inditp)],'-append' );
 save('filename.mat', ['Mean_Temperature_' num2str(inditp)],'-append' );     
 save('filename.mat', ['Date_' num2str(inditp)],'-append' );
 save('filename.mat', ['Longitude_' num2str(inditp)],'-append' );
 save('filename.mat', ['Latitude_' num2str(inditp)],'-append' );                          
                                    
                                else 
                                    ind_RT_DM=['DM'];
                                    ind_grid_final=['grid'];
                                     
                                       if  exist(['/net/krypton/data0/project/drakkar/REFERENCE_DATA/ITP/itp_isas17/ITP_' num2str(inditp) '_L' num2str(indL) '_' num2str(ind_RT_DM)  '_' num2str(ind_grid_final) '.nc']);
                                           file=['/net/krypton/data0/project/drakkar/REFERENCE_DATA/ITP/itp_isas17/ITP_' num2str(inditp) '_L' num2str(indL) '_' num2str(ind_RT_DM) '_' num2str(ind_grid_final) '.nc'];
                                           s=ncread(file,'PSAL');
                                           evalc(['Salinity_' num2str(inditp) ' = s']);
                                           t= ncread(file,'TEMP');
                                           evalc(['Temperature_' num2str(inditp) ' = t']);
                                           p= ncread(file,'PRES');
                                           evalc(['Pression_' num2str(inditp) ' = p']);
                                           j=ncread(file,'JULD');
                                           evalc(['JULD_' num2str(inditp) ' = j']);
                                           
                              
      %%%%%%% On converti la date dans un format lisible %%%%%%%%%%%                                      
                                           
date=zeros(size(j,1),6);
di=zeros(1,6);

for i=1:size(j,1)
    k=i;
    if j(i)>0 
        di=datevec(datestr(j(i) + datenum('01-01-1950','dd-mm-yyyy')));
        di;
        date(i,1:6)=di;
    else
        while j(k)>0==0
              k=k+1;
        end
        j(i)=j(k);
        di=datevec(datestr(j(i) + datenum('01-01-1950','dd-mm-yyyy')));
        di;
        date(i,1:6)=di;
                 
    end
end
                                           eval(['Date_' num2str(inditp) ' = date']);
                                           A = repmat(datenum(date)',size(t,1),1);
                                           
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                           d = sw_dens(s,t,p);
                                           eval(['Density_' num2str(inditp) ' = d']);
                                           lg=ncread(file,'LONGITUDE');
                                           eval(['Longitude_' num2str(inditp) ' = lg']);
                                           lt=ncread(file,'LATITUDE');
                                           eval(['Latitude_' num2str(inditp) ' = lt']);
                                           
%Initialisation des compteurs de profils supprimés par chaque critère  

Compteur_Critere_3=0;
Compteur_Critere_4=0;
Compteur_Critere_5=0;
Compteur_Critere_6=0;
Compteur_Critere_8=0;
Compteur_Critere_9=0;
Compteur_Critere_10=0;
Compteur_Critere_3_stockage=zeros(1,size(A,2)); %stocke les profils supprimé par le critère 3



    
%% Critère 2: La résolution verticale doit être inférieur à 5m
for j=1:size(p,2)
  for i=2:size(p,1)
     if p(i,j)-p(i-1,j)>5
        p(1:size(p,1),j)=NaN(size(p,1),1);
     end

  end
end


mld=NaN(1,size(A,2)); % MLD=Mixed Layer Depth | Création d'un vecteur vide ayant un nombre de colonne corespondant un nombre de pas de temps.
evalc(['MLD_' num2str(inditp) ' = mld']);

md=NaN(1,size(A,2)); % Vecteur vide | Moyenne de la densité sur la couche de mélange 

ms=NaN(1,size(A,2));

mt=NaN(1,size(A,2));

Ind=NaN(1,size(A,2));

     for j=1:size(d,2)
                   if max(gradient(d(:,j)))> 0
                      Ind(j)=max(find(gradient(d(:,j))==max(gradient(d(:,j)))));
                      mld(j)=p(Ind(j),j);
                   else
                      mld(j)=NaN;

        end        
 %% Critère 8: Les profils doivent contenir au moins 10 mesures.

if(length(find(isnan(d(:,j))==0))<2) || (length(find(isnan(p(:,j))==0))<2)
   mld(j)=NaN;
   Compteur_Critere_8=Compteur_Critere_8+1;
else
end      
       
    %% Critère 4: La première mesure de pression doit commencer avant 10 mètres de profondeur %%
    
c=1;

    if p(c,j)>0
          if p(c,j)>10 
          mld(j)=NaN;
          Compteur_Critere_4= Compteur_Critere_4+1;
          j
          end
    else
        
           while p(c,j)>0==0 & c<size(p,1)
              c=c+1;
              if p(c,j)>10
                 mld(j)=NaN;
                 Compteur_Critere_4= Compteur_Critere_4+1;
                 j
              end
           end
        
    end
    
    %% Critère 9: La première mesure de densité doit commencer avant 10 mètres de profondeur %%
    
    c=1;

    if d(c,j)>0
          if p(c,j)>10 
          mld(j)=NaN;
          j
          Compteur_Critere_9= Compteur_Critere_9+1;
          end
    else
        
           while d(c,j)>0==0 & c<size(d,1)
              c=c+1;
           end
              if p(c,j)>10
                 mld(j)=NaN;
                 Compteur_Critere_9= Compteur_Critere_9+1;
              end
        
    end

    
   %% Critère 5: La MLD calculée ne doit pas correspondre aux trois premières mesures de pression %%
    
         k=1;
         while p(k,j)>0==0 & k<size(p,1)
             k=k+1;
         end
             if  mld(j)==p(k,j)
                 mld(j)=NaN;
                 Compteur_Critere_5=Compteur_Critere_5+1;
                 
             else 
                 if k<(size(p,1)-3)
                 k=k+1;
                 end
         while p(k,j)>0==0 & k<size(p,1)
               k=k+1;
         end
             if  mld(j)==p(k,j) 
                 mld(j)=NaN;
                 Compteur_Critere_5=Compteur_Critere_5+1;
                 if k<(size(p,1)-3)
                 k=k+1;
                 end
         while p(k,j)>0==0 & k<size(p,1)
               k=k+1;
         end
             if mld(j)==p(k,j)
                mld(j)=NaN;
                Compteur_Critere_5=Compteur_Critere_5+1;
             end
             end
             end
 
    %% Critère 6: La MLD calculée ne doit pas se situer à moins de 2 mètres du premier point de mesure %%
    
          if mld(j)-p(1,j)<2
          mld(j)=NaN;
          Compteur_Critere_6=Compteur_Critere_6+1;
          end   
          
 
          
              %% Critère 10: La densité doit croître avec la profondeur %%
    sigma= std(mld,'omitnan');
if j>1
            if mld(j-1)>0 & mld(j)>0
                    if abs(mld(j)-mld(j-1))>2*sigma
                       mld(j)=NaN;
                       Compteur_Critere_10=Compteur_Critere_10+1;
                    else 
                    
                    end
            end
end   

if j>2
            if mld(j-2)>0 & mld(j)>0
                    if abs(mld(j)-mld(j-2))>2*sigma
                       mld(j)=NaN;
                       Compteur_Critere_10=Compteur_Critere_10+1;
                    else 
                    
                    end
            end
end   
if j>3
            if mld(j-3)>0 & mld(j)>0
                    if abs(mld(j)-mld(j-3))>2*sigma
                       mld(j)=NaN;
                       Compteur_Critere_10=Compteur_Critere_10+1;
                    else 
                    
                    end
            end
end 
              %% Critère 11: L'instrument doit se trouver en Arctique %%
              
             if min(lt)<60
                mld=NaN(1,size(A,2))
                disp('l instrument ne se trouve pas en Arctique')
             end





    if mld(j)>0
       md(j)=nansum(d(1:Ind(j),j))/(size(find(d(1:Ind(j),j)>0),1)*1000);
       ms(j)=nansum(s(1:Ind(j),j))/size(find(s(1:Ind(j),j)>0),1);
       mt(j)=nansum(t(1:Ind(j),j))/size(find(t(1:Ind(j),j)>-3),1);
    end


%% Critère 3: La Salinité doit être inférieur à 35 psu  
for i=1:size(p,1)
     if  s(i,j)>36
         mld(j)=NaN;
         Compteur_Critere_3_stockage(j)=1
         
     end
end
Compteur_Critere_3=sum(Compteur_Critere_3_stockage)




     end
evalc(['MLD_' num2str(inditp) ' = mld']);
evalc(['Mean_Density_' num2str(inditp) ' = md']);
evalc(['Mean_Salinity_' num2str(inditp) ' = ms']);
evalc(['Mean_Temperature_' num2str(inditp) ' = mt']);    

disp(['Le critere 3 "La salinité doit être inférieur à 35 psu élimine" ' num2str(Compteur_Critere_3) ' valeurs.'])
disp(['Le critere 4 "La première mesure de pression doit commencer avant 10 mètres de profondeur" élimine ' num2str(Compteur_Critere_4) ' valeurs.'])
disp(['Le critere 5 "La MLD calculée ne doit pas correspondre aux trois premières mesures de pression" élimine ' num2str(Compteur_Critere_5) ' valeurs.'])
disp(['Le critere 6 "La MLD calculée ne doit pas se situer à moins de 2 mètres du premier point de mesure" élimine ' num2str(Compteur_Critere_6) ' valeurs.'])
disp(['Le critere 8 "Les profils doivent contenir au moins 10 mesures" " élimine ' num2str(Compteur_Critere_8) ' valeurs.'])
disp(['Le critere 9 "La première mesure de densité doit commencer avant 10 mètres de profondeur" élimine ' num2str(Compteur_Critere_9) ' valeurs.'])
disp(['Le critere 10 "Suprpession ittérative des outliers" " élimine ' num2str(Compteur_Critere_10) ' valeurs.'])                               
 
 save('filename.mat', ['MLD_' num2str(inditp)],'-append' );     
 save('filename.mat', ['Mean_Density_' num2str(inditp)],'-append' );
 save('filename.mat', ['Mean_Salinity_' num2str(inditp)],'-append' );
 save('filename.mat', ['Mean_Temperature_' num2str(inditp)],'-append' );     
 save('filename.mat', ['Date_' num2str(inditp)],'-append' );
 save('filename.mat', ['Longitude_' num2str(inditp)],'-append' );
 save('filename.mat', ['Latitude_' num2str(inditp)],'-append' );
                                       end
                                         
                                end
                                
                         end
                      
                 end
                 
          end
          
          
          
          for j=1:size(A,2)
              %BM(1,j+a)=inditp;
              %BM(2,j+a)=date(j,3);
              %BM(3,j+a)=date(j,2);
              %BM(4,j+a)=date(j,1);
              %BM(5,j+a)=mld(j);
              %BM(6,j+a)=ms(j);
              %BM(7,j+a)=mt(j);
              %BM(8,j+a)=md(j);
              %BM(9,j+a)=lg(j);
              %BM(10,j+a)=lt(j);
                              
          end
          
          
%c4=c4+Compteur_Critere_4;
%c5=c5+Compteur_Critere_5;
%c6=c6+Compteur_Critere_6;
%c7=c7+Compteur_Critere_7;
%c8=c8+Compteur_Critere_8;
%c9=c9+Compteur_Critere_9;
%c10=c10+Compteur_Critere_10;
%c3=c3+Compteur_Critere_3;
%Nb_profil=Nb_profil+sum(~isnan(mld));
%cn=cn+size(A,2);
%Nb_profil_sup=cn-Nb_profil

 end
 
save('filename.mat', 'BM')