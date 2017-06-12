% Ёлемент имеющий толщину
classdef ArmorQuadrangle < Quadrangle
    properties
        armorThickness      
    end
    methods
        function obj = ArmorQuadrangle(number,points,armorThickness)
              if nargin ==0
                error('Please define points and armorThickness ')
              end
            obj = obj@Quadrangle(number,points);
            obj.armorThickness = armorThickness;
        end
    end
    
    
end

