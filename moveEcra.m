function []  = moveEcra(tecla)

[az, elev] = view()

switch tecla
    case 'w'
        view(az, elev+10);
    case 's'
        view(az, elev-10);
    case 'a'
        view(az-10, elev);
    case 'd'
        view(az+10, elev);
    case '1'
        view(3);
    case '2'
        view(-5, 30);
    case '3'
        view(-97.5, 30);
    case '4'
        view(-37.5, 70);
end