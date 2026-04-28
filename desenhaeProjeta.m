function [] = desenhaeProjeta(M, x, y,z, n)

formas(x,y,z,n)
disp(x)
disp(y)
disp(z)
disp('      ')
switch n
    case 1
        h = z(find(M(x+1, y+1, :) == 1, 1, 'last'));
    case 2
        h = z(max(find(M(x-1:x+1, y:y+2, :) == 1, 1, 'last')));
    case 3
        h = z(max(find(M(x+1, y+1:y+2, :) == 1, 1, 'last')));
    case 4
        h = z(max(find(M(x+1, y+1, :) == 1, 1, 'last')));
    case 5
        h = z(max(find(M(x+1, y+1:y+3, :) == 1, 1, 'last')));
    case 6
        h = z(max(find(M(x+1:x+2, y+1, :) == 1, 1, 'last')));
end

if isempty(h)
    h=0;
end

formas(x,y,h,n, 2);
end