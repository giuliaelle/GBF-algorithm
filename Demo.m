close all; 
clear;

%% Demo to execute the GBF algorithm

n = 3; % number of components
mu = [1,2,3]; % means
s2 = [0.1,0.2,0.3]; % variances
lambda = [0.7,0.5,-0.2]; % weights
eps = 10^-6; % accuracy for Ridders' method
roots = Roots_GBF(n,lambda,mu,s2,eps); % sign-changing roots
