function feaVec = main(Input_Im, RegionRowNum, RegionColNum, Radius)
Iinput_Im=double(rgb2gray(Input_Im)); 

%% Inspect the Input Parameters
if nargin < 4,     Radius = [4 6];         end;
if nargin < 3,     RegionColNum = 9;       end;
if nargin < 2,     RegionRowNum = 9;       end;

if size(Input_Im, 3) == 3
    Input_Im = rgb2gray(Input_Im);
end


%% Encode the Image by DCP
feaVec = [];
OffSet = [0 pi/4];
for i = 1:length(OffSet)
    feaVec(:,i) = calDCPVec_sub(Input_Im, RegionRowNum, RegionColNum, 4, Radius, OffSet(i));
end


%% Rank the Feature Vectors Block by Block
blockNum = RegionRowNum*RegionColNum;
dimPerBlock = size(feaVec,1)/blockNum;
result = [];
for i = 1:size(feaVec, 2)
    temp = reshape(feaVec(:,i), dimPerBlock, blockNum);
    result = [result; temp];
end

feaVec = result(:);
end



