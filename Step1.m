%%
clc
clear
load('UnitsData.mat');
cn1=zeros(320,1);
cn2=zeros(320,1);
cn3=zeros(320,1);
cn4=zeros(320,1);
cn5=zeros(320,1);
cn6=zeros(320,1);
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
        
    end
    psth11=sum(psth1)'/481;
    for i=1:320
        aw=0;
        aw=sum(psth11((i-1)*10+1:i*10))*320;
        cn1(i)=cn1(i)+aw;
    end
end





t1=-1.2:0.01:1.99;
t1=round(t1*10000)/10000;
for j=1:length(cnd2)
    psth1=zeros(481,3200);
    for i=1:481
        n1=Unit(i).Trls{cnd2(j),1};
        n1=round(n1*1000)+1201;
        n2=n1(n1<3201);
        psth1(i,n2)=1;
        
    end
    psth11=sum(psth1)'/481;
    for i=1:320
        aw=0;
        aw=sum(psth11((i-1)*10+1:i*10))*320;
        cn2(i)=cn2(i)+aw;
    end
end






for j=1:length(cnd3)
    psth1=zeros(481,3200);
    for i=1:481
        n1=Unit(i).Trls{cnd3(j),1};
        n1=round(n1*1000)+1201;
        n2=n1(n1<3201);
        psth1(i,n2)=1;
        
    end
    psth11=sum(psth1)'/481;
    for i=1:320
        aw=0;
        aw=sum(psth11((i-1)*10+1:i*10))*320;
        cn3(i)=cn3(i)+aw;
    end
end

for j=1:length(cnd4)
    psth1=zeros(481,3200);
    for i=1:481
        n1=Unit(i).Trls{cnd4(j),1};
        n1=round(n1*1000)+1201;
        n2=n1(n1<3201);
        psth1(i,n2)=1;
        
    end
    psth11=sum(psth1)'/481;
    for i=1:320
        aw=0;
        aw=sum(psth11((i-1)*10+1:i*10))*320;
        cn4(i)=cn4(i)+aw;
    end
end

for j=1:length(cnd5)
    psth1=zeros(481,3200);
    for i=1:481
        n1=Unit(i).Trls{cnd5(j),1};
        n1=round(n1*1000)+1201;
        n2=n1(n1<3201);
        psth1(i,n2)=1;
        
    end
    psth11=sum(psth1)'/481;
    for i=1:320
        aw=0;
        aw=sum(psth11((i-1)*10+1:i*10))*320;
        cn5(i)=cn5(i)+aw;
    end
end

for j=1:length(cnd6)
    psth1=zeros(481,3200);
    for i=1:481
        n1=Unit(i).Trls{cnd6(j),1};
        n1=round(n1*1000)+1201;
        n2=n1(n1<3201);
        psth1(i,n2)=1;
        
    end
    psth11=sum(psth1)'/481;
    for i=1:320
        aw=0;
        aw=sum(psth11((i-1)*10+1:i*10))*320;
        cn6(i)=cn6(i)+aw;
    end
end


figure('WindowState','maximized')
plot(t1,smooth(cn1./length(cnd1)))
hold on
plot(t1,smooth(cn2./length(cnd2)))
hold on
plot(t1,smooth(cn3./length(cnd3)))
hold on
plot(t1,smooth(cn4./length(cnd4)))
hold on
plot(t1,smooth(cn5./length(cnd5)))
hold on
plot(t1,smooth(cn6./length(cnd6)),"Color",'black')
hold on
xline(0,'--g','LineWidth',1.5)
hold on
xline(0.9,'--r','LineWidth',1.5)
text(-0.2,74 ...
    ,['Cue onset $\rightarrow$'],'Interpreter','latex')
text(0.63,86, ...
    ['Reward onset $\rightarrow$'],'Interpreter','latex')

legend('reward = 3 , cue = -1','reward = 3 , cue = 1','reward = 6 , cue = -1', ...
    'reward = 6 , cue = 1','reward = 9 , cue = -1','reward = 9 , cue = 1','Location','southeast')
grid on
grid minor
xlim([-1.2,2])
xlabel('Time(s)','Interpreter','latex')
ylabel('rate','Interpreter','latex')
title('Average PSTH','Interpreter','latex')
saveas(gcf,'Fig1.png')

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

cn1=zeros(80,4);
cn2=zeros(80,4);
cn3=zeros(80,4);
cn4=zeros(80,4);
cn5=zeros(80,4);
cn6=zeros(80,4);




t1=-1.2:0.01:1.99;
t1=round(t1*10000)/10000;

neurs = randperm(481,4);

for j=1:length(cnd1)    
    psth1=zeros(32000,4);
    for i=1:4
        n1=Unit(neurs(i)).Trls{cnd1(j),1};
        n1=round(n1*10000)+12001;
        n2=n1(n1<32001);
        psth1(n2,i)=1;
        
    end
    
    for i=1:80
        psth2=psth1((i-1)*400+1:i*400,:);
        aw=sum(psth2)/0.0125;
        cn1(i,:)=cn1(i,:)+aw;
    end
end


for j=1:length(cnd2)    
    psth1=zeros(32000,4);
    for i=1:4
        n1=Unit(neurs(i)).Trls{cnd2(j),1};
        n1=round(n1*10000)+12001;
        n2=n1(n1<32001);
        psth1(n2,i)=1;
        
    end
    
    for i=1:80
        psth2=psth1((i-1)*400+1:i*400,:);
        aw=sum(psth2)/0.0125;
        cn2(i,:)=cn2(i,:)+aw;
    end
end


for j=1:length(cnd3)    
    psth1=zeros(32000,4);
    for i=1:4
        n1=Unit(neurs(i)).Trls{cnd3(j),1};
        n1=round(n1*10000)+12001;
        n2=n1(n1<32001);
        psth1(n2,i)=1;
        
    end
    
    for i=1:80
        psth2=psth1((i-1)*400+1:i*400,:);
        aw=sum(psth2)/0.0125;
        cn3(i,:)=cn3(i,:)+aw;
    end
end


for j=1:length(cnd4)    
    psth1=zeros(32000,4);
    for i=1:4
        n1=Unit(neurs(i)).Trls{cnd4(j),1};
        n1=round(n1*10000)+12001;
        n2=n1(n1<32001);
        psth1(n2,i)=1;
        
    end
    
    for i=1:80
        psth2=psth1((i-1)*400+1:i*400,:);
        aw=sum(psth2)/0.0125;
        cn4(i,:)=cn4(i,:)+aw;
    end
end


for j=1:length(cnd5)    
    psth1=zeros(32000,4);
    for i=1:4
        n1=Unit(neurs(i)).Trls{cnd5(j),1};
        n1=round(n1*10000)+12001;
        n2=n1(n1<32001);
        psth1(n2,i)=1;
        
    end
    
    for i=1:80
        psth2=psth1((i-1)*400+1:i*400,:);
        aw=sum(psth2)/0.0125;
        cn5(i,:)=cn5(i,:)+aw;
    end
end


for j=1:length(cnd6)    
    psth1=zeros(32000,4);
    for i=1:4
        n1=Unit(neurs(i)).Trls{cnd6(j),1};
        n1=round(n1*10000)+12001;
        n2=n1(n1<32001);
        psth1(n2,i)=1;
        
    end
    
    for i=1:80
        psth2=psth1((i-1)*400+1:i*400,:);
        aw=sum(psth2)/0.0125;
        cn6(i,:)=cn6(i,:)+aw;
    end
end

t2=linspace(-1.2,2,80);
%%
figure('WindowState','maximized')
plot(t1,interp(cn1(:,1)./length(cnd1),4))
hold on
plot(t1,interp(cn2(:,1)./length(cnd2),4))
hold on
plot(t1,interp(cn3(:,1)./length(cnd3),4))
hold on
plot(t1,interp(cn4(:,1)./length(cnd4),4))
hold on
plot(t1,interp(cn5(:,1)./length(cnd5),4))
hold on
plot(t1,interp(cn6(:,1)./length(cnd6),4))
hold on
xline(0,'--g','LineWidth',1.5)
hold on
xline(0.9,'--r','LineWidth',1.5)
text(-0.2,300 ...
    ,['Cue onset $\rightarrow$'],'Interpreter','latex')
text(0.63,300, ...
    ['Reward onset $\rightarrow$'],'Interpreter','latex')
legend('reward = 3 , cue = -1','reward = 3 , cue = 1','reward = 6 , cue = -1', ...
    'reward = 6 , cue = 1','reward = 9 , cue = -1','reward = 9 , cue = 1','Location','southeast')
grid on
grid minor
xlim([-1.2,2])
xlabel('Time(s)','Interpreter','latex')
ylabel('rate','Interpreter','latex')
title(['Average PSTH for Neuron $',num2str(neurs(1)),'$'],'Interpreter','latex')
saveas(gcf,'Fig2.png')

%%
figure('WindowState','maximized')
plot(t1,interp(cn1(:,2)./length(cnd1),4))
hold on
plot(t1,interp(cn2(:,2)./length(cnd2),4))
hold on
plot(t1,interp(cn3(:,2)./length(cnd3),4))
hold on
plot(t1,interp(cn4(:,2)./length(cnd4),4))
hold on
plot(t1,interp(cn5(:,2)./length(cnd5),4))
hold on
plot(t1,interp(cn6(:,2)./length(cnd6),4))
hold on
xline(0,'--g','LineWidth',1.5)
hold on
xline(0.9,'--r','LineWidth',1.5)
text(-0.2,130 ...
    ,['Cue onset $\rightarrow$'],'Interpreter','latex')
text(0.63,130, ...
    ['Reward onset $\rightarrow$'],'Interpreter','latex')
legend('reward = 3 , cue = -1','reward = 3 , cue = 1','reward = 6 , cue = -1', ...
    'reward = 6 , cue = 1','reward = 9 , cue = -1','reward = 9 , cue = 1','Location','southeast')
grid on
grid minor
xlim([-1.2,2])
xlabel('Time(s)','Interpreter','latex')
ylabel('rate','Interpreter','latex')
title(['Average PSTH for Neuron $',num2str(neurs(2)),'$'],'Interpreter','latex')
saveas(gcf,'Fig3.png')

%%
figure('WindowState','maximized')
plot(t1,interp(cn1(:,3)./length(cnd1),4))
hold on
plot(t1,interp(cn2(:,3)./length(cnd2),4))
hold on
plot(t1,interp(cn3(:,3)./length(cnd3),4))
hold on
plot(t1,interp(cn4(:,3)./length(cnd4),4))
hold on
plot(t1,interp(cn5(:,3)./length(cnd5),4))
hold on
plot(t1,interp(cn6(:,3)./length(cnd6),4))
hold on
xline(0,'--g','LineWidth',1.5)
hold on
xline(0.9,'--r','LineWidth',1.5)
text(-0.2,(cn1(31,3)+cn2(31,3)+cn3(31,3)+cn4(31,3)+cn5(31,3)+cn6(31,3))/100 - 10 ...
    ,['Cue onset $\rightarrow$'],'Interpreter','latex')
text(0.63,(cn1(54,3)+cn2(54,3)+cn3(54,3)+cn4(54,3)+cn5(54,3)+cn6(54,3))/100 + 10, ...
    ['Reward onset $\rightarrow$'],'Interpreter','latex')
legend('reward = 3 , cue = -1','reward = 3 , cue = 1','reward = 6 , cue = -1', ...
    'reward = 6 , cue = 1','reward = 9 , cue = -1','reward = 9 , cue = 1','Location','southeast')
grid on
grid minor
xlim([-1.2,2])
xlabel('Time(s)','Interpreter','latex')
ylabel('rate','Interpreter','latex')
title(['Average PSTH for Neuron $',num2str(neurs(3)),'$'],'Interpreter','latex')
saveas(gcf,'Fig4.png')
%%

figure('WindowState','maximized')
plot(t1,interp(cn1(:,4)./length(cnd1),4))
hold on
plot(t1,interp(cn2(:,4)./length(cnd2),4))
hold on
plot(t1,interp(cn3(:,4)./length(cnd3),4))
hold on
plot(t1,interp(cn4(:,4)./length(cnd4),4))
hold on
plot(t1,interp(cn5(:,4)./length(cnd5),4))
hold on
plot(t1,interp(cn6(:,4)./length(cnd6),4))
hold on
xline(0,'--g','LineWidth',1.5)
hold on
xline(0.9,'--r','LineWidth',1.5)
text(-0.2,140 ...
    ,['Cue onset $\rightarrow$'],'Interpreter','latex')
text(0.63,140, ...
    ['Reward onset $\rightarrow$'],'Interpreter','latex')
legend('reward = 3 , cue = -1','reward = 3 , cue = 1','reward = 6 , cue = -1', ...
    'reward = 6 , cue = 1','reward = 9 , cue = -1','reward = 9 , cue = 1','Location','southeast')
grid on
grid minor
xlim([-1.2,2])
xlabel('Time(s)','Interpreter','latex')
ylabel('rate','Interpreter','latex')
title(['Average PSTH for Neuron $',num2str(neurs(4)),'$'],'Interpreter','latex')
saveas(gcf,'Fig5.png')