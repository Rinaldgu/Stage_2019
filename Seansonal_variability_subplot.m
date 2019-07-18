clear off
addpath('/home/rinaldi/Documents/MATLAB/m_map')
addpath('/home/rinaldi/Documents/Divers')
clf

% Afin d'afficher correctement les cartes: LANCER LA FONCTION
%        "Tight_subplot" ET LA TOOLBOX "m_map"

% Ce programme permet de représenter sur une carte de la région polaire
% Arctique les données de mld ainsi que de salinité et température moyenne
% au sein de la couche de mélange. Ces données sont représenté pour les
% mois de janvier à décembre. 
% Les données sont issus de la matrice "BM"
% avec: BM(9,:)=longitude ; BM(10,:)=latitude ; BM(5,ind)=Mld ;
% BM(6,:)=salinité moyenne ; BM(7,:)=température moyenne.
% La matrice BM a été calculée à partir du programme "algorithme_mld".
% Les cartes de mld, salinité et températures sont respectivement
% enregistrées sous les noms: "MLD_Monthly_evolution",
% "Mean_Salinity_Monthly_evolution", "Mean_Temperature_Monthly_evolution".


                            %% Définition des colorbars %%
Tmin=-1.8 %Température
Tmax=-1

Smin=25 %Salinité
Smax=35

MLDmin=0 %Mixed layer depth
MLDmax=100

                            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%



taille_point=1 % Définition de la taille des points

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%% MLD %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%
ha = tight_subplot(4,3,[.01 .01],[.01 .01],[.1 .1])
hold on
figure(1) 

hold on
ind=find(BM(3,:)==1); %BM(3,:)=Mois avec 1=janvier; 2=février...etc.
m_proj('stereographic','lat',90,'long',-30,'radius',23);
m_elev('contour',[-3500:2000:--500],'edgecolor','k');
m_grid('xtick',5,'tickdir','out','ytick',[70 80],'linest','-');
m_coast('patch',[.7 .7 .7],'edgecolor','r');
hidem('m_grid_xticklabel')
hidem('m_grid_yticklabel')
hidem('m_grid_xlabeldir')
axes(ha(1))
m_scatter(BM(9,ind),BM(10,ind),taille_point, BM(5,ind), 'fill')
title('Jan', 'fontsize',6)
set(get(gca,'title'),'Position',[0.03 0.42 0.01])
colormap(jet(177))
caxis([MLDmin MLDmax])


hold on
ind=find(BM(3,:)==2);
m_proj('stereographic','lat',90,'long',-30,'radius',23);
m_elev('contour',[-3500:2000:--500],'edgecolor','k');
m_grid('xtick',5,'tickdir','out','ytick',[70 80],'linest','-');
m_coast('patch',[.7 .7 .7],'edgecolor','r');
hidem('m_grid_xticklabel')
hidem('m_grid_yticklabel')
axes(ha(2))
m_scatter(BM(9,ind),BM(10,ind), taille_point, BM(5,ind), 'fill')
title('Feb', 'fontsize',6)
set(get(gca,'title'),'Position',[0.03 0.42 0.01])
colormap(jet(177))
caxis([MLDmin MLDmax])

hold on
ind=find(BM(3,:)==3);
m_proj('stereographic','lat',90,'long',-30,'radius',23);
m_elev('contour',[-3500:2000:--500],'edgecolor','k');
m_grid('xtick',5,'tickdir','out','ytick',[70 80],'linest','-');
m_coast('patch',[.7 .7 .7],'edgecolor','r');
hidem('m_grid_xticklabel')
hidem('m_grid_yticklabel')
axes(ha(3))
m_scatter(BM(9,ind),BM(10,ind), taille_point, BM(5,ind), 'fill')
title('Mar', 'fontsize',6)
set(get(gca,'title'),'Position',[0.03 0.42 0.01])
colormap(jet(177))
caxis([MLDmin MLDmax])

hold on
ind=find(BM(3,:)==4);
m_proj('stereographic','lat',90,'long',-30,'radius',23);
m_elev('contour',[-3500:2000:--500],'edgecolor','k');
m_grid('xtick',5,'tickdir','out','ytick',[70 80],'linest','-');
m_coast('patch',[.7 .7 .7],'edgecolor','r');
hidem('m_grid_xticklabel')
hidem('m_grid_yticklabel')
axes(ha(4))
m_scatter(BM(9,ind),BM(10,ind), taille_point, BM(5,ind), 'fill')
title('Apr', 'fontsize',6)
set(get(gca,'title'),'Position',[0.03 0.42 0.01])
colormap(jet(177))
caxis([MLDmin MLDmax])

hold on
ind=find(BM(3,:)==5);
m_proj('stereographic','lat',90,'long',-30,'radius',23);
m_elev('contour',[-3500:2000:--500],'edgecolor','k');
m_grid('xtick',5,'tickdir','out','ytick',[70 80],'linest','-');
m_coast('patch',[.7 .7 .7],'edgecolor','r');
hidem('m_grid_xticklabel')
hidem('m_grid_yticklabel')
axes(ha(5))
m_scatter(BM(9,ind),BM(10,ind),taille_point, BM(5,ind), 'fill')
title('May', 'fontsize',6)
set(get(gca,'title'),'Position',[0.03 0.35 0.01])
colormap(jet(177))
caxis([MLDmin MLDmax])

hold on
ind=find(BM(3,:)==6);
m_proj('stereographic','lat',90,'long',-30,'radius',23);
m_elev('contour',[-3500:2000:--500],'edgecolor','k');
m_grid('xtick',5,'tickdir','out','ytick',[70 80],'linest','-');
m_coast('patch',[.7 .7 .7],'edgecolor','r');
hidem('m_grid_xticklabel')
hidem('m_grid_yticklabel')
axes(ha(6))
m_scatter(BM(9,ind),BM(10,ind), taille_point, BM(5,ind), 'fill')
title('Jun', 'fontsize',6)
set(get(gca,'title'),'Position',[0.03 0.42 0.01])
colormap(jet(177))
caxis([MLDmin MLDmax])

hold on
ind=find(BM(3,:)==7);
m_proj('stereographic','lat',90,'long',-30,'radius',23);
m_elev('contour',[-3500:2000:--500],'edgecolor','k');
m_grid('xtick',5,'tickdir','out','ytick',[70 80],'linest','-');
m_coast('patch',[.7 .7 .7],'edgecolor','r');
hidem('m_grid_xticklabel')
hidem('m_grid_yticklabel')
axes(ha(7))
m_scatter(BM(9,ind),BM(10,ind), taille_point, BM(5,ind), 'fill')
title('Jul', 'fontsize',6)
set(get(gca,'title'),'Position',[0.03 0.42 0.01])
colormap(jet(177))
caxis([MLDmin MLDmax])

hold on
ind=find(BM(3,:)==8);
m_proj('stereographic','lat',90,'long',-30,'radius',23);
m_elev('contour',[-3500:2000:--500],'edgecolor','k');
m_grid('xtick',5,'tickdir','out','ytick',[70 80],'linest','-');
m_coast('patch',[.7 .7 .7],'edgecolor','r');
hidem('m_grid_xticklabel')
hidem('m_grid_yticklabel')
axes(ha(8))
m_scatter(BM(9,ind),BM(10,ind), taille_point, BM(5,ind), 'fill')
title('Aug', 'fontsize',6)
set(get(gca,'title'),'Position',[0.03 0.42 0.01])
colormap(jet(177))
caxis([MLDmin MLDmax])

hold on
ind=find(BM(3,:)==9);
m_proj('stereographic','lat',90,'long',-30,'radius',23);
m_elev('contour',[-3500:2000:--500],'edgecolor','k');
m_grid('xtick',5,'tickdir','out','ytick',[70 80],'linest','-');
m_coast('patch',[.7 .7 .7],'edgecolor','r');
hidem('m_grid_xticklabel')
hidem('m_grid_yticklabel')
axes(ha(9))
m_scatter(BM(9,ind),BM(10,ind), taille_point, BM(5,ind), 'fill')
title('Sep', 'fontsize',6)
set(get(gca,'title'),'Position',[0.03 0.42 0.01])
colormap(jet(177))
caxis([MLDmin MLDmax])

hold on
ind=find(BM(3,:)==10);
m_proj('stereographic','lat',90,'long',-30,'radius',23);
m_elev('contour',[-3500:2000:--500],'edgecolor','k');
m_grid('xtick',5,'tickdir','out','ytick',[70 80],'linest','-');
m_coast('patch',[.7 .7 .7],'edgecolor','r');
hidem('m_grid_xticklabel')
hidem('m_grid_yticklabel')
axes(ha(10))
m_scatter(BM(9,ind),BM(10,ind), taille_point, BM(5,ind), 'fill')
title('Oct', 'fontsize',6)
set(get(gca,'title'),'Position',[0.03 0.42 0.01])
colormap(jet(177))
caxis([MLDmin MLDmax])

hold on
ind=find(BM(3,:)==11);
m_proj('stereographic','lat',90,'long',-30,'radius',23);
m_elev('contour',[-3500:2000:--500],'edgecolor','k');
m_grid('xtick',5,'tickdir','out','ytick',[70 80],'linest','-');
m_coast('patch',[.7 .7 .7],'edgecolor','r');
hidem('m_grid_xticklabel')
hidem('m_grid_yticklabel')
axes(ha(11))
m_scatter(BM(9,ind),BM(10,ind), taille_point, BM(5,ind), 'fill')
title('Nov', 'fontsize',6)
set(get(gca,'title'),'Position',[0.03 0.42 0.01])
colormap(jet(177))
caxis([MLDmin MLDmax])

hold on
ind=find(BM(3,:)==12);
m_proj('stereographic','lat',90,'long',-30,'radius',23);
m_elev('contour',[-3500:2000:--500],'edgecolor','k');
m_grid('xtick',5,'tickdir','out','ytick',[70 80],'linest','-');
m_coast('patch',[.7 .7 .7],'edgecolor','r');
hidem('m_grid_xticklabel')
hidem('m_grid_yticklabel')
axes(ha(12))
m_scatter(BM(9,ind),BM(10,ind), taille_point, BM(5,ind), 'fill')
title('Dec', 'fontsize',6)
set(get(gca,'title'),'Position',[0.03 0.42 0.01])
colormap(jet(177))
caxis([MLDmin MLDmax])



colormap(jet(177))
cb=colorbar()
caxis([MLDmin MLDmax])
t=title(cb,'m')
set(cb,'Position',[0.91 0.2 0.038 0.5])

%fname1 = '/home/rinaldi/Documents/Seasonal_variability'
%filename1=(['MLD_Monthly_evolution.png'])
print('MLD_Monthly_evolution', '-dpng', '-r300')

%saveas(gca, fullfile(fname1, filename1),'png');


%% %%%%%%%%%%%%%%%%%%%%%%%%%%% Mean Salinity %%%%%%%%%%%%%%%%%%%%%%%%% %%
figure(2) 
clf
ha = tight_subplot(4,3,[.01 .01],[.01 .01],[.1 .1])


hold on
ind=find(BM(3,:)==1);
m_proj('stereographic','lat',90,'long',-30,'radius',23);
m_elev('contour',[-3500:2000:--500],'edgecolor','k');
m_grid('xtick',5,'tickdir','out','ytick',[70 80],'linest','-');
m_coast('patch',[.7 .7 .7],'edgecolor','r');
hidem('m_grid_xticklabel')
hidem('m_grid_yticklabel')
axes(ha(1))
m_scatter(BM(9,ind),BM(10,ind), taille_point, BM(6,ind), 'fill')
title('Jan', 'fontsize',6)
set(get(gca,'title'),'Position',[0.03 0.42 0.01])
colormap(jet(177))
caxis([Smin Smax])


hold on
ind=find(BM(3,:)==2);
m_proj('stereographic','lat',90,'long',-30,'radius',23);
m_elev('contour',[-3500:2000:--500],'edgecolor','k');
m_grid('xtick',5,'tickdir','out','ytick',[70 80],'linest','-');
m_coast('patch',[.7 .7 .7],'edgecolor','r');
hidem('m_grid_xticklabel')
hidem('m_grid_yticklabel')
axes(ha(2))
m_scatter(BM(9,ind),BM(10,ind), taille_point, BM(6,ind), 'fill')
title('Feb', 'fontsize',6)
set(get(gca,'title'),'Position',[0.03 0.42 0.01])
colormap(jet(177))
caxis([Smin Smax])

hold on
ind=find(BM(3,:)==3);
m_proj('stereographic','lat',90,'long',-30,'radius',23);
m_elev('contour',[-3500:2000:--500],'edgecolor','k');
m_grid('xtick',5,'tickdir','out','ytick',[70 80],'linest','-');
m_coast('patch',[.7 .7 .7],'edgecolor','r');
hidem('m_grid_xticklabel')
hidem('m_grid_yticklabel')
axes(ha(3))
m_scatter(BM(9,ind),BM(10,ind),taille_point, BM(6,ind), 'fill')
title('Mar', 'fontsize',6)
set(get(gca,'title'),'Position',[0.03 0.42 0.01])
colormap(jet(177))
caxis([Smin Smax])

hold on
ind=find(BM(3,:)==4);
m_proj('stereographic','lat',90,'long',-30,'radius',23);
m_elev('contour',[-3500:2000:--500],'edgecolor','k');
m_grid('xtick',5,'tickdir','out','ytick',[70 80],'linest','-');
m_coast('patch',[.7 .7 .7],'edgecolor','r');
hidem('m_grid_xticklabel')
hidem('m_grid_yticklabel')
axes(ha(4))
m_scatter(BM(9,ind),BM(10,ind), taille_point, BM(6,ind), 'fill')
title('Apr', 'fontsize',6)
set(get(gca,'title'),'Position',[0.03 0.42 0.01])
colormap(jet(177))
caxis([Smin Smax])

hold on
ind=find(BM(3,:)==5);
m_proj('stereographic','lat',90,'long',-30,'radius',23);
m_elev('contour',[-3500:2000:--500],'edgecolor','k');
m_grid('xtick',5,'tickdir','out','ytick',[70 80],'linest','-');
m_coast('patch',[.7 .7 .7],'edgecolor','r');
hidem('m_grid_xticklabel')
hidem('m_grid_yticklabel')
axes(ha(5))
m_scatter(BM(9,ind),BM(10,ind), taille_point, BM(6,ind), 'fill')
title('May', 'fontsize',6)
set(get(gca,'title'),'Position',[0.03 0.42 0.01])
colormap(jet(177))
caxis([Smin Smax])

hold on
ind=find(BM(3,:)==6);
m_proj('stereographic','lat',90,'long',-30,'radius',23);
m_elev('contour',[-3500:2000:--500],'edgecolor','k');
m_grid('xtick',5,'tickdir','out','ytick',[70 80],'linest','-');
m_coast('patch',[.7 .7 .7],'edgecolor','r');
hidem('m_grid_xticklabel')
hidem('m_grid_yticklabel')
axes(ha(6))
m_scatter(BM(9,ind),BM(10,ind), taille_point, BM(6,ind), 'fill')
title('Jun', 'fontsize',6)
set(get(gca,'title'),'Position',[0.03 0.42 0.01])
colormap(jet(177))
caxis([Smin Smax])

hold on
ind=find(BM(3,:)==7);
m_proj('stereographic','lat',90,'long',-30,'radius',23);
m_elev('contour',[-3500:2000:--500],'edgecolor','k');
m_grid('xtick',5,'tickdir','out','ytick',[70 80],'linest','-');
m_coast('patch',[.7 .7 .7],'edgecolor','r');
hidem('m_grid_xticklabel')
hidem('m_grid_yticklabel')
axes(ha(7))
m_scatter(BM(9,ind),BM(10,ind), taille_point, BM(6,ind), 'fill')
title('Jul', 'fontsize',6)
set(get(gca,'title'),'Position',[0.03 0.42 0.01])
colormap(jet(177))
caxis([Smin Smax])

hold on
ind=find(BM(3,:)==8);
m_proj('stereographic','lat',90,'long',-30,'radius',23);
m_elev('contour',[-3500:2000:--500],'edgecolor','k');
m_grid('xtick',5,'tickdir','out','ytick',[70 80],'linest','-');
m_coast('patch',[.7 .7 .7],'edgecolor','r');
hidem('m_grid_xticklabel')
hidem('m_grid_yticklabel')
axes(ha(8))
m_scatter(BM(9,ind),BM(10,ind), taille_point, BM(6,ind), 'fill')
title('Aug', 'fontsize',6)
set(get(gca,'title'),'Position',[0.03 0.42 0.01])
colormap(jet(177))
caxis([Smin Smax])

hold on
ind=find(BM(3,:)==9);
m_proj('stereographic','lat',90,'long',-30,'radius',23);
m_elev('contour',[-3500:2000:--500],'edgecolor','k');
m_grid('xtick',5,'tickdir','out','ytick',[70 80],'linest','-');
m_coast('patch',[.7 .7 .7],'edgecolor','r');
hidem('m_grid_xticklabel')
hidem('m_grid_yticklabel')
axes(ha(9))
m_scatter(BM(9,ind),BM(10,ind), taille_point, BM(6,ind), 'fill')
title('Sep', 'fontsize',6)
set(get(gca,'title'),'Position',[0.03 0.42 0.01])
colormap(jet(177))
caxis([Smin Smax])

hold on
ind=find(BM(3,:)==10);
m_proj('stereographic','lat',90,'long',-30,'radius',23);
m_elev('contour',[-3500:2000:--500],'edgecolor','k');
m_grid('xtick',5,'tickdir','out','ytick',[70 80],'linest','-');
m_coast('patch',[.7 .7 .7],'edgecolor','r');
hidem('m_grid_xticklabel')
hidem('m_grid_yticklabel')
axes(ha(10))
m_scatter(BM(9,ind),BM(10,ind), taille_point, BM(6,ind), 'fill')
title('Oct', 'fontsize',6)
set(get(gca,'title'),'Position',[0.03 0.42 0.01])
colormap(jet(177))
caxis([Smin Smax])

hold on
ind=find(BM(3,:)==11);
m_proj('stereographic','lat',90,'long',-30,'radius',23);
m_elev('contour',[-3500:2000:--500],'edgecolor','k');
m_grid('xtick',5,'tickdir','out','ytick',[70 80],'linest','-');
m_coast('patch',[.7 .7 .7],'edgecolor','r');
hidem('m_grid_xticklabel')
hidem('m_grid_yticklabel')
axes(ha(11))
m_scatter(BM(9,ind),BM(10,ind), taille_point, BM(6,ind), 'fill')
title('Nov', 'fontsize',6)
set(get(gca,'title'),'Position',[0.03 0.42 0.01])
colormap(jet(177))
caxis([Smin Smax])

hold on
ind=find(BM(3,:)==12);
m_proj('stereographic','lat',90,'long',-30,'radius',23);
m_elev('contour',[-3500:2000:--500],'edgecolor','k');
m_grid('xtick',5,'tickdir','out','ytick',[70 80],'linest','-');
m_coast('patch',[.7 .7 .7],'edgecolor','r');
hidem('m_grid_xticklabel')
hidem('m_grid_yticklabel')
axes(ha(12))
m_scatter(BM(9,ind),BM(10,ind), taille_point, BM(6,ind), 'fill')
title('Dec', 'fontsize',6)
set(get(gca,'title'),'Position',[0.03 0.42 0.01])
colormap(jet(177))
caxis([Smin Smax])



colormap(jet(177))
cb=colorbar()
caxis([Smin Smax])
t=title(cb,'psu')
set(cb,'Position',[0.91 0.2 0.030 0.5])

%fname2 = '/home/rinaldi/Documents/Seasonal_variability'
%filename2=(['Mean_Salinity_Monthly_evolution.png'])
print('Mean_Salinity_Monthly_evolution', '-dpng', '-r300')
%saveas(gca, fullfile(fname2, filename2),'png');


%% %%%%%%%%%%%%%%%%%%%%%%%%% Mean Temperature %%%%%%%%%%%%%%%%%%%%%%%%%%% %%
figure(3) 
clf
ha = tight_subplot(4,3,[.01 .01],[.01 .01],[.1 .1])


hold on
ind=find(BM(3,:)==1);
m_proj('stereographic','lat',90,'long',-30,'radius',23);
m_elev('contour',[-3500:2000:--500],'edgecolor','k');
m_grid('xtick',5,'tickdir','out','ytick',[70 80],'linest','-');
m_coast('patch',[.7 .7 .7],'edgecolor','r');
hidem('m_grid_xticklabel')
hidem('m_grid_yticklabel')
hidem('m_grid_xtick')
axes(ha(1))
m_scatter(BM(9,ind),BM(10,ind), taille_point, BM(7,ind), 'fill')
title('Jan', 'fontsize',6)
set(get(gca,'title'),'Position',[0.03 0.42 0.01])
colormap(jet(177))
caxis([Tmin Tmax])


hold on
ind=find(BM(3,:)==2);
m_proj('stereographic','lat',90,'long',-30,'radius',23);
m_elev('contour',[-3500:2000:--500],'edgecolor','k');
m_grid('xtick',5,'tickdir','out','ytick',[70 80],'linest','-');
m_coast('patch',[.7 .7 .7],'edgecolor','r');
hidem('m_grid_xticklabel')
hidem('m_grid_yticklabel')
axes(ha(2))
m_scatter(BM(9,ind),BM(10,ind), taille_point, BM(7,ind), 'fill')
title('Feb', 'fontsize',6)
set(get(gca,'title'),'Position',[0.03 0.42 0.01])
colormap(jet(177))
caxis([Tmin Tmax])

hold on
ind=find(BM(3,:)==3);
m_proj('stereographic','lat',90,'long',-30,'radius',23);
m_elev('contour',[-3500:2000:--500],'edgecolor','k');
m_grid('xtick',5,'tickdir','out','ytick',[70 80],'linest','-');
m_coast('patch',[.7 .7 .7],'edgecolor','r');
hidem('m_grid_xticklabel')
hidem('m_grid_yticklabel')
axes(ha(3))
m_scatter(BM(9,ind),BM(10,ind), taille_point, BM(7,ind), 'fill')
title('Mar', 'fontsize',6)
set(get(gca,'title'),'Position',[0.03 0.42 0.01])
colormap(jet(177))
caxis([Tmin Tmax])

hold on
ind=find(BM(3,:)==4);
m_proj('stereographic','lat',90,'long',-30,'radius',23);
m_elev('contour',[-3500:2000:--500],'edgecolor','k');
m_grid('xtick',5,'tickdir','out','ytick',[70 80],'linest','-');
m_coast('patch',[.7 .7 .7],'edgecolor','r');
hidem('m_grid_xticklabel')
hidem('m_grid_yticklabel')
axes(ha(4))
m_scatter(BM(9,ind),BM(10,ind), taille_point, BM(7,ind), 'fill')
title('Apr', 'fontsize',6)
set(get(gca,'title'),'Position',[0.03 0.42 0.01])
colormap(jet(177))
caxis([Tmin Tmax])

hold on
ind=find(BM(3,:)==5);
m_proj('stereographic','lat',90,'long',-30,'radius',23);
m_elev('contour',[-3500:2000:--500],'edgecolor','k');
m_grid('xtick',5,'tickdir','out','ytick',[70 80],'linest','-');
m_coast('patch',[.7 .7 .7],'edgecolor','r');
hidem('m_grid_xticklabel')
hidem('m_grid_yticklabel')
axes(ha(5))
m_scatter(BM(9,ind),BM(10,ind), taille_point, BM(7,ind), 'fill')
title('May', 'fontsize',6)
set(get(gca,'title'),'Position',[0.03 0.42 0.01])
colormap(jet(177))
caxis([Tmin Tmax])

hold on
ind=find(BM(3,:)==6);
m_proj('stereographic','lat',90,'long',-30,'radius',23);
m_elev('contour',[-3500:2000:--500],'edgecolor','k');
m_grid('xtick',5,'tickdir','out','ytick',[70 80],'linest','-');
m_coast('patch',[.7 .7 .7],'edgecolor','r');
hidem('m_grid_xticklabel')
hidem('m_grid_yticklabel')
axes(ha(6))
m_scatter(BM(9,ind),BM(10,ind), taille_point, BM(7,ind), 'fill')
title('Jun', 'fontsize',6)
set(get(gca,'title'),'Position',[0.03 0.42 0.01])
colormap(jet(177))
caxis([Tmin Tmax])

hold on
ind=find(BM(3,:)==7);
m_proj('stereographic','lat',90,'long',-30,'radius',23);
m_elev('contour',[-3500:2000:--500],'edgecolor','k');
m_grid('xtick',5,'tickdir','out','ytick',[70 80],'linest','-');
m_coast('patch',[.7 .7 .7],'edgecolor','r');
hidem('m_grid_xticklabel')
hidem('m_grid_yticklabel')
axes(ha(7))
m_scatter(BM(9,ind),BM(10,ind), taille_point, BM(7,ind), 'fill')
title('Jul', 'fontsize',6)
set(get(gca,'title'),'Position',[0.03 0.42 0.01])
colormap(jet(177))
caxis([Tmin Tmax])

hold on
ind=find(BM(3,:)==8);
m_proj('stereographic','lat',90,'long',-30,'radius',23);
m_elev('contour',[-3500:2000:--500],'edgecolor','k');
m_grid('xtick',5,'tickdir','out','ytick',[70 80],'linest','-');
m_coast('patch',[.7 .7 .7],'edgecolor','r');
hidem('m_grid_xticklabel')
hidem('m_grid_yticklabel')
axes(ha(8))
m_scatter(BM(9,ind),BM(10,ind),taille_point, BM(7,ind), 'fill')
title('Aug', 'fontsize',6)
set(get(gca,'title'),'Position',[0.03 0.42 0.01])
colormap(jet(177))
caxis([Tmin Tmax])

hold on
ind=find(BM(3,:)==9);
m_proj('stereographic','lat',90,'long',-30,'radius',23);
m_elev('contour',[-3500:2000:--500],'edgecolor','k');
m_grid('xtick',5,'tickdir','out','ytick',[70 80],'linest','-');
m_coast('patch',[.7 .7 .7],'edgecolor','r');
hidem('m_grid_xticklabel')
hidem('m_grid_yticklabel')
axes(ha(9))
m_scatter(BM(9,ind),BM(10,ind),taille_point, BM(7,ind), 'fill')
title('Sep', 'fontsize',6)
set(get(gca,'title'),'Position',[0.03 0.42 0.01])
colormap(jet(177))
caxis([Tmin Tmax])

hold on
ind=find(BM(3,:)==10);
m_proj('stereographic','lat',90,'long',-30,'radius',23);
m_elev('contour',[-3500:2000:--500],'edgecolor','k');
m_grid('xtick',5,'tickdir','out','ytick',[70 80],'linest','-');
m_coast('patch',[.7 .7 .7],'edgecolor','r');
hidem('m_grid_xticklabel')
hidem('m_grid_yticklabel')
axes(ha(10))
m_scatter(BM(9,ind),BM(10,ind), taille_point, BM(7,ind), 'fill')
title('Oct', 'fontsize',6)
set(get(gca,'title'),'Position',[0.03 0.42 0.01])
colormap(jet(177))
caxis([Tmin Tmax])

hold on
ind=find(BM(3,:)==11);
m_proj('stereographic','lat',90,'long',-30,'radius',23);
m_elev('contour',[-3500:2000:--500],'edgecolor','k');
m_grid('xtick',5,'tickdir','out','ytick',[70 80],'linest','-');
m_coast('patch',[.7 .7 .7],'edgecolor','r');
hidem('m_grid_xticklabel')
hidem('m_grid_yticklabel')
axes(ha(11))
m_scatter(BM(9,ind),BM(10,ind), taille_point, BM(7,ind), 'fill')
title('Nov', 'fontsize',6)
set(get(gca,'title'),'Position',[0.03 0.42 0.01])
colormap(jet(177))
caxis([Tmin Tmax])

hold on
ind=find(BM(3,:)==12);
m_proj('stereographic','lat',90,'long',-30,'radius',23);
m_elev('contour',[-3500:2000:--500],'edgecolor','k');
m_grid('xtick',5,'tickdir','out','ytick',[70 80],'linest','-');
m_coast('patch',[.7 .7 .7],'edgecolor','r');
hidem('m_grid_xticklabel')
hidem('m_grid_yticklabel')
axes(ha(12))
m_scatter(BM(9,ind),BM(10,ind), taille_point, BM(7,ind), 'fill')
title('Dec', 'fontsize',6)
set(get(gca,'title'),'Position',[0.03 0.42 0.01])
colormap(jet(177))
caxis([Tmin Tmax])



colormap(jet(177))
cb=colorbar()
caxis([Tmin Tmax])
t=title(cb,'°C')
set(cb,'Position',[0.91 0.2 0.038 0.5])

%fname3 = '/home/rinaldi/Documents/Seasonal_variability'
%filename3=(['Mean_Temperature_Monthly_evolution.png'])
print('Mean_Temperature_Monthly_evolution', '-dpng', '-r300')
%saveas(gca, fullfile(fname3, filename3),'png');




