classdef Line
    properties
        beginPoint;
        endPoint;
        
        
    end
    
    methods
        function obj = Line(beginPoint, endPoint)
            if (nargin == 2)
            obj.beginPoint = beginPoint;
            obj.endPoint = endPoint;
            else
            error('Line need two points');    
            end
        end
        
        function plotX = getPlotXData(obj)
            plotX = [obj.beginPoint.x,obj.endPoint.x];
        end
        function plotY =  getPlotYData(obj)
           plotY = [obj.beginPoint.y,obj.endPoint.y];  
        end
        
        function plotZ =  getPlotZData(obj)
           plotZ = [obj.beginPoint.z,obj.endPoint.z];  
        end
        
       
        
    end
    
    
    
end

