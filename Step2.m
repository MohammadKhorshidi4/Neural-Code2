%%
clc
clear
load('UnitsData.mat');
cnd1=Unit(1).Cnd(1).TrialIdx;
cnd2=Unit(1).Cnd(2).TrialIdx;
cnd3=Unit(1).Cnd(3).TrialIdx;
cnd4=Unit(1).Cnd(4).TrialIdx;
cnd5=Unit(1).Cnd(5).TrialIdx;
cnd6=Unit(1).Cnd(6).TrialIdx;
t1=-1.2:0.01:1.99;

for i=1:481

    psth1=zeros(length(cnd1),32000);
    for j=1:length(cnd1)
       n1=Unit(i).Trls{cnd1(j),1};
       n1=round(n1*10000)+12001;
       n2=n1(n1<32001);
       psth1(j,n1)=1;
    end
    psth11=sum(psth1)'/32;
    for j=1:320
        aw=sum(psth11((j-1)*100+1:j*100))*32;
        cn1(j)=aw/length(cnd1);
    end
    for j=1:32
        cn11=cn1((j-1)*10+1:j*10);
        cu=-1*ones(10,1);
        rw=3*ones(10,1);
        [b,dev,stats]=glmfit([cu rw],cn11,'normal');
        pvcu1(i,j)=stats.p(2);
        pcrw1(i,j)=stats.p(3);
    end
end



for i=1:481

    psth1=zeros(length(cnd2),32000);
    for j=1:length(cnd2)
       n1=Unit(i).Trls{cnd2(j),1};
       n1=round(n1*10000)+12001;
       n2=n1(n1<32001);
       psth1(j,n1)=1;
    end
    psth11=sum(psth1)'/32;
    for j=1:320
        aw=sum(psth11((j-1)*100+1:j*100))*32;
        cn1(j)=aw/length(cnd2);
    end
    for j=1:32
        cn11=cn1((j-1)*10+1:j*10);
        cu=1*ones(10,1);
        rw=3*ones(10,1);
        [b,dev,stats]=glmfit([cu rw],cn11,'normal');
        pvcu2(i,j)=stats.p(2);
        pcrw2(i,j)=stats.p(3);
    end
end




for i=1:481

    psth1=zeros(length(cnd3),32000);
    for j=1:length(cnd3)
       n1=Unit(i).Trls{cnd3(j),1};
       n1=round(n1*10000)+12001;
       n2=n1(n1<32001);
       psth1(j,n1)=1;
    end
    psth11=sum(psth1)'/32;
    for j=1:320
        aw=sum(psth11((j-1)*100+1:j*100))*32;
        cn1(j)=aw/length(cnd3);
    end
    for j=1:32
        cn11=cn1((j-1)*10+1:j*10);
        cu=-1*ones(10,1);
        rw=6*ones(10,1);
        [b,dev,stats]=glmfit([cu rw],cn11,'normal');
        pvcu3(i,j)=stats.p(2);
        pcrw3(i,j)=stats.p(3);
    end
end




for i=1:481

    psth1=zeros(length(cnd4),32000);
    for j=1:length(cnd4)
       n1=Unit(i).Trls{cnd4(j),1};
       n1=round(n1*10000)+12001;
       n2=n1(n1<32001);
       psth1(j,n1)=1;
    end
    psth11=sum(psth1)'/32;
    for j=1:320
        aw=sum(psth11((j-1)*100+1:j*100))*32;
        cn1(j)=aw/length(cnd4);
    end
    for j=1:32
        cn11=cn1((j-1)*10+1:j*10);
        cu=-1*ones(10,1);
        rw=6*ones(10,1);
        [b,dev,stats]=glmfit([cu rw],cn11,'normal');
        pvcu4(i,j)=stats.p(2);
        pcrw4(i,j)=stats.p(3);
    end
end



for i=1:481

    psth1=zeros(length(cnd5),32000);
    for j=1:length(cnd5)
       n1=Unit(i).Trls{cnd5(j),1};
       n1=round(n1*10000)+12001;
       n2=n1(n1<32001);
       psth1(j,n1)=1;
    end
    psth11=sum(psth1)'/32;
    for j=1:320
        aw=sum(psth11((j-1)*100+1:j*100))*32;
        cn1(j)=aw/length(cnd5);
    end
    for j=1:32
        cn11=cn1((j-1)*10+1:j*10);
        cu=-1*ones(10,1);
        rw=9*ones(10,1);
        [b,dev,stats]=glmfit([cu rw],cn11,'normal');
        pvcu5(i,j)=stats.p(2);
        pcrw5(i,j)=stats.p(3);
    end
end




for i=1:481

    psth1=zeros(length(cnd6),32000);
    for j=1:length(cnd6)
       n1=Unit(i).Trls{cnd6(j),1};
       n1=round(n1*10000)+12001;
       n2=n1(n1<32001);
       psth1(j,n1)=1;
    end
    psth11=sum(psth1)'/32;
    for j=1:320
        aw=sum(psth11((j-1)*100+1:j*100))*32;
        cn1(j)=aw/length(cnd6);
    end
    for j=1:32
        cn11=cn1((j-1)*10+1:j*10);
        cu=1*ones(10,1);
        rw=9*ones(10,1);
        [b,dev,stats]=glmfit([cu rw],cn11,'normal');
        pvcu6(i,j)=stats.p(2);
        pcrw6(i,j)=stats.p(3);
    end
end


pcrw11=reshape(pcrw1,1,[]);
pcrw22=reshape(pcrw2,1,[]);
pcrw33=reshape(pcrw3,1,[]);
pcrw44=reshape(pcrw4,1,[]);
pcrw55=reshape(pcrw5,1,[]);
pcrw66=reshape(pcrw6,1,[]);
pcrw=[pcrw11,pcrw22,pcrw33,pcrw44,pcrw55,pcrw66];
pcrww=[pcrw1;pcrw2;pcrw3;pcrw4;pcrw5;pcrw6];

[x,k]=find(pcrww<0.05);
t2=linspace(-1.2,2,32);
figure('WindowState','maximized')
histogram(k,'Normalization','probability')
xticks(0:4:32)
xticklabels({'-1.2','-0.8','-0.4','0','0.4','0.8','1.2','1.6','2'})
xlabel('Time bins(s)','Interpreter','latex')
ylabel('Probability','Interpreter','latex')
title('Histogram of time bins with P-value under 0.05 for Reward','Interpreter','latex')
saveas(gcf,'Fig6.png')


figure('WindowState','maximized')
histogram(pcrww,'Normalization','probability')

xlabel('P-value','Interpreter','latex')
ylabel('Probability','Interpreter','latex')
title('Histogram of P-values for Reward','Interpreter','latex')
saveas(gcf,'Fig7.png')


pvcu11=reshape(pvcu1,1,[]);
pvcu22=reshape(pvcu2,1,[]);
pvcu33=reshape(pvcu3,1,[]);
pvcu44=reshape(pvcu4,1,[]);
pvcu55=reshape(pvcu5,1,[]);
pvcu66=reshape(pvcu6,1,[]);
pvcu=[pvcu11,pvcu22,pvcu33,pvcu44,pvcu55,pvcu66];
pvcuu=[pvcu1;pvcu2;pvcu3;pvcu4;pvcu5;pvcu6];
figure

figure('WindowState','maximized')
histogram(pvcuu,'Normalization','probability')

xlabel('P-value','Interpreter','latex')
ylabel('Probability','Interpreter','latex')
title('Histogram of P-values for Cue','Interpreter','latex')
saveas(gcf,'Fig8.png')

%%
clc
clear
load('UnitsData.mat');
connew=randperm(192,192);
cnd1=connew(1:31);
cnd2=connew(32:64);
cnd3=connew(65:95);
cnd4=connew(96:128);
cnd5=connew(129:161);
cnd6=connew(162:192);



for i=1:481

    psth1=zeros(length(cnd1),32000);
    for j=1:length(cnd1)
       n1=Unit(i).Trls{cnd1(j),1};
       n1=round(n1*10000)+12001;
       n2=n1(n1<32001);
       psth1(j,n1)=1;
    end
    psth11=sum(psth1)'/32;
    for j=1:320
        aw=sum(psth11((j-1)*100+1:j*100))*32;
        cn1(j)=aw/length(cnd1);
    end
    tre=randperm(320,320);
    cn1=cn1(tre);
    for j=1:32
        cn11=cn1((j-1)*10+1:j*10);
        cu=-1*ones(10,1);
        rw=3*ones(10,1);
        [b,dev,stats]=glmfit([cu rw],cn11,'normal');
        pvcu1(i,j)=stats.p(2);
        pcrw1(i,j)=stats.p(3);
    end
end



for i=1:481

    psth1=zeros(length(cnd2),32000);
    for j=1:length(cnd2)
       n1=Unit(i).Trls{cnd2(j),1};
       n1=round(n1*10000)+12001;
       n2=n1(n1<32001);
       psth1(j,n1)=1;
    end
    psth11=sum(psth1)'/32;
    for j=1:320
        aw=sum(psth11((j-1)*100+1:j*100))*32;
        cn1(j)=aw/length(cnd2);
    end
    tre=randperm(320,320);
    cn1=cn1(tre);
    for j=1:32
        cn11=cn1((j-1)*10+1:j*10);
        cu=1*ones(10,1);
        rw=3*ones(10,1);
        [b,dev,stats]=glmfit([cu rw],cn11,'normal');
        pvcu2(i,j)=stats.p(2);
        pcrw2(i,j)=stats.p(3);
    end
end




for i=1:481

    psth1=zeros(length(cnd3),32000);
    for j=1:length(cnd3)
       n1=Unit(i).Trls{cnd3(j),1};
       n1=round(n1*10000)+12001;
       n2=n1(n1<32001);
       psth1(j,n1)=1;
    end
    psth11=sum(psth1)'/32;
    for j=1:320
        aw=sum(psth11((j-1)*100+1:j*100))*32;
        cn1(j)=aw/length(cnd3);
    end
    tre=randperm(320,320);
    cn1=cn1(tre);
    for j=1:32
        cn11=cn1((j-1)*10+1:j*10);
        cu=-1*ones(10,1);
        rw=6*ones(10,1);
        [b,dev,stats]=glmfit([cu rw],cn11,'normal');
        pvcu3(i,j)=stats.p(2);
        pcrw3(i,j)=stats.p(3);
    end
end




for i=1:481

    psth1=zeros(length(cnd4),32000);
    for j=1:length(cnd4)
       n1=Unit(i).Trls{cnd4(j),1};
       n1=round(n1*10000)+12001;
       n2=n1(n1<32001);
       psth1(j,n1)=1;
    end
    psth11=sum(psth1)'/32;
    for j=1:320
        aw=sum(psth11((j-1)*100+1:j*100))*32;
        cn1(j)=aw/length(cnd4);
    end
    tre=randperm(320,320);
    cn1=cn1(tre);
    for j=1:32
        cn11=cn1((j-1)*10+1:j*10);
        cu=-1*ones(10,1);
        rw=6*ones(10,1);
        [b,dev,stats]=glmfit([cu rw],cn11,'normal');
        pvcu4(i,j)=stats.p(2);
        pcrw4(i,j)=stats.p(3);
    end
end



for i=1:481

    psth1=zeros(length(cnd5),32000);
    for j=1:length(cnd5)
       n1=Unit(i).Trls{cnd5(j),1};
       n1=round(n1*10000)+12001;
       n2=n1(n1<32001);
       psth1(j,n1)=1;
    end
    psth11=sum(psth1)'/32;
    for j=1:320
        aw=sum(psth11((j-1)*100+1:j*100))*32;
        cn1(j)=aw/length(cnd5);
    end
    tre=randperm(320,320);
    cn1=cn1(tre);
    for j=1:32
        cn11=cn1((j-1)*10+1:j*10);
        cu=-1*ones(10,1);
        rw=9*ones(10,1);
        [b,dev,stats]=glmfit([cu rw],cn11,'normal');
        pvcu5(i,j)=stats.p(2);
        pcrw5(i,j)=stats.p(3);
    end
end




for i=1:481

    psth1=zeros(length(cnd6),32000);
    for j=1:length(cnd6)
       n1=Unit(i).Trls{cnd6(j),1};
       n1=round(n1*10000)+12001;
       n2=n1(n1<32001);
       psth1(j,n1)=1;
    end
    psth11=sum(psth1)'/32;
    for j=1:320
        aw=sum(psth11((j-1)*100+1:j*100))*32;
        cn1(j)=aw/length(cnd6);
    end
    tre=randperm(320,320);
    cn1=cn1(tre);
    for j=1:32
        cn11=cn1((j-1)*10+1:j*10);
        cu=1*ones(10,1);
        rw=9*ones(10,1);
        [b,dev,stats]=glmfit([cu rw],cn11,'normal');
        pvcu6(i,j)=stats.p(2);
        pcrw6(i,j)=stats.p(3);
    end
end


pcrw11=reshape(pcrw1,1,[]);
pcrw22=reshape(pcrw2,1,[]);
pcrw33=reshape(pcrw3,1,[]);
pcrw44=reshape(pcrw4,1,[]);
pcrw55=reshape(pcrw5,1,[]);
pcrw66=reshape(pcrw6,1,[]);
pcrw=[pcrw11,pcrw22,pcrw33,pcrw44,pcrw55,pcrw66];
pcrww=[pcrw1;pcrw2;pcrw3;pcrw4;pcrw5;pcrw6];

[x,k]=find(pcrww<0.05);
t2=linspace(-1.2,2,32);
figure('WindowState','maximized')
histogram(k,'Normalization','probability')
xticks(0:4:32)
xticklabels({'-1.2','-0.8','-0.4','0','0.4','0.8','1.2','1.6','2'})
xlabel('Time bins(s)','Interpreter','latex')
ylabel('Probability','Interpreter','latex')
title('Histogram of time bins with P-value under 0.05 for Reward for Shuffled Data','Interpreter','latex')
saveas(gcf,'Fig9.png')


figure('WindowState','maximized')
histogram(pcrww,'Normalization','probability')

xlabel('P-value','Interpreter','latex')
ylabel('Probability','Interpreter','latex')
title('Histogram of P-values for Reward for Shuffled Data','Interpreter','latex')
saveas(gcf,'Fig10.png')


