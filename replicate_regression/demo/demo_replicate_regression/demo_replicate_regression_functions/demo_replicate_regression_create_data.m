function [t,x,sigma,l,t_true,x_true, t1,t2,t3,x1,x2,x3,sigma1,sigma2,sigma3,x1_true,x2_true,x3_true,x1_true_all,x2_true_all,x3_true_all] = demo_replicate_regression_create_data()


% ---------------------------------
% Create artificial data

randn('state',1);

noise_level = 0.1;

t_true  = 0:1:30;
x_true  = 2 * [0.1*t_true./(1+0.1*t_true)] .* exp(-0.1*t_true/2);

offset2 =  0.1*x_true;
offset1 = -0.5*x_true;
offset3 =  0.5*x_true;

ind1 = 5:6:20;
ind2 = 10:6:25;
ind3 = 18:6:30;

t1 = t_true(ind1); 
t2 = t_true(ind2);
t3 = t_true(ind3);

x1_true_all = x_true + offset1;
x2_true_all = x_true + offset2;
x3_true_all = x_true + offset3;

x1_true = x_true(ind1) + offset1(ind1);
x2_true = x_true(ind2) + offset2(ind2);
x3_true = x_true(ind3) + offset3(ind3);

x1 = x1_true + noise_level * randn(size(ind1));
x2 = x2_true + noise_level * randn(size(ind2));
x3 = x3_true + noise_level * randn(size(ind3));

sigma1 = noise_level * ones(size(x1));
sigma2 = noise_level * ones(size(x2));
sigma3 = noise_level * ones(size(x3));

t     = [t1, t2, t3];
x     = [x1, x2, x3];
sigma = [sigma1, sigma2, sigma3];
l     = [ones(size(t1)), 2*ones(size(t2)), 3*ones(size(t3))];

[t,order] = sort(t);
x         = x(order);
sigma     = sigma(order);
l         = l(order);
