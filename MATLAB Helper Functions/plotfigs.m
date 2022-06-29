function plotfigs()
    x = 0:0.01:1.2;
    y = 0:0.1:(2*pi);
    
    [xx, yy] = meshgrid(x,y);
    
    subplot(2,2,1);
    [~, z, ~, ~, ~] = arrayfun(@create_training_set_row, xx, yy);
    surf(xx, yy, z);
    xlabel('m');
    ylabel('angle');
    zlabel('S1');
    title('S1');
    
    subplot(2,2,2);
    [~, ~, z, ~, ~] = arrayfun(@create_training_set_row, xx, yy);
    surf(xx, yy, z);
    xlabel('m');
    ylabel('angle');
    zlabel('S3');
    title('S3');
    
    subplot(2,2,3);
    [~, ~, ~, z, ~] = arrayfun(@create_training_set_row, xx, yy);
    surf(xx, yy, z);
    xlabel('m');
    ylabel('angle');
    zlabel('S5');
    title('S5');
    
    subplot(2,2,4);
    [~, ~, ~, ~, z] = arrayfun(@create_training_set_row, xx, yy);
    surf(xx, yy, z);
    xlabel('m');
    ylabel('angle');
    zlabel('switchseq');
    title('Switching Sequence');
end