classdef Point
   
    properties
        number;
        x;
        y;
        z;
    
    end
    methods
        function obj = Point(number,x,y,z)
            if(isnumeric(number)&& isnumeric(x) && isnumeric(y) && isnumeric(z))
            obj.x = x;
            obj.y = y;
            obj.z = z;
            obj.number = number;
            else
                error('Value must be numerir')
            end 
        end
        function v = toVector(obj)
            v = [obj.x,obj.y,obj.z];
        end
     
    end
    
end

