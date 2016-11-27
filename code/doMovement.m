%% Makes a simple movement between two points in the space.
function new_q = doMovement(time_animation, last_q, robot, links, dimention_3)
    
        clc
        disp('====Radin for rotational and meters for prismatic====');
        new_q = input('Enter trajectory [vector(q)]: ');
        clc
        %%Check if new_q is valid for this robot.
        [ignore, links_to_move] = size(new_q);
        if((links_to_move == links) && isValidMove(robot.islimit(new_q)))
            trajectory = jtraj(last_q, new_q, time_animation);
            T = robot.fkine(trajectory);
            drwaRobot(robot, links, trajectory, dimention_3, last_q, new_q)
            logMovement(T, last_q, new_q, 1);
        else
            clc
            disp('The moviment is not valid for this robot');
            input('Press enter to continue...')
        end
end