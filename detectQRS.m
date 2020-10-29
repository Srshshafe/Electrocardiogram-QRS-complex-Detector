clc
clear all
close all
load ECG5.dat
x=ECG5;
for i=3:3996;
    y0(i)=abs(x(i,1)-x(i-2,1));
    y1(i)=abs(x(i,1)-2*x(i-2,1)+x(i+4,1));
    y2(i)=1.3*y0(i)+1.1*y1(i);
end
ax(1)=subplot(5,1,1);
plot(ECG5)
title('ECG')
ax(2)=subplot(5,1,2);
plot(y0)
title('D1')
ax(3)=subplot(5,1,3);
plot(y1)
title('D2')
ax(5)=subplot(5,1,5);
plot(ECG5)
title('D1+D2')
p=y2(532);
th=0.5*p;
M=5;
plot(ECG5)
hold on
ax(4)=subplot(5,1,4);
plot(y2)
hold on
plot(1:length(y2),th*ones(size(y2)),'r')
for i=M+1 :length(y2)  

    if   (y2(i)>th)& all (y2(i)>y2((i-1):-1:(i-M))) & all (y2(i)>y2((i+1):(i+M)))
        ax(5)=subplot(5,1,5);
        plot(i-2,ECG5(i-2),'rx')
    end
end
linkaxes(ax,'x')