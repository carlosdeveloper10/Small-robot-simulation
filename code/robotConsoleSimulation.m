%% This scripts is like the java main method. 
% here's the app flow 

figure(1)
hold on
%Before that all, always draw robot.
[robot, q_initial] = getRobot();   
q_final = q_initial;                          %For the robot does not move when he shows.
time_animation = [0:1:30]; 
trajectory = jtraj(q_initial, q_final, time_animation);
T = robot.fkine(trajectory);
[row, col, dimention_3] = size(T);
[iteractions, links] = size(trajectory);
drwaRobot(robot, links, trajectory, dimention_3, q_initial, q_final);

app_is_running = 1;  
while (app_is_running == 1)
    
    
    move_type = input(getMenu(1));
    if(move_type == 1)
        q_initial = doMovement(time_animation, q_initial, robot, links, dimention_3);
    end
    if(move_type == 2)
        doWork(time_animation, q_final, robot, links, dimention_3);
    end
    if(move_type == 4)                                                      %Show additional information...!
        [robot, q_initial] = getRobot()
        clf
        q_final = q_initial;                          %For the robot does not move when he shows.
        time_animation = [0:1:30]; 
        trajectory = jtraj(q_initial, q_final, time_animation);
        T = robot.fkine(trajectory);
        [row, col, dimention_3] = size(T);
        [iteractions, links] = size(trajectory);
        drwaRobot(robot, links, trajectory, dimention_3);
    end
end

