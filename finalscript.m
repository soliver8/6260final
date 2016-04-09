%ECE 6260 Final Purva Kulkarni, Sean Oliver

close all;

[raw Fs] = audioread('Signal.wav');
f = abs(fft(raw));
figure; hold on; title('Overall frequency content');
plot(linspace(0,8000,length(f)/2),f(1:end/2));
hold off;

[b1,a1] = butter(40,3300/8000,'low'); 
[b2,a2] = butter(6,[3980/8000 4059/8000],'bandpass');
[b3,a3] = butter(40,4100/8000,'high');

speechband = filter(b1,a1,raw);
noiseband1 = filter(b2,a2,raw);
noiseband2 = filter(b3,a3,raw);

f1 = 10*log10(abs(fft(speechband)));
f2 = 10*log10(abs(fft(noiseband1)));
f3 = 10*log10(abs(fft(noiseband2)));

figure; hold on; title('Speech frequency content'); ylabel('dB');
plot(linspace(0,8000,length(f1)/2),f1(1:end/2));
hold off;

figure; hold on; title('NB1 frequency content'); ylabel('dB');
plot(linspace(0,8000,length(f2)/2),f2(1:end/2));
hold off;

figure; hold on; title('NB2 frequency content'); ylabel('dB');
plot(linspace(0,8000,length(f3)/2),f3(1:end/2));
hold off;

% figure;
% plotspec(raw,Fs,320); hold on; title('Spectrogram');

%uncomment one of these to hear the bands
% sound(speechband(1:100000),Fs)
% sound(noiseband1(1:100000),Fs)
% sound(noiseband2(1:100000),Fs)