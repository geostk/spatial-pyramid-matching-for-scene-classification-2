function [h] = getImageFeaturesSPM(layerNum, wordMap, dictionarySize)
% Compute histogram of visual words using SPM method
% Inputs:
%   layerNum: Number of layers (L+1)
%   wordMap: WordMap matrix of size (h, w)
%   dictionarySize: the number of visual words, dictionary size
% Output:
%   h: histogram of visual words of size {dictionarySize * (4^layerNum - 1)/3} (l1-normalized, ie. sum(h(:)) == 1)

    % TODO Implement your code here
    [r,c]=size(wordMap);
    C=cell(21,1);
%divide the wordMap into 16 cells. L=2.   
C{1}=wordMap(1:ceil(r/4),1:ceil(c/4));  %11  12 13 14
C{2}=wordMap(1:ceil(r/4),ceil(c/4)+1:ceil(c/2));             
C{3}=wordMap(1:ceil(r/4),ceil(c/2)+1:ceil((3*c)/4));             
C{4}=wordMap(1:ceil(r/4),ceil((3*c)/4)+1:end);            

C{5}=wordMap(ceil(r/4)+1:ceil(r/2),1:ceil(c/4));  %21  22 23  24
C{6}=wordMap(ceil(r/4)+1:ceil(r/2),ceil(c/4)+1:ceil(c/2));
C{7}=wordMap(ceil(r/4)+1:ceil(r/2),ceil(c/2)+1:ceil((3*c)/4));
C{8}=wordMap(ceil(r/4)+1:ceil(r/2),ceil((3*c)/4)+1:end);

C{9}=wordMap(ceil(r/2)+1:ceil((3*r)/4),1:ceil(c/4));   %31  32  33  34
C{10}=wordMap(ceil(r/2)+1:ceil((3*r)/4),ceil(c/4)+1:ceil(c/2));
C{11}=wordMap(ceil(r/2)+1:ceil((3*r)/4),ceil(c/2)+1:ceil(3*c/4));
C{12}=wordMap(ceil(r/2)+1:ceil((3*r)/4),ceil((3*c)/4)+1:end);

C{13}=wordMap(ceil((3*r)/4)+1:r,1:ceil(c/4));  %41  42  43  44
C{14}=wordMap(ceil((3*r)/4)+1:r,ceil(c/4)+1:ceil(c/2));
C{15}=wordMap(ceil((3*r)/4)+1:r,ceil(c/2)+1:ceil(3*c/4));
C{16}=wordMap(ceil((3*r)/4)+1:r,ceil((3*c)/4)+1:end);

%divide the wordMap into 4 cells. L=1 
C{17}=wordMap(1:ceil(r/2),1:ceil(c/2));   %  11   12
C{18}=wordMap(1:ceil(r/2),ceil(c/2)+1:end);

C{19}=wordMap(ceil(r/2)+1:r,1:ceil(c/2));  %21  22
C{20}=wordMap(ceil(r/2)+1:r,ceil(c/2)+1:end);

%L=0
C{21}=wordMap;

temp=cell(21,1);

for i=(1:21)                       %calc histogram for ea ch of the wordMap cell.
    l=hist(C{i},100);
    l=l/sum(l);
    temp{i}=l;
end

h=[];
for i=(1:21)                    %concatenate all the hsitograms together with weights. 
    if(i<=16)
    temp{i}=temp{i}*1/2;
    else 
     temp{i}=temp{i}*1/4;
    end
    
    h=[h;temp{i}];
end



 


