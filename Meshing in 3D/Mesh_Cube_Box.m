featureSize = 0.5;
pointSpacing = 3;
shrinkFactor = featureSize / pointSpacing;
boxDim = [36 36 36]; %Width in each direction
[meshStruct] = tetMeshBox(boxDim, pointSpacing);
F = meshStruct.faces;
V = meshStruct.nodes;
C = meshStruct.boundaryMarker;
meshStruct
E = meshStruct.elements;
Fb = meshStruct.facesBoundary;
V = meshStruct.nodes;
meshView(meshStruct);