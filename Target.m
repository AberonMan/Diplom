
% ����� �������������� ����� ����, �������� �������� ������ �������
classdef Target
    
    properties
        armorQuadrangles = ArmorQuadrangle.empty;
        defenslessAgregates;
    end
    
    methods
        function obj = Target(armorQuadrangles,defenslessAgregates)
            
            if nargin ==0
                error('Please define targets elements')
            end
            
            obj.armorQuadrangles = armorQuadrangles;
            obj.defenslessAgregates = defenslessAgregates;
        end
        
        
        
        %   ������ ���������� ������������ ��� ���������� ������������ �����
        function p = calculateArmorWithUniformDistribution(obj,n,step,fileName)
            p =   obj.calculate(n,step,'uniform',[],fileName,filterQuads(obj.armorQuadrangles));
        end
        
        %         ������ ���������� ������������ ��� ���������� ������������ �����
        function p = calculateArmorWithNormalDistribution(obj,n,step,sigma,fileName)
            
            p =   obj.calculate(n,step,'norm',sigma,fileName,filterQuads(obj.armorQuadrangles));
        end
        
        function p  = calculateDefenslessAgregates(obj,n,step,sigma,fileName)
            agregates  = obj.defenslessAgregates;
            quads = [];
            for i =1:length(agregates)
                quads = [quads agregates.armorQuadranges];
            end
            p =   obj.calculate(n,step,'norm',sigma,fileName,quads);
        end
        
        %�������� ��������� �����, ������ ������� ��������� �� �������� ��
        %������������� �����
        function p = calculate(obj,n,step,distributionType, additionalParam,fileName,quads)
            %             parpool(2)
            arrayLength = ((floor((90)/step) + 1) * ( floor(180/step) + 1) * 2);
            x = zeros(1,arrayLength);
            y = zeros(1,arrayLength);
            z = zeros(1,arrayLength);
            xS = zeros(1,arrayLength);
            yS = zeros(1,arrayLength);
            zS = zeros(1,arrayLength);
            r = 1000;
            center = calculateCenter(obj);
            failCount = 0;
            iL = floor(90/step) + 1;
            jL = floor(180/step) + 1;
            %������� �������� ���� �  �������� �����
            h = zeros(iL,jL);
            parfor_progress(iL*jL);
            
            
            parfor i=1:iL
                tmp = zeros(1,jL);
                try
                    for j = 1:jL
                        tmp(j) = calculateArmor(obj,n,distributionType, additionalParam,i,j,quads,r,step,center);
                        parfor_progress;
                    end
                catch e
                    continue;
                end
                h(i,:) = tmp;
            end
            phi = [];
            tetta = [];
            for i=1:1:iL
                phi =[phi linspace(-180,0,jL)];
                tetta = [tetta ones(1,jL)*(90 - (i-1)*step)];
            end
            h =  reshape( h.',1,numel(h));
            x  = h.* cosd(phi).*sind(tetta);
            y =  h.* cosd(tetta);
            z =  h.* sind(phi).*sind(tetta);
            
            
            %             �������� ���������� ����������, �������� ������ ����� �����
            arrayIndex = arrayLength / 2 + 1;
            for i =arrayLength / 2 - 1: -1 :2
                x(arrayIndex) = x(i);
                y(arrayIndex) = y(i);
                z(arrayIndex) = z(i)* -1;
                arrayIndex = arrayIndex + 1;
            end
            %             ������ �����������, � ������� ���������
            writeResultToFile([x *-1; y; z],fileName);
            [xS,yS,zS] =sphere;
            plotCaclulatedArmored(x *-1, y, z,xS,yS,zS);
            plotTarget(obj,1.8);
            p = 1 -  failCount/arrayLength;
        end
        
        %          � ���������� �� ����������� ������� � ����� ������� �������
        %          �����
        function visibleQuads = getVisibleQuads(~,viewVector,quads)
            warning('off','all');
            visibleQuads = ArmorQuadrangle.empty;
            for i = 1:1:length(quads)
                currentQuad = quads(i);
                multi = dot(viewVector,currentQuad.normal);
                
                if (multi < 0)
                    visibleQuads = [visibleQuads,currentQuad];
                end
            end
        end
        
        function viewVector =  getViewVector(~,perspectiveCenter,center)
            viewVector = center - perspectiveCenter;
        end
        
        %   ������� ����� ����
        function center = calculateCenter(obj)
            quads  = obj.armorQuadrangles;
            centers = arrayfun(@(armorQuadrangles) armorQuadrangles.findCenter, ...
                quads,'UniformOutput',false);
            areas = arrayfun(@(armorQuadrangles) armorQuadrangles.calculateArea, ...
                quads);
            
            X = cell2mat(cellfun(@(center) center(1),centers,'UniformOutput',false));
            Y = cell2mat(cellfun(@(center) center(2),centers,'UniformOutput',false));
            Z = cell2mat(cellfun(@(center) center(3),centers,'UniformOutput',false));
            
            xCenter = sum(X.*areas)/sum(areas);
            yCenter = sum(Y.*areas)/sum(areas);
            zCenter = sum(Z.*areas)/sum(areas);
            
            center = [xCenter yCenter zCenter];
        end
        %   ������ ����
        function plotTarget(obj, scaleFactor, center)
            
            hold on;
            for i=1:1:length(obj.armorQuadrangles)
                obj.armorQuadrangles(i).plotQuadrangle(scaleFactor,center);
            end
            hold off;
        end
        
        function plotCalculatedAgregares(obj)
            agregates  = obj.defenslessAgregates;
            quads = [];
            for i =1:length(agregates)
                quads = [quads agregates.armorQuadranges];
            end
            hold on
            for i=1:length(quads)
                quads(i).plotQuadrangle(1,[0,0,0]);
            end
            hold  off
        end
    end
    
    
    
    
    
end






