clear on
addpath('/home/rinaldi/Documents/seawater_ver3_3.1/')

% Les données ITP se trouvent dans le répertoire: /net/krypton/data0/project/drakkar/REFERENCE_DATA/ITP/itp_isas17
% Ce programme représente les relations Densité/Salinité/Température en
% fonction de la profondeur lors du déplacement des ITP.
% La densité est calculée à partir d'une fonction d'état se trouvant dans
% le dossier "seawater_ver3_3.1".

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Choisir l'instrument  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

inditp=109;                   

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Choisir les limites de la profondeur %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Profondeur_min=-100
Profondeur_max=0

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


fname_1 = '/home/rinaldi/Documents/Plot/Plot_Densite'
filename_1=(['Density_ITP_' num2str(inditp)  '.png'])

fname_2 = '/home/rinaldi/Documents/Plot/Plot_Salinity'
filename_2=(['Salinity_ITP_' num2str(inditp)  '.png'])


fname_3 = '/home/rinaldi/Documents/Plot/Plot_Temperature'
filename_3=(['Temperature_ITP_' num2str(inditp)  '.png'])


          for indL=2:3 
              
              ind_RT_DM=['RT'];
              ind_grid_final=['final'];
              
                 if  exist(['/net/krypton/data0/project/drakkar/REFERENCE_DATA/ITP/itp_isas17/ITP_' num2str(inditp) '_L' num2str(indL) '_' num2str(ind_RT_DM)  '_' num2str(ind_grid_final) '.nc']);
                     file=['/net/krypton/data0/project/drakkar/REFERENCE_DATA/ITP/itp_isas17/ITP_' num2str(inditp) '_L' num2str(indL) '_' num2str(ind_RT_DM) '_' num2str(ind_grid_final) '.nc'];
                     
                     s=ncread(file,'PSAL');
                     eval(['Salinity_' num2str(inditp) ' = s']);
                     t= ncread(file,'TEMP');
                     eval(['Temperature_' num2str(inditp) ' = t']);
                     p= ncread(file,'PRES');
                     eval(['Pression_' num2str(inditp) ' = p']);
                     j=ncread(file,'JULD');
                     eval(['JULD_' num2str(inditp) ' = j']);
                     date = datevec(datestr(j(:) + datenum('01-01-1950','dd-mm-yyyy')))
                     A = repmat(datenum(date)',size(t,1),1)
                     d= sw_dens(s,t,p)
                     eval(['Density_' num2str(inditp) ' = d']);
                     
                     
                 else                   
                     ind_RT_DM=['RT'];
                     ind_grid_final=['grid'];
            
                         if  exist(['/net/krypton/data0/project/drakkar/REFERENCE_DATA/ITP/itp_isas17/ITP_' num2str(inditp) '_L' num2str(indL) '_' num2str(ind_RT_DM)  '_' num2str(ind_grid_final) '.nc']);
                             file=['/net/krypton/data0/project/drakkar/REFERENCE_DATA/ITP/itp_isas17/ITP_' num2str(inditp) '_L' num2str(indL) '_' num2str(ind_RT_DM) '_' num2str(ind_grid_final) '.nc'];
                             
                             s=ncread(file,'PSAL');
                             eval(['Salinity_' num2str(inditp) ' = s']);
                             t= ncread(file,'TEMP');
                             eval(['Temperature_' num2str(inditp) ' = t']);
                             p= ncread(file,'PRES');
                             eval(['Pression_' num2str(inditp) ' = p']);
                             j=ncread(file,'JULD');
                             eval(['JULD_' num2str(inditp) ' = j']);
                             date = datevec(datestr(j(:) + datenum('01-01-1950','dd-mm-yyyy')))
                             A = repmat(datenum(date)',size(t,1),1)
                             d= sw_dens(s,t,p)
                             eval(['Density_' num2str(inditp) ' = d']);               
                             
                         
                         else
                             ind_RT_DM=['DM'];
                             ind_grid_final=['final'];
                             
                                if  exist(['/net/krypton/data0/project/drakkar/REFERENCE_DATA/ITP/itp_isas17/ITP_' num2str(inditp) '_L' num2str(indL) '_' num2str(ind_RT_DM)  '_' num2str(ind_grid_final) '.nc']);
                                    file=['/net/krypton/data0/project/drakkar/REFERENCE_DATA/ITP/itp_isas17/ITP_' num2str(inditp) '_L' num2str(indL) '_' num2str(ind_RT_DM) '_' num2str(ind_grid_final) '.nc'];
                                    
                                    s=ncread(file,'PSAL');
                                    eval(['Salinity_' num2str(inditp) ' = s']);
                                    t= ncread(file,'TEMP');
                                    eval(['Temperature_' num2str(inditp) ' = t']);
                                    p= ncread(file,'PRES');
                                    eval(['Pression_' num2str(inditp) ' = p']);
                                    j=ncread(file,'JULD');
                                    eval(['JULD_' num2str(inditp) ' = j']);
                                    date = datevec(datestr(j(:) + datenum('01-01-1950','dd-mm-yyyy')))
                                    A = repmat(datenum(date)',size(t,1),1)
                                    d= sw_dens(s,t,p)
                                    eval(['Density_' num2str(inditp) ' = d']);
                                    
                             
                                else 
                                    ind_RT_DM=['DM'];
                                    ind_grid_final=['grid'];
                                     
                                       if  exist(['/net/krypton/data0/project/drakkar/REFERENCE_DATA/ITP/itp_isas17/ITP_' num2str(inditp) '_L' num2str(indL) '_' num2str(ind_RT_DM)  '_' num2str(ind_grid_final) '.nc']);
                                           file=['/net/krypton/data0/project/drakkar/REFERENCE_DATA/ITP/itp_isas17/ITP_' num2str(inditp) '_L' num2str(indL) '_' num2str(ind_RT_DM) '_' num2str(ind_grid_final) '.nc'];
                                           
                                           s=ncread(file,'PSAL');
                                           eval(['Salinity_' num2str(inditp) ' = s']);
                                           t= ncread(file,'TEMP');
                                           eval(['Temperature_' num2str(inditp) ' = t']);
                                           p= ncread(file,'PRES');
                                           eval(['Pression_' num2str(inditp) ' = p']);
                                           j=ncread(file,'JULD');
                                           eval(['JULD_' num2str(inditp) ' = j']);
                                           date = datevec(datestr(j(:) + datenum('01-01-1950','dd-mm-yyyy')))
                                           A = repmat(datenum(date)',size(t,1),1)
                                           d= sw_dens(s,t,p)
                                           eval(['Density_' num2str(inditp) ' = d']);
                             
                                         
                                end
                                
                         end
                      
                 end
                 
           end
                 
 end
    
 p=Pression_109;
 d=Density_109;
 s=Salinity_109;
hold on       

          figure(1)
          clf
          pcolor(A,-p,d),shading flat;
          ylim([Profondeur_min Profondeur_max]) % Fixe les limites de l'axe y entre 0 et 100 mètres
          colormap(jet)
          cb=colorbar();
          tl=title(cb,'kg/m^3');
          title(['Evolution de la densité en fonction de la profondeur lors du déplacement de l instrument ' num2str(inditp)]) ;
          xlabel('Date');
          ylabel('Densité (kg/m³)');
          datetick('x','dd/mm/yyyy','keeplimits')
          saveas(gca, fullfile(fname_1, filename_1),'png')
      
           
          figure(2)
          clf
          pcolor(A,-p,s),shading flat;
          ylim([Profondeur_min Profondeur_max]) % Fixe les limites de l'axe y entre 0 et 100 mètres
          cb=colorbar; % Inclu une barre de couleur au graphique
          tl=title(cb,'psu')
          title(['Evolution de la salinité en fonction de la profondeur lors du déplacement de l instrument ' num2str(inditp)]) ;
          xlabel('Date') % Axe des abcisses 
          ylabel('Salinité (psu)') % Axe des ordonnées 
          datetick('x','dd/mm/yyyy','keeplimits') % Converti le temps en format dd/mm/yy
          saveas(gca, fullfile(fname_2, filename_2),'png') % Sauvegarde la figure
            
           figure(3)
           clf
           pcolor(A,-p,t),shading flat;
           ylim([Profondeur_min Profondeur_max]) % Fixe les limites de l'axe y entre 0 et 100 mètres
           cb=colorbar; % Inclu une barre de couleur au graphique
           tl=title(cb,'°C')
           title(['Evolution de la temperature en fonction de la profondeur lors du déplacement de l instrument ' num2str(inditp)]) ;
           xlabel('Date') % Axe des abcisses 
           ylabel('Température (°C)') % Axe des ordonnées 
           datetick('x','dd/mm/yyyy','keeplimits') % Converti le temps en format dd/mm/yy
           saveas(gca, fullfile(fname_3, filename_3),'png') % Sauvegarde la figure
         
           


     

