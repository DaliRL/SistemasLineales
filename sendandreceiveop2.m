% Connect to serial port
s = serial('COM6', 'BaudRate', 9600);
fopen(s);
pause(3);
fprintf("Connection established\n")


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

plotTitle = 'Gráfica senoidal';
xLabel = 'Tiempo (seg)';
legend1 = 'A0 Arduino Leonardo';
yMax  = 1.5;
yMin  = -1.5;
plotGrid = 'on';
min = -1;
max = 1;
delay = .01;


time = 0;
data = 0;
count = 0;


plotGraph = plot(time,data,'-r' );
title(plotTitle,'FontSize',20);
xlabel(xLabel,'FontSize',10);
legend(legend1)
axis([yMin yMax min max]);
grid(plotGrid);
tic


theta=0:10/96:2*pi;
k=1;

while ishandle(plotGraph)
  % Send float and receive float
  fprintf(s, theta(k));
  k=k+1;
  out = fscanf(s, '%f\n');
  % Display data to user
  fprintf("%f\n",out)
  dat = out; 
  count = count + 1;
  time(count) = toc;
  data(count) = dat;
  set(plotGraph,'XData',time,'YData',data);
  axis([0 time(count) min max]);
  pause(delay);
  if k==length(theta)
      k=1;
  end
end

fclose(s);
delete(s)
clear s
disp('Plot Closed and arduino object has been deleted');