clear 
clc
% Connect to serial port
s = serial('COM6', 'BaudRate', 9600);
fopen(s);
pause(3);
fprintf("Connection established\n")


plotTitle = 'Gráfica Resorte-Amortiguador';
xLabel = 'Tiempo (seg)';
legend1 = 'A0 Arduino Leonardo';
yMax  = 5;
yMin  = 0;
plotGrid = 'on';
min = 0;
max = 5;
delay = .01;



% Start a counter and timer
count = 0;
data = 0;
tic
time = 0;

plotGraph = plot(time,data,'-g' );
title(plotTitle,'FontSize',20);
xlabel(xLabel,'FontSize',10);
legend(legend1)
axis([yMin yMax min max]);
grid(plotGrid);
tic


theta=0:10/96:2*pi;
k=1;
data=[];


while ishandle(plotGraph)
  fprintf(s, theta(k));
  k=k+1;
  out = fscanf(s, '%f\n');
  fprintf("%f\n",out)
  count = count + 1;
  data(count) = out;
  time(count) = toc;
  set(plotGraph,'XData',time,'YData',data);
  axis([0 time(count) min max]);
  pause(delay);
  if k==length(theta)
      k=1;
  end
end

