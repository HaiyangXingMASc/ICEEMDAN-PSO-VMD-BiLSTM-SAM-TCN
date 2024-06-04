tic;
load ('OriginalSeries.mat');

Nstd = 0.2;
NR = 500;
MaxIter = 5000;
SNRFlag = 1;


[modes its]=iceemdan(OriginalSeries,Nstd,NR,MaxIter,SNRFlag);
t=1:length(OriginalSeries);

[a b]=size(modes);

figure;
subplot(a+1,1,1);
plot(t,OriginalSeries);% the OriginalSeries signal is in the first row of the subplot
ylabel('OriginalSeries')
set(gca,'xtick',[])
axis tight;

for i=2:a
    subplot(a+1,1,i);
    plot(t,modes(i-1,:));
    ylabel (['IMF ' num2str(i-1)]);
    set(gca,'xtick',[])
    xlim([1 length(OriginalSeries)])
end;

subplot(a+1,1,a+1)
plot(t,modes(a,:))
ylabel(['IMF ' num2str(a)])
xlim([1 length(OriginalSeries)])


modes_transposed = modes';


dlmwrite('ICEEMDAN SSEC Low modes_data.csv', modes_transposed, 'precision', 16, 'delimiter', ',');
elapsed_time = toc;

fprintf('Execution time: %.2f seconds\n', elapsed_time);