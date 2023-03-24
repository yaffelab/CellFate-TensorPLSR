function sMx = shufflematrix(X)
% sufflematrix randomizes the rows and columns in a matrix

linX=reshape(X,[],size(X,2)*size(X,3),1);
shuffleindex=randperm(size(X,2)*size(X,3),size(X,2)*size(X,3));
shuflinX=linX(shuffleindex);
sMx=reshape(shuflinX,size(X,2),size(X,3));