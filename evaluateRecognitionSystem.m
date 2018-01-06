function [conf] = evaluateRecognitionSystem()
% Evaluates the recognition system for all test-images and returns the confusion matrix

	load('vision.mat');
	load('../data/traintest.mat');

	% TODO Implement your code here
    [r c]=size(test_imagenames)
    interval =1;   
    test_imagenames = test_imagenames(1:interval:end);  
    s=strcat(('../data/'),test_imagenames);
    % G is the confusion matrix.
    G=zeros(8); 
    for i=(1:r)
    predicted=guessImage(s{i});
    p=find(contains(mapping,predicted));
    actual=test_imagenames{i}(1:end-25);
    a=find(contains(mapping,actual));
    G(a,p)=G(a,p)+1;
    end
    accuracy=trace(G)/sum(G(:));
    accuracy=accuracy*100
    save('G');
        
end