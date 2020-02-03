V1 = [-1 -1; -1 1; 1 1; 1 -1]; % boundaries edge points
regionCell = { V1 };
plotOn = 1; %turns on/off plotting
pointSpacing = 0.5; %Desired point spacing
regionTriMesh2D(regionCell, pointSpacing, 1, plotOn);