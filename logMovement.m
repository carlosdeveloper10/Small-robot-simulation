%% print on the console, information about the Qs, Matrix T
function [returned_value] = logMovement(T, Initial_q, Final_q, stop)

    clc
    [d1, d2 lastT] = size(T);
    Initial_T = T(:,:,1);
    Final_T = T(:,:,lastT);
    
    format bank
    Initial_q
    Final_q
    Initial_T
    Final_T
        if(stop == 1)
            input('Press enter to continue...');
        end
end

