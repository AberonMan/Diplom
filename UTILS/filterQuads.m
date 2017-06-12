function [ quads ] = filterQuads( quads )
for i = length(quads):-1:1
    armor =  quads(i).armorThickness;
    if (armor < 25  )
        quads(i) = [];
    end
end
end

