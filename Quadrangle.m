%  ласс представл€ющий собой геометричекое представлени€ элемента
classdef Quadrangle
    properties
        % Quadrangle points
        lines=Line.empty(0,4);
        number;
        normal;
    end
    
    methods
        
        function obj = Quadrangle(number,points)
            if nargin > 0
                
                if(isnumeric(number))
                    obj.number = number;
                end
                
                if(length(points) == 4)
                    obj.lines(1) = Line(points(1),points(2));
                    obj.lines(2) = Line(points(2),points(3));
                    obj.lines(3) = Line(points(3),points(4));
                    obj.lines(4) = Line(points(4), points(1));
                    P1 = points(1).toVector;
                    P2 = points(2).toVector;
                    P3 = points(3).toVector;
                    obj.normal = cross(P1  - P2, P1 - P3);
                    obj.normal = obj.normal / norm( obj.normal );
                    if (dot(obj.normal,P1) < 0)
                        obj.normal = obj.normal * -1;
                    end
                    
                    
                else
                    error('You need give 4 point array as argument')
                end
            else
                error('You need specify the center of qudrangke and 4 points from left bottom point to right bottom point')
            end
        end
        
        function plotQuadrangle(obj,scaleFactor ,center)
            plotX = [];
            plotY = [];
            plotZ = [];
            for i =1:1:length(obj.lines)
                plotX =  [plotX;obj.lines(i).getPlotXData];
                plotY =  [plotY;obj.lines(i).getPlotYData];
                plotZ =  [plotZ;obj.lines(i).getPlotZData];
            end
            fill3(plotZ/scaleFactor  - center(3),plotX/scaleFactor - center(1),plotY/scaleFactor - center(2),'r');
            xlabel('z');
            ylabel('x');
            zlabel('y');
            view(3);
            axis vis3d image, box on, grid on
            camlight, lighting phong, alpha(.8)
            zoom on;
            zoom(1.009);
        end
        
        function center = findCenter(obj)
            X = arrayfun(@(line) line.beginPoint.x,obj.lines);
            Y = arrayfun(@(line) line.beginPoint.y,obj.lines);
            Z= arrayfun(@(line) line.beginPoint.z,obj.lines);
            center = [(max(X)+min(X))/2, (max(Y) + min(Y))/2,(max(Z) + min(Z))/2 ];
        end
        
        function area =  calculateArea(obj)
            X = obj.getX();
            Y = obj.getY();
            Z=  obj.getZ();
            area = max([(max(X) - min(X))*(max(Y) - min(Y)),...
                (max(X) - min(X))*(max(Z) - min(Z)), ...
                (max(Y) - min(Y))*(max(Z) - min(Z))]);
        end
        
        function X = getX(obj)
            X = [arrayfun(@(line) line.beginPoint.x,obj.lines) obj.lines(1).beginPoint.x  ];
        end
        
        function Y = getY(obj)
            Y = [arrayfun(@(line) line.beginPoint.y,obj.lines) obj.lines(1).beginPoint.y];
        end
        
        function Z = getZ(obj)
            Z = [arrayfun(@(line) line.beginPoint.z,obj.lines) obj.lines(1).beginPoint.z];
        end
        
        
        function points = getPoints(obj)
            X = obj.getX();
            Y = obj.getY();
            Z = obj.getZ();
            points = cell(1, length(X));
            for i=1:1:length(X)
                curX =X(i);
                curY =Y(i);
                curZ =Z(i);
                points(i) = {[curX curY curZ]};
            end
        end
    end
    
    methods(Static)
                function quads  =loadQuadsFromCenter(center,deltaX,deltaY,deltaZ,h)
            
             H = [h(3);h(3);h(3);h(3);h(2);h(2);h(2);h(2);h(1);h(1);h(1);h(1)];
            
            x=[ -1 -1 1 1 
                -1 -1 1 1 
                -1 1 1 -1  % bottom
                -1 1 1 -1  % top
                -1 -1 -1 -1  % left
                 1 1 1 1  % right
                ] * deltaX + center(1);
            
            y=[  1  1  1 1  
                -1 -1 -1 -1  
                -1 -1 1 1 
                -1 -1 1 1 
                -1 1 1 -1 
                -1 1 1 -1 
                ] *deltaY + center(2) ;
            
            z=[  1  -1 -1 1 
                 1  -1 -1 1 
                -1 -1 -1 -1 
                1  1  1  1  
                -1 -1  1  1 
                -1 -1  1  1 
                ] * deltaZ +  center(3);
            
            points = [];
            quads = [];
            
            for i =1:6
                for j =1:4
                    points = [points Point(-1, x(i,j),y(i,j),z(i,j))];
                end
                 quads = [ArmorQuadrangle(-1, points,H(j)),quads];
                 points = [];
            end
          
        end
        
    end
    
    
end

