%% MATLAB Code

% Solution to Problem 1 Part e
syms h
eqn1 = h - h / sqrt(h^2 + 1) == (0.5 * 70 * 9.81) / (211 * 10^9 * pi / 4 * 0.001^2);
h = double(solve(eqn1,h,'PrincipalValue',true))


% Solution to Problem 1 Part f
l_f = 2*sqrt(h^2 + 1)
l_i = 2/1.01;
q_1 = (l_f - l_i) / l_i;
q_2 = -0.29 * q_1;
d_i = 1 / (1 - 0.0029);
d_f = d_i + q_2 * d_i

% Solution to Problem 3 Part d
syms e_y
E = 22.2 / 0.0022;
e_o = 0.002;
E_i = (37.9 - 35.9) / (0.0069 - 0.0047)
eqn2 = E * (e_y - e_o) == E_i * (e_y - 0.0047) + 35.9;
e_y = double(solve(eqn2,e_y,'PrincipalValue',true))
s_y = E * (e_y - e_o);

% Solution to Problem 3 Part e
e = [0.0022 0.0033 0.0047 0.0069 0.011 0.017 0.023 0.028 0.035];
s = [22.2 33.7 35.9 37.9 39.9 41.2 41.9 42.3 42.6];

x = e(4:9);
y = s(4:9);

p = polyfit(x,y,1);
m = p(1)
b = p(2);

% Graph for Problem 3 Part f
s_1 = @(e_1) E * e_1;
s_11 = @(e_11) E * (e_11 - e_o);
s_2 = @(e_2) E_i * (e_2 - 0.0047) + 35.9;
s_3 = @(e_3) m * e_3 + b;

l_1x = [0,e_y];
l_1y = [s_y,s_y];
l_2x = [e_y,e_y];
l_2y = [0,s_y];

figure
scatter(e,s,'ko','filled')
title('Stress vs. Strain');
xlabel('Strain');
ylabel('Stress (ksi)');
grid on
hold on
plot(e_y,s_y,'ko',l_1x,l_1y,'k--',l_2x,l_2y,'k--')
text(e_y - 0.0006,s_y,'Yield Point','VerticalAlignment','bottom','HorizontalAlignment','right')
fplot(s_1,[0 0.0033],'b')
fplot(s_11,[0.002 e_y],'g')
fplot(s_2,[0.0047 0.0069],'m')
fplot(s_3,[0.0069 0.035],'r')

% Graph for Problem 3 Part g
r = m * x + b;
d = (r - y) ./ y .* 100;

figure
scatter(x,d,'ko','filled')
title('Relative Error vs. Strain');
xlabel('Strain');
ylabel('Relative Error (%)');
grid on