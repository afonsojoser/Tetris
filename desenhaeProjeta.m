function [] = desenhaeProjeta(M, x, y, z, n)

    switch n
        case 1
            hd = find(M(x+1, y+1, :) ~= 0, 1, 'last');
            
        case 2
            hd = find(sum(sum(M(x+1:x+2, y+1:y+2, :), 1), 2) > 0, 1, 'last');
            
        case 3
            hd = find(sum(sum(M(x+1, y+1:y+2, :), 1), 2) > 0, 1, 'last');
            
        case 4
            hd = find(M(x+1, y+1, :) >0, 1, 'last');
            
        case 5
            hd = find(sum(sum(M(x+1, y+1:y+3, :), 1), 2) > 0, 1, 'last');
            
        case 6
            hd = find(M(x+1, y+1, :) >0, 1, 'last');
    end
    
    if isempty(hd)
        hd = 0;
    end
    
    formas(x,y,hd,n, 2);
    formas(x,y,z,n)
end