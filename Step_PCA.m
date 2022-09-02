%%
clc
clear
load('UnitsData.mat');
cn1=zeros(320,481);
cn2=zeros(320,481);
cn3=zeros(320,481);
cn4=zeros(320,481);
cn5=zeros(320,481);
cn6=zeros(320,481);
cnd1=Unit(1).Cnd(1).TrialIdx;
cnd2=Unit(1).Cnd(2).TrialIdx;
cnd3=Unit(1).Cnd(3).TrialIdx;
cnd4=Unit(1).Cnd(4).TrialIdx;
cnd5=Unit(1).Cnd(5).TrialIdx;
cnd6=Unit(1).Cnd(6).TrialIdx;
t1=-1.2:0.01:1.99;
t1=round(t1*10000)/10000;
for j=1:length(cnd1)
    psth1=zeros(481,3200);
    for i=1:481
        n1=Unit(i).Trls{cnd1(j),1};
        n1=round(n1*1000)+1201;
        n2=n1(n1<3201);
        psth1(i,n2)=1;
        for x=1:320
            aw=0;
            aw=sum(psth1(i,(x-1)*10+1:x*10))*320/length(cnd1);
            cn1(x,i)=cn1(x,i)+aw;
        end
    end
end


for j=1:length(cnd2)
    psth1=zeros(481,3200);
    for i=1:481
        n1=Unit(i).Trls{cnd2(j),1};
        n1=round(n1*1000)+1201;
        n2=n1(n1<3201);
        psth1(i,n2)=1;
        for x=1:320
            aw=0;
            aw=sum(psth1(i,(x-1)*10+1:x*10))*320/length(cnd2);
            cn2(x,i)=cn2(x,i)+aw;
        end
    end
end

for j=1:length(cnd3)
    psth1=zeros(481,3200);
    for i=1:481
        n1=Unit(i).Trls{cnd3(j),1};
        n1=round(n1*1000)+1201;
        n2=n1(n1<3201);
        psth1(i,n2)=1;
        for x=1:320
            aw=0;
            aw=sum(psth1(i,(x-1)*10+1:x*10))*320/length(cnd3);
            cn3(x,i)=cn3(x,i)+aw;
        end
    end
end


for j=1:length(cnd4)
    psth1=zeros(481,3200);
    for i=1:481
        n1=Unit(i).Trls{cnd4(j),1};
        n1=round(n1*1000)+1201;
        n2=n1(n1<3201);
        psth1(i,n2)=1;
        for x=1:320
            aw=0;
            aw=sum(psth1(i,(x-1)*10+1:x*10))*320/length(cnd4);
            cn4(x,i)=cn4(x,i)+aw;
        end
    end
end


for j=1:length(cnd5)
    psth1=zeros(481,3200);
    for i=1:481
        n1=Unit(i).Trls{cnd5(j),1};
        n1=round(n1*1000)+1201;
        n2=n1(n1<3201);
        psth1(i,n2)=1;
        for x=1:320
            aw=0;
            aw=sum(psth1(i,(x-1)*10+1:x*10))*320/length(cnd5);
            cn5(x,i)=cn5(x,i)+aw;
        end
    end
end


for j=1:length(cnd6)
    psth1=zeros(481,3200);
    for i=1:481
        n1=Unit(i).Trls{cnd6(j),1};
        n1=round(n1*1000)+1201;
        n2=n1(n1<3201);
        psth1(i,n2)=1;
        for x=1:320
            aw=0;
            aw=sum(psth1(i,(x-1)*10+1:x*10))*320/length(cnd6);
            cn6(x,i)=cn6(x,i)+aw;
        end
    end
end


cn = [cn1;cn2;cn3;cn4;cn5;cn6];


%%
[V,U] = pca(cn);



% 2and4 3and4



cnnew =   cn * V(:,1:4);
figure('WindowState','maximized')
for i =1:6
    plot(smooth(smooth(cnnew((i-1)*320+1:i*320,4))),smooth(smooth(cnnew((i-1)*320+1:i*320,1))),'.-' ...
        ,'LineWidth',1)
    hold on
end
legend('reward = 3 , cue = -1','reward = 3 , cue = 1','reward = 6 , cue = -1', ...
    'reward = 6 , cue = 1','reward = 9 , cue = -1','reward = 9 , cue = 1','Location','southeast', ...
    'Interpreter','latex')

xlabel('Compenent 1','Interpreter','latex')
ylabel('Compenent 2','Interpreter','latex')


grid on
grid minor
saveas(gcf,'Fig11.png')

%% Shuffling
ti=randperm(320,320);
cn112 = cn1(ti,:);
cn21 = cn2(ti,:);
cn31 = cn3(ti,:);
cn41 = cn4(ti,:);
cn51 = cn5(ti,:);
cn61 = cn6(ti,:);
cn11 = [cn112;cn21;cn31;cn41;cn51;cn61];
%%
[V,U] = pca(cn11);



% 2and4 3and4



cnnew =   cn11 * V(:,1:4);
figure('WindowState','maximized')
for i =1:6
    plot(smooth(smooth(cnnew((i-1)*320+1:i*320,4))),smooth(smooth(cnnew((i-1)*320+1:i*320,1))),'.-' ...
        ,'LineWidth',1)
    hold on
end

legend('reward = 3 , cue = -1','reward = 3 , cue = 1','reward = 6 , cue = -1', ...
    'reward = 6 , cue = 1','reward = 9 , cue = -1','reward = 9 , cue = 1','Location','southeast', ...
    'Interpreter','latex')


xlabel('Compenent 1','Interpreter','latex')
ylabel('Compenent 2','Interpreter','latex')

grid on
grid minor
saveas(gcf,'Fig12.png')
