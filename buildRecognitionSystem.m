function buildRecognitionSystem()
% Creates vision.mat. Generates training features for all of the training images.

	load('dictionary.mat');
	load('../data/traintest.mat');

	% TODO create train_features
    train_features=[];
    interval =1;   
    train_imagenames = train_imagenames(1:interval:end);
    a=erase(train_imagenames,'.jpg');   
    s=strcat(('../data/'),a,('.mat'));
    for i=(1:1349)
    w=load(s{i});
    w=w.wordMap;
    h=getImageFeaturesSPM(3,w, size(dictionary,2));
    train_features=[train_features,h];
    end   
	save('vision.mat', 'filterBank', 'dictionary', 'train_features', 'train_labels');

end