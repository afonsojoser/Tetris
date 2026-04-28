function [] = desenhaeProjeta(M, x, y,z, n)

formas(x,y,z,n)

switch n
    case 1 %cubo unitário
        h = z(find(M(x+1, y+1, :) == 1, 1, 'last'));
    case 2 % cubo 2x2x2
        h = z(max(find(M(x:x+2, y:y, :) == 1, 1, 'last')));
    case 3 % prisma quadrangular comprimento 2 deitado
        h = z(max(find(M(x+1, y+1:y+2, :) == 1, 1, 'last')));
    case 4 % prisma quadrangular comprimento 2 em pé
        h = z(max(find(M(x+1, y+1, :) == 1, 1, 'last')));
    case 5 % prisma quadrangular comprimento 3 deitado
        h = z(max(find(M(x+1, y+1:y+3, :) == 1, 1, 'last')));
    case 6 % prisma quadrangular comprimento 3 em pé
        h = z(max(find(M(x+1, y+1, :) == 1, 1, 'last')));
end

if isempty(h)
    h=0;
end

formas(x,y,h,n, 2);
end