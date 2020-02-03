%Creating boundary curves

%Boundary 1 (outer boundary)
ns = 150;
t = linspace(0, 2*pi, ns);
t = t(1:end-1);
r = 6 + 2.*sin(5*t);
[x, y] = pol2cart(t, r);
V1 = [x(:) y(:)];

%Boundary 2 (hole 1 boundary)
[x, y] = pol2cart(t, ones(size(t)));
V2 = [x(:) y(:)+4];

%Boundary 3 (hole 2 boundary)
[x, y] = pol2cart(t, 2*ones(size(t)));
V3 = [x(:) y(:)-0.5];

regionCell = { V1, V2, V3 }; %Defining region
plotOn = 1; %This turns on/off plotting
pointSpacing = 0.5; %Desired point spacing
regionTriMesh2D(regionCell, pointSpacing, 1, plotOn);