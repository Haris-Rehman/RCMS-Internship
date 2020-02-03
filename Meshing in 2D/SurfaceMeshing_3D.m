% Plot settings
fontSize = 15;
markerSize1 = 45;
lineWidth1 = 4;
faceAlpha = 0.5;

%Boundary 1
ns = 150;
t = linspace(0, 2*pi, ns);
t = t(1:end-1);
r = 6+2.*sin(5*t);
[x, y] = pol2cart(t, r);
z = 1/10*x.^2;
V1 = [x(:) y(:) z(:)];

%Boundary 2
ns = 100;
t = linspace(0, 2*pi, ns);
t = t(1 : end-1);
[x, y] = pol2cart(t, ones(size(t)));
z = zeros(size(x));
V2 = [x(:) y(:)+4 z(:)];

%Boundary 3
ns = 75;
t = linspace(0, 2*pi, ns);
t = t(1 : end-1);
[x, y] = pol2cart(t,2*ones(size(t)));
z = zeros(size(x));
V3 = [x(:) y(:)-0.5 z(:)];

regionCell = { V1, V2, V3 };

pointSpacing = 0.5; %Desired point spacing
resampleCurveOpt = 1;
interpMethod = ’linear’; %or ’natural’
[F, V] = regionTriMesh3D(regionCell, pointSpacing, resampleCurveOpt, interpMethod);

% Plotting meshed model
hf1 = cFigure;
title(’The meshed model’,’FontSize’, fontSize);
xlabel(’X’, ’FontSize’, fontSize);
ylabel(’Y’, ’FontSize’, fontSize);
zlabel(’Z’, ’FontSize’, fontSize);
hold on;

% plot sheet like patch
patch(’Faces’, F, ’Vertices’, V, ’FaceColor’, ’g’);

plotV(V1, ’b-’,’LineWidth’, 2);
plotV(V2, ’b-’,’LineWidth’, 2);
plotV(V3, ’b-’,’LineWidth’, 2);

view(3); grid on;