%% checks if a movement is valid or no.
function value = isValidMove(move)
    
    value = 1;                      

    found = find(move == 1 | move == -1);
    [row, col] = size(found);
    
    if(row > 0)
        value = 0;
    end
end