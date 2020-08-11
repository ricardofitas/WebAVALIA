%%%% Webavalia: Algorithm Improvement of an eAssessment Tool Based on an User Survey  
% Rosalina Babo and Ricardo Fitas, 2020

C=15; %student max mark
M(1)=21;M(2)=21;M(3)=15;M(4)=16;M(5)=19; %students' final votation

%%%%%%%%%%%
x1=0:0.01:max(M);
Cf=C*sqrt(x1./max(M));
plot(x1,Cf,'b', 'LineWidth',2)
hold on

%%%%%%%% constants definition 
s1=12.0494;
s2=18.28709266;
aa=9.34668E-05;bb=-0.005888408;cc=0.513046106;Aa=-0.044667046;Bb=1.488275716;dd=5.957223665;
aa2=0.000269755;bb2=-0.016994552;cc2=0.469628777;Aa2=-0.037432485;Bb2=1.487761912;dd2=10.13419407;
aa3=-0.000488218;bb3=0.030757743;cc3=0;Aa3=-0.022038807;Bb3=1.059683334;dd3=5.957223665;
aa4=0.000525408;bb4=-0.033100721;cc4=0.695115133;Aa4=-0.044188336;Bb4=1.627753209;dd4=10.13419407;
aa5=0.000113298;bb5=-0.007137778;cc5=0.519398738;Aa5=-0.043309776;Bb5=1.484512823;dd5=6.191133122;
aa6=0.000269906;bb6=-0.017004048;cc6=0.473121571;Aa6=-0.038856217;Bb6=1.512968803;dd6=10.06363707;
aa7=0.000266565;bb7=-0.016793597;cc7=0.499864266;Aa7=-0.041738611;Bb7=1.556067837;dd7=9.440168044;
%%%%%%%% functions
x1=0:0.01:s2;
x2=s2:0.01:max(M);
x4=s1:-0.01:0;
x3= max(M):-0.01:s1;
fnF1=@(x) Aa2*x.^2+Bb2*x;
fnF2=@(x) aa2*x.^3+bb2*x.^2+cc2*x+dd2;
fnF3=@(x) Aa*x.^2+Bb*x;
fnF4=@(x) aa*x.^3+bb*x.^2+cc*x+dd;
hh=fill([x1, x2,x3,x4],[fnF1(x1),fnF2(x2),[fnF4(x3), fnF3(x4)]],[1 165/255 0]);

fnF1=@(x) Aa4*x.^2+Bb4*x;
fnF2=@(x) aa4*x.^3+bb4*x.^2+cc4*x+dd4;
fnF3=@(x) Aa3*x.^2+Bb3*x;
fnF4=@(x) aa3*x.^3+bb3*x.^2+cc3*x+dd3;
hh2=fill([x1, x2,x3,x4],[fnF1(x1),fnF2(x2),[fnF4(x3), fnF3(x4)]],[1 165/255 0]);
set(hh,'facealpha',.15)
set(hh2,'facealpha',.03)
hold on
%%%%% constants
s2=17.87383115;
s1=12.59528;
%%%% functions for X+-sigma
x1=0:0.01:s2;
x2=s2:0.01:max(M);
x4=s1:-0.01:0;
x3= max(M):-0.01:s1;
fnF1=@(x) Aa6*x.^2+Bb6*x;
fnF2=@(x) aa6*x.^3+bb6*x.^2+cc6*x+dd6;
fnF3=@(x) Aa5*x.^2+Bb5*x;
fnF4=@(x) aa5*x.^3+bb5*x.^2+cc5*x+dd5;
%plot([x1, x2,x3,x4],[fnF1(x1),fnF2(x2),[fnF4(x3), fnF3(x4)]]);
hold on
s1=16.70017171; %constant
% functions for the average
x1=0:0.01:s1;
x2=s1:0.01:max(M);
fnF1=@(x) Aa7*x.^2+Bb7*x;
fnF2=@(x) aa7*x.^3+bb7*x.^2+cc7*x+dd7;
plot([x1, x2],[fnF1(x1), fnF2(x2)],':') %X
hold on
M1(1)=21;M1(2)=21;M3=[0 min(M)];Mx=min(M):0.01:max(M);
x1=0:0.01:max(M);

xmed = 1./(((sum(M1)*ones(size(M3',1),size(Mx,2))+ones(2,1)*Mx+(M3')*ones(size(Mx))))./ ...
    (sum(M1.^2)*ones(size((M3.^2)',1),size(Mx.^2,2))+ones(2,1)*Mx.^2+((M3.^2)')*ones(size(Mx))));
[~,XX]=min(xmed(1,:));
[~,XX2]=min(xmed(2,:));
xmed(1,XX:end)=2*xmed(1,XX)-xmed(1,XX:end);
xmed(2,XX2:end)=2*xmed(2,XX2)-xmed(2,XX2:end);

%Cf(1,:)=Cf(1,:)/5;
%hh1=fill([Mx, fliplr(Mx)],[Cf(1,:),fliplr(Cf(2,:))],'r');
%set(hh1,'facealpha',.1)

%%% function for the inferior limit of the framework
x1=0:0.01:max(M);
aa8=-0.000809848;bb8=0.051020408;
fnF2=@(x) aa8*x.^3+bb8*x.^2;

plot(x1,fnF2(x1));
legend('Algorithm D','SF,CI','T','SF,Avg','IL','Position',[330 150 1 1]);
set(groot,'defaultLegendAutoUpdate','off');

xlim([min(M) max(M)]);
ylim([10 15]);

hold on
line([16 16],[10 16],'LineStyle','--');
line([19 19],[10 16],'LineStyle','--');
xlabel("Students' self and peer votation (M)");
ylabel("Students' final mark");
hold off 
print -dmeta
