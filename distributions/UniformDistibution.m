classdef UniformDistibution
    %UNTITLED9 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        n
        
    end
    
    methods
        function obj = UniformDistibution(n)
            obj.n = n;
        end
        
        function [ randX, randY,randZ ] = generateUniformDistributedPoints( area)
            minPoint = area{1};
            maxPoint = area{2};
            randX = minPoint(1) + (maxPoint(1) - minPoint(1))*rand(1,n);
            randY = minPoint(2) + (maxPoint(2) - minPoint(2))*rand(1,n);
            randZ = repmat(minPoint(3),1,n);
        end

    end
    
end

