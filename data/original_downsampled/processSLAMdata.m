close all
clear all
%filename = 'cse_lobby_2011-03-27.txt';
filename = 'discus_center_2011-03-26.txt';

data = load(filename);

% mapping the magnetometer readings to standard coordinates and to uT
mag = data(:, 6:8)/32;
%mag = data(:, 6:8)/8; % some of the raw data is scaled differently
mag(:,2) = -mag(:,2);
mag(:,3) = -mag(:,3);
mag = medfilt1(mag,5);
figure, plot(mag);

x = data(:, 1);
y = data(:, 2);
figure, plot(y, x, 'o');

d = data(:, 5)/1000;
figure, plot(d);

a = data(:, 4)/360*2*pi;
figure, plot(a)

ata = atan2(mag(:,2), mag(:,1));
figure, plot(ata)

t = (data(:, 19) - data(1, 19))/1000;
figure, plot(t)

% finding the first element where t > 0.5 s, and using this to downsample
% data to approximately 2 Hz
dtime = find(t > 0.5, 1) - 1;

dmag = mag(1:dtime:end, :);
dd = d(1:dtime:end);
da = a(1:dtime:end);
dt = t(1:dtime:end);

figure, plot(dmag);

% computing the control
cd(1) = 0;
ca(1) = 0;
for i = 2:length(da)
   cd(i) = dd(i) - dd(i-1);
   ca(i) = da(i) - da(i-1);
end

figure, plot(cd)
figure, plot(ca)

slamData = [cd' ca' dmag dt];

save(['2Hz_' filename], 'slamData', '-ascii')