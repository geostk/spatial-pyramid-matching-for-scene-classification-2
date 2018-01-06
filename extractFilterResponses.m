function [filterResponses] = extractFilterResponses(img, filterBank)
% Extract filter responses for the given image.
% Inputs: 
%   img:                a 3-channel RGB image with width W and height H
%   filterBank:         a cell array of N filters
% Outputs:
%   filterResponses:    a W x H x N*3 matrix of filter responses


% TODO Implement your code here
[h,w,f]=size(img);                
if(f==1)
    img=repmat(img,[1 1 3]);       %repeating the matrix in 3rd dimension, 3 times.
end

img=im2double(img);                %facilitates calculation to be done on the matrix,as it represented as a floating point mat.  
con_img=RGB2Lab(img);              
filterResponses=imfilter(con_img,filterBank);%obtaining filterResponse; as a result of filter convolving on the input image.
end
