function [] = desenhaeProjeta(M, x, y,z, n)

formas(x,y,z,n)

switch n
    case 1
        h = find(M(x, y, :) == 1, 1, 'last');
    case 2
        h = max(find(M(x-1:x+1, y-1:y+1, :) == 1, 1, 'last'));
    case 3
        h = max(find(M(x:x, y:y+1, :) == 1, 1, 'last'));
    case 4
        h = max(find(M(x:x, y, :) == 1, 1, 'last'));
    case 5
        h = max(find(M(x:x, y:y+2, :) == 1, 1, 'last'));
    case 6
        h = max(find(M(x:x+1, y, :) == 1, 1, 'last'));
end

formas(x,y,h,n, 2);