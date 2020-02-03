% import model
[V, F] = stlread(’femur.stl’);

% show model
trisurf(F,V(:,1),V(:,2),V(:,3),’FaceColor’,[0.5 0.5 0.5],’EdgeAlpha’,0)
axis image
camlight

% meshing
faceBoundaryMarker = ones(size(F, 1), 1);
[V_regions] = getInnerPoint(F, V);
V_holes = [];
[regionA] = tetVolMeanEst(F, V); %Volume for regular tets
stringOpt = ’-pq1.2AaYQ’;
inputStruct.stringOpt = stringOpt;
inputStruct.Faces = fliplr(F);
inputStruct.Nodes = V;
inputStruct.holePoints = V_holes;
inputStruct.faceBoundaryMarker = faceBoundaryMarker; %Face boundary markers
inputStruct.regionPoints = V_regions; %region points
inputStruct.regionA = regionA;
inputStruct.minRegionMarker = 2; %Minimum region marker

[meshStruct] = runTetGen(inputStruct); %Run tetGen

pointSpacing = mean(patchEdgeLengths(F, V));
featureSize = pointSpacing / 10;
shrinkFactor = featureSize / pointSpacing;

E = meshStruct.elements;
Fb = meshStruct.facesBoundary;
V = meshStruct.nodes;

meshView(meshStruct);