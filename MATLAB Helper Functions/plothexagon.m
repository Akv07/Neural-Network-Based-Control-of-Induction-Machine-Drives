function plothexagon()
Vbus = 800;
x =linspace(0, Vbus, 1000);
y = linspace(0, Vbus, 1000);

xyidx=0;

for i=x
    for j=y
        if ((j-(sqrt(3)*i)) <= 0) && (j-(sqrt(3)*(Vbus-i)) <= 0)
            xyidx = xyidx+1;
            xy(xyidx, :) = [i, j];
        end
    end
end

%1 for 0127, 2 for 0121 and 3 for 7212
pointsize = 10;
type = zeros(size(xy, 1), 1);
for i = 1:size(xy,1)
    [theta, Vref] = cart2pol(xy(i, 1), xy(i,2));
    type(i) = switchtimes(Vref, theta, Vbus);
end
% size(type)
% size(xy)
% unique(type)

colorID = ones(length(xy),3);
colorID(type == 1, 1) = 1*0.75;
colorID(type == 2, 2) = 1*0.75;
colorID(type == 3, 3) = 1*0.75;
colorID(type == 4, 1) = 1*0.75;
colorID(type == 4, 2) = 1*0.75;
colorID(type == 5, 2) = 1*0.75;
colorID(type == 5, 3) = 1*0.75;

scatter(xy(:,1), xy(:, 2), pointsize, colorID, 'filled');

colormap([0.75 1 1;1 0.75 1;1 1 0.75; 0.75 0.75 1; 1 0.75 0.75])
chb = colorbar();
caxis([0,1])
set(chb,'Ticks',0.1:0.2:1,'TickLabels',{'0127', '0121', '7212', '1012', '2721'})
end