%% A 'work' is a group of movement. So it makes a group repetitively.
function new_q = doWork(time_animation, last_q, robot, links, dimention_3)
    
    
        clc
        disp('====Radin for rotational and meters for prismatic====');
        init_q = input('Initial q: ');
        [ignore, links_to_move] = size(init_q);
        while(links_to_move ~= links ||  isValidMove(robot.islimit(init_q)) == 0)
            clc
            disp('The moviment is not valid for this robot\n');
            disp('====Radin for rotational and meters for prismatic====');
            init_q = input('Enter again initial q: ');
            [ignore, links_to_move] = size(init_q);
        end
        
        clc
        disp('====Radin for rotational and meters for prismatic====');
        inter_q_1 = input('1ft intermediate q: ');
        [ignore, links_to_move] = size(inter_q_1);
        while(links_to_move ~= links || isValidMove(robot.islimit(inter_q_1)) == 0)
            clc
            disp('The moviment is not valid for this robot\n');
            disp('====Radin for rotational and meters for prismatic====');
            init_q = input('Enter again 1ft intermediate q: ');
            [ignore, links_to_move] = size(inter_q_1);
        end
        
        clc
        disp('====Radin for rotational and meters for prismatic====');
        inter_q_2 = input('2nd intermediate q: ');
        [ignore, links_to_move] = size(inter_q_2);
        while(links_to_move ~= links || isValidMove(robot.islimit(inter_q_2)) == 0)
            clc
            disp('The moviment is not valid for this robot\n');
            disp('====Radin for rotational and meters for prismatic====');
            init_q = input('Enter again 2nd intermediate q: ');
            [ignore, links_to_move] = size(inter_q_2);
        end
        
        clc
        disp('====Radin for rotational and meters for prismatic====');
        fin_q = input('Final q: ');
        [ignore, links_to_move] = size(fin_q);
        while(links_to_move ~= links || isValidMove(robot.islimit(fin_q)) == 0)
            clc
            disp('The moviment is not valid for this robot\n');
            disp('====Radin for rotational and meters for prismatic====');
            init_q = input('Enter again final q: ');
            [ignore, links_to_move] = size(fin_q);
        end
        
        clc
        repetitions = input('repetitions: ');
        clc
        
        %Prepare the robot
        trajectory = jtraj(last_q, init_q, time_animation);
        T = robot.fkine(trajectory);
        drwaRobot(robot, links, trajectory, dimention_3, last_q, init_q);
        logMovement(T, init_q, init_q, 0);
        
        
        pa_place = 1; %Place de Pa. 1 = inicial point. 2 = firts intermediate point. 3 = second intermediate point 4 = final point. 
        toward = 1; % 1 = forward. 0 = backward.
        while(repetitions ~= 0)
            
            if(pa_place == 1)                                               %Initial point
                trajectory = jtraj(init_q, inter_q_1, time_animation);
                T = robot.fkine(trajectory);
                pa_place = 2;
                drwaRobot(robot, links, trajectory, dimention_3, init_q, inter_q_1);
                logMovement(T, init_q, inter_q_1, 0);
            elseif(pa_place == 2 && toward == 1)                            %first intermadiate point
                trajectory = jtraj(inter_q_1, inter_q_2, time_animation);
                T = robot.fkine(trajectory);
                pa_place = 3;
                drwaRobot(robot, links, trajectory, dimention_3, inter_q_1, inter_q_2);
                logMovement(T, inter_q_1, inter_q_2, 0);
           elseif(pa_place == 2 && toward == 0)                            
                trajectory = jtraj(inter_q_1, init_q, time_animation);
                T = robot.fkine(trajectory);
                pa_place = 1;
                drwaRobot(robot, links, trajectory, dimention_3, inter_q_1, init_q)
                logMovement(T, inter_q_1, init_q, 0);
            elseif(pa_place == 3 && toward == 1)                            %second intermadiate point
                trajectory = jtraj(inter_q_2, fin_q, time_animation);
                T = robot.fkine(trajectory);
                pa_place = 4;
                drwaRobot(robot, links, trajectory, dimention_3, inter_q_2, fin_q)
                logMovement(T, inter_q_2, fin_q, 0);
           elseif(pa_place == 3 && toward == 0)                            
                trajectory = jtraj(inter_q_2, inter_q_1, time_animation);
                T = robot.fkine(trajectory);
                pa_place = 2;
                drwaRobot(robot, links, trajectory, dimention_3, inter_q_2, inter_q_1)
                logMovement(T, fin_q, inter_q_2, 0);
           elseif(pa_place == 4)                                            %second intermadiate point
                trajectory = jtraj(fin_q, inter_q_2, time_animation);
                T = robot.fkine(trajectory);
                pa_place = 3;
                drwaRobot(robot, links, trajectory, dimention_3, fin_q, inter_q_2)
                logMovement(T, fin_q, inter_q_2, 0);
            end
            
            if(toward == 1 && pa_place == 4)
                toward = 0;
            elseif(toward == 0 && pa_place == 1)
                toward = 1;
            end
                    
            if(pa_place == 1)
                repetitions = repetitions - 1;
            end
        end
        
        new_q  = init_q;
        
end