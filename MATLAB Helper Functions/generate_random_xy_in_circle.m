function xy = generate_random_xy_in_circle(requiredPoints, radius)
        numPointsIn = 1;
       viscircles([[0 0]], radius);
       hold on;
       xy = zeros(requiredPoints, 2);
       
        while numPointsIn <= requiredPoints
              testx = 2 * radius * rand(1) - radius;
              testy = 2 * radius * rand(1) - radius;
              if ((testx.^2) + (testy.^2)) <= (radius.^2)
                    xy(numPointsIn, 1) = testx;
                    xy(numPointsIn, 2) = testy;
                    numPointsIn = numPointsIn + 1;
              end
        end
        plot(xy(:, 1), xy(:, 2), '.', 'MarkerSize', 20);
end