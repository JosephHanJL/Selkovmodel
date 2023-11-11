%parameters
global gamma;
global alpha;
global nu;
global eta;

gamma = 2;
alpha = 1.0;
nu = 0.0285;
eta = 0.1;

%time span and initial conditions
Tspan = [0 1500];
Y0 = [0.5 0.5];

%ode solutions
[T Y] = ode45(@spiral, Tspan, Y0);

%plot
figure;
subplot(2,2,1);
plot(Y(:,1), Y(:,2));
title('sigma2 vs sigma1 vector map')
xlabel('sigma1')
ylabel('sigma2')
text(Y0(1),Y0(2),'\leftarrow starting point')

subplot(2,2,2);
g = gcf;
g.WindowState = 'maximized';
plot(T, Y(:,1));
hold on;
plot(T, Y(:,2));
hold off;
title('sigma vs time plot')
xlabel('tau')
ylabel('sigma')
legend('sigma 1', 'sigma 2')

subplot(2,2,3);
u1 = (Y(:,2).^gamma)./((Y(:,2).^gamma).*Y(:,1)+(Y(:,2).^gamma)+1);
u2 = Y(:,1).*(Y(:,2).^gamma)./((Y(:,2).^gamma).*Y(:,1)+(Y(:,2).^gamma)+1);
plot(T, u1);
hold on;
plot(T, u2);
hold off;
title('u1, u2 vs time plot')
xlabel('tau')
ylabel('u')
legend('u1', 'u2')

global nu2
nu2 = 0.04;
[T_2 Y_2] = ode45(@spiral2, Tspan*2, Y0);
figure;
subplot(2,2,1);
plot(Y_2(:,1), Y_2(:,2));
title('sigma2 vs sigma1 vector map')
xlabel('sigma1')
ylabel('sigma2')
text(Y0(1),Y0(2),'\leftarrow starting point')

subplot(2,2,2);
g = gcf;
g.WindowState = 'maximized';
plot(T_2, Y_2(:,1));
hold on;
plot(T_2, Y_2(:,2));
hold off;
title('sigma vs time plot')
xlabel('tau')
ylabel('sigma')
legend('sigma 1', 'sigma 2')

u_1 = (Y_2(:,2).^gamma)./((Y_2(:,2).^gamma).*Y_2(:,1)+(Y_2(:,2).^gamma)+1);
u_2 = Y_2(:,1).*(Y_2(:,2).^gamma)./((Y_2(:,2).^gamma).*Y_2(:,1)+(Y_2(:,2).^gamma)+1);

subplot(2,2,3)
plot(T_2, u_1);
hold on;
plot(T_2, u_2);
hold off;
title('u vs time plot')
xlabel('tau')
ylabel('sigma')
legend('u 1', 'u 2')
subplot(2,2,4)
plot3(T_2, Y_2(:,1), Y_2(:,2))
title('sigma across time')
xlabel('time');
ylabel('u1');
zlabel('u2');

%Sel'kov model
function dy = spiral(t, y)
global gamma
global alpha
global nu
global eta
dy(1) = nu - y(1)*(y(2)^gamma)/((y(2)^gamma)*y(1)+(y(2)^gamma)+1);
dy(2) = alpha*y(1)*(y(2)^gamma)/((y(2)^gamma)*y(1)+(y(2)^gamma)+1) - eta*y(2);
dy = dy';
end

function dy = spiral2(t, y)
global gamma
global alpha
global nu2
global eta
dy(1) = nu2 - y(1)*(y(2)^gamma)/((y(2)^gamma)*y(1)+(y(2)^gamma)+1);
dy(2) = alpha*y(1)*(y(2)^gamma)/((y(2)^gamma)*y(1)+(y(2)^gamma)+1) - eta*y(2);
dy = dy';
end

