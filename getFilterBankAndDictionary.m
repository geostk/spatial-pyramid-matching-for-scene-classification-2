function [filterBank, dictionary] = getFilterBankAndDictionary(imPaths)
% Creates the filterBank and dictionary of visual words by clustering using kmeans.

% Inputs:
%   imPaths: Cell array of strings containing the full path to an image (or relative path wrt the working directory.
% Outputs:
%   filterBank: N filters created using createFilterBank()
%   dictionary: a dictionary of visual words from the filter responses using k-means.

    filterBank  = createFilterBank();

    % TODO Implement your code here'
  Co_response=[];
  
  alpha=randperm(70);                   %obtain 70 random values for alpha 
  K=100;                                %set Number of Clusters as 100
   
  for i=(1:20)                          %obtaining filter response for 20 filters
        response=[];
        for j =(1:950)                  %using 950 images for generating a dictionary
        C=[];     
        img=imread(imPaths{j});
        filterResponses=extractFilterResponses(img,filterBank{i});
       
        for z=(1:3)                     %as RGB matrix associated for each image,thus filter responses are to be generated for eeach of the 3 layers.
        A=filterResponses(:,:,z);
        B=A(alpha);
        C=[C;B];                        
        end
        response=[response;C.'];
        end
        Co_response=[Co_response,response]; %constructing a Co-response matrix for feeding to kmeans function to generate a dictionary  
  end   
[~,dictionary]=kmeans(Co_response,K,'EmptyAction','drop');      
dictionary=transpose(dictionary);
end
