%% Creates a robot like the SCARA, establishes the initial position and
% shows information about the ROBOT
function [robot, q_initial] = getScara()
    
    %the intial matriz t
    link1 = Link([0 0.342 0.325 0 0],'standard');
    link2 = Link([0 0 0.275 0 0],'standard');
    link3 = Link([0 -0.210 0 0 1],'standard');
    link4 = Link([0 0 0 0 0],'standard');
    
    %Restrition move for each link
    link1.qlim = [(-7*pi)/12, (7*pi)/12];
    link2.qlim = [(-5*pi)/6,(5*pi)/6];
    link3.qlim = [-0.21, 0.21];
    link4.qlim = [-2*pi , 2*pi];
    
    clc
    disp('====|| Scara Info ||====');
    disp('====Radin for rotational and meters for prismatic====');
    disp('Link one limit (-7*pi)/12, (7*pi)/12');
    disp('Link two limit (-5*pi)/6,(5*pi)/6');
    disp('Link three limit -0.21, 0.21 [Prismatic]');
    disp('Link four limit -2*pi , 2*pi');
    input('Press enter to continue...')
    
    
    robot = SerialLink([link1 link2 link3 link4]);
    robot.plotopt = {'workspace',[-1.2 1.2 -1.2 1.2 -1.2 1.2]};
    q_initial = [0 0 0 0];
end