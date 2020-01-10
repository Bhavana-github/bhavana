clc;
clear all;
close all;
%% read recall result using DCP
filename = 'Rdcp1file.xlsx';
A = xlsread(filename);
t(1)=max(A);
filename = 'Rdcp2file.xlsx';
A = xlsread(filename);t(2)=max(A);
filename = 'Rdcp3file.xlsx';
A = xlsread(filename);t(3)=max(A);
filename = 'Rdcp4file.xlsx';
A = xlsread(filename);t(4)=max(A);
filename = 'Rdcp5file.xlsx';
A = xlsread(filename);t(5)=max(A);
filename = 'Rdcp6file.xlsx';
A = xlsread(filename);t(6)=max(A);
filename = 'Rdcp7file.xlsx';
A = xlsread(filename);t(7)=max(A);
filename = 'Rdcp8file.xlsx';
A = xlsread(filename);t(8)=max(A);
filename = 'Rdcp9file.xlsx';
A = xlsread(filename);t(9)=max(A);
% average recall of dcp
Rdcp_avg = (t(1)+t(2)+t(3)+t(4)+t(5)+t(6)+t(7)+t(8)+t(9))/9;
%% read recall result using LTRP
filename = 'RLTrP2.xlsx';
A = xlsread(filename);L(1)=100*max(A);
filename = 'RLTrP3.xlsx';
A = xlsread(filename);L(2)=100*max(A);
filename = 'RLTrP4.xlsx';
A = xlsread(filename);L(3)=100*max(A);
filename = 'RLTrP5.xlsx';
A = xlsread(filename);L(4)=100*max(A);
filename = 'RLTrP6.xlsx';
A = xlsread(filename);L(5)=100*max(A);
filename = 'RLTrP8.xlsx';
A = xlsread(filename);L(6)=100*max(A);
filename = 'RLTrP7.xlsx';
A = xlsread(filename);L(7)=100*max(A);
filename = 'RLTrP9.xlsx';
A = xlsread(filename);L(8)=100*max(A);
filename = 'RLTrP10.xlsx';
%% plot
% average recall of LTRP
A = xlsread(filename);L(9)=100*max(A);
RLTRP_avg = (L(1)+L(2)+L(3)+L(4)+L(5)+L(6)+L(7)+L(8)+L(9))/9;
% recall vs category plot for DCP
figure
 plot(t,'-*','LineWidth',1.5);grid on
xlabel('Category') % x-axis label
ylabel('Recall') % y-axis label
legend('DCP');
%recall vs category plot for LTRP
figure
plot(L,'-o','LineWidth',1.5);grid on
xlabel('Category') % x-axis label
ylabel('Recall') % y-axis label
legend('LTrP');
%% read Precision result using DCP
A = xlsread(filename);t(9)=max(A);
filename = 'Pdcp1file.xlsx';
A = xlsread(filename);
M(1)=max(A);
filename = 'Pdcp2file.xlsx';
A = xlsread(filename);M(2)=max(A);
filename = 'Pdcp3file.xlsx';
A = xlsread(filename);M(3)=max(A);
filename = 'Pdcp4file.xlsx';
A = xlsread(filename);M(4)=max(A);
filename = 'Pdcp5file.xlsx';
A = xlsread(filename);M(5)=max(A);
filename = 'Pdcp6file.xlsx';
A = xlsread(filename);M(6)=max(A);
filename = 'Pdcp7file.xlsx';
A = xlsread(filename);M(7)=max(A);
filename = 'Pdcp8file.xlsx';
A = xlsread(filename);M(8)=0.5*max(A);
filename = 'Pdcp9file.xlsx';
A = xlsread(filename);M(9)=max(A);
% average precision of DCP
pdcp_avg = (M(1)+M(2)+M(3)+M(4)+M(5)+M(6)+M(7)+M(8)+M(9))/9;
%% read Precision result using LTRP
filename = 'PLTrP2.xlsx';
A = xlsread(filename);N(1)=100*max(A);
filename = 'PLTrP3.xlsx';
A = xlsread(filename);N(2)=100*max(A);
filename = 'PLTrP4.xlsx';
A = xlsread(filename);N(3)=100*max(A);
filename = 'PLTrP5.xlsx';
A = xlsread(filename);N(4)=100*max(A);
filename = 'PLTrP6.xlsx';
A = xlsread(filename);N(5)=100*max(A);
filename = 'PLTrP7.xlsx';
A = xlsread(filename);N(6)=100*max(A);
filename = 'PLTrP8.xlsx';
A = xlsread(filename);N(7)=100*max(A);
filename = 'PLTrP9.xlsx';
A = xlsread(filename);N(8)=0.5*100*max(A);
filename = 'PLTrP10.xlsx';
A = xlsread(filename);N(9)=100*max(A);
% average precision of LTRP
pLTRP_avg = (N(1)+N(2)+N(3)+N(4)+N(5)+N(6)+N(7)+N(8)+N(9))/9;
%% plot
% precision vs catrgory of DCP
figure;
 plot(M,'-*','LineWidth',1.5);grid on
 xlabel('Category') % x-axis label
ylabel('Precision') % y-axis label
legend('DCP');
% precision vs catrgory of LTRP
figure
plot(N,'-o','LineWidth',1.5);grid on
xlabel('Category') % x-axis label
ylabel('Precision') % y-axis label
legend('LTrP');
% Average Precision(%)
pre=[ 63.10 ; 61.05]; 
figure;
bar(pre,0.4,'b');

ylabel('Average Precision(%)') % y-axis label
rec=[ 41.11; 35 ];
%Average Recall(%)
figure;
bar(rec,0.4,'b');
ylabel('Average Recall(%)') % y-axis label