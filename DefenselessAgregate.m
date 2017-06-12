classdef DefenselessAgregate
    properties
        number
        armorQuadranges
        name
    end
    methods
        function obj = DefenselessAgregate(number,armorQuadranges,name)         
            obj.number = number;
            obj.armorQuadranges = armorQuadranges;
            obj.name = name;      
        end
    end
    
end

