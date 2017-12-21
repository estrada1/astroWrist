clear; close all; clc; 

[t,accx1,accy1,accz1] = importdata('trial2.txt');

plot(diff(t))
ylabel('dt from sampling')

figure
plot(t,accx1,t,accy1,t,accz1)
ylabel('Raw number')
xlabel('time [ms]')
legend('x', 'y', 'z')

zoffset = 351; 
nstart=1400;
nend = 1800;
accz1clip = accz1(nstart:nend)-zoffset;
tclip = t(nstart:nend); 

% accz1clip = sin(0:.001:2*pi);
% accz1clip = ones(1000,1)
% tclip = 1:length(accz1clip); 

velz1 = cumtrapz(accz1clip);
posz1 = cumtrapz(velz1);

figure 
subplot(3,1,1)
plot(tclip,accz1clip)
ylabel('accel [raw number]')
subplot(3,1,2)
plot(tclip,velz1)
ylabel('velocity [raw number]')
subplot(3,1,3)
plot(tclip,posz1)
ylabel('position [raw number]')
xlabel('time [ms]')