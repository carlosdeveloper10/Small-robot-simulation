%% draws the robot dynamically.
function draws = drwaRobot(robot, links, trajectory, dimention_3, initial_q, final_q)    
    T = robot.fkine(trajectory);
    
    
    %======================================================================
    %     Creates the vectors x, y and z.
    %     tha describe the position of Pa 
    %     for each moment in the time
    x_trajetory = zeros(1,dimention_3);
    y_trajetory = zeros(1,dimention_3);
    z_trajetory = zeros(1,dimention_3);
    for i=1:dimention_3
        x_trajetory(1,i) = T(1,4,i);
        y_trajetory(1,i) = T(2,4,i);
        z_trajetory(1,i) = T(3,4,i);
    end
    %======================================================================
    
    robot_place = [1:2:(links + 1) * 2];
    subplot((links + 1), 2, robot_place), robot.plot(trajectory);
    %======================================================================
    
    %======================================================================
    %     Draws dynamically the graphics depending of numbers of links
    xt = 1;
    for i = 1: ((links) * 2)
        if (mod(i,2) == 0)
            subplot((links + 1), 2, i), plot(trajectory(:,xt)), grid;
            xt = xt + 1;
        end
    end

    hold on
    plotXYZ = subplot((links + 1), 2, ((links * 2) + 2));
    [x,y,z] = sphere(16);
    scatter3(plotXYZ, x_trajetory, y_trajetory , z_trajetory, '.');

end    