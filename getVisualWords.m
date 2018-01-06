function [wordMap] = getVisualWords(img, filterBank, dictionary)
% Compute visual words mapping for the given image using the dictionary of visual words.

% Inputs:
% 	img: Input RGB image of dimension (h, w, 3)
% 	filterBank: a cell array of N filters
% Output:
%   wordMap: WordMap matrix of same size as the input image (h, w)

    % TODO Implement your code here
A=[];
for i=(1:20)                                                %obtaining filter responses from all 20 filters to generate a wordMap
filterResponses=extractFilterResponses(img,filterBank{i});
A=cat(3,A,filterResponses);    
end 
s=size(A);
wordMap=[];
P=reshape(A,s(1)*s(2),s(3));                                %reshaping the 3D matrix to (XY x 60), to avoid for loops while wordMap generation                   
for i=1:s(1)*s(2)
    C=pdist2(P(i,:),dictionary.');
    [M,I]=min(C);
    wordMap(1,i)=I; 
end
 wordMap=reshape(wordMap,s(1),s(2));
