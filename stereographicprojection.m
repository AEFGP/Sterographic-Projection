% Quantum Novice
function stereographicprojection

    % Projects 2D plane onto a sphere
    function [x y z] = project(X,Y,n)
        r = 1 + X.^2 + Y.^2;
        x = 2 .* X ./ r;
        y = 2 .* Y ./ r;
        z = n*(-1 + X.^2 + Y.^2) ./ r;
    end
    % Projects 3D sphere onto a plane
    function [X Y] = retrace(x,y,z)
        X = x ./ (1 - z);
        Y = y ./ (1 - z);
    end
    
    % plots the projection
    function plane2sphere(n)
        X = linspace(-1,1,40);
        Y = linspace(-1,1,40);
        [X,Y] = meshgrid(X,Y);
        [x y z] = project(X,Y,n);
        plot3(x,y,z, 'b-');
        hold on
        rx = rot90(x);
        ry = rot90(y);
        rz = rot90(z);
        plot3(rx,ry,rz, 'b-')
        
        [X Y] = retrace(x,y,z);
        plot(X,Y, 'r-');
        [X Y] = retrace(rx,ry,rz);
        plot(X,Y, 'r-');
        axis([-1.5, 1.5 -1.5 1.5])
        zlim([-1, 0.5])
        
    end
    plane2sphere(0.1);

    
end
