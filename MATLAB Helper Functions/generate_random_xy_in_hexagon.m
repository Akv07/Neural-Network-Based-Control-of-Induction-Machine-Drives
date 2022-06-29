function xy = generate_random_xy_in_hexagon(requiredPoints, sidelen)
        xVertex = sidelen * cos((0:6)*pi/3);
        yVertex = sidelen * sin((0:6)*pi/3);
        yVertex(7) = 0;
        
        numPointsIn = 1;
       
        while numPointsIn <= requiredPoints
              testx = 2 * sidelen * rand(1) - sidelen;
              testy = 2 * sidelen * rand(1) - sidelen;
              if inpolygon(testx, testy, xVertex, yVertex)
                    xy(numPointsIn, 1) = testx;
                    xy(numPointsIn, 2) = testy;
                    numPointsIn = numPointsIn + 1;
              end
        end
%         size(xy)
end