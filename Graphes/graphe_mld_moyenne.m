clear on

% Ce programme trace les graphiques représentant les moyennes de mld
% mensuelle et les moyennes d'extention de glace mensuelle.
% Les programmes suivant doivent être lancés afin de calculer les moyennes
% moyenne_mld_eurasie
% moyenne_mld_canada
% sic_moyenne_mensuelle
% sic_moyenne_canada
% Ces programmes se trouvent dans le dossier "Calcul des moyennes"


eurasie=[janvier_eurasie fevrier_eurasie mars_eurasie avril_eurasie mai_eurasie juin_eurasie juillet_eurasie aout_eurasie septembre_eurasie octobre_eurasie novembre_eurasie decembre_eurasie]
canada=[janvier_canada fevrier_canada mars_canada avril_canada mai_canada juin_canada juillet_canada aout_canada septembre_canada octobre_canada novembre_canada decembre_canada];
eurasie_sci=[sic_eurasie_janvier sic_eurasie_fevrier sic_eurasie_mars sic_eurasie_avril sic_eurasie_mai sic_eurasie_juin sic_eurasie_juillet sic_eurasie_aout sic_eurasie_septembre sic_eurasie_octobre sic_eurasie_novembre sic_eurasie_decembre];
canada_sci=[sic_canada_janvier sic_canada_fevrier sic_canada_mars sic_canada_avril sic_canada_mai sic_canada_juin sic_canada_juillet sic_canada_aout sic_canada_septembre sic_canada_octobre sic_canada_novembre sic_canada_decembre];
eurasie_sci=eurasie_sci*(areaquad(82,0,90,140,earthellipsoid)+areaquad(78,110,82,140,earthellipsoid)+areaquad(82,310,90,360,earthellipsoid)+areaquad(83.5,310,90,360,earthellipsoid)+areaquad(78,141,90,180,earthellipsoid)); %Concentration de glace de mer * Superfice du bassin
canada_sci=canada_sci*areaquad(70,180,83.5,240,earthellipsoid);
eurasie_sci=eurasie_sci/100; %conversion en km²
canada_sci=canada_sci/100; 
%%%%%%%%%%%%%%%%%%%%%%% Eurasie %%%%%%%%%%%%%%%%%%%%%%%%

x=linspace(1,12,12)

i1=find(x1>0); %Valeurs en abcisse définies
i2=find(x2>0);
i3=find(x3>0);
i4=find(x4>0);
i5=find(x5>0);
i6=find(x6>0);
i7=find(x7>0);
i8=find(x8>0);
i9=find(x9>0);
i10=find(x10>0);
i11=find(x11>0);
i12=find(x12>0);

x13=x1(i1);
x14=x2(i2);
x15=x3(i3);
x16=x4(i4);
x17=x5(i5);
x18=x6(i6);
x19=x7(i7);
x20=x8(i8);
x21=x9(i9);
x22=x10(i10);
x23=x11(i11);
x24=x12(i12);

j1=find(e1>0); %valeurs de mld définies
j2=find(e2>0);
j3=find(e3>0);
j4=find(e4>0);
j5=find(e5>0);
j6=find(e6>0);
j7=find(e7>0);
j8=find(e8>0);
j9=find(e9>0);
j10=find(e10>0);
j11=find(e11>0);
j12=find(e12>0);

y13=e1(j1);
y14=e2(j2);
y15=e3(j3);
y16=e4(j4);
y17=e5(j5);
y18=e6(j6);
y19=e7(j7);
y20=e8(j8);
y21=e9(j9);
y22=e10(j10);
y23=e11(j11);
y24=e12(j12);

err1=std(y13); %ecart-type des series de valeurs mensuelles de mld
err2=std(y14);
err3=std(y15);
err4=std(y16);
err5=std(y17);
err6=std(y18);
err7=std(y19);
err8=std(y20);
err9=std(y21);
err10=std(y22);
err11=std(y23);
err12=std(y24);


error_bar=[err1 err2 err3 err4 err5 err6 err7 err8 err9 err10 err11 err12]

%%%%%%%%%%%%%%%%%%%%%%% Canada %%%%%%%%%%%%%%%%%%%%%%%%

i1=find(x1c>0);
i2=find(x2c>0);
i3=find(x3c>0);
i4=find(x4c>0);
i5=find(x5c>0);
i6=find(x6c>0);
i7=find(x7c>0);
i8=find(x8c>0);
i9=find(x9c>0);
i10=find(x10c>0);
i11=find(x11c>0);
i12=find(x12c>0);

x13c=x1c(i1);
x14c=x2c(i2);
x15c=x3c(i3);
x16c=x4c(i4);
x17c=x5c(i5);
x18c=x6c(i6);
x19c=x7c(i7);
x20c=x8c(i8);
x21c=x9c(i9);
x22c=x10c(i10);
x23c=x11c(i11);
x24c=x12c(i12);

j1=find(e1c>0);
j2=find(e2c>0);
j3=find(e3c>0);
j4=find(e4c>0);
j5=find(e5c>0);
j6=find(e6c>0);
j7=find(e7c>0);
j8=find(e8c>0);
j9=find(e9c>0);
j10=find(e10c>0);
j11=find(e11c>0);
j12=find(e12c>0);

y13c=e1c(j1);
y14c=e2c(j2);
y15c=e3c(j3);
y16c=e4c(j4);
y17c=e5c(j5);
y18c=e6c(j6);
y19c=e7c(j7);
y20c=e8c(j8);
y21c=e9c(j9);
y22c=e10c(j10);
y23c=e11c(j11);
y24c=e12c(j12);

err1=std(y13c);
err2=std(y14c);
err3=std(y15c);
err4=std(y16c);
err5=std(y17c);
err6=std(y18c);
err7=std(y19c);
err8=std(y20c);
err9=std(y21c);
err10=std(y22c);
err11=std(y23c);
err12=std(y24c);


error_bar_c=[err1 err2 err3 err4 err5 err6 err7 err8 err9 err10 err11 err12],


%%%%%%%%%%%%%%%%%%%%%% Plot %%%%%%%%%%%%%%%%%%%%%%%%%%%
clf

%ha = tight_subplot(1,2,[.05 .05],[.1 .1],[.1 .1])
subplot(1,2,1)
hold on
figure(1) 

hold on
%axes(ha(1))


plot(x13,y13,'k*',x14,y14,'k*',x15,y15,'k*',x16,y16,'k*',x17,y17,'k*',x18,y18,'k*',x19,y19,'k*',x20,y20,'k*',x21,y21,'k*',x22,y22,'k*',x23,y23,'k*',x24,y24,'k*')

xlabel('Months') 
ylabel('mld (m)')

set(gca,'xtick',1:12, 'xticklabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'})
set(gca,'yDir','reverse')
ylim([0 100])
title('Bassin Eurasien')


hold on
errorbar(eurasie,error_bar,'linewidth',2,'Color','b')

hold on
h1=plot(x,eurasie,'linewidth',2,'Color','r')

hold on
yyaxis right
h2=plot(x,eurasie_sci,'linewidth',2,'Color','c')
ylim([0 2.5e6])
legend([h1,h2],'Mld','Ice concentration','Location','southeast')


hold on
subplot(1,2,2)

%axes(ha(2))

plot(x13c,y13c,'k*',x14c,y14c,'k*',x15c,y15c,'k*',x16c,y16c,'k*',x17c,y17c,'k*',x18c,y18c,'k*',x19c,y19c,'k*',x20c,y20c,'k*',x21c,y21c,'k*',x22c,y22c,'k*',x23c,y23c,'k*',x24c,y24c,'k*')
xlabel('Months') 


set(gca,'xtick',1:12, 'xticklabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'})
set(gca,'yDir','reverse')
set(gca,'yTick',[0 10 20 30 40 50 60 70 80 90 100])
ax.YTickLabel = [0 10 20 30 40 50 60 70 80 90 100]
ylim([0 100])
title('Bassin Canadien')

hold on
errorbar(canada,error_bar_c,'linewidth',2,'Color','b')

hold on
h1=plot(x,canada,'linewidth',2,'Color','r')
hold on

yyaxis right
ylabel('Sea ice concentration (km²)')
h2=plot(x,canada_sci,'linewidth',2,'Color','c')
ylim([0 2.5e6])
legend([h1,h2],'Mld','Ice concentration','Location','southeast')


print('variabilite_spatiale_temperature_sci', '-dpng', '-r300')
