function area = getQuadrangleArea( quads )
     X = cell2mat(arrayfun(@(visible) visible.getX,quads,'UniformOutput',false));
     Y = cell2mat(arrayfun(@(visible) visible.getY,quads,'UniformOutput',false));
     Z = cell2mat(arrayfun(@(visible) visible.getZ,quads,'UniformOutput',false)); 
     area = {[min(X) min(Y) min(Z)] [max(X) max(Y) max(Z)]};
end

