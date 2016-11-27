%% returns the robot selected by user.
function [robot, q_initial] = getRobot()
    robot_election = input(getMenu(2));
    if(robot_election == 1)
        [robot, q_initial] = getScara();
    end
    if(robot_election == 2)
        [robot, q_initial] = getMitsubishi();
    end
    if(robot_election == 3)
        [robot, q_initial] = getFanuc();
    end
end

